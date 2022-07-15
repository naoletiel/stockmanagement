const  express = require("express");
//var session = require('express-session')
const path=require("path");
const mysql=require("mysql");
const bodyparser=require("body-parser");
//const fileUpload = require('express-fileupload');
const ejs=require("ejs");
const app=express();
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
//listening
app.listen(3000,()=>{
  console.log("server is runing on port 3000");
});


//set views files
app.set("views",path.join(__dirname,"views"));
//set views engine
app.set("view engine","ejs");
app.use(bodyparser.json());
app.use(bodyparser.urlencoded({extended:false}));
//display output
app.get ('/', function (req, res) {

  var query="SELECT * from admins ";
    connection.query(query, function (error, rows,fields) {
     if (error) {throw error;}
     else
     res.render("items" ,{ title : "my project",action:"list",admins: rows}); 
    });
    
res.send(rows);
         // res.render("user_index",{ title : "my project",action:"list",admins: "results"}); 
   })
    
    //});
    //display output
app.get ('/', function (req, res) {

  var query="SELECT * from products ";
    connection.query(query, function (error, rows,fields) {
     if (error) {throw error;}
     else
     //res.send(rows);
     res.render("index",{ title : "my project",action:"list",admins: rows}); 
   })
    
    });

    //delete
app.delete ('/:id', function (req, res) {

    var query="DELETE FROM `products` WHERE  id=?  ";
      connection.query(query,[req.params.id], function (error, rows,fields) {
       if (error) {throw error;}
       else
  res.send("deleted seccessfully");
          
     })
      
      });
       //insert
app.post ('/:id', function (req, res) {

    var query="INSERT INTO `products`(`id`, `product_name`, `catagory`, `quantity`, `expiered_date`, `price`) VALUES ('','[value-2]','[value-3]','[value-4]','[value-5]','[value-6]')  ";
      connection.query(query,[req.params.id], function (error, rows,fields) {
       if (error) {throw error;}
       else
  res.send("rows");
           
     })
      
      });
  

//login
app.get('/login', function (req, res) {
  res.render('login', {title : "Login"})
})
app.post('/login', function (req, res) {
  console.log(req.body)
  let usr = req.body

  connection.query(`SELECT * from admins where name="${usr.uname}"`, function(err, rows, fields) {
    if (!err) {
      console.log('The solution is: ', rows[0]);

      if(typeof rows[0] != 'undefined' && pwVerify(usr.pwd, rows[0].password)){
        console.log("Successful Login");
        req.session.user = {
          id : rows[0].id,
          username : rows[0].username,
        };
        res.redirect('/');
      } else {
        res.render('login', {title: "Failed! Try again", failed: true});
      }
    }
    else
      throw err;
  });
  
})

//});
const people=["eticha","ali","aman","jone"];
console.log(people);
module.exports="world";
