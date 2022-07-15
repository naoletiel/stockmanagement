
const express=require("express");
const mysql=require("mysql");
const app=express(); 
const path=require("path");
const bodyparser=require("body-parser");
const ejs=require("ejs");
const { rename } = require("fs");
const { connect } = require("http2");
//connection
const connection=mysql.createConnection({
    host:"localhost",
    user:"root",
    password:"",
    database:"stockdb"
});
connection.connect((error) => { 
if (!!error)console.log(error);
else console.log("database connected");
});
app.use(bodyparser.json());

//set views files
app.set("views",path.join(__dirname,"views"));
//set views engine
app.set("view engine","ejs");
app.use(bodyparser.json());
app.use(bodyparser.urlencoded({extended:false}));
app.listen((3000),()=>{
console.log("server is runing on port 3000..")
});
app.get("/",(req,res)=>{
    res.render("test"),{title:"my title"};
})
//login
app.get("/login",(req,res)=>{
  res.render("login.ejs"),{ title:"my title"};
  console.log(" Login Successful");
})
 app.post('/login', function (req, res) {
  console.log(req.body)
  let usr = req.body
  // res.render('login', {title: "Failed! Try again", failed: true});

  connection.query(`SELECT * from admins where username="${usr.uname}"`, function(err, rows, fields) {
    if (!err) {
      console.log('The solution is: ', rows[0]);

      if(typeof rows[0] != 'undefined' ){
        console.log("Successful Login");
        res.redirect('/');
      } else {
        res.render('login', {title: "Failed! Try again", failed: true});
      }
    }
    else
      throw err;
  });
  
})
//product page
app.get("/product",(req,res)=>{
  var query="SELECT * from products ";
  connection.query(query, function (error, rows,fields) {
   if (error) {throw error;}
   else
  res.render('product',{ title : "my project",products: rows}); 

  })
  })
  //selld page
app.get("/selled",(req,res)=>{
  var query="SELECT * from selled_items ";
  connection.query(query, function (error, row1,fields) {
   if (error) {throw error;}
   else
  
  res.render('selled',{ title : "my project",selled_items: row1}); 


  })
  })
  app.get("/items",(req,res)=>{
    res.render("items.ejs"),{ title:"my title"};
  })

  
 //register post
app.post('/register', function (req, res) {
  console.log(req.body)
  let usr = req.body
      connection.query(`INSERT INTO products(id, product_name, catagory, quantity, expiered_date, price,store_id) VALUES ('','${usr.name}','${usr.catagory}','${usr.quantity}','${usr.expierd_date}','${usr.price}','${usr.stock_id}')`, function(err, rows, fields) {
        if(!err) {
          res.redirect('/product');
        } else {
          res.render('items', {title : "Some error occurred", failed: true})
        }
      
    })
})
//delete
app.post ('/delete', function (req, res) {
  let order = req.body
    connection.query(`delete from products where id='${order.id}' `, function (err, rows,fields) {
     if (err) {throw err;}
     else
      res.send("deleted seccessfully");
        console.log(rows)
   })
    
    });
    //sell
app.post('/sell', function(req, res) {
  let order = req.body
      connection.query(`UPDATE products set quantity = quantity - ${order.quantity} where id=${order.id}`, function (err, results, fieldss) {
        if(!err)
        connection.query(`INSERT INTO selled_items(id, selling_price, selling_date, selled_quantity, product_id) VALUES ('','${order.price}','${order.date}','${order.quantity}','${order.id}')`,(req,res)=>{

       console.log('Successfully purchased');
        })
      });
      res.redirect('/selled')
    });
   //transfer
   app.post('/transfer', function(req, res) {
    let transfer = req.body
        connection.query(`UPDATE products set store_id = ${transfer.to} where store_id=${transfer.from} && id=${transfer.pid}`, function (err, results, fields) {
          if(!err)
          connection.query("INSERT INTO `transferd_items`(`id`, `tdate`, `from`, `to`, `product_id`) VALUES ('[value-1]','[value-2]','[value-3]','[value-4]','[value-5]')",(req,res)=>{
            
            console.log('Successfully transferd');
         
          })
        })
        res.redirect('/transfer')
      });
    app.get('/transfer', function(req, res) {
        var query="SELECT * from transferd_items ";
        connection.query(query, function (error, row2,fields) {
         if (error) {throw error;}
         else
        
        res.render('transfer',{ title : "transfer history",transferd_items: row2}); 
      
        })
        })
    // search by id
app.post('/search', function (req, res) {
  let order = req.body
  connection.query(`SELECT * from products where id=${order.id}`, function (error, results, fields) {
    if (error) throw error;
    res.render('product',{ title : "my project",products: results}); 
  });

})
    // search by id
    app.post('/store_products', function (req, res) {
      let order = req.body
      connection.query(`SELECT * from products where store_id='${order.id}'`, function (error, results, fields) {
        if (error) throw error;
        res.render('product',{ title : "my project",products: results}); 
      });
    
    })
    
app.use((req,res)=>{
  res.render("404.ejs"),{ title:"my title"};
})


      