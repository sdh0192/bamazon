var mysql = require("mysql");
var inquirer = require("inquirer");

var connection = mysql.createConnection({
    host: "localhost",
    port: 3306,
    user: "root",
    password: "",
    database: "bamazon_db"
});

connection.connect(function (err) {
    console.log("Connected as id: " + connection.threadId);
    start();
});

var start = function () {
    connection.query("SELECT * FROM products", function (err, response) {
        if (err) {
            console.log(err)
        }
        console.log(response);
        inquirer.prompt([{
            name: "whattobuy",
            type: "input",
            message: "What is the ID of the product you would like to buy?"
        }, {
            name: "howmanytobuy",
            type: "input",
            message: "How many would you like to buy?"
        }]).then(function(answer){
            var chosenProduct;
            for (var i = 0; i < response.length; i++){
                if(response[i].id === parseInt(answer.whattobuy)){
                    chosenProduct = response[i];
                }
            }
            if(chosenProduct.stockquantity < parseInt(answer.howmanytobuy)){
                console.log("Sorry! We dont have enough in stock! Get out of my store!")
                connection.end();
            } else {
                var quantityUpdate = chosenProduct.stockquantity - parseInt(answer.howmanytobuy);
                connection.query("UPDATE products SET ? WHERE ?",[
                    {stockquantity: quantityUpdate},
                    {id: chosenProduct.id}
                ], function(err){
                    if(err){
                        console.log(err);
                    } else {
                        var totalPrice = parseInt(answer.howmanytobuy) * chosenProduct.price;
                        console.log("Your total price is " + totalPrice);
                        console.log("We now have " + quantityUpdate + " left of this product. Goodbye!");
                        connection.end();
                    }
                });
            };
        });
    }
    
)}