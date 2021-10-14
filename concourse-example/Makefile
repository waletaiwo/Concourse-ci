Deploy:
	fly -t tutorial set-pipeline -p concourse-example -c pipeline.yml \
	 --var image-repo-name= \
 	 --var registry-username= \
 	 --var registry-password=
	
	fly -t tutorial unpause-pipeline -p concourse-example
	
	fly -t tutorial trigger-job --job concourse-example/build-and-push --watch 	

Clean:
	fly -t tutorial destroy-pipeline -p concourse-example
