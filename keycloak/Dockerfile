FROM daggerok/jboss-eap-7.3:7.3.0-centos
COPY --chown=jboss ./target/*.war ${JBOSS_HOME}/standalone/deployments/keycloak.war
