FROM centos:centos7.9.2009

RUN yum install -y python python-ldap epel-release && \
    yum install -y openldap-servers-2.4.44-22.el7 openldap-clients-2.4.44-22.el7 && \
    yum install -y ansible-2.9.21-1.el7 && \
    yum clean all 

COPY config_openldap_server config_openldap_server
COPY systemctl.py /usr/bin/systemctl

RUN chmod 700 /usr/bin/systemctl && \
    systemctl enable slapd && systemctl start slapd && \
    ansible-playbook config_openldap_server/main.yml --extra-vars "ldap_admin_pwd=admin ldap_admin_service_pwd=admin ldap_users_dn='ou=users,ou=v1,dc=npes,dc=navy,dc=mil' ldap_groups_dn='ou=groups,ou=v1,dc=npes,dc=navy,dc=mil' ldap_roles_dn='ou=roles,ou=v1,dc=npes,dc=navy,dc=mil' ldappw_npes_defaultuser=Admin.123 ldappw_npes_defaultadmin=Admin.123 ldappw_arcgisadmin=Admin.123 ldappw_jboss_ldap=Admin.123 ldappw_jboss_jboss=Admin.123 ldappw_jboss_devuser=Admin.123 ldappw_jboss_auditacct=Admin.123"

EXPOSE 636 389

ENTRYPOINT ["systemctl", "start", "slapd"]

