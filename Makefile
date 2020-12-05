category:
	@sh $(CURDIR)/scripts/make-category.sh ${CATEGORY}

recipe:
	@sh $(CURDIR)/scripts/make-recipe.sh ${CATEGORY} ${RECIPE}

PHONY: category