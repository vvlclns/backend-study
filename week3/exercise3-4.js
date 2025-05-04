const express = require('express');
const app = express();
const port = 3000;

app.use(express.urlencoded({ extended: true })); // body 데이터를 정상적으로 받기 위한 미들웨어

app.set('views', `${__dirname}/views`);
app.set('view engine', 'pug');

app.get('/', (req, res) => { // 로그인할 수 있는 웹페이지를 응답
    res.render('login.pug');
})

app.post('/login', (req, res) => { // 로그인 페이지에서 받은 username과 password 값을 텍스트로 응답
    const username = req.body.username;
    const password = req.body.password;
    res.send(`username: ${username}, password: ${password}`);
})

app.listen(port, () => console.log(`Server listening on port ${port}!`));