dist:
	@mkdir dist
	@cp index.html dist/index.html
	@cp -r js dist/js
	@cp -r css dist/css

	@mkdir dist/jam
	@cp jam/require.js dist/jam/require.js

	@echo "Created a distributable version."

clean:
	@rm -rf jam
	@rm -rf css/bin
	@rm -rf dist
	
	@echo "The jam, css/bin, and dist folders have been removed."