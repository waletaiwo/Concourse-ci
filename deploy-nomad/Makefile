Deploy:
	fly -t tutorial set-pipeline -c pipeline.yml -p nomad-deployment
	fly -t tutorial unpause-pipeline -p nomad-deployment
	fly -t tutorial trigger-job --job nomad-deployment/deploy-to-nomad --watch

Clean:
	fly -t tutorial destroy-pipeline -p nomad-deployment