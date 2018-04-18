configure_keepalived:
  pkg.installed:
    - name: keepalived
  file.managed:
    - name: /etc/keepalived/keepalived.conf
    - source: salt://keepalived/rancher_keepalived.conf
  service.running:
    - name: 'keepalived'
    - enable: True
    - reload: True
