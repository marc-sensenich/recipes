.DEFAULT_GOAL: recipe

recipe:
	@sh $(CURDIR)/scripts/make-recipe.sh ${CATEGORY} ${RECIPE}

PHONY: recipe