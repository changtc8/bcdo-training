class motd {
   File { owner => 0, group => 0, mode => 0644 }

   file { '/etc/motd.tail':
      content => "Welcome to your Vagrant-built virtual machine!  test2
                    Managed by Puppet.\n"
   }
}
