# Script to create a file

file {'File creation':
path       => '/tmp/school',
insure     => present,
permission => 0744,
owner      => www-data,
group      => www-data,
content    => 'I love Puppet',
}
