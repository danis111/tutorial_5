--1)What is Primary Key?
--Primary Key is a column or a set of columns that uniquely represents a row in a table.
--Primary Key is like a ID card that ppl have, only one person can be identified with one unique card.

--2)What is Foreign Key?
--Foreign Key is a column of a child table that references to the column of the parent table.

--3)What is the point of using Foreign Key
--it ensures the existence of the referenced row in the parent table
-- you can't insert any row into child table that doesnt exist into parent table.
create database bookstores 
use bookstores --to activate your database
create schema Library

create table Library.Books(
	book_id int identity(1,1) primary key,
	book_name varchar(255),
	Author_of_the_book varchar(255),
	published_at smallint
)

create table Library.Members(
   member_id int identity(1,1) primary key,
   first_name varchar(255) not null,
   last_name varchar(255) not null,
   phone_number varchar(255),
   address varchar(255),
   book_id  int not null,
   foreign key(book_id)
   references Library.Books(book_id) ON DELETE CASCADE ON UPDATE CASCADE,
   booking_time datetime NOT NULL DEFAULT GETDATE() 
)
 
delete from library.books where book_id=1
 INSERT INTO Library.Members(first_name,last_name,phone_number,address,book_id,booking_time)
VALUES
	('Rachel','Green','+158486258632','75.street',1,GETDATE()),
	('Chanler','Bing','+178486255232','75.street',1,GETDATE()),
	('Joe','Tribiani','+158482748527','75.street',2,GETDATE()),
	('Ross','Geller','+15849652632','75.street',3,GETDATE()),
	('Mike','jackson','+148486258674','75.street',7,GETDATE()),
	('Phoebe ','Buffay','+128486258822','75.street',4,GETDATE()),    
	('Monica','Geller','+158486258963','75.street',6,GETDATE())


--if you want to insert rows on your own instead of making it done by MSsql using  'SET IDENTITY_INSERT Library.Books ON;' and 'SET IDENTITY_INSERT Library.Books OFF;'
SET IDENTITY_INSERT Library.Books ON;  

INSERT INTO Library.Books(book_id,book_name,Author_of_the_book,published_at)
VALUES
	(1,'Alchemist','Paulo Coelho',1988),
	(2,'Rich Dad Poor Dad','Robert Kiyosaki',1997),
	(3,'The Millionaire Next Door','Thomas J. Stanley',1996),
	(4,'Atomic Habits','James Clear',2018),
	(5,'Project Hail Mary','Andy Weir',2021),
	(6,'1984','George Orwell',1949),
	(7,'My Sweet Orange Tree','José Mauro de Vasconcelos',1968)

SET IDENTITY_INSERT Library.Books OFF;   

/**********************************/
select*from library.books	--to see all column in the tabþe
select*from library.members