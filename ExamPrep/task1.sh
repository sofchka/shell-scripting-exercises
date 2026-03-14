#!/bin/sh

ls -al | grep '^-..x' | tr -s ' ' | cut -f9 -d' '