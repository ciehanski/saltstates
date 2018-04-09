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
