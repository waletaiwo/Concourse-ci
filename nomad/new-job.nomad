job "concourse" {
    datacenters = ["dc1"]

    group "example" {
        network {
            port "server" {
                static = 8080
            }
        }

        task "db" {
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

            resources {
                memory = 100
            }

        }

        task "concourse" {
            lifecycle {
                hook = "prestart"
                sidecar = true
            }
            driver = "docker"
            config {
                image = "concourse/concourse"
                command = ["quickstart"]
                privileged = true 
                ports = ["server"]
            }

            env {
                CONCOURSE_POSTGRES_HOST = "concourse-db"
                CONCOURSE_POSTGRES_USER = "concourse_user"
                CONCOURSE_POSTGRES_PASSWORD = "concourse_pass"
                CONCOURSE_POSTGRES_DATABASE = "concourse"
                CONCOURSE_EXTERNAL_URL = "http://localhost:8080"
                CONCOURSE_ADD_LOCAL_USER = "test:test"
                CONCOURSE_MAIN_TEAM_LOCAL_USER = "test"
                CONCOURSE_WORKER_BAGGAGECLAIM_DRIVER = "overlay"
                CONCOURSE_CLIENT_SECRET = "Y29uY291cnNlLXdlYgo="
                CONCOURSE_TSA_CLIENT_SECRET = "Y29uY291cnNlLXdvcmtlcgo="
                CONCOURSE_X_FRAME_OPTIONS = "allow"
                CONCOURSE_CONTENT_SECURITY_POLICY = "*"
                CONCOURSE_CLUSTER_NAME = "tutorial"
                CONCOURSE_WORKER_CONTAINERD_DNS_SERVER = "8.8.8.8"
                CONCOURSE_WORKER_RUNTIME = "containerd"
                CONCOURSE_VAULT_URL = "http://172.20.10.4:8100"
                CONCOURSE_VAULT_CLIENT_TOKEN = ""
            }
        resources {
            memory = 128
            cpu = 100
        }
    }
}
}