require('dotenv').config({ path: '../../.env' })

const express = require("express")
const app = express()
const server_host = process.env.CRAWL_HOST
const server_port = process.env.CRAWL_PORT

const { rpcCheckBlockNum } = require('./rpcCheckBlockNum')
const { rpcRecheckBlockNum } = require('./rpcRecheckBlockNum')

let rpcCheckBlockNumError = false
// forever
setInterval(() => rpcCheckBlockNum(), 2000) // Checking latest block data every 2 seconds
setInterval(() => rpcRecheckBlockNum() , 60000) // Checking 30 previous block data every minute

app.get("/", (req, res) =>{
  res.json({
    Type: "RPC Crawling server",
  })
})

app.listen(server_port, server_host, () => {
  console.log(`RPC Crawl server started at http://${server_host}:${server_port}`);
})
