base:

  'os:Ubuntu':
    - match: grain
    - init_ubuntu
    
  'ranchernode*':
    - rancher.rancher_node
    
  'saltmaster*':
    - salt.master

