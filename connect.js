var fs = require('fs'),
    tls = require('tls');


var options = {
    ca: [fs.readFileSync('server.crt')],
    secureProtocol: tls.TLSv1,
    servername: 'tls_drama'
};

var cleartextStream = tls.connect(2103, process.argv[2], options, function() {
    console.log('client connected',
              cleartextStream.authorized ? 'authorized' : 'unauthorized');
    cleartextStream.write("Hello");
    cleartextStream.end();

});

cleartextStream.setEncoding('utf8');

cleartextStream.on('data', function(data) {
  console.log(data);
});

cleartextStream.on('error', function(error) {
    console.log('ERROR', error)
});
