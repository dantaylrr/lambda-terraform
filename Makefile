construct-directories:
	# Create package staging area as zip cannot create dirs itself.
	mkdir -p ./lambda/$(working_dir)/tmp/ ./lambda/$(working_dir)/tmp/package/ ./lambda/$(working_dir)/tmp/hash/ ./lambda/$(working_dir)/tmp/current_hash/

build-package:
	# pip can create dirs.
	cd lambda/$(working_dir)/
	pip3 install --target ./tmp/dependencies -r ./requirements.txt
	zip -r ./tmp/package/deployment-package.zip ./tmp/dependencies/*
	zip -r ./tmp/package/deployment-package.zip ./src/*

generate-source-hash:
	# Generate new hash
	openssl dgst -sha256 -binary ./lambda/$(working_dir)/tmp/package/deployment-package.zip | openssl enc -base64 > "./lambda/$(working_dir)/tmp/hash/deployment-package.sha256"

release-deployment-package-to-s3:
	# Push deployment package to S3
	aws s3 cp ./lambda/$(working_dir)/tmp/package/deployment-package.zip s3://$(lambda_template_bucket)/$(working_dir)/deployment-package/

release-source-hash-to-s3:
	# Push SHA256 hash to S3
	aws s3 cp ./lambda/$(working_dir)/tmp/hash/deployment-package.sha256 s3://$(lambda_template_bucket)/$(working_dir)/source-hash/

clean-up:
	# Remove tmp staging area.
	rm -rf ./lambda/$(working_dir)/tmp/