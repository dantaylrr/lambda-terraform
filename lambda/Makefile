construct-directories:
	# Create package staging area as zip cannot create dirs itself.
	mkdir -p ./tmp/ ./tmp/package/

build-package:
	# pip can create dirs.
	pip install --target ./tmp/dependencies -r ./requirements.txt
	zip -r ./tmp/package/my-deployment-package.zip ./tmp/dependencies/*
	zip -r ./tmp/package/my-deployment-package.zip ./src/*

clean-up:
	# Remove tmp staging area.
	rm -rf ./tmp/