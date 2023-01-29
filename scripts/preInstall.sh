#set env vars
set -o allexport; source .env; set +o allexport;

apt install jq -y

mkdir -p ./postgres_data
mkdir -p ./redis_data

chown -R 1000:1000 ./postgres_data
chown -R 1000:1000 ./redis_data
