# Script to create a file
file {'/tmp/school':
insure     => present,
permission => 0744,
owner      => www-data,
group      => www-data,
content    => 'I love Puppet',
}
