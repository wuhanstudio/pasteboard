###
# Web Server Setup
###
fs   = require "fs"
http = require "https"

privateKey = fs.readFileSync(process.env.SSL_KEY).toString();
certificate = fs.readFileSync(process.env.SSL_CERT).toString();

credentials = {key: privateKey, cert: certificate};

exports.init = (app) ->
	http.createServer(credentials,app).listen app.get("port"), ->
		console.log "Express server listening on port #{app.get "port"}"
