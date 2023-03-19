construct-directories:
	# Create package staging area as zip cannot create dirs itself.
	mkdir -p ./tmp/ ./tmp/package/ ./tmp/hash/ ./tmp/current_hash/

build-package:
	# pip can create dirs.
	pip install --target ./tmp/dependencies -r ./requirements.txt
	zip -r ./tmp/package/deployment-package.zip ./tmp/dependencies/*
	zip -r ./tmp/package/deployment-package.zip ./src/*

generate-source-hash:
	# Create & push updated hash to S3
	openssl dgst -sha256 -binary ./tmp/package/deployment-package.zip | openssl enc -base64 > "./tmp/hash/deployment-package-$(id).sha256"

clean-up:
	# Remove tmp staging area.
	rm -rf ./tmp/