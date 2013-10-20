class ssh{
    augeas { "configure_sshd":
        context => "/files/etc/ssh/sshd_config",
        changes => "set PermitRootLogin no",
    }
}
