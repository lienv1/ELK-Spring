# ELK-Spring

![Diagram](https://raw.githubusercontent.com/lienv1/ELK-Spring/main/Architecture.png)

This project is a simulation tool designed to test and inspect log files using the ELK stack (Elasticsearch, Logstash, and Kibana). It features a Spring Boot application that can generate multiple log files through GET requests to specific endpoints:

1. /api/warning generates warn.log
2. /api/info generates info.log
3. /api/error generates error.log

These log files are intended to be inspected using the ELK stack. The entire project is containerized using Docker and includes encryption via OpenSSL in Nginx. Additionally, the project contains a Docker container that generates SSL keys and certificates for Nginx, Elasticsearch, and Kibana.

# ELK
ELK stands for Elasticsearch, Logstash, and Kibana. It is a powerful set of tools for searching, analyzing, and visualizing log data in real time.
1. Elasticsearch is a search and analytics engine.
2. Logstash collects, processes, and forwards log data.
3. Kibana is a visualization layer that works on top of Elasticsearch to provide insights into the log data.

# Configuration
Before deploying the project, create a .env file containing the following variables:
```
ELASTIC_USERNAME=elastic
ELASTIC_PASSWORD=changeme
XPACK_ENCRYPTEDSAVEDOBJECTS_ENCRYPTIONKEY=c34d38b3a14956121ff2170e5030b471551370178f43e5626eec58b04a30fae2
```
# How to Deploy
### Initial Deployment

For the first deployment, use the docker-compose-init.yml file to generate the necessary SSL keys and certificates:
```
docker-compose -f docker-compose-init.yml -p es-docker-cluster up -d --build
```

### Subsequent Deployments

For subsequent deployments, use the default docker-compose.yml file:
```
docker-compose -p es-docker-cluster up -d --build
```
# Accessing the Services

Swagger Documentation is accessible at https://localhost/spring/swagger-ui/index.html

Kibana is accessible at https://localhost/kibana

**Note**: The browser will display a warning due to the use of self-signed SSL certificates. This warning is expected and can be safely ignored, as the SSL certificates are generated by OpenSSL.



