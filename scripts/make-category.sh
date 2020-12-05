#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

_category=$1

if [ -z "$_category" ]; then
    printf "Enter the category name: "
    read _category
fi

cp -R ${DIR}/../archetypes/category ${DIR}/../content/docs/${_category}