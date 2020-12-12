.DEFAULT_GOAL: recipe

GIT_REMOTE?=origin
GIT_BRANCH?=main
GIT_PUSH_FLAGS?=

recipe:
	@sh $(CURDIR)/scripts/make-recipe.sh ${CATEGORY} ${RECIPE}

push:
	@git push ${GIT_REMOTE} ${GIT_BRANCH} ${GIT_PUSH_FLAGS}

PHONY: recipe