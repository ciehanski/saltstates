base:

  'os:Ubuntu':
    - match: grain
    - init.ubuntu
    - zabbix.zabbix_agent
    
  'ranchernode*':
    - rancher.rancher_node
    
  'saltmaster*':
    - salt.master

