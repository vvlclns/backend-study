// const http = require('http');

// const hostname = '127.0.0.1';
// const port = 3001;

// const server = http.createServer((req, res) => {
// res.statusCode = 200;
// res.setHeader('Content-Type', 'text/plain');
// res.end('Hello World\n');
// });

// server.listen(port, hostname, () => {
// console.log(`Server running at http://${hostname}:${port}/`);
// });



// 동기식
// const fs = require('fs');

// console.log('String 1');

// const data = fs.readFileSync('./sample.txt');
// console.log(`Data length: ${data.length} bytes`);

// console.log('String 2');



//비동기식
const fs = require('fs');

console.log('String 1');

fs.readFile('./sample.txt', (err, data) => {
    if (!err) console.log(`Data length: ${data.length} bytes`);
    else console.error(err);
});

console.log('String 2');