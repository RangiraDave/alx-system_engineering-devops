# manisscript to configure my server to not use password.

$str = "
PermitRootLogin no
PasswordAuthentication no
HostKey ~/.ssh/school
"

file {'/etc/ssh/sshd_config':
ensure  => present,
content => $str,
}
