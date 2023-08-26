const TASK = require('../model/task');

module.exports = {
    getTasks: async (req, res, next) => {
        const tasks = await TASK.find();
        let taskList = [];
        tasks.map((res) => {
            
          taskList.push({
            id: res.id,
            task_name: res.task_name,
            task_description: res.task_description,
        });
        })

        res.json(taskList)
    },
    insertTask: async (req, res) => {
        console.log(req.body);
        const task = await new TASK({
            task_name: req.body.task_name,
            task_description: req.body.task_description,
        })

        task.save();
        console.log(task);
        res.json({
            "message": "Task Successfully Inserted",
            id: task.id,
            task_name: task.task_name
        })
    },
    deleteTask: async (req, res) => {
        const id = req.params.id;
        await TASK.findByIdAndRemove(id)
        res.json({
            // "delete":del,
            "message": "Task Successfully Deleted"
        })
    },
    updateTask: async (req, res) => {
        const id = req.params.id;
        let task = await TASK.findById(id);

        task.id = id
        task.task_name = req.body.task_name
        task.task_description = req.body.task_description

        let updatedTask = await task.save();

        res.json({
            "res":updatedTask
        })
    }
}