job "concourse" {
    datacenters = ["default"]

    group "example" {

      network {
          port "server" {
            static = 8080
          }
      }
      
      task "concourse-db" {
        driver = "docker"
        config {
          image = "postgres"
        }
        env {
            POSTGRES_DB = "concourse"
            POSTGRES_PASSWORD = "concourse_pass"
            POSTGRES_USER = "concourse_user"
            PGDATA = "/database"
        }

      artifact {
        source      = "https://example.com/file.yml.tpl"  
        destination = "local/file.yml.tpl"
        }

        template {
            destination = "local/file.yml"
            data = <<EOF 
            concourse:
                image: concourse/concourse
                command: quickstart
                privileged: true
                depends_on: [concourse-db]
                ports: ["8080:8080"]
                environment:
                CONCOURSE_POSTGRES_HOST: concourse-db
                CONCOURSE_POSTGRES_USER: concourse_user
                CONCOURSE_POSTGRES_PASSWORD: concourse_pass
                CONCOURSE_POSTGRES_DATABASE: concourse
                CONCOURSE_EXTERNAL_URL: http://localhost:8080
                CONCOURSE_ADD_LOCAL_USER: test:test
                CONCOURSE_MAIN_TEAM_LOCAL_USER: test
                # instead of relying on the default "detect"
                CONCOURSE_WORKER_BAGGAGECLAIM_DRIVER: overlay
                CONCOURSE_CLIENT_SECRET: Y29uY291cnNlLXdlYgo=
                CONCOURSE_TSA_CLIENT_SECRET: Y29uY291cnNlLXdvcmtlcgo=
                CONCOURSE_X_FRAME_OPTIONS: allow
                CONCOURSE_CONTENT_SECURITY_POLICY: "*"
                CONCOURSE_CLUSTER_NAME: tutorial
                CONCOURSE_WORKER_CONTAINERD_DNS_SERVER: "8.8.8.8"
                CONCOURSE_WORKER_RUNTIME: "containerd"
                #vault settings for concourse
                CONCOURSE_VAULT_URL: http://172.20.10.4:8100  #add vault url here
                CONCOURSE_VAULT_CLIENT_TOKEN:  # add vault client token here or root token
            EOF 
        }
            }
      
        resources {
          memory = 128
          cpu = 100
        }
      }
    }
  }
}
