# manisscript to configure my server to not use password.

file {'/etc/ssh/ssh_config':
ensure  => present,
content += "Host *
IdentityFile ~/.ssh/school
PasswordAuthentication no",
}
