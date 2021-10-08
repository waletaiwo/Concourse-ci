fly:
	fly -t tutorial set-pipeline -p concourse-example -c concourse-example.yml \
	 --var image-repo-name= \
 	 --var registry-username= \
 	 --var registry-password=
	
	fly -t tutorial trigger-job --job concourse-example/build-and-push --watch 	
