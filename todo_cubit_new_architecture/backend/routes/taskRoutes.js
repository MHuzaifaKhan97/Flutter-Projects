const express = require('express');
const { getTasks,
     insertTask,
     deleteTask,
     updateTask 
    } = require('../controller/taskLogic');

const router = express.Router();

router.get('/', getTasks);
router.post('/', insertTask);
router.delete('/:id', deleteTask);
router.put('/:id', updateTask);

module.exports = router;