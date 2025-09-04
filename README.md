# 🛒 Zepto SQL Data Analysis

This project analyzes a **Zepto product dataset** using **pure SQL**.\
It covers **data cleaning, exploration, and business insights** such as
pricing, discounts, inventory management, and revenue estimation.

------------------------------------------------------------------------

## 📂 Project Structure

-   **`zepto_analysis.sql`** → Contains all SQL queries:
    -   Table creation\
    -   Data cleaning\
    -   Exploratory queries\
    -   Business insights (Q1--Q8)

------------------------------------------------------------------------

## 🗄️ Database Schema

Table: **zepto** \| Column \| Type \| Description \|
\|--------------------------\|--------------\|--------------------------------------\|
\| `sku_id` \| SERIAL (PK) \| Unique identifier \| \| `category` \|
VARCHAR(120) \| Product category \| \| `name` \| VARCHAR(150) \| Product
name \| \| `mrp` \| NUMERIC(8,2) \| Maximum Retail Price (in ₹) \| \|
`discountPercent` \| NUMERIC(5,2) \| Discount offered (%) \| \|
`availableQuantity` \| INTEGER \| Stock available \| \|
`discountedSellingPrice`\| NUMERIC(8,2) \| Price after discount (₹) \|
\| `weightInGms` \| INTEGER \| Product weight (grams) \| \| `outOfStock`
\| BOOLEAN \| Stock status (TRUE/FALSE) \| \| `quantity` \| INTEGER \|
Unit quantity \|

------------------------------------------------------------------------

## 🔍 Data Exploration

1.  Count rows\
2.  Check null values\
3.  Find distinct categories\
4.  Stock status (in-stock vs out-of-stock)\
5.  Detect duplicate products

------------------------------------------------------------------------

## 🧹 Data Cleaning

-   Remove products with `mrp = 0`\
-   Convert **paise → rupees**\
-   Validate `discountedSellingPrice`

------------------------------------------------------------------------

## 📊 Business Insights (Queries)

-   **Q1.** Top 10 products by discount percentage\
-   **Q2.** High MRP products that are out of stock\
-   **Q3.** Estimated revenue per category\
-   **Q4.** Products with `MRP > 500` and `Discount < 10%`\
-   **Q5.** Top 5 categories with highest average discounts\
-   **Q6.** Price per gram analysis for products \> 100g\
-   **Q7.** Categorize products into `low`, `medium`, `bulk` weight
    groups\
-   **Q8.** Total inventory weight per category

------------------------------------------------------------------------

## 🚀 How to Run

1.  Open PostgreSQL / MySQL client.\

2.  Create a new database:

    ``` sql
    CREATE DATABASE zepto_db;
    ```

3.  Run the script:

    ``` sql
    \i zepto_analysis.sql
    ```

4.  Execute queries inside the file to explore insights.

------------------------------------------------------------------------

## 📈 Example Query

``` sql
-- Find top 5 categories with highest average discount
SELECT category,
       ROUND(AVG(discountPercent), 2) AS avg_discount
FROM zepto
GROUP BY category
ORDER BY avg_discount DESC
LIMIT 5;
```

------------------------------------------------------------------------

## 📝 Future Improvements

-   Add time-series sales data for trend analysis\
-   Connect with BI tools (Power BI / Tableau)\
-   Automate revenue & stock-out reporting

------------------------------------------------------------------------

## 📜 License

This project is licensed under the MIT License.
