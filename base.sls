base:
 pkg:
   - installed
   - pkgs:
     - munin-node
     - rsyslog


munin:
 service.running:
  - name: munin-node
  - enable: True
  - full_restart: True
  - watch:
    - file: /etc/munin/munin-node.conf

/etc/munin/munin-node.conf:
  file.append:
   - text: 'allow ^10\.2\.4\.76$'



rsyslog:
 service.running:
  - name: rsyslog
  - enable: True
  - full_restart: True
  - watch:
    - file: /etc/rsyslog.conf

/etc/rsyslog.conf:
  file.append:
  - text: '*.* @@10.2.4.76:514'

cmd.run:
 - name: /etc/init.d/munin-node restart

