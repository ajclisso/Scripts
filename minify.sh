#!/bin/bash
# error if no extension specified
files=("$@")
for file in "${files[@]}"
do
    if [[ "$file" == *".js" ]]
    then
        filename=${file%.js}
        curl -X POST -s --data-urlencode input@$filename.js http://javascript-minifier.com/raw > $filename.min.js
    elif [[ "$file" == *".css" ]]
    then
        filename=${file%.css}
        curl -X POST -s --data-urlencode input@$filename.css http://cssminifier.com/raw > $filename.min.css
    fi
done
# if file is javascript:
#     curl -X POST -s --data-urlencode 'input@ready.js' http://javascript-minifier.com/raw > ready.min.js
# else if file is css:
#     curl -X POST -s --data-urlencode 'input@style.css' http://cssminifier.com/raw > style.min.css