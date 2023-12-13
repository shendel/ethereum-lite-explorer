#!/bin/bash
npm i pm2 -g
echo "Setup PM2 services"
pm2 start pm2_crawl
pm2 start pm2_back
pm2 start pm2_front
pm2 save
echo "Ready..."