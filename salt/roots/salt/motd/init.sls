/etc/motd.tail:
      file.managed:
        - contents: "Welcome to your Vagrant-built virtual machine!\nManaged by SaltStack. test\n"
        - user: root
        - group: root
        - mode: 644
