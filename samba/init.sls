{% from "samba/map.jinja" import samba with context %}

samba:
  pkg:
    - installed
    - name: {{ samba.server }}
  service:
    - running
    - name: {{ samba.service }}
    - enable: True
    - require:
      - pkg: samba
      - pkg: avahi

/etc/avahi/services/smb.service:
    file:
        - managed
        - source: salt://samba/files/smb.service
        - replace: True
        - user: root
        - group: root
        - mode: 600

