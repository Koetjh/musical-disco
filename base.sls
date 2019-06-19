base:
 pkg:
   - installed
   - pkgs:
     - munin-node
     - rsyslog

 service.running:
  - name: munin-node
  - enable: True
  - reload: True
  - name: rsyslog
  - enable: True
  - reload: True

/etc/munin/munin-node.conf:
  file.append:
   - text: 'allow ^10\.2\.4\.25$'

/etc/rsyslog.conf:
  file.append:
  - text: '*. * @@10.2.4.25:514'
