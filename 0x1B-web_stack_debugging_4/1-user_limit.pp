# Fixed by increasing hard user and soft file limit for user holberton.

exec { 'increase_hard_limit':
  command => 'sed -i "/holberton hard/s/5/10000/" /etc/security/limits.conf'
  path    => '/usr/local/bin/:/bin/'
}

exec { 'increase_soft_file':
  command => 'sed -i "/holberton soft/s/4/20000/" /etc/security/limits.conf',
  path    => '/usr/local/bin/:/bin/'
}
