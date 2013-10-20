class grp { 
  
     group { add-devops:
       name => devops,
       gid  => 500,
       ensure => present
     }

     group { rm-sysadmin:
       name => sysadmin,
       ensure => absent
     }

     group { add-grps:
       name => ["a1", "b2", "c3", "d4", "e5"],
       ensure => present,
       gid    => [501, 502, 503, 504, 504]
     }
}
