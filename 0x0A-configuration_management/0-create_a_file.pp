# Manifest to create a file

file {'/tmp/school':
ensure  => present,
Perm    => 0744,
owner   => www-data,
group   => www-data,
content => 'I love Puppet',
}
