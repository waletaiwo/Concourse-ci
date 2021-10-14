Deploy:
	fly -t tutorial set-pipeline -p example \
 	 -c pipeline.yml \
 	 --var image-repo-name= \
 	 --var registry-username= \
 	 --var registry-password=

	  fly -t tutorial unpause-pipeline -p example

	  fly -t tutorial trigger-job --job example/build-and-push --watch 

Clean: 
	fly -t tutorial destroy-pipeline -p example
