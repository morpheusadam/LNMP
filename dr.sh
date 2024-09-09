#!/bin/bash

# پرسیدن نام دامنه از کاربر
read -p "Please enter the domain name to delete: " DOMAIN

# چک کردن ورودی دامنه
if [ -z "$DOMAIN" ]; then
    echo "Domain name cannot be empty. Exiting."
    exit 1
fi

NGINX_CONF="/etc/nginx/sites-available/$DOMAIN"
NGINX_LINK="/etc/nginx/sites-enabled/$DOMAIN"
WEB_ROOT="/var/www/$DOMAIN"
HOSTS_FILE="/mnt/c/Windows/System32/drivers/etc/hosts"

# حذف فایل پیکربندی Nginx و لینک آن
if [ -f "$NGINX_CONF" ]; then
    sudo rm $NGINX_CONF
    echo "Nginx configuration file removed."
else
    echo "Nginx configuration file not found."
fi

if [ -L "$NGINX_LINK" ]; then
    sudo rm $NGINX_LINK
    echo "Nginx configuration link removed."
else
    echo "Nginx configuration link not found."
fi

# حذف دایرکتوری وب
if [ -d "$WEB_ROOT" ]; then
    sudo rm -rf $WEB_ROOT
    echo "Web root directory removed."
else
    echo "Web root directory not found."
fi

# حذف دامنه از فایل hosts ویندوز
if grep -q "127.0.0.1 $DOMAIN" $HOSTS_FILE; then
    sudo sed -i "/127.0.0.1 $DOMAIN/d" $HOSTS_FILE
    echo "Domain removed from hosts file."
else
    echo "Domain not found in hosts file."
fi

# تست و راه‌اندازی مجدد Nginx
sudo nginx -t && sudo systemctl restart nginx

echo "Domain $DOMAIN deleted successfully."