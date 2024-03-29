# Manifest to install nginx and configure it to handle
# redirection with 301 permanently

# install nginx package
package { 'nginx':
 ensure => installed,
}

# Define the custom index page content
file { '/var/www/html/index.nginx-debian.html':
 ensure  => present,
 content => 'Hello World!\n',
}

# Configure Nginx server block
file { '/etc/nginx/sites-available/default':
ensure  => present,
content => "
 server {
  listen 80 default_server;
  listen [::]:80 default_server;

  root /var/www/html;
  index index.html index.htm index.nginx-debian.html;

  location / {
   return 200 'Hello World!';
  }

  # 301 Redirect /redirect_me
  location /redirect_me {
   return 301 https://www.youtube.com/watch?v=lE-qjOzwk3s;
  }
 }",

 require => Package['nginx'],
 notify  => Service['nginx'],
}

# Ensure Nginx service is running and enabled
service { 'nginx':
 ensure => running,
 enable => true,
}
