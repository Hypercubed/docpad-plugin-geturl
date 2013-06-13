# If you change something here, be sure to change it in package.json's scripts as well

dev:
	./node_modules/.bin/coffee -w -o out/ -c src/

compile:
	./node_modules/.bin/coffee -o out/ -c src/

test: compile
	npm test
	
rebase: 
	cp -r ./test/out/* ./test/out-expected/

.PHONY: dev compile test rebase