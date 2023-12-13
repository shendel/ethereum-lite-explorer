console.log(process.env)
const config = {
  backend: process.env.REACT_APP_BACKEND,
  rpc: process.env.REACT_APP_RPC,
  currency: 'PROXIMA',
  network: 'mainnet'
}

export default config