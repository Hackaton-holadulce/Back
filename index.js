const express = require('express'),
//información que tu le mandas por un formulario
      bodyParser = require('body-parser'),
      app = express(),
      connection = require('./config'),
      router = express.Router();


const port = 5000;
var cors = require('cors')
app.use(cors())
app.use(bodyParser.urlencoded({ extended: false }));
// 3 WE CONVERT INTO JSON FORMAT

app.use(bodyParser.json());

// ROUTE TO MAIN PAGE
app.get('/', function(req, res) {
    res.send('Start');
});

//Show all ingredients
app.get('/ingredient', (req, res) => {

  connection.query('SELECT * FROM ingredient', (err, results) => {
    if(err) {
      res.status(500).send(err)
    } else {
      res.json(results)
    }  })
})

app.get('/box_recipe', (req, res) => {

  connection.query('SELECT * FROM box_recipe', (err, results) => {
    if(err) {
      res.status(500).send(err)
    } else {
      res.json(results)
    }  })
})




app.listen(port,(err)=>{
    if (err) {
    throw new Error('Something bad happened...');
    }
    console.log(`Server listening to port ${port}`)
});
