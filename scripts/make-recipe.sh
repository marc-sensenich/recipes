#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

_category=$1
_recipe=$2

if ! command -v hugo &> /dev/null
then
    echo "hugo could not be found and must be installed to generate a recipe"
    exit
fi

if [ -z "$_category" ]; then
    printf "Enter the category: "
    read _category
fi

if [ ! -d ${DIR}/../content/docs/${_category} ]; then
    sh ${DIR}/make-category.sh ${_category}
fi

if [ -z "$_recipe" ]; then
    printf "Enter the recipe name (e.g. chocolate-chip-cookies): "
    read _recipe
fi

_recipe=`printf ${_recipe} | sed 's/[^[:alnum:]]/-/g' | tr '[:upper:]' '[:lower:]'`

hugo new ${DIR}/../content/docs/${_category}/${_recipe}.md
