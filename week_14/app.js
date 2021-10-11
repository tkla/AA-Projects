// Had to add const { TextEncoder, TextDecoder } = require("util"); 
// to top of node_modules/whatwg-url/dist/encoding.js 
const mongoose = require('mongoose');
const express = require("express");
const db = require('./config/keys').mongoURI;
const users = require("./routes/api/users");
const tweets = require("./routes/api/tweets");
const bodyParser = require('body-parser');
const passport = require('passport');

const app = express();

const path = require('path');
if (process.env.NODE_ENV === 'production') {
   app.use(express.static('frontend/build'));
   app.get('/', (req, res) => {
     res.sendFile(path.resolve(__dirname, 'frontend', 'build', 'index.html'));
   })
}

mongoose
  .connect(db, { useNewUrlParser: true })
  .then(() => console.log("Connected to MongoDB successfully"))
  .catch(err => console.log(err));



app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: false }));
app.use("/api/users", users);
app.use("/api/tweets", tweets);

app.use(passport.initialize());
require('./config/passport')(passport);

const port = process.env.PORT || 5000;

app.listen(port, () => console.log(`Server is runnin on port ${port}`));

