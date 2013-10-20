{% for group, args in pillar['grps'].iteritems() %}
{{ group }}:
  group.present:
    - name: {{ group }}
{% if 'gid' in args %}
    - gid: {{ args['gid'] }}
{% endif %}
{% endfor %}
