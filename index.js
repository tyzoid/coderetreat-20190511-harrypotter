var express = require('express')
var app = express()

app.get('/', function (req, res) {
  res.send('hello world')
})

var port = 8080;
app.listen(port, () => console.log("Listening..."))
