#!/usr/bin/env bash

file=$1
date=$(stat -c '%y' "$file" | awk '{print $1}')
newfile="$date-$file"
cp -- "$file" "$newfile"

# Convert front matter
sed -i 's,^title: \(.*\)$,title = "\1",g' "$newfile"
sed -i 's,^tags: \(.*\)$,\n[taxonomies]\ntags = \1,g' "$newfile"
sed -i 's,^---$,+++,g' "$newfile"

# Convert links
# This is terrible! :s
for _i in {1..10}
do
    sed -i 's,\[\[\(.*\) \(.*\)\]\],[[\1-\2]],g'  "$newfile"
done

sed -i 's,\[\[\(.*\)\]\],[\1](https://john-rodewald.github.io/blog/\L\1),g' "$newfile"
