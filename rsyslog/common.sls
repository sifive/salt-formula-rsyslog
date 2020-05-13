{%- from "rsyslog/map.jinja" import global with context %}

rsyslog_packages:
  pkg.latest:
  - names: {{ global.pkgs|yaml }}

rsyslog_service:
  service.running:
  - enable: true
  - name: rsyslog
