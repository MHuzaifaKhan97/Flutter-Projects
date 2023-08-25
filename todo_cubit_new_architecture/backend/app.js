const express = require('express');
const taskRoute = require('./routes/taskRoutes.js');
const connectDB = require('./config/db');
const bodyParser = require('body-parser');
const cors = require('cors');

const app = express();
const port = process.env.PORT || 8080;


connectDB();

app.use([bodyParser.urlencoded({extended: true,}), express.json()])
app.use(cors());

app.use('/tasks', taskRoute);

app.listen(port, () => console.log('Its Working'));

module.exports = app;