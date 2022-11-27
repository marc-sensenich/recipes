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
    IFS= read -r -p "Enter the category: " _category
fi

_category=`printf "${_category}" | xargs | sed 's/[^[:alnum:]]/-/g' | tr '[:upper:]' '[:lower:]'`

if [ ! -d ${DIR}/../content/docs/${_category} ]; then
    hugo new --kind category ${DIR}/../content/docs/${_category}
fi

if [ -z "$_recipe" ]; then
    IFS= read -r -p "Enter the recipe: " _recipe
fi

_recipe=`printf "${_recipe}" | xargs | sed 's/[^[:alnum:]]/-/g' | tr '[:upper:]' '[:lower:]'`

if [ ! -f "${DIR}/../content/docs/${_category}/${_recipe}.md" ]; then
    hugo new "${DIR}/../content/docs/${_category}/${_recipe}.md"
fi
