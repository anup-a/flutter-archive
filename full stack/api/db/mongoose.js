const mongoose = require('mongoose');

mongoose.Promise = global.Promise;

mongoose.connect('mongodb://localhost/taskmanager', { useNewUrlParser: true, useUnifiedTopology: true }).then(() => {
    console.log('connected successfully');
}).catch((e) => {
    console.log("error in db connection");
    console.log(e);
});

mongoose.set('useCreateIndex', true);
mongoose.set('useFindAndModify', false);

module.exports = {
    mongoose
};