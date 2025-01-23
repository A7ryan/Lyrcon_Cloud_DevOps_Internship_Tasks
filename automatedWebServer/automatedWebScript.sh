#!/bin/bash

# Update package list
sudo apt update

# Install Apache2
sudo apt install -y apache2

# Change to the web root directory
cd /var/www/html

# Remove the existing index.html file
sudo rm index.html

# Create a new index.html file with the specified content
sudo bash -c 'cat > index.html <<EOF
<!Doctype html>
<html>
<head>
<title>Automated Website</title>
</head>
<body>
<h3 align="center">Hello, World!</h3>
</body>
</html>
EOF'

# Enable and start the Apache2 service
sudo systemctl enable apache2
sudo systemctl start apache2

echo "Web hosting task completed successfully!"

# Give exe permission to the script
chmod +x automatedWebScript.sh

# Run the script
./automatedWebScript.sh

echo "Scipt execution successful!"
