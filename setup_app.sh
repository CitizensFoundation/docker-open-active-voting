#! /bin/bash
chown -R app:app /home/app/oav_website
cd /home/app/oav_website
sudo -u app bundle install --deployment
sudo -u app rake db:migrate RAILS_ENV=production
sudo -u app rake assets:precompile
export RAILS_SECRET_TOKEN=3j92193j2193j2193j219j392132193j2193j2193j2193j9213j921j3912j3921j3921j39j213
RAILS_SECRET_TOKEN=3j92193j2193j2193j219j392132193j2193j2193j2193j9213j921j3912j3921j3921j39j213
sudo -u app rake db:seed RAILS_ENV=production
echo 'done seed'
mkdir -p /var/log/nginx
