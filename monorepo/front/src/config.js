require('dotenv').config()

const config = {
  backend: process.env.BACKEND,
  rpc: process.env.RPC,
  currency: 'PROXIMA',
  network: 'mainnet'
}

export default config