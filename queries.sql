

/*Retrieve all employees' full names and birth dates */
SELECT Fname, Minit, Lname, Bdate FROM Employee;



/*Count total VIP customers*/
SELECT COUNT(*) AS TotalVIPCustomers FROM Customer_VIP;



/*Find the average price of all items*/
SELECT AVG(Price) AS AveragePrice FROM Items;



/*Retrieve the top 5 highest-priced items*/
SELECT * FROM Items ORDER BY Price DESC LIMIT 5;





/*Retrieve the most 5 expensive order*/
SELECT *, (Quantity * Unit_Price) AS TotalCost 
FROM Ordered 
ORDER BY TotalCost DESC LIMIT 5;





/*List employees who live in 'Al-Mataria'*/
SELECT Fname, Lname FROM Employee WHERE Address = 'Al-Mataria';



/*Retrieve accessories available for both genders*/
SELECT * FROM Accessories WHERE For_Gender = 'M&F';



/*List Accessories with discounts applied greater than 5*/
SELECT Items_Code, Discount FROM Accessories WHERE Discount > 5;



/*Retrieve employees whose first name starts with "A"*/
SELECT Fname, Lname FROM Employee WHERE Fname LIKE 'A%';



/*Find orders with a status of 'Shipping'*/
SELECT * FROM Ordered WHERE Status = 'Shipping';



/*Retrieve invoices by a specific employee(Zainab)*/
SELECT * FROM Invoice WHERE Employee_SSN = '28903040949648';



/*Count medicines categorized as tablets*/
SELECT 'Tablets' Form , COUNT(*) AS Count FROM Medicines WHERE Form = 'Tablets';





/*Get All Medicines With All Medicines Simillers*/
SELECT i.Code ,i.name AS Medicine_Name, i.price, e1.Expiry_Date ,i2.code, i2.name AS Similler_Name, i2.price, e2.Expiry_Date 
FROM items i, medicine_simillers ms, items i2, expiry_date e1 ,expiry_date e2
WHERE i.code = ms.Medicine_Items_Code AND i2.code = ms.Similliers_Items_Code1 AND e1.items_code = i.code AND e2.items_code = i2.code;





/*Find medicines that are both safe for pregnancy and lactation*/
SELECT code , name, m.Form ,m.Safety_In_Pregnancy AS Pregnancy , m.Safety_In_Lactation AS Lactation
FROM items i, medicines m
WHERE i.Code = m.Items_Code AND m.Safety_In_Lactation = "Safety" AND m.Safety_In_Pregnancy = "Safety";





/*Retrieve all invoice details*/
SELECT 
    concat(c.fname, ' ', c.minit, ' ', c.lname) AS Customer_Full_Name ,
    cp.Phone,
    concat(e.fname, ' ', e.minit, ' ', e.lname) AS Employee_Full_Name , 
    i.Date , 
    it.Name AS Medicine , ihi.Amount, ihi.Unit_Price
FROM 
    customer_vip c, employee e, invoice i, items it, invoice_has_items ihi, customer_phone cp
WHERE
    i.employee_ssn = e.ssn AND i.customer_vip_code = c.code AND ihi.invoice_Id = i.id AND 
    ihi.items_code  = it.code AND c.Fname <> 'unknown' AND cp.customer_code = c.code;
    
    
    
    

/*retrieve the low stock items (0,1,2) and thier price*/
 SELECT i.code , i.name, i.price , e.Stock_Level
FROM items i , expiry_date e
WHERE e.Items_Code = i.Code AND e.Stock_Level BETWEEN 1 AND 2
UNION
SELECT i.code , i.name, i.price ,'0'
FROM items i
WHERE (i.code NOT IN (SELECT Items_Code FROM expiry_date ) AND i.code NOT IN ( SELECT items_Code FROM instruments ));





/*Retrieve the items category, total number of pieces, and total monetary value*/
SELECT 
    'Accessories' Items_Category ,
    (SUM(e.Stock_Level)) AS Total_Amount ,
    (SUM(e.Stock_Level * i.Price)) AS Total_Money
FROM 
    items i , expiry_date e , accessories a
WHERE i.code = e.Items_Code and i.Code = a.Items_Code
UNION
SELECT 
    'Medicines',
    (SUM(e.Stock_Level)) AS Total_Amount ,
    (SUM(e.Stock_Level * i.Price)) AS Total_Money
FROM 
    items i , expiry_date e , medicines m
WHERE i.code = e.Items_Code and i.Code = m.Items_Code
UNION
SELECT 
    'Instrument',
    (SUM(ir.Stock_Level)) AS Total_Amount ,
    (SUM(ir.Stock_Level * i.Price)) AS Total_Money
FROM 
    items i , instruments ir 
WHERE i.code = ir.Items_Code ;





/*Count invoices by type (D or R)*/
SELECT Type, COUNT(*) AS Count
FROM Invoice 
GROUP BY Type;





/*Count the number of male , female and both for Accessories*/
SELECT For_Gender, COUNT(*) AS GenderCount
FROM Accessories
GROUP BY For_Gender;





/*List medicines grouped by their safety during lactation*/
SELECT Safety_In_Lactation, COUNT(*) AS Count
FROM Medicines
GROUP BY Safety_In_Lactation;





/*Find the total amount of medicines imported*/
SELECT Imported, COUNT(*) AS Total
FROM Medicines
GROUP BY Imported;





/*Find the total number of items ordered for each invoice*/
SELECT Invoice_Id, SUM(Amount) AS TotalItems
FROM Invoice_has_Items
GROUP BY Invoice_Id;





/*Total Earning Of Day*/
SELECT date(i.date) AS Date, sum(ihi.Amount * ihi.Unit_Price) AS Total_Earning
FROM invoice i, invoice_has_items ihi, items it
WHERE ihi.Invoice_Id = i.id AND ihi.Items_Code = it.code
GROUP BY date(i.date);





/*Total Earning Of Month*/
SELECT month(i.date) AS Month, sum(ihi.Amount * ihi.Unit_Price) AS Total_Earning
FROM invoice i, invoice_has_items ihi, items it
WHERE ihi.Invoice_Id = i.id AND ihi.Items_Code = it.code
GROUP BY month(i.date);





/*Get Financial Dues Of Each Distribution Company*/
SELECT dc.name AS Distribution_Company_Name , CEIL(SUM(unit_price*0.65)) AS Financial_Dues
FROM distribution_company dc, ordered o
WHERE o.Distribution_Company_ID = dc.ID
GROUP BY dc.name;





/*List all employees who are trainees along with their training months*/
SELECT e.Fname, e.Lname, t.Training_Months
FROM Employee e
JOIN Trainee t ON e.SSN = t.Employee_SSN;





/*Retrieve invoices and the customers linked to them*/
SELECT i.Id, c.Fname, c.Lname
FROM Invoice i
JOIN Customer_VIP c ON i.Customer_VIP_Code = c.Code
WHERE c.fname <> 'unknown';





/*Find employees who have worked for more than 5 years*/
SELECT concat(e.fname, ' ', e.minit, ' ', e.lname) AS Employee_Full_Name , ps.Experience_Years
FROM Employee e
JOIN Pharmacier ps ON e.SSN = ps.Employee_SSN
WHERE ps.Experience_Years > 5;





/*Calculate the average price of each category of accessories*/
SELECT Category, AVG(i.Price) AS AveragePrice
FROM Accessories a
JOIN Items i ON a.Items_Code = i.Code
GROUP BY Category;





/*List employees and the total number of invoices they handled*/
SELECT e.Fname, e.Lname, COUNT(i.Id) AS TotalInvoices
FROM Employee e
LEFT JOIN Invoice i ON e.SSN = i.Employee_SSN
GROUP BY e.SSN;





/*Calculate the revenue generated by each employee*/
SELECT e.Fname, e.Lname, SUM(ihi.Amount * ihi.Unit_Price) AS TotalRevenue
FROM Employee e
JOIN Invoice i ON e.SSN = i.Employee_SSN
JOIN Invoice_has_Items ihi ON i.Id = ihi.Invoice_Id
GROUP BY e.SSN;





/*Calculate the average amount ordered for each accessories type*/
SELECT a.Category, AVG(o.Quantity) AS AvgOrdered
FROM Accessories a
JOIN Ordered o ON a.Items_Code = o.Items_Code
GROUP BY a.Category;





/*retrieve the hourly salary employees and display thier daily salary*/
SELECT 
    hs.Employee_SSN AS EmployeeSSN,
    e.Fname AS FirstName,
    e.Lname AS LastName,
    DATE(st.Start_Time) AS WorkDate,
    (TIMESTAMPDIFF(HOUR, st.Start_Time, lt.Leave_Time) * hs.Price_of_Hour) AS DailySalary
FROM 
    Hourly_Salary hs
JOIN 
    Employee e ON hs.Employee_SSN = e.SSN
JOIN 
    Start_Time st ON hs.Employee_SSN = st.Employee_SSN
JOIN 
    Leave_Time lt ON st.Employee_SSN = lt.Employee_SSN
WHERE 
    st.Start_Time < lt.Leave_Time
GROUP BY 
    hs.Employee_SSN, WorkDate, e.Fname, e.Lname
ORDER BY 
    WorkDate, EmployeeSSN;
    
    
    
    

/*Get Items That Will Be Expired In Next 5 Months*/
SELECT Code AS Medicine_Code , name AS Medicine_Name , form AS Medicine_Form , e.expiry_date AS Expiry_Date , stock_level AS Stock_Level
FROM items i, expiry_date e, medicines m
WHERE e.Items_Code = i.code and m.items_code = i.code
HAVING e.expiry_date between current_date() and date_sub(current_date(), interval -5 month);





/* Get Expired Items*/
SELECT Code AS Items_Code , name AS Items_Name , form AS Form_or_Category , e.expiry_date AS Expiry_Date , stock_level AS Stock_Level
FROM items i, expiry_date e, medicines m
WHERE e.Items_Code = i.code AND m.items_code = i.code
HAVING e.expiry_date <= current_date()
UNION
SELECT Code AS Items_Code , name AS Items_Name , Category AS Form_or_Category , e.expiry_date AS Expiry_Date , stock_level AS Stock_Level
FROM items i, expiry_date e, accessories a
WHERE e.Items_Code = i.code AND a.items_code = i.code
HAVING e.expiry_date <= current_date();





/*Find customers with multiple phone numbers*/
SELECT 
    cv.Fname AS customerName,
    COUNT(cp.Phone) AS PhoneCount
FROM 
    Customer_VIP cv
JOIN 
    Customer_Phone cp ON cv.Code = cp.Customer_Code
GROUP BY 
    cv.Code, cv.Fname, cv.Minit, cv.Lname
HAVING 
    PhoneCount > 1;
    
    
    
    
    
/*List the distribution companies with more than 10 orders*/
SELECT d.Name, COUNT(o.Items_Code) AS TotalOrders
FROM Distribution_Company d
JOIN Ordered o ON d.ID = o.Distribution_Company_ID
GROUP BY d.ID
HAVING TotalOrders > 10;





/*Identify the top 5 items contributing to revenue*/
SELECT i.Name, SUM(ihi.Amount * ihi.Unit_Price) AS Revenue
FROM Items i
JOIN Invoice_has_Items ihi ON i.Code = ihi.Items_Code
GROUP BY i.Code
ORDER BY Revenue DESC
LIMIT 5;





/*Find the top 5 customers who have spent the most*/
SELECT c.Fname, c.Lname, SUM(ihi.Amount * ihi.Unit_Price) AS TotalSpent
FROM Customer_VIP c
JOIN Invoice i ON c.Code = i.Customer_VIP_Code
JOIN Invoice_has_Items ihi ON i.Id = ihi.Invoice_Id
WHERE c.fname <> 'unknown'
GROUP BY c.Code
ORDER BY TotalSpent DESC
LIMIT 5;





/*Retrieve the distribution company with the highest number of orders*/
SELECT d.Name, COUNT(o.Items_Code) AS OrderCount
FROM Distribution_Company d
JOIN Ordered o ON d.ID = o.Distribution_Company_ID
GROUP BY d.ID
ORDER BY OrderCount DESC
LIMIT 1;





/*Find the accessories type with the highest average price*/
SELECT Category, AVG(i.Price) AS AvgPrice
FROM Accessories a
JOIN Items i ON a.Items_Code = i.Code
GROUP BY Category
ORDER BY AvgPrice DESC
LIMIT 1;





/*Find the most 5 frequently ordered item*/
SELECT i.Name, SUM(ihi.Amount) AS TotalOrdered
FROM Items i
JOIN Invoice_has_Items ihi ON i.Code = ihi.Items_Code
GROUP BY i.Code
ORDER BY TotalOrdered DESC
LIMIT 5;






/*Find the names of employees and his monthly salary with a monthly salary above the average*/
SELECT concat(e.fname, ' ', e.minit, ' ', e.lname) AS Employee_Full_Name , ms.Salary
FROM Employee e
JOIN Monthly_Salary ms ON e.SSN = ms.Employee_SSN
WHERE ms.Salary > (
    SELECT AVG(Salary) FROM Monthly_Salary );
    
    
    
    
 
/*Display employee names with their supervisor's name*/
SELECT 
    e.Fname AS EmployeeName, 
    (SELECT CONCAT(s.Fname, ' ', s.Lname) 
     FROM Employee s 
     WHERE s.SSN = e.Super_SSN) AS SupervisorName
FROM Employee e;





/*Calculate the percentage contribution of each employee to total sales*/
SELECT e.Fname, e.Lname,
       (SUM(ihi.Amount * ihi.Unit_Price) / 
       (SELECT SUM(ihi.Amount * ihi.Unit_Price) 
        FROM Invoice_has_Items ihi)) * 100 AS ContributionPercentage
FROM Employee e
JOIN Invoice i ON e.SSN = i.Employee_SSN
JOIN Invoice_has_Items ihi ON i.Id = ihi.Invoice_Id
GROUP BY e.SSN;





/*List customers who have purchased more than the average number of items*/
SELECT c.Fname, c.Lname, COUNT(ihi.Amount) AS ItemsPurchased
FROM Customer_VIP c
JOIN Invoice i ON c.Code = i.Customer_VIP_Code
JOIN Invoice_has_Items ihi ON i.Id = ihi.Invoice_Id
where c.fname <> 'unknown'
GROUP BY c.Code
HAVING ItemsPurchased > (
    SELECT AVG(ihi.Amount) 
    FROM Invoice_has_Items ihi );





/*Find The employee who handled the most expensive invoice*/
SELECT e.Fname, e.Lname, i.Id AS InvoiceId
FROM Employee e
JOIN Invoice i ON e.SSN = i.Employee_SSN
WHERE i.Id = (
    SELECT Invoice_Id
    FROM Invoice_has_Items
    GROUP BY Invoice_Id
    ORDER BY SUM(Amount * Unit_Price) DESC
    LIMIT 1 );


/*Get Toatl Earning Of The Pharmacy*/
select (Total_Paied - (Financial_Dues + Total_Monthly_Salary + sum(HS.DailySalary))) as Total_Earning
from (
        select CEIL(Sum(unit_price0.65))  as Financial_Dues
        from ordered
    ) FD,
    (
        select sum(salary) as Total_Monthly_Salary
        from monthly_salary
    ) MS,
    (
        select sum(Unit_PriceAmount) as Total_Paied
        from invoice_has_items
    ) TP,
    (
        SELECT 
            hs.Employee_SSN AS EmployeeSSN,
            e.Fname AS FirstName,
            e.Lname AS LastName,
            DATE(st.Start_Time) AS WorkDate,
            (TIMESTAMPDIFF(HOUR, st.Start_Time, lt.Leave_Time) * hs.Price_of_Hour) AS DailySalary
        FROM 
            Hourly_Salary hs
        JOIN 
            Employee e ON hs.Employee_SSN = e.SSN
        JOIN 
            Start_Time st ON hs.Employee_SSN = st.Employee_SSN
        JOIN 
            Leave_Time lt ON st.Employee_SSN = lt.Employee_SSN
        WHERE 
            st.Start_Time < lt.Leave_Time
        GROUP BY 
            hs.Employee_SSN, WorkDate, e.Fname, e.Lname
        ORDER BY 
            WorkDate, EmployeeSSN
    ) HS;

