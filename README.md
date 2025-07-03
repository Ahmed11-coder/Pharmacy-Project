# Pharmacy Management System Database

![Pharmacy Management](https://img.shields.io/badge/Pharmacy-Management-brightgreen)
![Database](https://img.shields.io/badge/Database-SQL-blue)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

## Overview
Pharmacy Management is a complex task that involves balancing business operations, customer service, employee management, and inventory control. Our Pharmacy Management System Database is designed to streamline these operations, providing a comprehensive solution for modern pharmacies to manage their daily activities efficiently.

## Key Features

### 📊 Centralized Data Management
- Single source of truth for all pharmacy operations
- Unified storage for employee records, prescriptions, and inventory
- Secure and organized data access

### ⚡ Accuracy and Efficiency
- Automated processes to minimize manual errors
- Optimized data retrieval for quick decision-making
- Real-time inventory tracking

### 👥 Improved Customer Service
- Comprehensive customer order tracking
- Prescription management system
- Reduced waiting times through efficient processing
- Customer history and preferences tracking

### ⚖️ Compliance and Legal
- Maintain accurate records for audits
- Prescription tracking for controlled substances
- Data retention policies for legal compliance

### 📈 Business Intelligence
- Advanced reporting and analytics
- Sales and inventory forecasting
- Performance metrics and KPIs
- Data-driven decision making

## Database Schema

### Entity Relationship Diagram
![Database Schema](Images/Pharmacy%20Project%20Relation%20Schame%20Dark.png)

### Enhanced Entity-Relationship Diagram
![EER Diagram](Images/Pharmacy%20Project%20F.png)

## Key Entities
- 👨‍💼 **Employee**: Staff information, roles, and access control
- 👥 **Customer**: Customer details and contact information
- 🏭 **Supplier**: Vendor details and contact information
- 💊 **Medicine**: Product details including name, price, and stock
- 🏷️ **Category**: Medicine categories and classifications
- 🛒 **Order**: Customer orders and transaction details
- 📋 **Order_Details**: Line items for each order
- 📦 **Supply_Order**: Supplier orders and restocking information
- 📑 **Supply_Order_Details**: Line items for supply orders
- 📝 **Prescription**: Medical prescriptions from doctors
- 📋 **Prescription_Details**: Line items for prescriptions
- 💰 **Bill**: Customer billing information
- 📊 **Bill_Details**: Line items for billing
- ⏳ **Expiry_Date**: Medicine expiry tracking

## Sample Queries

Here are some useful SQL queries that demonstrate the database's capabilities, ranging from basic to advanced operations:

### Inventory Summary
```sql
-- Get total items count and value by category
SELECT 
    'Medicine' AS Category,
    (SUM(m.Stock_Level)) AS Total_Amount,
    (SUM(m.Stock_Level * i.Price)) AS Total_Money
FROM 
    items i, medicines m
WHERE 
    i.code = m.Items_Code
UNION
SELECT 
    'Instrument',
    (SUM(ir.Stock_Level)) AS Total_Amount,
    (SUM(ir.Stock_Level * i.Price)) AS Total_Money
FROM 
    items i, instruments ir 
WHERE 
    i.code = ir.Items_Code;
```

### Sales Analysis
```sql
-- Count invoices by type (D for Direct, R for Return)
SELECT 
    Type, 
    COUNT(*) AS Count
FROM 
    Invoice 
GROUP BY 
    Type;
```

### Product Analysis
```sql
-- Count products by gender category
SELECT 
    For_Gender, 
    COUNT(*) AS GenderCount
FROM 
    Accessories
GROUP BY 
    For_Gender;

-- Analyze medicine safety during lactation
SELECT 
    Safety_In_Lactation, 
    COUNT(*) AS Count
FROM 
    Medicines
GROUP BY 
    Safety_In_Lactation;

-- Check import statistics
SELECT 
    Imported, 
    COUNT(*) AS Total
FROM 
    Medicines
GROUP BY 
    Imported;
```

## Advanced Queries

### Top-Selling Products Analysis
```sql
-- Find top 5 best-selling medicines with their suppliers and current stock levels
SELECT 
    m.Name AS Medicine_Name,
    s.Name AS Supplier_Name,
    i.Stock_Level AS Current_Stock,
    COUNT(od.Order_ID) AS Times_Ordered,
    SUM(od.Quantity) AS Total_Quantity_Sold,
    ROUND(SUM(od.Quantity * i.Price), 2) AS Total_Revenue
FROM 
    Order_Details od
    JOIN Items i ON od.Item_Code = i.Code
    JOIN Medicines m ON i.Code = m.Items_Code
    JOIN Supply_Order_Details sod ON i.Code = sod.Items_Code
    JOIN Supply_Order so ON sod.Supply_Order_ID = so.ID
    JOIN Supplier s ON so.Supplier_ID = s.ID
GROUP BY 
    m.Name, s.Name, i.Stock_Level, i.Price
ORDER BY 
    Total_Revenue DESC
LIMIT 5;
```

### Expiry Management Analysis
```sql
-- Identify medicines expiring in the next 30 days with reorder recommendations
SELECT 
    m.Name AS Medicine_Name,
    e.Expiry_Date,
    DATEDIFF(e.Expiry_Date, CURDATE()) AS Days_Until_Expiry,
    i.Stock_Level AS Current_Stock,
    CASE 
        WHEN DATEDIFF(e.Expiry_Date, CURDATE()) <= 30 AND i.Stock_Level > 0 THEN 'Urgent: Expiring Soon'
        WHEN i.Stock_Level < 10 THEN 'Low Stock: Reorder Needed'
        ELSE 'Stock Level OK'
    END AS Status,
    ROUND((i.Stock_Level * 100.0) / 
        (SELECT AVG(Stock_Level) FROM Items WHERE Code IN (SELECT Items_Code FROM Medicines)), 2) AS Stock_Level_Percent
FROM 
    Items i
    JOIN Medicines m ON i.Code = m.Items_Code
    JOIN Expiry_Date e ON i.Code = e.Items_Code
WHERE 
    e.Expiry_Date BETWEEN CURDATE() AND DATE_ADD(CURDATE(), INTERVAL 30 DAY)
    OR i.Stock_Level < 10
ORDER BY 
    Days_Until_Expiry ASC, 
    Stock_Level_Percent ASC;
```

### Customer Value Analysis
```sql
-- Analyze customer purchase patterns and value
WITH CustomerPurchaseStats AS (
    SELECT 
        c.ID AS Customer_ID,
        c.Name AS Customer_Name,
        COUNT(DISTINCT o.ID) AS Total_Orders,
        SUM(od.Quantity * i.Price) AS Total_Spent,
        AVG(od.Quantity * i.Price) AS Avg_Order_Value,
        MAX(o.Date) AS Last_Order_Date,
        DATEDIFF(CURDATE(), MAX(o.Date)) AS Days_Since_Last_Order
    FROM 
        Customer c
        JOIN `Order` o ON c.ID = o.Customer_ID
        JOIN Order_Details od ON o.ID = od.Order_ID
        JOIN Items i ON od.Item_Code = i.Code
    GROUP BY 
        c.ID, c.Name
)
SELECT 
    Customer_Name,
    Total_Orders,
    ROUND(Total_Spent, 2) AS Total_Spent,
    ROUND(Avg_Order_Value, 2) AS Avg_Order_Value,
    Last_Order_Date,
    Days_Since_Last_Order,
    CASE 
        WHEN Days_Since_Last_Order > 90 THEN 'Churned'
        WHEN Days_Since_Last_Order > 30 THEN 'At Risk'
        ELSE 'Active'
    END AS Customer_Status,
    ROUND((Total_Spent / (SELECT SUM(Total_Spent) FROM CustomerPurchaseStats) * 100), 2) AS Revenue_Contribution_Percent
FROM 
    CustomerPurchaseStats
ORDER BY 
    Total_Spent DESC
LIMIT 10;
```

## Getting Started
### Prerequisites
- Database Management System (e.g., MySQL, PostgreSQL)

### Installation
1. Clone the repository
2. Import the database schema
3. Configure the connection settings
4. Initialize with sample data (optional)

## Team
👥 **Team Leader**: Ahmed Hashem  
👨‍💻 **Team Members**:  
- Mostafa Magdy  
- Mohab Wael  
- Ali Mohamed Ali Ramadan  
- Mazen Mamdoh

## Contributing
Contributions are welcome! Please feel free to submit a Pull Request.

## License
This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---
*Last Updated: July 2023*