{%- from "rsyslog/map.jinja" import server with context %}

{%- set file = salt['pillar.get']('rsyslog:file', {}) %}

include:
- rsyslog.common

{%- for name, config in file.iteritems() -%}

rsyslog_files_{{ name }}
  file.managed:
  - name: /etc/rsyslog.d/{{ name }}.conf
  - source: salt://rsyslog/files/file.conf
  - template: jinja
  - mode: 0640
  - context:
    config: {{ config | yaml }}
  - watch_in:
    - service: rsyslog_service

{% endfor %}