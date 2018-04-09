install docker:
  cmd.run:
    - names:
      - curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
      - sudo add-apt-repository \
        "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
        $(lsb_release -cs) \
        stable"
      - sudo apt update
  docker-ce:
    pkg.installed:
      - version: 17.03.2-ce

configure ufw:
  

join rancher cluster:
  cmd.run:
    - name: sudo docker run --rm --privileged -v /var/run/docker.sock:/var/run/docker.sock -v /var/lib/rancher:/var/lib/rancher rancher/agent:v1.2.10 http://192.168.60.5:8080/v1/scripts/F8C41F2B55B9591DDE1F:1514678400000:4HFcUIuSW7fSsfaZEt6d2GrrcU
