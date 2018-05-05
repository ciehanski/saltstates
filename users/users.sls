ubuntu:
  user.present:
    - fullname: Ubuntu User
    - shell: /bin/bash
    - home: /home/ubuntu
    - uid: 5000
    - gid: 5000
    - groups:
      - wheel

#zabbix01:
#  user.absent:
#    - purge: True

#zabbix01:
#  user.absent:
#    - purge: True
