require('dotenv').config();
const mongoose = require("mongoose");
//const uri = "mongodb://localhost:27017/login";
const uri = process.env.MONGO_URI;

//connection do database
mongoose.connect(uri)
.then(() => {
    console.log("Database connected successfully to MongoDB Atlas");
}).catch((err) => {
    console.error("Database connection error: ", err);
});




// Create a schema
const LoginSchema = new mongoose.Schema({  
    username:   {
        type: String,
        required: true
    },
    fullname:   {
        type: String,
        required: true
    },
    email:   {
        type: String,
        required: true
    },
    password:   {
        type: String,
        required: true
    },
    orgName:   {
        type: String,
        required: true
    },
    centre:   {
        type: String,
        required: true
    },
    role:   {
        type: String,
        required: true
    },
    status:   {
        type: String,
        required: true
    }
});

//collection Part  Model
const collection = new mongoose.model("users", LoginSchema);

module.exports = collection;