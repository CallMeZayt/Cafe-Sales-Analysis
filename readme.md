# Cafe Sales Dashboard using Power BI
This repository contains the Power BI dashboard project for analyzing and visualizing sales data from a cafe. The dashboard is designed to provide insights on sales performance, popular products, payment methods, and customer purchase locations.

## Aim
This Power BI dashboard helps cafe owners and managers monitor overall sales trends, product popularity, payment methods distribution, and customer behavior by location (Takeaway/In-store). With interactive filters for time periods and purchase locations, users can explore sales data dynamically.

## Features
- **Total Income Summary**: Displays the overall Total Income to provide a quick snapshot of the sales performance.
- **Monthly Income Trend Chart**: An area chart visualizing monthly income fluctuations throughout the year, helping identify seasonal patterns and sales trends.
- **Total Selling per Product Bar Chart**: A horizontal bar chart showing the quantity sold per product, making it easy to identify best-selling items such as Salad and Sandwich.
- **Interactive Location and Product Filters**: Slicers allowing users to filter data by purchase location (In-store or Takeaway) and specific products, enabling dynamic and deeper analysis.
- **Location Distribution Pie Chart**: A donut chart depicting the proportion of transactions by location, giving insights into the split between Takeaway and In-store purchases.
- **Quantity by Item and Location Stacked Bar Chart**: A stacked bar chart illustrating product quantities sold broken down by location, assisting in understanding consumer preferences in different purchase contexts.
- **Payment Method Distribution Pie Chart**: Shows the breakdown of payment methods used by customers, such as Digital Wallet, Cash, and Credit Card, for understanding payment behavior.

## Data Description
The dataset used in this project includes the following key columns:
- `transaction_id`: Unique identifier for each sale transaction
- `item`: Product name sold
- `quantity`: Number of items sold per transaction
- `price_per_unit`: Unit price of each product
- `total_spent`: Total amount spent in each transaction
- `payment_method`: Payment type used (Cash, Credit Card, Digital Wallet)
- `location`: Purchase location (Takeaway or In-store)
- `transaction_date`: Date of the transaction

## Data Processing Workflow
This project follows a structured data processing pipeline to ensure clean and reliable data for visualization:
1. **Data Cleaning in Jupyter Notebook (Python)**  
   Raw sales data is first cleaned and preprocessed using Python in Jupyter Notebook. This includes handling missing values, correcting data types, filling missing prices, and calculating additional columns such as total spent per transaction item.
2. **Data Input and Storage in Database**  
   The cleaned data is then loaded into a relational database (e.g., MySQL, PostgreSQL). Stored procedures are created for common data operations such as aggregating sales by month, best seller products, and filtering by purchase location.
3. **Data Visualization in Power BI**  
   Power BI connects to the database to load the processed data. Interactive visuals and filters are built in Power BI Desktop, leveraging the clean, pre-aggregated data for fast and dynamic dashboard performance.

![alt text](https://github.com/CallMeZayt/Cafe-Sales-Anlysis/blob/main/cafe_sales_dashboard.png?raw=true)

## Conclusion
This project provides a comprehensive and interactive sales dashboard designed to offer valuable insights into cafe sales performance. Starting from raw data cleaning and preparation, the dashboard enables detailed visualization of monthly income trends, product sales distribution, purchase locations, and payment methods. 
