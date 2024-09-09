#!/bin/bash

# پرسیدن نام دامنه از کاربر
read -p "Please enter the domain name: " DOMAIN

# چک کردن ورودی دامنه
if [ -z "$DOMAIN" ]; then
    echo "Domain name cannot be empty. Exiting."
    exit 1
fi

NGINX_CONF="/etc/nginx/sites-available/$DOMAIN"
NGINX_LINK="/etc/nginx/sites-enabled/$DOMAIN"
WEB_ROOT="/var/www/$DOMAIN"
HOSTS_FILE="/mnt/c/Windows/System32/drivers/etc/hosts"

# ایجاد دایرکتوری وب
sudo mkdir -p $WEB_ROOT

# ایجاد فایل HTML
cat <<EOL | sudo tee $WEB_ROOT/index.html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Welcome to $DOMAIN</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            text-align: center;
            margin-top: 50px;
        }
        h1 {
            color: #333;
        }
    </style>
</head>
<body>
    <h1>Hello, $DOMAIN!</h1>
</body>
</html>
EOL

# ایجاد فایل پیکربندی Nginx
cat <<EOL | sudo tee $NGINX_CONF
server {
    listen 80;
    server_name $DOMAIN;

    root $WEB_ROOT;
    index index.html;

    location / {
        try_files \$uri \$uri/ =404;
    }
}
EOL

# فعال کردن سایت در Nginx
sudo ln -s $NGINX_CONF $NGINX_LINK

# اضافه کردن دامنه به فایل hosts ویندوز
echo "127.0.0.1 $DOMAIN" | sudo tee -a $HOSTS_FILE

# تست و راه‌اندازی مجدد Nginx
sudo nginx -t && sudo systemctl restart nginx

echo "Domain $DOMAIN created and configured successfully."