const helmet = require('helmet');
const { port } = require('../config/server');
const app = require('express')();

app.use(helmet());

app.get('/', (req, res, next) => {
 res.send('hello world!');
});

app.listen(port, () => {
 console.log(`app listening on ${port}`);
});
