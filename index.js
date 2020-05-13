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

//display all stock for every ingredient

app.get('/stock_ingredients', (req, res) => {

  connection.query('SELECT * FROM stock_ingredients', (err, results) => {
    if(err) {
      res.status(500).send(err)
    } else {
      res.json(results)
    }  })
})



//Show all recipes

app.get('/box_recipe', (req, res) => {

  connection.query('SELECT * FROM box_recipe', (err, results) => {
    if(err) {
      res.status(500).send(err)
    } else {
      res.json(results)
    }  })
})


//add post method to integrate recipe inside the table
app.post('/box_recipe', (req, res) => {

  const formData = {
    name: req.body.name,
    description: req.body.description,
    ingredients_quantity: req.body.ingredients_quantity
  }
    connection.query(`INSERT INTO box_recipe (name, description) VALUES ('${formData.name}', '${formData.description}')`
 , (err) => {          // WE need to say formData to kw where to go searching the information
      if(err){
        res.status(500).send(err)
      } else {
        connection.query('SELECT id_box FROM box_recipe ORDER BY id_box DESC LIMIT 1', (err, results) => {
          if(err) {
            res.status(500).send(err)
          } else {
            let box_id = results[0].id_box


          formData.ingredients_quantity.map((ingredient_quantity) => {
            let ingredient = ingredient_quantity["ingredient"]
            let quantity = ingredient_quantity["quantity"]

              connection.query(`INSERT INTO quantities_ingredient (id_ingredient, id_box, quantity) VALUES (${ingredient}, ${box_id}, ${quantity}) `, (err) => {          // WE need to say formData to kw where to go searching the information
                if(err){
                  res.status(500).send(err)
                } else {
                  res.sendStatus(200)
                }
              })
            })
          }})
        }
      })
  });

// post ingredient



app.post('/ingredient', (req, res) => {

  const formData = {
    name: req.body.name,
    alergies: req.body.alergies,
  }
    connection.query(`INSERT INTO ingredient SET ?`, formData, (err) => {
      if(err){
        res.status(500).send(err)
      } else {
        console.log('BIG SUCCESS')
        res.sendStatus(200)
      }
    })
});



// post stock, add products when they are recibed (name, expiration_date, kg)

//creo que para hacer la conexión entre las dos tablas sería al revés por que a stock le tenemos que pasar ingredient_id no al revés


app.post('/stock_ingredients', (req, res) => {

  const formData = {
    name: req.body.name,
    expiration_date: req.body.expiration_date,
    kg: req.body.kg,
    id_ingredient: req.body.id_ingredient
  }
    connection.query(`INSERT INTO stock_ingredients SET ?`, formData, (err) => {
      if(err){
        res.status(500).send(err)
      } else {
        console.log('BIG SUCCESS')
        res.sendStatus(200)
      }
    })
});



// port listen

app.listen(port,(err)=>{
    if (err) {
    throw new Error('Something bad happened...');
    }
    console.log(`Server listening to port ${port}`)
});
