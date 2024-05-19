openssl genrsa -out certs/ca.key 2048
openssl req -x509 -new -nodes -key certs/ca.key -sha256 -days 1024 -out certs/ca.crt -subj "/C=US/ST=State/L=City/O=Organization/OU=OrgUnit/CN=example.com"
openssl genrsa -out certs/elasticsearch.key 2048
openssl req -new -key certs/elasticsearch.key -out certs/elasticsearch.csr -subj "/C=US/ST=State/L=City/O=Organization/OU=OrgUnit/CN=elasticsearch.example.com"
openssl x509 -req -in certs/elasticsearch.csr -CA certs/ca.crt -CAkey certs/ca.key -CAcreateserial -out certs/elasticsearch.crt -days 500 -sha256
openssl genrsa -out certs/kibana.key 2048
openssl req -new -key certs/kibana.key -out certs/kibana.csr -subj "/C=US/ST=State/L=City/O=Organization/OU=OrgUnit/CN=kibana.example.com"
openssl x509 -req -in certs/kibana.csr -CA certs/ca.crt -CAkey certs/ca.key -CAcreateserial -out certs/kibana.crt -days 500 -sha256
openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout certs/nginx.key -out certs/nginx.crt -subj "/C=US/ST=State/L=City/O=Organization/OU=OrgUnit/CN=nginx.example.com"
chmod 666 certs/ca.key certs/ca.crt
chmod 666 certs/elasticsearch.key certs/elasticsearch.csr certs/elasticsearch.crt certs/ca.srl
chmod 666 certs/kibana.key certs/kibana.csr certs/kibana.crt certs/ca.srl
chmod 666 certs/nginx.key certs/nginx.crt