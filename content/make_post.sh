#!/usr/bin/env bash

file=$1
date=$(stat -c '%y' "$file" | awk '{print $1}')
newname="$date-$file"
cp -- "$file" "$newname"

# Convert front matter
sed -i 's,^title: \(.*\)$,title = "\1",g' "$file"
sed -i 's,^tags: \(.*\)$,\n[taxonomies]\ntags = \1,g' "$file"
sed -i 's,^---$,+++,g' "$file"

# Convert links
# This is terrible! :s
for _i in {1..10}
do
    sed -i 's,\[\[\(.*\) \(.*\)\]\],[[\1-\2]],g'  "$file"
done

sed -i 's,\[\[\(.*\)\]\],[\1](https://john-rodewald.github.io/blog/\L\1),g' "$file"
