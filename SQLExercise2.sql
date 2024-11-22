/* joins: select all the computers from the products table:
using the products table and the categories table, return the product name and the category name */
SELECT bestbuy.products.Name, bestbuy.categories.Name
FROM bestbuy.products
INNER JOIN bestbuy.categories
ON products.CategoryID = categories.CategoryID
WHERE categories.Name = 'computers';
/* joins: find all product names, product prices, and products ratings that have a rating of 5 */
SELECT bestbuy.products.Name, bestbuy.products.Price, bestbuy.reviews.Rating
FROM bestbuy.products
INNER JOIN bestbuy.reviews
ON products.ProductID = Reviews.ProductID
WHERE reviews.Rating = 5;
/* joins: find the employee with the most total quantity sold.  use the sum() function and group by */
SELECT bestbuy.employees.FirstName, bestbuy.employees.LastName, SUM(bestbuy.sales.Quantity) AS TotalSold
FROM bestbuy.employees
INNER JOIN bestbuy.sales
ON bestbuy.employees.EmployeeID = bestbuy.sales.EmployeeID
GROUP BY employees.EmployeeID, employees.FirstName, employees.LastName
ORDER BY TotalSold DESC;
/* joins: find the name of the department, and the name of the category for Appliances and Games */
SELECT bestbuy.departments.Name, bestbuy.categories.Name
FROM bestbuy.categories
INNER JOIN bestbuy.departments
ON bestbuy.categories.DepartmentID = bestbuy.departments.DepartmentID
WHERE categories.Name = 'Appliances'
OR categories.Name = 'Games';
/* joins: find the product name, total # sold, and total price sold,
 for Eagles: Hotel California --You may need to use SUM() */
SELECT bestbuy.products.Name,
SUM(bestbuy.sales.Quantity) AS TotalQuantity,
SUM(bestbuy.sales.PricePerUnit) AS TotalSold
FROM bestbuy.products
INNER JOIN bestbuy.sales
ON bestbuy.products.ProductID = bestbuy.sales.ProductID
WHERE products.Name = 'Eagles: Hotel California'
GROUP BY products.Name;
/* joins: find Product name, reviewer name, rating, and comment on the Visio TV. (only return for the lowest rating!) */
SELECT
	bestbuy.products.Name,
    bestbuy.reviews.Reviewer,
    bestbuy.reviews.Rating,
    bestbuy.reviews.Comment
FROM bestbuy.products
INNER JOIN bestbuy.reviews
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
	bestbuy.employees.EmployeeID,
	bestbuy.employees.FirstName,
    bestbuy.employees.LastName,
	bestbuy.products.Name,
    SUM(bestbuy.sales.Quantity) AS TotalSold
FROM bestbuy.Employees
INNER JOIN bestbuy.sales 
INNER JOIN bestbuy.products
ON bestbuy.employees.EmployeeID = bestbuy.sales.EmployeeID
GROUP BY
	employees.EmployeeID,
    employees.FirstName,
    employees.LastName,
    products.Name
ORDER BY
	employees.EmployeeID, products.Name;


