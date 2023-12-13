import config from "../config"
import axios from "axios";

const etherApi = axios.create({
  baseURL: config.rpc,
  headers : {'content-type' : "application/json"}
})

export default etherApi