node default {
   include motd
#  include cronj
#  include execj
#  include grp
#  include hostname
#  include ssh
   include usr
#   class { "usr": }
}
