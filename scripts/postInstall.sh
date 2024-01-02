# set env vars
set -o allexport; source .env; set +o allexport;

echo "Waiting";
sleep 40;

target=$(docker-compose port activepieces 80)

curl http://${target}/api/v1/authentication/sign-up \
  -H 'accept: application/json, text/plain, */*' \
  -H 'accept-language: fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7,he;q=0.6' \
  -H 'content-type: application/json' \
  -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36' \
  --data-raw '{"firstName":"root","lastName":"root","email":"'${ADMIN_EMAIL}'","password":"'${ADMIN_PASSWORD}'","trackEvents":true,"newsLetter":true}' \
  --compressed
