const mongoose = require('mongoose');


const connectDB = async () => {
    try{
        const conn = await mongoose.connect('connection String', {

        })
        console.log(`MongoDB Connected: ${conn.connection.host}`);
    }
    catch(e){
        console.log(`Error: ${e.message}`);
        process.exit(1); // that's means exit with failure
    }
}

module.exports = connectDB;