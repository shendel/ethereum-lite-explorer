npm i pm2 -g
echo "Setup PM2 services"

pm2 start pm2_crawl.sh
pm2 start pm2_back.sh
pm2 start pm2_front.sh

pm2 save

echo "Ready..."