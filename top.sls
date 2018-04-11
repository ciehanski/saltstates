base:

  'os:Ubuntu':
    - match: grain
    - init.ubuntu
    
  'ranchernode*':
    - rancher.rancher_node
    
  'saltmaster*':
    - salt.master

