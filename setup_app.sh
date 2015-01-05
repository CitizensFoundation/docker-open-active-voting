#! /bin/bash
chown -R app:app /home/app/oav_website
cd /home/app/oav_website
sudo -u app bundle install --deployment
sudo -u app rake db:migrate RAILS_ENV=production
sudo -u app rake assets:precompile
export RAILS_SECRET_TOKEN=82d58d3dfb91238b495a311eb8539edf5064784f1d58994679db8363ec241c745bef0b446bfe44d66cbf91a2f4e497d8f6b1ef1656e3f405b0d263a9617ac75e
sudo -u app rake db:seed RAILS_ENV=production
echo 'done seed'
mkdir -p /var/log/nginx
