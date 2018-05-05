include:
  - users.users
  
install_qga:
  pkg.installed:
    - name: qemu-guest-agent

configure_ssh:
  file.managed:
    - name: /etc/ssh/sshd_config
    - source: salt://ssh/sshd_config
    - mode: 0600
  service.running:
    - name: 'sshd'
    - reload: True
    - watch:
      - file: /etc/ssh/sshd_config

enable_ufw:
  cmd.run:
    - names:
      - sudo ufw allow from 192.168.100.0/24 proto tcp to any port 256
      - sudo ufw allow from 192.168.99.49 proto tcp to any port 19999
      - sudo ufw allow from 192.168.100.0/24 proto tcp to any port 19999
      - sudo ufw allow from 192.168.99.100 proto udp to any port 1514
      - sudo ufw allow from 192.168.10.10 proto tcp to any port 4505
      - sudo ufw allow from 192.168.10.10 proto tcp to any port 4506
  service.running:
    - name: ufw
    - enable: True
    - reload: True

enable_rsyslog:
  cmd.run:
    - names:
      - sudo touch /etc/rsyslog.d/10-graylog.conf
      - echo -n "*.* @192.168.99.100:1514;RSYSLOG_SyslogProtocol23Format" | sudo tee /etc/rsyslog.d/10-graylog.conf
  service.running:
    - name: rsyslog
    - enable: True
