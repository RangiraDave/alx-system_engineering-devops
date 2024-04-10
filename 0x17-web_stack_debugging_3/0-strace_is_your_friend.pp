# The puppet to automate the process to debug apache 500 error

exec { 'fix the php extension issue':
  command => 'sed -i s/phpp/php/g /var/www/html/wp-settings.php',
  path    => '/usr/local/bin/:/bin/'
  }
