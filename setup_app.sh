#! /bin/bash
chown -R app:app /home/app/oav_website
cd /home/app/oav_website
#rm -r /home/app/oav_website/vendor/bundle
sudo -u app gem install rake
sudo -u app bundle install --deployment
sudo -u app bundle exec rake db:migrate RAILS_ENV=production
mkdir -p /var/log/nginx
