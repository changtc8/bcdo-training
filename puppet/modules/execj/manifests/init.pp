class execj { 
  
     exec { sshd:
       command => "ssh restart",
       path => "/etc/init.d",
     }
}
