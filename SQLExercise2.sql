/* joins: select all the computers from the products table:
using the products table and the categories table, return the product name and the category name */
SELECT products.Name, categories.Name
FROM products
INNER JOIN categories
ON products.CategoryID = categories.CategoryID
WHERE categories.Name = 'computers';

/* joins: find all product names, product prices, and products ratings that have a rating of 5 */
SELECT products.Name, products.Price, reviews.Rating
FROM products
INNER JOIN reviews
ON products.ProductID = Reviews.ProductID
WHERE reviews.Rating = 5; 
 
/* joins: find the employee with the most total quantity sold.  use the sum() function and group by */
SELECT employees.FirstName, employees.LastName, SUM(sales.Quantity) AS TotalSold
FROM employees
INNER JOIN sales
ON employees.EmployeeID = sales.EmployeeID
GROUP BY employees.EmployeeID, employees.FirstName, employees.LastName
ORDER BY TotalSold DESC;

/* joins: find the name of the department, and the name of the category for Appliances and Games */
SELECT departmets.Name, categories.Name
FROM categories
INNER JOIN departments
ON categories.DepartmentID = departments.DepartmentID
WHERE categories.Name = 'Appliances' 
OR categories.Name = 'Games';

/* joins: find the product name, total # sold, and total price sold,
 for Eagles: Hotel California --You may need to use SUM() */
SELECT products.Name, 
SUM(sales.Quatity) AS TotalQuantity,
SUM(sales.Price) AS TotalSold
FROM products
INNER JOIN sales
ON products.ProductID = sales.ProductID
WHERE products.Name = 'Eagles: Hotel California'
GROUP BY products.Name;

/* joins: find Product name, reviewer name, rating, and comment on the Visio TV. (only return for the lowest rating!) */
SELECT
	products.Name,
    reviews.Reviewer,
    reviews.Rating,
    reviews.Comment
FROM products
INNER JOIN reviews
ON products.ProductID = reviews.ProductID
WHERE products.Name = 'Visio TV'
ORDER BY reviews.Rating ASC
LIMIT 1;

-- ------------------------------------------ Extra - May be difficult
/* Your goal is to write a query that serves as an employee sales report.
This query should return:
-  the employeeID
-  the employee's first and last name
-  the name of each product
-  and how many of that product they sold */
SELECT
	employees.EmployeeID,
	employees.FirstName,
    employees.LastName,
    products.Name,
    SUM(sales.Quantity) AS TotalSold
FROM Employees
INNER JOIN sales
ON employees.EmployeeID = sales.EmployeeID
GROUP BY
	employees.EmployeeID,
    employees.FirstName,
    employees.LastName,
    products.Name
ORDER BY
	employees.EmployeeID, products.Name;
