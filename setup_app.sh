#! /bin/bash
chown -R app:app /home/app/oav_website
cd /home/app/oav_website

#ls -l /usr/local/rvm/rubies/ruby-2.2.5/lib/ruby/site_ruby/2.2.0/rubygems/ssl_certs
#sudo cp ./GlobalSignRootCA.pem /usr/local/rvm/rubies/ruby-2.2.5/lib/ruby/site_ruby/2.2.0/rubygems/ssl_certs/ 
#ls -l /usr/local/rvm/rubies/ruby-2.2.5/lib/ruby/site_ruby/2.2.0/rubygems/ssl_certs

#sudo -u app gem update 
#sudo -u app gem install bundler

#rm -r /home/app/oav_website/vendor/bundle

sudo -u app bundle install --deployment --verbose
sudo -u app bundle exec rake db:create RAILS_ENV=production
#sudo -u app bundle exec rake db:seed RAILS_ENV=production
mkdir -p /var/log/nginx
