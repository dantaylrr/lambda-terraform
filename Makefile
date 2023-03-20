construct-directories:
	# Create package staging area as zip cannot create dirs itself.
	cd lambda/$(working_dir)
	mkdir -p ./tmp/ ./tmp/package/ ./tmp/hash/ ./tmp/current_hash/

build-package:
	# pip can create dirs.
	cd lambda/$(working_dir)
	pip install --target ./tmp/dependencies -r ./requirements.txt
	zip -r ./tmp/package/deployment-package.zip ./tmp/dependencies/*
	zip -r ./tmp/package/deployment-package.zip ./src/*

generate-source-hash:
	# Generate new hash
	cd lambda/$(working_dir)
	openssl dgst -sha256 -binary ./tmp/package/deployment-package.zip | openssl enc -base64 > "./tmp/hash/deployment-package.sha256"

release-deployment-package-to-s3:
	# 
	cd lambda/$(working_dir)
	aws s3 cp ./tmp/package/deployment-package.zip s3://$(lambda_template_bucket)/$(working_dir)/deployment-package/

release-source-hash-to-s3:
	#
	cd lambda/$(working_dir)
	aws s3 cp ./tmp/hash/deployment-package.sha256 s3://$(lambda_template_bucket)/$(working_dir)/source-hash/

clean-up:
	# Remove tmp staging area.
	cd lambda/$(working_dir)
	rm -rf ./tmp/