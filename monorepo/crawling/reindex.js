require('dotenv').config({ path: '../../.env' })

const { db } = require('./db')
const { etherApi } = require('./etherApi')
const { rpcGetLatestData, db_insertBlockData } = require('./rpcGetLatestData')

const rpcRecheckBlockNum = () => {
  eth_blockNumber()
}

const eth_blockNumber = async() => {
  const response = await etherApi({
    "jsonrpc":"2.0",
    "method":"eth_blockNumber",
    "params":[],
    "id":9
  })
  let latestBlock = response.data.result
  db_checkBlockNum(latestBlock)
}

const db_checkBlockNum = async(latestBlock) => {
  let blockNumber = parseInt(latestBlock, 16)

  // Checking 30 previous block data every minute
  for(let i = 1; i<31; i++){
    let checkNumber = blockNumber - i
    let number = Number(checkNumber)
    
    const txHashInsert = "SELECT IF(EXISTS(SELECT * from block_data WHERE blocknumber = ?), '1', '0' ) as RESULT";
    db.query(txHashInsert, [number], (err, result) => {
      let string = JSON.stringify(result)
      let parse = JSON.parse(string)
      let checkBlockNum = parse[0].RESULT

      if(checkBlockNum == '0') {
        console.log("[Info] missed block data", number)
        rpcGetLatestData(number)
      }
    })
  }
}

const wait = (ms) => {
  return new Promise((resolve) => {
    setTimeout(() => { resolve() }, ms)
  })
}
const doReindex = () => {
  return new Promise(async (resolve) => {
    const fromBlock = Number(process.argv.pop())
    console.log("[INDEX] Do re-index")
    const response = await etherApi({
      "jsonrpc":"2.0",
      "method":"eth_blockNumber",
      "params":[],
      "id":9
    })
    const latestBlock = Number(response.data.result, 16)
    console.log("[INDEX} From block:", fromBlock)
    console.log("[INDEX] Last block:", latestBlock)

    for (let curBlock = fromBlock; curBlock <= latestBlock; curBlock++) {
      console.log("[INDEX] Check block:", curBlock)
      await rpcGetLatestData(curBlock, true)
      await wait(100)
    }
    console.log("[INDEX] Ready")
    process.exit()
  })
}

doReindex()