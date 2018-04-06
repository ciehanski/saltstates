install_qga:
  pkg.installed:
    - name: qemu-guest-agent

change_ssh_port:
  /etc/ssh/sshd_config:
    - source: salt://etc/ssh/sshd_config.conf
    - mode: 0600
  service.running:
    - name: 'sshd'
    - reload: True

enable_ufw:
  cmd.run:
    - names:
      - sudo ufw allow from 192.168.100.0/24 proto tcp to any port 256
      - sudo ufw allow from 192.168.99.49 proto tcp to any port 19999
      - sudo ufw allow from 192.168.100.0/24 proto tcp to any port 19999
      - sudo ufw allow from 192.168.99.100 proto udp to any port 1514
  service.running:
    - name: ufw
    - enable: True

enable_rsyslog:
  cmd.run:
    - names:
      - sudo touch /etc/rsyslog.d/10-graylog.conf
      - echo -n "*.* @192.168.99.100:1514;RSYSLOG_SyslogProtocol23Format" | sudo tee /etc/rsyslog.d/10-graylog.conf
   service.running:
    - name: rsyslog
    - enable: True

update_upgrade_ubuntu:
  cmd run:
    - name: sudo apt-get update && sudo apt-get upgrade -y

install_netdata:
  cmd.run:
    - name: bash <(curl -Ss https://my-netdata.io/kickstart.sh) all
