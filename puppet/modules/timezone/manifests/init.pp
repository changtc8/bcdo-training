class timezone { 
   package {'tzdata':
     ensure  => 'present'
   }

   file {'/etc/localtime':
      require => Package['tzdata'],
      source  => 'file:///usr/share/zoneinfo/America/Los_Angeles',
      notify  => Exec['reboot']
   }

   file {'/etc/timezone':
      content => 'America/Los_Angeles'
   }
}
  
