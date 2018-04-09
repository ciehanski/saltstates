install_docker:
  cmd.run:
    - names:
      - curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
      - sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
      - sudo apt-get update
  pkg.installed:
    - name: docker-ce
    - version: 17.03.2-ce

configure_ufw:
  cmd.run:
    - names:
      - sudo ufw allow from 192.168.60.0/24 proto udp to any port 500
      - sudo ufw allow from 192.168.60.0/24 proto udp to any port 4500
      - sudo ufw allow from 192.168.60.5 proto tcp to any port 8080

join_rancher_cluster:
  cmd.run:
    - name: sudo docker run --rm --privileged -v /var/run/docker.sock:/var/run/docker.sock -v /var/lib/rancher:/var/lib/rancher rancher/agent:v1.2.10 http://192.168.60.5:8080/v1/scripts/F8C41F2B55B9591DDE1F:1514678400000:4HFcUIuSW7fSsfaZEt6d2GrrcU

disable_swap:
  cmd.run:
    - name: sudo sed -i '/ swap / s/^/#/' /etc/fstab
