const { runQuery } = require('./database');
const express = require('express');
const app = express();
const port = 3000;

app.get('/fare', async (req, res) => {
    const uid = req.query.uid;
    try {
        const sql = `
            SELECT SUM(ROUND(types.fare_rate * trains.distance * 0.001, -2)) AS total_fare
            FROM tickets
            JOIN trains ON tickets.train = trains.id
            JOIN types ON trains.type = types.id
            WHERE tickets.user = ${uid}
        `;
        const result = await runQuery(sql);
        res.type('text/plain').send(`Total fare is ${result[0].total_fare} KRW.`);
    } catch (err) {
        console.error(err);
        res.status(500).type('text/plain').send('Internal Server Error');
    }
});

app.get('/train/status', async (req, res) => {
    const tid = req.query.tid;
    try {
        const sql = `
            SELECT COUNT(tickets.id) AS occupied, types.max_seats AS maximum
            FROM trains
            JOIN types ON trains.type = types.id
            LEFT JOIN tickets ON trains.id = tickets.train
            WHERE trains.id = ${tid}
            GROUP BY trains.id
        `;
        const result = await runQuery(sql);
        res.type('text/plain');
        const { occupied, maximum } = result[0];
        res.send(Number(occupied) >= Number(maximum) ? 'Train is sold out' : 'Train is not sold out');
    } catch (err) {
        console.error(err);
        res.status(500).type('text/plain').send('Internal Server Error');
    }
});

app.listen(port, () => console.log(`Server listening on port ${port}!`));