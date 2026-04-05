# 📊 Retail Sales Analytics Project

## 🚀 Overview
This project presents a retail analytics solution focused on validating AI-generated SQL queries against manually written logic. The objective is to ensure data accuracy, identify discrepancies in query results, and uncover key profitability issues.

The analysis combines structured data modeling in Snowflake, SQL-based validation techniques, and business-oriented exploration to evaluate how differences in query logic can impact insights and decision-making.

Supporting visualizations were created using Tableau to reinforce findings and highlight patterns in sales and profit performance.

---

## 🧱 Data Preparation
- Collected dataset from Kaggle  
- Split raw data into structured tables:
  - Customers  
  - Products  
  - Orders  
  - Order_Items  
- Uploaded data into Snowflake  
- Cleaned inconsistent date formats using SQL (`TRY_TO_DATE`)  

---

## 🏗️ Data Modeling
- Created relational tables in Snowflake  
- Built a unified analytical view (`SALES_VIEW`) using joins  
- Enabled efficient querying and reporting  

---

## 🧠 SQL Analysis
Performed analysis using SQL to answer key business questions:
- Revenue trends over time  
- Top customers by spending  
- Product and category performance  
- Regional sales insights  
- Order and customer metrics  

---

## 🤖 AI-Assisted Validation
- Compared manual SQL queries with AI-generated queries  
- Verified correctness of outputs  
- Identified differences in:
  - Sorting  
  - Alias naming  
  - Edge cases  
  - Precision  

📌 **Key Learning:** AI improves speed, but manual validation is essential for accuracy.

- Screenshots of manual vs AI query comparison are included in the project for validation.
- Validation was performed by comparing outputs of manual SQL queries with AI-generated queries.
  
---

## 🔍 Data Quality & Profit Analysis
- Identified 1800+ loss-making transactions using raw transaction data  
- Calculated total loss (~156K)  
- Validated results using the final analytical view (sales_view)

Performed analysis on:
- Loss by category  
- Loss trends over time

📌 **Key Insight:** High sales does not always result in profit.

---
## 📊 Final Business Recommendations

Based on the analysis:

- 🔴 **Loss-making transactions:**  
  A significant number of transactions are generating negative profit. Review discount strategies and pricing for these cases.

- 📉 **Category-level losses:**  
  Certain product categories consistently show losses. These categories need pricing adjustments or cost optimization.

- 📅 **Seasonal trends:**  
  Profit and sales trends vary over time. Businesses should align promotions and inventory planning with high-performing periods.

- 🧾 **Customer insights:**  
  Top customers contribute significantly to revenue. Focus on retention strategies like loyalty programs.

- ⚠️ **Data quality importance:**  
  Validating data (raw vs modeled) is critical to ensure accurate business decisions.

📌 **Overall Insight:**  
High sales does not always guarantee profit — profitability analysis is essential for sustainable growth.

---

## 📊 Tableau Dashboard

🔹 Main Dashboard  
👉 https://public.tableau.com/app/profile/vaishnavi.sendhamilselvan/viz/RetailSalesAnalysisDashboard_17750422572980/RetailSalesAnalysisDashboard

---

## 📈 Supporting Visualizations

- Profit vs Loss Analysis  
👉 https://public.tableau.com/app/profile/vaishnavi.sendhamilselvan/viz/RetailSalesAnalysis_ProfitLossAnalysis/ProfitLossAnalysis  

- Monthly Sales Trend  
👉 https://public.tableau.com/app/profile/vaishnavi.sendhamilselvan/viz/RetailSalesAnalysis_MonthlySalesTrend/MonthlySalesTrend  

- Sales by Category  
👉 https://public.tableau.com/app/profile/vaishnavi.sendhamilselvan/viz/RetailSalesAnalysis_SalesbyCategory/SalesbyCategory

---

## 📁 Project Structure
- data/ → CSV files (structured datasets)  
- sql/ → SQL queries for modeling and analysis  
- docs/ → Project documentation and notes  

---

## 💡 Skills Demonstrated
- Snowflake (Cloud Data Warehouse)  
- SQL (Joins, Aggregations, Data Cleaning)  
- Data Modeling  
- Data Quality Analysis  
- AI-assisted SQL Validation  
- Business Insight Generation  

---

## 📌 Conclusion
This project highlights how data, SQL, and AI can be combined to solve real-world business problems. It also emphasizes the importance of validating AI-generated outputs.
