// Had to add const { TextEncoder, TextDecoder } = require("util"); 
// to top of node_modules/whatwg-url/dist/encoding.js 
const mongoose = require('mongoose');

const express = require("express");
const app = express();
const db = require('./config/keys').mongoURI;
mongoose
  .connect(db, { useNewUrlParser: true })
  .then(() => console.log("Connected to MongoDB successfully"))
  .catch(err => console.log(err));

app.get("/", (req, res) => res.send("Hello ?"));
const port = process.env.PORT || 5000;

app.listen(port, () => console.log(`Server is runnin on port ${port}`));

