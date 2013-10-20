sshd:
   pkg:
     - installed
   
   cmd.run:
     - name: sed -i.bak -e /PermitRootLogin/s/yes/no/ /etc/ssh/sshd_config  
     - user: root

   service:
     - running
     - enable: True
     - watch:
       - file: /etc/ssh/sshd_config
       - pkg: sshd         

