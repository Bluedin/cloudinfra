var fs = require('fs');
var https = require('https');
var express = require('express');
var options = {
	key	: fs.readFileSync('server.key'),
	cert	: fs.readFileSync('server.crt')
};

var app = express();

app.use(express.static('public'));

https.createServer(options, app).listen(3000, function(){
	console.log('Started!');
});

