import config from "../config"
import axios from "axios";

const dbApi = axios.create({
  baseURL : config.backend,
  headers : {'content-type' : "application/json"}
})

export default dbApi