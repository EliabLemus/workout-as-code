#!/usr/bin/env bash

set -e

main () {
    echo "Before we go, let's answer a couple of questions first"

    read -r -p "What is the workout discipline? ie: crossfit [freestyle]: " discipline
    discipline=${discipline:-freestyle}
    echo "$discipline"

    read -r -p "Would you like to add other keywords to the name (comma separated)? ie: core,push,supperset []: " raw_meta
    echo "$raw_meta"

    if [[ -n "$raw_meta" ]]; then
        metadata="${raw_meta//,/-}-"
    fi

    readonly date=$(date +'%Y%-m%d')
    readonly filename="${discipline// /_}-${metadata// /_}${date}.md"

    if [[ -f "data/${filename}" ]]; then
        "The file data/${filename} already exists, please try again"
        return 1
    fi

    echo "The following file will be created data/${filename}, you can rename it afterwards"

    cat << EOF > "data/${filename}"
# ${discipline} placeholder title
<!-- Your workout goes here -->

EOF
}


main $@
