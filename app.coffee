###
# Express Bootstrap
###
express = require "express"
async = require "async"

app = express()

require("./config/environments").init app, express
require("./config/routes").init	app

if process.env.HTTPS
        webServer = require("./webserverssl").init app
    else
        webServer = require("./webserver").init app

webSocketServer = require("./websocketserver").init app, webServer
