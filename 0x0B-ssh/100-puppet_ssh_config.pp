# manisscript to configure my server to not use password.

$str = "PermitRootLogin no
PasswordAuthentication no"

file {'/etc/ssh/sshd_config':
ensure  => present,
content => $str,
}
