#nuke ldap

echo "Erasing LDAP..."
sudo yum erase openldap-clients -y
sudo yum erase openldap-servers -y
sudo rm -rf /var/lib/ldap/
sudo ls -la /var/lib/ldap
echo "Done"

read -p "Continue with installing everything?"
sudo yum install openldap-servers -y
sudo yum install openldap-clients -y

echo "Starting LDAP..."
sudo systemctl start slapd
sudo systemctl enable slapd
sudo systemctl status slapd
echo "Done"

echo "Listing ldap contents..."
sudo ls -la /var/lib/ldap
sudo ls -la /etc/openldap/slapd.d/cn=config




