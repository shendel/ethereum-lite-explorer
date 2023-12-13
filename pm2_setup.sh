npm i pm2 -g
echo "Setup PM2 services"

chmod +x ./pm2_crawl.sh
chmod +x ./pm2_back.sh
chmod +x ./pm2_front.sh

pm2 start pm2_crawl
pm2 start pm2_back
pm2 start pm2_front

pm2 save

echo "Ready..."