docker:
	fly -t tutorial set-pipeline -p getting-started -c getting-started.yml
	fly -t tutorial trigger-job --job getting-started/getting-started-job --watch
