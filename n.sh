#bin/bash
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
