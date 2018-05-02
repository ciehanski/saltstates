install_zabbix_agent:
  cmd.run:
    - names: 
      - sudo wget http://repo.zabbix.com/zabbix/3.5/ubuntu/pool/main/z/zabbix-release/zabbix-release_3.5-1%2Bxenial_all.deb
      - sudo dpkg -i zabbix-release_3.5-1%2Bxenial_all.deb
      - sudo apt-get update
  pkg.installed:
    - name: zabbix-agent
    - enable: True
