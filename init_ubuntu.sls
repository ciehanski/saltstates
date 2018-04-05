install_qga:
  pkg.installed:
    - name: qemu-guest-agent

change_ssh_port:
  file.replace:
    - name: '/etc/ssh/sshd_config'
    - pattern: '22'
    - repl: '256'
  service.running:
    - name: 'sshd'
    - reload: True

enable_ufw:
  sudo ufw allow from 192.168.100.0/24 proto tcp to any port 256:
    cmd.run
  sudo ufw allow from 192.168.99.49 proto tcp to any port 19999:
    cmd.run
  sudo ufw allow from 192.168.100.0/24 proto tcp to any port 19999:
    cmd.run
  sudo ufw allow from 192.168.99.100 proto udp to any port 1514:
    cmd.run
  service.running:
    - name: ufw
    - enable: True

enable_rsyslog:
  sudo touch /etc/rsyslog.d/10-graylog.conf:
    cmd.run
  echo -n "*.* @192.168.99.100:1514;RSYSLOG_SyslogProtocol23Format" | sudo tee /etc/rsyslog.d/10-graylog.conf:
    cmd.run
  service.running:
    - name: rsyslog
    - enable: True

install_netdata:
  bash <(curl -Ss https://my-netdata.io/kickstart.sh) all:
    cmd.run
