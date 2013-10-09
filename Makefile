POLVO=node_modules/polvo/bin/polvo
CS=node_modules/coffee-script/bin/coffee

setup:
	npm install
	bower install


watch:
	@$(CS) -bwo lib src

build:
	@$(CS) -bco lib src



bump.minor:
	@$(MVERSION) minor

bump.major:
	@$(MVERSION) major

bump.patch:
	@$(MVERSION) patch

publish:
	git tag $(VERSION)
	git push origin $(VERSION)
	git push origin master
	npm publish

re-publish:
	git tag -d $(VERSION)
	git tag $(VERSION)
	git push origin :$(VERSION)
	git push origin $(VERSION)
	git push origin master -f
	npm publish -f



# TEST
# ------------------------------------------------------------------------------

test: build
	@$(CS) test/runner.coffee