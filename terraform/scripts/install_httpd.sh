#! /bin/bash

# Update yum repos and install apache web server
yum -y update
yum -y install httpd
systemctl enable httpd
systemctl start httpd

# Query google's metadata server to get the VM details
NAME=$(curl -H "Metadata-Flavor: Google" "http://metadata.google.internal/computeMetadata/v1/instance/hostname")
IP=$(curl -H "Metadata-Flavor: Google" "http://metadata.google.internal/computeMetadata/v1/instance/network-interfaces/0/ip")
cat <<EOF > /var/www/html/index.html
<h1>Web Server Virtual Machine</h1>
<pre>
Name: $NAME
IP ADDRESS: $IP
</pre>
EOF