CREATE DATABASE LIBRARY;

USE LIBRARY;

#BRANCH TABLE
CREATE TABLE Branch(
Branch_no INT PRIMARY KEY,
Manager_Id INT,
Branch_address VARCHAR(30),
Contact_no BIGINT
);

INSERT INTO Branch(Branch_no,Manager_Id,Branch_address,Contact_no) VALUES
(1,101,'Library stuvert',9987650943),
(2,102,'Book Ave',7650983211),
(3,103,'Novel road',6574987322),
(4,104,'Science Blvd',9977664422),
(5,105,'Hornimon Circle',7789432312),
(6,106,'Tech park',9123508764),
(7,107,'Novelty Ave',7032458798),
(8,108,'Cuffe Chouk',7982345677),
(9,109,'Wisdom Line',9160872569),
(10,110,'knowledge Lane',8015789023);

SELECT * FROM Branch;


#EMPLOYEE TABLE
CREATE TABLE Employee(
Emp_Id INT PRIMARY KEY,
Emp_name VARCHAR(20),
Position VARCHAR(20),
Salary INT,
Branch_no INT,
FOREIGN KEY (Branch_no) REFERENCES Branch(Branch_no)
);

INSERT INTO Employee(Emp_Id,Emp_name,Position,Salary,Branch_no) VALUES
(1, 'Alice', 'Manager', 55000.00, 1),
(2, 'Bob', 'Assistant', 40000.00, 1),
(3, 'Charlie', 'Manager', 60000.00, 2),
(4, 'Diana', 'Staff', 30000.00, 2),
(5, 'Eve', 'Manager', 52000.00, 3),
(6, 'Frank', 'Staff', 32000.00, 3),
(7, 'Grace', 'Assistant', 45000.00, 1),
(8, 'Henry', 'Staff', 31000.00, 4),
(9, 'Isabella', 'Manager', 58000.00, 4),
(10, 'James', 'Staff', 29000.00, 5);

SELECT * FROM Employee;

#BOOKS TABLE
CREATE TABLE Books(
ISBN VARCHAR(30) PRIMARY KEY,
Book_title VARCHAR(30),
Category VARCHAR(30),
Rental_Price DECIMAL(10,2),
Status VARCHAR(20),
Author VARCHAR(30),
Publisher VARCHAR(50)
);

INSERT INTO Books (ISBN, Book_title, Category, Rental_Price, Status, Author, Publisher) VALUES
(1001, 'Introduction to Python', 'Programming', 20.00, 'yes', 'John Doe', 'TechPress'),
(1002, 'Advanced Python', 'Programming', 25.00, 'no', 'Jane Smith', 'TechPress'),
(1003, 'History of Art', 'History', 30.00, 'yes', 'Emma Brown', 'ArtHouse'),
(1004, 'World War II', 'History', 35.00, 'no', 'Tom Clark', 'HistoryPress'),
(1005, 'Data Science Essentials', 'Data Science', 40.00, 'yes', 'Alice Green', 'DataPub'),
(1006, 'Machine Learning Basics', 'Data Science', 50.00, 'no', 'Ben White', 'MLPress'),
(1007, 'The Renaissance', 'History', 28.00, 'yes', 'Sarah Blue', 'ArtHouse'),
(1008, 'JavaScript for Beginners', 'Programming', 22.00, 'yes', 'Lily Black', 'WebWorld'),
(1009, 'Algorithms Unlocked', 'Computer Science', 45.00, 'yes', 'Michael Grey', 'CSPress'),
(1010, 'Deep Learning with Python', 'Data Science', 55.00, 'no', 'Andrew Ng', 'DLPress');

SELECT * FROM Books;

#CUSTOMER TABLE
CREATE TABLE Customer(
Customer_Id INT PRIMARY KEY,
Customer_name VARCHAR(30),
Customer_address VARCHAR(50),
Reg_date DATE 
);

INSERT INTO Customer (Customer_Id, Customer_name, Customer_address, Reg_date) VALUES
(1, 'Henry', 'Maple St', '2021-05-15'),
(2, 'Isabella', 'Oak St', '2022-03-20'),
(3, 'James', 'Pine St', '2023-06-10'),
(4, 'Emily', 'Cedar St', '2021-12-25'),
(5, 'Oliver', 'Birch St', '2022-01-10'),
(6, 'Sophia', 'Elm St', '2023-02-15'),
(7, 'Liam', 'Walnut St', '2021-11-10'),
(8, 'Mia', 'Chestnut St', '2020-09-30'),
(9, 'Noah', 'Redwood St', '2022-04-05'),
(10, 'Ava', 'Spruce St', '2023-08-01');

SELECT * FROM Customer;

#ISSUESTATUS TABLE
CREATE TABLE IssueStatus(
Issue_Id INT PRIMARY KEY,
Issued_cust INT,
Issued_book_name VARCHAR(50),
Issue_date DATE,
Isbn_book VARCHAR(50),
FOREIGN KEY (Issued_cust) REFERENCES Customer (Customer_Id),
FOREIGN KEY (Isbn_book) REFERENCES Books (ISBN)
);

INSERT INTO IssueStatus (Issue_Id, Issued_cust, Issued_book_name, Issue_date, Isbn_book) VALUES
(1, 1, 'Introduction to Python', '2023-06-05', 1001),
(2, 2, 'Advanced Python', '2023-07-12', 1002),
(3, 3, 'History of Art', '2023-06-15', 1003),
(4, 4, 'World War II', '2023-08-21', 1004),
(5, 5, 'Data Science Essentials', '2023-05-10', 1005),
(6, 6, 'Machine Learning Basics', '2023-06-18', 1006),
(7, 7, 'The Renaissance', '2023-07-20', 1007),
(8, 8, 'JavaScript for Beginners', '2023-08-05', 1008),
(9, 9, 'Algorithms Unlocked', '2023-06-25', 1009),
(10, 10, 'Deep Learning with Python', '2023-07-30', 1010);

SELECT * FROM IssueStatus;

#RETURNSTATUS TABLE
CREATE TABLE ReturnStatus(
Return_Id INT PRIMARY KEY,
Return_cust INT,
Return_book_name VARCHAR(50),
Return_date DATE,
Isbn_book2 VARCHAR(50),
FOREIGN KEY (Isbn_book2) REFERENCES Books (ISBN)
);

INSERT INTO ReturnStatus (Return_Id, Return_cust, Return_book_name, Return_date, Isbn_book2) VALUES
(1, 1, 'Introduction to Python', '2023-07-05', 1001),
(2, 2, 'Advanced Python', '2023-08-10', 1002),
(3, 3, 'History of Art', '2023-07-15', 1003),
(4, 4, 'World War II', '2023-09-01', 1004),
(5, 5, 'Data Science Essentials', '2023-06-12', 1005),
(6, 6, 'Machine Learning Basics', '2023-07-22', 1006),
(7, 7, 'The Renaissance', '2023-08-18', 1007),
(8, 8, 'JavaScript for Beginners', '2023-09-10', 1008),
(9, 9, 'Algorithms Unlocked', '2023-07-30', 1009),
(10, 10, 'Deep Learning with Python', '2023-08-15', 1010);

SELECT * FROM ReturnStatus;               


#QUESTIONS:
#1)Retrieve the book title, category, and rental price of all available books. 

   SELECT Book_title,Category,Rental_price FROM Books WHERE Status ='Yes';
   
#2)List the employee names and their respective salaries in descending order of salary.

   SELECT Emp_name,Salary FROM Employee ORDER BY Salary DESC;
   
#3)Retrieve the book titles and the corresponding customers who have issued those books. 

   SELECT Issued_book_name,Customer_name FROM IssueStatus LEFT JOIN Customer ON Issued_cust =  Customer_Id;
   
#4)Display the total count of books in each category

   SELECT Category,COUNT(*) AS 'Total books' FROM Books GROUP BY Category; 
   
#5)Retrieve the employee names and their positions for the employees whose salaries are above Rs.50,000. 

   SELECT Emp_name,Position FROM Employee WHERE Salary >50000;
   
#6)List the customer names who registered before 2022-01-01 and have not issued any book yet.

  SELECT Customer_name FROM Customer WHERE Customer_Id NOT IN (SELECT Issued_cust FROM Issuestatus) AND Reg_date < '2022-01-01';
  SELECT Customer_name FROM Customer
  Customer LEFT JOIN IssueStatus ON Issued_cust = Customer_Id WHERE Reg_date <'2022-01-01'; 
  
#7)Display the branch numbers and the total count of employees in each branch.

   SELECT Branch_no, COUNT(*) AS 'Total employees' FROM Employee GROUP BY Branch_no;
   
#8)Display the names of customers who have issued books in the month of June 2023.

   SELECT DISTINCT Customer_name FROM IssueStatus I LEFT JOIN Customer c ON I.Issued_cust = c.Customer_Id WHERE I.Issue_date BETWEEN'2023-06-01' AND '2023-06-30';
   
#9)Retrieve book_title from book table containing history. 

   SELECT Book_title FROM Books WHERE Book_title LIKE'%History%';
   
#10)Retrieve the branch numbers along with the count of employees for branches having more than 5 employees.

    SELECT Branch_no,COUNT(*) AS 'Count of employees' FROM Employee GROUP BY Branch_no HAVING COUNT(*) >5;
    
#11)Retrieve the names of employees who manage branches and their respective branch addresses. 

    SELECT  e.Emp_name, b.Branch_address FROM Employee e 
	LEFT JOIN Branch b ON e.Branch_no = b.Branch_no
    WHERE e.position = 'Manager';
    
#12)Display the names of customers who have issued books with a rental price higher than Rs. 25.

    SELECT DISTINCT c.Customer_name FROM IssueStatus I
    LEFT JOIN Books b ON I.Isbn_book = b.ISBN
    LEFT JOIN Customer c ON I.Issued_cust = c.Customer_Id
    WHERE b.Rental_price >25;
    
    
   
   
    
    
   
   
   
   
   
   



