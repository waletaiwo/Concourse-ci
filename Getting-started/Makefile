Deploy:
	fly -t tutorial set-pipeline -p getting-started -c pipeline.yml
	fly -t tutorial unpause-pipeline -p getting-started
	fly -t tutorial trigger-job --job getting-started/getting-started-job --watch
	echo"waving my magic wand=====>"

Clean:
	fly -t tutorial destroy-pipeline -p getting-started
