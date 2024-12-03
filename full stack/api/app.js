const express = require("express");
const path = require("path");
const bodyParser = require('body-parser');

const app = express();
const port = process.env.PORT || "8000";

app.use(function (req, res, next) {
    res.header("Access-Control-Allow-Origin", "http://localhost:4200"); // update to match the domain you will make the request from
    res.header("Access-Control-Allow-Methods", "POST, PUT, GET, OPTIONS, DELETE, PATCH");
    res.header("Access-Control-Allow-Headers", "Origin, X-Requested-With, Content-Type, Accept");
    next();
});
app.use(bodyParser.json());

const { mongoose } = require('./db/mongoose');

const { List } = require('./db/models/list_model');
const { Task } = require('./db/models/task_model');







app.get("/", (req, res) => {
    res.status(200).send("WHATABYTE: Food For Devs");
});

app.get("/lists", (req, res) => {
    List.find({}).then((lists) => {
        res.send(lists);
    });
});

app.post("/lists", (req, res) => {
    let title = req.body.title;
    console.log(req.body);
    let newlist = new List({
        title
    });
    newlist.save().then((listDoc) => {
        res.send(listDoc);
    });
});

app.patch("/lists/:id", (req, res) => {

    List.findOneAndUpdate({ _id: req.params.id }, { $set: req.body }).then(() => {
        res.sendStatus(200);
    })
});

app.delete("/lists/:id", (req, res) => {

    List.findOneAndRemove({
        _id: req.params.id
    }).then((removedList) => {
        res.send(removedList);
    });
});


// Task API Routes

// FetchAll
app.get('/lists/:listId/tasks', (req, res) => {
    Task.find({
        _listId: req.params.listId
    }).then((tasks) => {
        res.send(tasks);
    });
});

// AddOne

app.post('/lists/:listId/tasks', (req, res) => {

    let newTask = new Task({
        title: req.body.title,
        _listId: req.params.listId
    });

    newTask.save().then((newTask) => {
        res.send(newTask);
    });
});


// Update an existing task

app.patch('/lists/:listId/tasks/:taskId', (req, res) => {
    console.log(req.body);

    Task.findOneAndUpdate({
        _id: req.params.taskId,
        _listId: req.params.listId
    }, {
        $set: req.body
    }).then(() => {
        res.send({ message: "updated Successfully" });
    })
});

// Delete an existing task

app.delete('/lists/:listId/tasks/:taskId', (req, res) => {
    Task.findByIdAndRemove({
        _id: req.params.taskId,
        _listId: req.params.listId
    }).then((removedTask) => {
        res.send(removedTask)
    })
});

app.listen(port, () => {
    console.log(`Listening to requests on http://localhost:${port}`);
});
