#cloud-config

runcmd:
    - curl -fsSL https://get.docker.com/ | sh
    - docker -v