const express = require('express');
const app = express();
const port = 3000;

app.use(express.urlencoded({ extended: true })); // body 데이터를 정상적으로 받기 위한 미들웨어

function stringfy(obj) { // 객체를 문자열로 변환하는 함수
    return Object.keys(obj).map(k => `${k}: ${obj[k]}`).join('\n');
}

app.get('/', (req, res) => {
    const queryData = req.query; // 객체 형태
    const stringfyData = stringfy(queryData);
    res.send(stringfyData);
})

app.post('/', (req, res) => {
    const bodyData = req.body; // 객체 형태
    const stringfyData = stringfy(bodyData);
    res.send(stringfyData);
})

app.put('/', (req, res) => {
    const bodyData = req.body;
    const stringfyData = stringfy(bodyData);
    res.send(stringfyData);
})

app.delete('/', (req, res) => {
    const bodyData = req.body;
    const stringfyData = stringfy(bodyData);
    res.send(stringfyData);
})

app.listen(port, () => console.log(`Server listening on port ${port}!`));
