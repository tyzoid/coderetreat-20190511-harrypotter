var express = require('express');
var app = express();

var books = [];

app.get('/', function (req, res) {
  res.send('hello world');
});

app.get('/reset', function(req, res) {
  books = [];
  res.send('state reset');
});

app.get('/price', function(req, res) {
  var discountGroups = [];
  var inserted = false;
  for (let book of books) {
    for (let group of discountGroups) {
      if (!group.includes(book)) {
        group.push(book);
        inserted = true;
        break;
      }
    }
    if (!inserted) {
      discountGroups.push([book]);
    }
    inserted = false;
  }

  var price = 0;
  var prices = [1,.95,.90,.80,.75];
  for (let group of discountGroups) {
    price += group.length * 8 * prices[group.length-1];
  }

  res.send(""+price);
});

app.get('/order/:id', function(req, res){
  var book = +req.params.id
  res.send('book ' + book + ' ordered');
  books.push(book);
});

var port = 8080;
app.listen(port, () => console.log("Listening..."))
