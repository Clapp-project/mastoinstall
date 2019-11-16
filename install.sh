#!/bin/bash
echo ""
echo "-------------------------------"
echo "   0000000000000000000000000   "
echo "  000000000000000000000000000  "
echo "  00                     0000  "
echo "  00     0000    0000    0000  "
echo "  00     0000    0000    0000  "
echo "  00     0000    0000    0000  "
echo "  00     0000    0000    0000  "
echo "  000000000000000000000000000  "
echo "  0000                         "
echo "  0000                         "
echo "  00000000000                  "

echo " Mastodon Intaller for SAKURA NO VPS"
echo " (C) 2019 Clapp_project ver 1.0"

echo "アップデートします"
apt update && apt upgrade -y

echo "install curl"
apt install -y curl
echo "nodejs install"
curl -sL https://deb.nodesource.com/setup_8.x | bash -
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list

echo "システムパッケージのインストール　しばらくお待ちください。"
apt install -y \
  imagemagick ffmpeg libpq-dev libxml2-dev libxslt1-dev file git-core \
  g++ libprotobuf-dev protobuf-compiler pkg-config nodejs gcc autoconf \
  bison build-essential libssl-dev libyaml-dev libreadline6-dev \
  zlib1g-dev libncurses5-dev libffi-dev libgdbm5 libgdbm-dev \
  nginx redis-server redis-tools postgresql postgresql-contrib \
  certbot python-certbot-nginx yarn libidn11-dev libicu-dev libjemalloc-dev
  
 echo "add user mastodon"
 adduser --disabled-login mastodon
 
 su - mastodon
 
 echo "install ruby"
 git clone https://github.com/rbenv/rbenv.git ~/.rbenv
cd ~/.rbenv && src/configure && make -C src
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(rbenv init -)"' >> ~/.bashrc
exec bash
git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build

RUBY_CONFIGURE_OPTS=--with-jemalloc rbenv install 2.6.1
rbenv global 2.6.1
echo "install gem"
gem update --system

gem install bundler --no-document

exit 0
