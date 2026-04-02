# 📊 Retail Sales Analytics Project

## 🚀 Overview
This project demonstrates an end-to-end data analytics workflow using real-world retail data. It focuses on data modeling, SQL-based analysis, and AI-assisted query validation to generate meaningful business insights.

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
- Identified 1800+ loss-making transactions  
- Calculated total loss (~156K)  
- Analyzed:
  - Loss by category  
  - Loss trends over time  

📌 **Key Insight:** High sales does not always result in profit.

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
