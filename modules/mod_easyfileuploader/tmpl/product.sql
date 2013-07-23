CREATE TABLE product
(
pro_Id int NOT NULL,
pro_Description varchar(255) NOT NULL,
pro_Category varchar(255),
PRIMARY KEY (`proId`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE category
(
cat_Id int NOT NULL,
pro_Id int NOT NULL,
cat_Description varchar(255) NOT NULL,
cat_Category varchar(255),
PRIMARY KEY (`cat_Id`),
key `pro_Id` (`pro_Id`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;
