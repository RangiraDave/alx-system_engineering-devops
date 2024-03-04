# Manifest to Add a custom HTTP header with Puppet

# install nginx package
package { 'nginx':
  ensure => installed,
}

# Define the custom index page content
file { '/var/www/html/index.nginx-debian.html':
  ensure  => present,
  content => 'Hello World!\n',
}

# Configure Nginx server block (On availlable)
file { '/etc/nginx/sites-available/default':
ensure    => present,
content   => '
  server {
   listen 80 default_server;
   listen [::]:80 default_server;

   add_header X-Served-By $hostname

   root /var/www/html;
   index index.html index.htm index.nginx-debian.html;

   location / {
    return 200 'Hello World!';
  }

  # 301 Redirect /redirect_me
   location /redirect_me {
     return 301 https://www.youtube.com/watch?v=lE-qjOzwk3s;
   }
  }',

# Configure Nginx server block(on enabled)
file { '/etc/nginx/sites-enabled/default':
ensure    => present,
content   => '
  server {
   listen 80 default_server;
   listen [::]:80 default_server;

   add_header X-Served-By $hostname;

   root /var/www/html;
   index index.html index.htm index.nginx-debian.html;

   location / {
    return 200 'Hello World!';
  }

  # 301 Redirect /redirect_me
   location /redirect_me {
     return 301 https://www.youtube.com/watch?v=lE-qjOzwk3s;
   }
  }',

  require => Package['nginx'],
  notify  => Service['nginx'],
}

  require => Package['nginx'],
  notify  => Service['nginx'],
}

# Ensure Nginx service is running and enabled
service { 'nginx':
  ensure => running,
  enable => true,
}
