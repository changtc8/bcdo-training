{% for user, args in pillar['usrs'].iteritems() %}
{{ user }}:
  user.present:
    - fullname: {{ args['fullname'] }}
    - home: {{ args['home'] }}
    - shell: {{ args['shell'] }}
    - uid: {{ args['uid'] }}
    - gid: {{ args['gid'] }}
{% endfor %}
