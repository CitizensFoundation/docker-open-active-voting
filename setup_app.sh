#! /bin/bash
chown -R app:app /home/app/oav_website
cd /home/app/oav_website
sudo -u app bundle install --deployment
sudo -u app rake db:migrate RAILS_ENV=production
sudo -u app rake assets:precompile
mkdir -p /var/log/nginx
