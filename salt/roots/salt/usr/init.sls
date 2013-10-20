fred:
  user.present:
    - fullname: Fred Jones
    - shell: /bin/zsh
    - home: /home/fred
    - uid: 2000
    - gid: 500
    - groups:
      - devops

testuser:
  user.absent
