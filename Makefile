dist:
	@mkdir dist
	@cp index.html dist/index.html
	@cp -r js dist/js
	@cp -r bin dist/bin

	@mkdir dist/jam
	@cp jam/require.js dist/jam/require.js

	@echo "Created a distributable version."

clean:
	@rm -rf jam
	@rm -rf bin
	@rm -rf dist
	@rm -rf app/bin
	
	@echo "The jam, css/bin, and dist folders have been removed."