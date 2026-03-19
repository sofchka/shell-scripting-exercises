#!/bin/bash

infile="$1"
outfile="accounts_new.csv"
tempfile="emails.tmp"

if [ ! -f "$infile" -o ! -r "$infile" ]; then
    echo "Error: File '$infile' does not exist or is not writable."
    exit 1
fi

> "$outfile"
> "$tempfile"

while read line
do
    id=$(echo "$line" | cut -d',' -f1)
    name=$(echo "$line" | cut -d',' -f3)

    [ -z "$id" ] && continue
    [ "$id" = "id" ] && continue

    lower=$(echo "$name" | tr 'A-Z' 'a-z')
    first=$(echo "$lower" | cut -c1)
    last=$(echo "$lower" | cut -d' ' -f2)
    base="${first}${last}"

    echo "$base" >> "$tempfile"

done < "$infile"

echo "id,location_id,name,title,email,department" > "$outfile"

while read line; do
    id=$(echo "$line" | cut -d',' -f1)
    location_id=$(echo "$line" | cut -d',' -f2)
    name=$(echo "$line" | cut -d',' -f3)
    title=$(echo "$line" | cut -d',' -f4)
    if [ "${title:0:1}" = "\"" ]; then
        title=$(echo "$line" | cut -d',' -f4-5)
        email=$(echo "$line" | cut -d',' -f6)
        rest=$(echo "$line" | cut -d',' -f7)
    else
        email=$(echo "$line" | cut -d',' -f5)
        rest=$(echo "$line" | cut -d',' -f6)
    fi

    [ -z "$id" ] && continue # skip empty lines

    [ "$id" = "id" ] && continue # skip header

    # format name
    formatted_name=$(echo "$name" | tr 'A-Z' 'a-z')
    first_letter=$(echo "$formatted_name" | cut -c1)
    last_lower=$(echo "$formatted_name" | cut -d' ' -f2)
    base_email="${first_letter}${last_lower}"

    first=$(echo "$formatted_name" | awk '{print toupper(substr($1,1,1)) substr($1,2)}')
    last=$(echo "$formatted_name" | awk '{
                                            split($2, parts, "-");
                                            for(i in parts) {
                                                parts[i] = toupper(substr(parts[i],1,1)) substr(parts[i],2)
                                            }
                                            printf "%s", parts[1]
                                            for(i=2;i<=length(parts);i++) printf "-%s", parts[i]
                                        }')
    formatted_name="$first $last"  

    # handle duplicates
    base_email="${first_letter}${last_lower}"

    count=$(grep -c "^$base_email$" "$tempfile")
    if [ "$count" -eq 1 ]; then
        final_email="${base_email}@abc.com"
    else
        final_email="${base_email}${location_id}@abc.com"
    fi

    #logging
    echo "Processing $id: $formatted_name -> $final_email"

    echo "$id,$location_id,$formatted_name,$title,$final_email,$rest" >> "$outfile"

done < "$infile"

rm "$tempfile"

exit 0