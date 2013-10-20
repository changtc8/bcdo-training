class hostname { 
  
     host { addhost:
       name => "mobileapp",
       ensure  => present,
       ip => "10.40.106.20"
     }

     host { delhost:
       name => "devop",
       ensure => absent,
       ip => "10.40.106.30"
     }
}
