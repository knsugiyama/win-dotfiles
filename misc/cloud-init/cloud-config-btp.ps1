# 事前に作成した.pubファイルを変数に読み込む
# 作成してない場合 : ssh-keygen -t rsa -b 4096 -C "your_email@example.com" -f $HOME/.ssh/multipass_docker
$AUTHORIZED_KEYS = Get-Content $HOME/.ssh/multipass_docker.pub

# ヒアドキュメントでファイルを作成する
Set-Content -Path "$HOME/multipass_btp.yaml" -Force -Value @"
locale: en_US.UTF8
timezone: Asia/Tokyo
package_upgrade: true
users:
  - name: ubuntu
    sudo: ALL=(ALL) NOPASSWD:ALL
    ssh-authorized-keys:
      - $AUTHORIZED_KEYS

packages:
  - docker
  - avahi-daemon
  - apt-transport-https
  - ca-certificates
  - curl
  - gnupg
  - lsb-release
  - build-essential
  - unzip

runcmd:
  # ユーザー作成
  - sudo curl -fsSL https://get.docker.com | sudo bash
  - sudo systemctl enable docker
  - sudo systemctl enable -s HUP ssh
  - sudo groupadd docker
  - sudo usermod -aG docker ubuntu
  # CF Cli 追加
  - wget -q -O - https://packages.cloudfoundry.org/debian/cli.cloudfoundry.org.key | sudo apt-key add
  - echo "deb https://packages.cloudfoundry.org/debian stable main" | sudo tee /etc/apt/sources.list.d/cloudfoundry-cli.list
  - sudo apt-get update
  - sudo apt-get install cf8-cli
  # AWS Cli 追加
  - curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
  - unzip awscliv2.zip
  - sudo ./aws/install
"@
