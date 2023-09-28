#set env vars
set -o allexport; source .env; set +o allexport;


mkdir -p ./postgres_data
mkdir -p ./redis_data

chown -R 1000:1000 ./postgres_data
chown -R 1000:1000 ./redis_data

AP_POSTGRES_PASSWORD=${AP_POSTGRES_PASSWORD:-`openssl rand -hex 32`}
AP_JWT_SECRET=${AP_JWT_SECRET:-`openssl rand -hex 32`}
ENCRYPTION_KEY=${ENCRYPTION_KEY:-`openssl rand -hex 16`}
AP_ENCRYPTION_KEY=${AP_ENCRYPTION_KEY:-`openssl rand -hex 16`}

cat << EOT >> ./.env

AP_POSTGRES_PASSWORD=${AP_POSTGRES_PASSWORD}
AP_JWT_SECRET=${AP_JWT_SECRET}
ENCRYPTION_KEY=${ENCRYPTION_KEY}
AP_ENCRYPTION_KEY=${AP_ENCRYPTION_KEY}
EOT

cat <<EOT > ./servers.json
{
    "Servers": {
        "1": {
            "Name": "local",
            "Group": "Servers",
            "Host": "172.17.0.1",
            "Port": 41962,
            "MaintenanceDB": "postgres",
            "SSLMode": "prefer",
            "Username": "postgres",
            "PassFile": "/pgpass"
        }
    }
}
EOT