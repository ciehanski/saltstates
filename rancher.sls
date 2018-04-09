install docker:
  curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -:
    cmd.run
  sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable":
    cmd.run
  sudo apt update:
    cmd.run
  docker:
    pkg.installed:
      - version: 17.03-ce
