DROP DATABASE IF EXISTS bamazon_db;
CREATE DATABASE bamazon_db;
USE bamazon_db;

CREATE TABLE products (
id INTEGER NOT NULL AUTO_INCREMENT,
productname VARCHAR(255) NOT NULL,
departmentname VARCHAR(255) NOT NULL,
price INTEGER NOT NULL,
stockquantity INTEGER NOT NULL,
PRIMARY KEY (id)
);


INSERT INTO products (productname, departmentname, price, stockquantity)
VALUES ("Cowboy Hat", "Clothing", 100, 25);

INSERT INTO products (productname, departmentname, price, stockquantity)
VALUES ("Football Jersey", "Clothing", 250, 20);

INSERT INTO products (productname, departmentname, price, stockquantity)
VALUES ("Dallas Cowboys T-Shirt", "Clothing", 25, 100);

INSERT INTO products (productname, departmentname, price, stockquantity)
VALUES ("Playstation 4", "Video Games", 300, 10);

INSERT INTO products (productname, departmentname, price, stockquantity)
VALUES ("XBOX Controller", "Video Games", 60, 100);

INSERT INTO products (productname, departmentname, price, stockquantity)
VALUES ("60 inch HDTV", "Electronics", 500, 5);

INSERT INTO products (productname, departmentname, price, stockquantity)
VALUES ("iPad Pro 2", "Electronics", 300, 15);

INSERT INTO products (productname, departmentname, price, stockquantity)
VALUES ("iPhone X", "Electronics", 1000, 5);

INSERT INTO products (productname, departmentname, price, stockquantity)
VALUES ("Dining Room Table", "Furniture", 150, 30);

INSERT INTO products (productname, departmentname, price, stockquantity)
VALUES ("Leather Loveseat", "Furniture", 500, 3);