# manisscript to configure my server to not use password.

$str = "
PermitRootLogin no
PasswordAuthentication no
Include /etc/ssh/sshd_config.d/*.conf
AcceptEnv LANG LC_*
"

file {'/etc/ssh/sshd_config':
ensure  => present,
content => $str,
}
