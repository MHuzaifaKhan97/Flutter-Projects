const mongoose = require('mongoose');

const task = mongoose.Schema({
    task_name: String,
    task_description: String,
})

module.exports = mongoose.model('TASK', task);