
cp -R ../../dist/KeycloakClient src/main/resources/static/
mvn clean package
docker build -t npes-demo .
rm -rf src/main/resources/static/KeycloakClient