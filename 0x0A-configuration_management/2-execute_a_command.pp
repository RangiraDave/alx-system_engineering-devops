# Manifest to kill a process

exec {'Process killer':
path        => '/usr/bin/',
command     => 'pkill killmenow',
refreshonly => true
}
