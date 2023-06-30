# You are going to build a project based on Library Management System. It keeps track all information about books in the library, their cost, status and total number of books available in the library. 
# Create a database named LIBRARY and create following TABLES in the database: 
# 1.Branch  2.Employee  3.Customer  4.IssueStatus  5.ReturnStatus  6.Books 

CREATE DATABASE LIBRARY;
USE LIBRARY;

CREATE TABLE BRANCH(Branch_No INT PRIMARY KEY, Manager_Id INT, Branch_Address VARCHAR(50), Contact_No INT);
INSERT INTO BRANCH VALUES(101, 201, 'Main Street Cityville', 2691630);
INSERT INTO BRANCH VALUES(102, 202, 'Jay Nagar', 5541630);
INSERT INTO BRANCH VALUES(103, 203, 'Indira Nagar', 2791430);
INSERT INTO BRANCH VALUES(104, 204, 'Ilangam Nagar', 2691630);
INSERT INTO BRANCH VALUES(105, 205, 'Pine Boulevard', 2691630);
INSERT INTO BRANCH VALUES(106, 206, 'Cedar Lane', 2441639);
INSERT INTO BRANCH VALUES(107, 207, 'Elm Street Townsville', 2589471);
INSERT INTO BRANCH VALUES(108, 208, 'Oak Avenue Villageland', 5559012);
INSERT INTO BRANCH VALUES(109, 209, 'Pine Lane Hamletown', 5553456);
SELECT * FROM BRANCH;

CREATE TABLE EMPLOYEE(Emp_Id INT PRIMARY KEY, Emp_Name VARCHAR(15), Position VARCHAR(30), Salary DECIMAL);
INSERT INTO EMPLOYEE VALUES(201, 'Manuja.A', 'Manager', 40000);
INSERT INTO EMPLOYEE VALUES(202, 'Sarah Johnson', 'Assistant Manager', 30000);
INSERT INTO EMPLOYEE VALUES(203, 'Pradeep Kumar', 'Senior Manager', 50000);
INSERT INTO EMPLOYEE VALUES(204, 'Anitta.L', 'Associate Manager', 25000);
INSERT INTO EMPLOYEE VALUES(205, 'Jeslin Varghese', 'Deputy Manager', 55000);
INSERT INTO EMPLOYEE VALUES(206, 'Vidisha Bhasin', 'Executive Manager', 35000);
INSERT INTO EMPLOYEE VALUES(207, 'Athulya John', 'Manager', 40000);
INSERT INTO EMPLOYEE VALUES(208, 'Nancy.J', 'Assistant Manager', 30000);
INSERT INTO EMPLOYEE VALUES(209, 'Karthik', 'Executive Manager', 35000);
INSERT INTO EMPLOYEE VALUES(210, 'Bindhya', 'Librarian', 20000);
INSERT INTO EMPLOYEE VALUES(211, 'Sibi.J', 'Cashier', 15000);
INSERT INTO EMPLOYEE VALUES(212, 'Samuel', 'Supervisor', 20000);
SELECT * FROM EMPLOYEE;

CREATE TABLE CUSTOMER(Customer_Id INT PRIMARY KEY, Customer_Name VARCHAR(15), Customer_Address VARCHAR(50), Reg_Date DATE);
INSERT INTO CUSTOMER VALUES(301, 'Arun Thampi', 'Indira Nagar', '2020-05-10');
INSERT INTO CUSTOMER VALUES(302, 'Sethudeth', 'Oak Avenue Villageland', '2023-03-15');
INSERT INTO CUSTOMER VALUES(303, 'Karthika Saji', 'Jay Nagar', '2022-04-20');
INSERT INTO CUSTOMER VALUES(304, 'Emy Wilson', 'Bilekahalli', '2023-06-05');
INSERT INTO CUSTOMER VALUES(305, 'Arunpriya Johny', 'Main Street Cityville', '2023-02-28');
INSERT INTO CUSTOMER VALUES(306, 'Jomol.A', 'Elangam Nagar', '2021-08-28');
SELECT * FROM CUSTOMER;

CREATE TABLE ISSUE_STATUS(Issue_Id INT PRIMARY KEY, Issued_Cust INT, Issued_Book_Name VARCHAR(20), Issue_Date DATE, Isbn_Book VARCHAR(13),
FOREIGN KEY(Issued_Cust) REFERENCES CUSTOMER(Customer_Id)ON DELETE CASCADE,
FOREIGN KEY(Isbn_Book) REFERENCES BOOKS(ISBN)ON DELETE CASCADE);
INSERT INTO ISSUE_STATUS VALUES(401, 301, "The Guns of August", '2023-06-10', 163450789);
INSERT INTO ISSUE_STATUS VALUES(402, 302, "The Notebook", '2023-04-25', 567890123);
INSERT INTO ISSUE_STATUS VALUES(403, 303, "The Great Gatsby", '2023-05-15', 987654321);
INSERT INTO ISSUE_STATUS VALUES(404, 304, "1984", '2023-06-01', 432109876);
INSERT INTO ISSUE_STATUS VALUES(405, 305, "Diary of Young Girl", '2023-03-05', 123456789);
SELECT * FROM ISSUE_STATUS;

CREATE TABLE RETURN_STATUS(Return_Id INT PRIMARY KEY, Return_Cust INT, Return_Book_Name VARCHAR(20), Return_Date DATE, Isbn_Book2 VARCHAR(13),
FOREIGN KEY(Isbn_Book2) REFERENCES BOOKS(ISBN)ON DELETE CASCADE);
INSERT INTO RETURN_STATUS VALUES(501, 301, "The Guns of August", '2023-06-15', 163450789);
INSERT INTO RETURN_STATUS VALUES(502, 302, "The Notebook", '2023-05-01', 567890123);
INSERT INTO RETURN_STATUS VALUES(503, 303, "The Great Gatsby", '2023-05-20', 987654321);
INSERT INTO RETURN_STATUS VALUES(504, 304, "1984", '2023-06-10', 432109876);
INSERT INTO RETURN_STATUS VALUES(505, 305, "Diary of Young Girl", '2023-03-10', 123456789);
SELECT * FROM RETURN_STATUS;

CREATE TABLE BOOKS(ISBN VARCHAR(13) PRIMARY KEY, Book_Title VARCHAR(30), Category VARCHAR(30), Rental_Price DECIMAL(3,2), Status VARCHAR(3), 
Author VARCHAR(20), Publisher VARCHAR(30));
INSERT INTO BOOKS VALUES(123456789, "Diary of Young Girl", 'History', 5.99, 'Yes', 'Anne Frank', 'Double day');
INSERT INTO BOOKS VALUES(213546879, "To Kill a Mockingbird",'Fiction', 4.99, 'Yes', 'Harper Lee', 'Grand Central');
INSERT INTO BOOKS VALUES(432109876, "1984", 'Fiction', 6.99, 'No', 'George Orwell',	'Secker & Warburg');
INSERT INTO BOOKS VALUES(789123456,	"Pride and Prejudice", 'Romance', 4.99,	'Yes', 'Jane Austen', 'Penguin Classics');
INSERT INTO BOOKS VALUES(321654987,	"Outlander", 'Romance', 5.99, 'No', 'Diana Gabaldon', 'Dell');
INSERT INTO BOOKS VALUES(163450789, "The Guns of August", 'History', 6.99, 'No', 'Barbara W.Tuchman', 'Presidio Press');
INSERT INTO BOOKS VALUES(456789123, "Catcher in the Rye", 'Fiction', 6.99, 'Yes', 'J.D. Salinger', 'Little Brown');
INSERT INTO BOOKS VALUES(567890123, "The Notebook", 'Romance', 6.99, 'No', 'Nicholas Sparks', 'Warner Books');
INSERT INTO BOOKS VALUES(987654321, "The Great Gatsby", 'Fiction', 6.99, 'No', 'F.Scott Fitzgerald', 'Scribner');
INSERT INTO BOOKS VALUES(749123856, "Gone Girl", 'Mystery', 6.99, 'No', 'Gillian Flynn', 'Broadway Books');
SELECT * FROM BOOKS;

# Write the queries for the following: 
  
# 1. Retrieve the book title, category, and rental price of all available books. 
SELECT Book_Title, Category, Rental_Price FROM BOOKS WHERE Status = 'Yes';

# 2. List the employee names and their respective salaries in descending order of salary. 
SELECT Emp_Name,Salary FROM EMPLOYEE ORDER BY Salary desc;

# 3. Retrieve the book titles and the corresponding customers who have issued those books. 
SELECT Issued_Book_Name AS Book_Title,Customer_Name FROM ISSUE_STATUS INNER JOIN CUSTOMER ON ISSUE_STATUS.Issued_Cust=CUSTOMER.Customer_Id;

# 4. Display the total count of books in each category. 
SELECT Category,COUNT(*) AS TOTAL_COUNT FROM BOOKS GROUP BY Category;

# 5. Retrieve the employee names and their positions for the employees whose salaries are above Rs.50,000. 
SELECT Emp_Name, Position FROM EMPLOYEE WHERE Salary>50000;

# 6. List the customer names who registered before 2022-01-01 and have not issued any books yet. 
SELECT Customer_Name FROM CUSTOMER WHERE Reg_Date < '2022-01-01' AND Customer_Id NOT IN (SELECT Issued_Cust FROM ISSUE_STATUS);

# 7. Display the branch numbers and the total count of employees in each branch. 
SELECT Branch_No,COUNT(*) FROM BRANCH GROUP BY Branch_No; 

# 8. Display the names of customers who have issued books in the month of June 2023.?? 
SELECT Issued_Cust FROM ISSUE_STATUS WHERE Issue_Date BETWEEN '2023-06-01' AND '2023-06-30';

# 9. Retrieve book_title from book table containing history. 
SELECT Book_Title FROM BOOKS WHERE Category = 'History';

# 10.Retrieve the branch numbers along with the count of employees for branches having more than 5 employees.
SELECT Branch_No,COUNT(*) AS Employee_Count FROM BRANCH GROUP BY Branch_No HAVING COUNT(*) > 5;

