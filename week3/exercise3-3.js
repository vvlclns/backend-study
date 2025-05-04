const express = require('express');
const app = express();
const port = 3000;

function factorial(num) {
    let result = 1;
    while (num > 0) {
        result = result * num;
        num--;
    }
    return result;
}

app.get('/factorial', (req, res) => {
    const number = req.query.number;
    res.redirect(`/factorial/${number}`);
})

app.get('/factorial/:number', (req, res) => {
    const num = req.params.number;
    const result = factorial(num);
    res.send({result});
})

app.listen(port, () => console.log(`Server listening on port ${port}!`));