var express = require('express'),
	apirest = require('./routes/apirest');

var app = express();

var enableCORS = function(req, res, next){
	res.header('Access-Control-Allow-Origin', '*');
	res.header('Access-Control-Allow-Methods', 'GET,PUT,POST,DELETE,OPTIONS');
	res.header('Access-Control-Allow-Headers', 'Content-Type,	Authorization,	Content-Length	X-Requested-With');
	//intercept OPTIONS method
 	if ('OPTIONS' == req.method) {
		res.send(200);
	}
	else {
	next();
	}
};
// enable CORS!
app.use(enableCORS);
// warning deprecated...
app.use(express.bodyParser());

app.use(express.static('public'));
app.get('/is_alive', apirest.isalive);

app.listen(3000);
console.log('Listening on port 3000...');
