include:
  - init.ubuntu
  
install_docker:
  cmd.run:
    - name: curl https://releases.rancher.com/install-docker/17.03.sh | sh
  pkg.installed:
    - name: docker-ce

configure_ufw:
  cmd.run:
    - names:
      - sudo ufw allow from 192.168.60.0/24 proto udp to any port 500
      - sudo ufw allow from 192.168.60.0/24 proto udp to any port 4500
      - sudo ufw allow from 192.168.60.5 proto tcp to any port 8080
      - sudo ufw allow from 192.168.60.0/24 proto tcp to any port 10250
      - sudo ufw allow from 192.168.60.0/24 proto tcp to any port 10255
      - sudo ufw allow 30000:32767/tcp
  service.running:
    - name: ufw
    - enable: True
    - reload: True

join_rancher_cluster:
  cmd.run:
    - name: sudo docker run --rm --privileged -v /var/run/docker.sock:/var/run/docker.sock -v /var/lib/rancher:/var/lib/rancher rancher/agent:v1.2.10 http://192.168.60.5:8080/v1/scripts/2D923062CC4B3275060B:1514678400000:rfkerzmnYka4bIdaa7hysXC4Mw

disable_swap:
  cmd.run:
    - name: sudo sed -i '/ swap / s/^/#/' /etc/fstab
