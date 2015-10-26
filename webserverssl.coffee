###
# Web Server Setup
###
fs   = require "fs"
http = require "https"

privateKey = fs.readFileSync("../pasteboard.key").toString();
certificate = fs.readFileSync("../pasteboard.crt").toString();

credentials = {key: privateKey, cert: certificate};

exports.init = (app) ->
	http.createServer(credentials,app).listen app.get("port"), ->
		console.log "Express server listening on port #{app.get "port"}"
