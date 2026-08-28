const express = require("express");

const app = express();

app.get("/", (req, res) => {
    res.send(`
        <h1>DevOps Calculator App</h1>
        <p>Application is running successfully!</p>
    `);
});

app.get("/add", (req, res) => {
    const a = Number(req.query.a || 0);
    const b = Number(req.query.b || 0);

    res.json({
        operation: "addition",
        a: a,
        b: b,
        result: a + b
    });
});

app.get("/health", (req, res) => {
    res.json({
        status: "healthy"
    });
});

const PORT = process.env.PORT || 8080;

app.listen(PORT, () => {
    console.log(`Calculator app running on port ${PORT}`);
});