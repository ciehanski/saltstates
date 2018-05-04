install_zabbix_agent:
  cmd.run:
    - names: 
      - sudo wget http://repo.zabbix.com/zabbix/3.5/ubuntu/pool/main/z/zabbix-release/zabbix-release_3.5-1%2Bxenial_all.deb
      - sudo dpkg -i zabbix-release_3.5-1+xenial_all.deb 
      - sudo apt-get update
  pkg.installed:
    - name: zabbix-agent
    - enable: True
  service.running:
    - name: zabbix-agent
    - reload: True

add_firewall_rules:
  cmd.run:
    - name: sudo ufw allow from 192.168.30.100 proto tcp to any port 10050
  service.running:
    - name: ufw
    - reload: True
