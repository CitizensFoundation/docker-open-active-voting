#! /bin/bash
chown -R app:app /home/app/oav_website
cd /home/app/oav_website

#sudo -u app gem update
#sudo -u app gem install bundler

#rm -r /home/app/oav_website/vendor/bundle

sudo -u app bundle install --deployment --verbose
sudo -u app bundle exec rake db:create RAILS_ENV=production
mkdir -p /var/log/nginx
