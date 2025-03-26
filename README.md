# 📊 Bank Loan Analysis using Excel, MySQL, and Power BI  

## 📌 Project Overview  
This project analyzes **bank loan data** using **Excel for preprocessing, MySQL for data storage & querying, and Power BI for visualization**.  
The goal is to extract insights, track key performance indicators (KPIs), and support decision-making in the banking sector.  

## 📌 Key Objectives  
✅ **Track Loan KPIs:** Monitor **Total Applications, Funded Amount, and Received Amount** (MTD & MoM)  
✅ **Evaluate Loan Risk:** Analyze **Debt-to-Income (DTI) ratio, Interest Rates, and Good vs. Bad Loans**  
✅ **Visualize Trends:** Identify **seasonal patterns, regional disparities, and borrower profiles**  
✅ **Improve Decision-Making:** Provide insights to optimize **lending strategies and financial risk assessment**

## ✅ Key Highlights  
- 🔹 **Data Cleaning & Transformation using Excel**  
- 🔹 **Loan Data Storage & Analysis using MySQL**  
- 🔹 **Interactive Dashboards using Power BI**  

---

---

## 📁 Data Sources & Preparation  

### 📌 Data Source  
- The dataset contains **loan applications, funded amounts, borrower details, and repayment history**.  
- Data is provided in **TEXT (.CSV) format** and cleaned before analysis.  

### 📌 Data Preprocessing in Excel  
✔ **Date Format Adjustments** for MySQL compatibility  
✔ **Handling Missing Values & Numeric Formatting**  

### 📌 Data Import into MySQL  
✔ Loaded cleaned data using `LOAD DATA INFILE`.  
✔ Created structured **tables** using SQL scripts.  

---

## 📊 SQL Data Analysis  

📌 **Key Queries Used in MySQL:**  

### 1️⃣ Total Loan Applications:  
          ```sql
        select count(id) as Total_loan_application from loan_data;
### 2️⃣ Total Loan Applications (MTD):
          ```sql
        select count(id) as MTD_Total_loan_application from loan_data
        where month(issue_date) = 12 and year(issue_date) = 2021;
        
✅ **More SQL queries are available in the `sql/queries.sql` file.**  

## 📊 Power BI Dashboard Design  

### 📌 Power BI `.pbix` file is available in the `powerbi/` folder.  

### **Dashboard 1: Summary View**  
✔ **Key Performance Indicators (KPIs):**  
- Total Loan Applications  
- Total Funded Amount  
- Total Amount Received  
- Average Interest Rate  
- Good vs. Bad Loans  

📊 **Visuals Used:**  
- Card Visuals for KPIs  
- Grid View for Loan Status
  
  ![Image](https://github.com/user-attachments/assets/530a60a1-e252-4c8c-8c8b-5af0cb483f26)

### **Dashboard 2: Loan Insights**  
✔ **Charts Used:**  
- **Monthly Trends (Line Chart)** → To track seasonal trends  
- **Regional Loan Distribution (Map Visualization)** → To assess regional disparities  
- **Loan Term Distribution (Donut Chart)** → To understand loan term trends  
- **Employment Length vs. Loans (Bar Chart)** → To evaluate the impact of employment history  
- **Loan Purpose Breakdown (Bar Chart)** → To categorize loan purposes  
- **Home Ownership Analysis (Tree Map)** → To assess the impact of home ownership  

![Image](https://github.com/user-attachments/assets/07fdd90b-2a24-40bb-ab1c-41c5c2007bc7)


### **Dashboard 3: Detailed Loan View**  
✔ Grid View of Loan Data  
✔ Key Metrics at a Glance  

![Image](https://github.com/user-attachments/assets/c24962f0-a1c5-4a95-a0c7-338f1c8a6c2d)

---

## 📈 Project Results & Insights  

- **Total Loan Applications**: 38,576  
- **Total Funded Amount**: $435.8M  
- **Total Amount Received**: $473.1M  
- **Month-to-Date (MTD) Growth**:
  - Loan Applications: 4,300
  - Funded Amount: $54M (+13%)
  - Amount Received: $58.1M (+15.8%)

---

## 📌 Loan Performance Breakdown

| Loan Type | Applications | Funded Amount | Amount Received |
|-----------|-------------|---------------|----------------|
| **Good Loans** | 33,243 | $370.2M | $435.8M |
| **Bad Loans** | 5,333 | $65.5M | $37.3M |

🔹 **Good Loans**: 86.2% of total loans  
🔹 **Bad Loans**: 13.8% of total loans  

---

## 📌 Loan Status Distribution

| Status | Applications | Funded Amount |
|--------|-------------|---------------|
| **Charged Off** | 5,333 | $65.53M |
| **Current** | 1,098 | $18.87M |
| **Fully Paid** | 32,145 | $351.36M |
| **Total** | 38,576 | $435.77M |

✅ **Fully Paid Loans** dominate the dataset, ensuring stability.  
❌ **Charged Off Loans** make up a notable portion, indicating risk.

---

## 📌 Loan Funding Trends

- **Highest Funding Months**: **November ($48M) & December ($58M)**
- **Most Loan Applications**: **California, Texas, Florida**
- **Loan Term Breakdown**:
  - **36 months**: $273.04M (62.66%)
  - **60 months**: $162.72M (37.34%)

---

## 📌 Borrower Profile Insights

### **Employment Length vs Funding**
| Employment Length | Funded Amount |
|-------------------|--------------|
| 10+ years | $116M |
| 2 years | $45M |
| <1 year | $44M |

📌 **Longer employment tenure correlates with higher funding approvals.**

### **Loan Purpose Breakdown**
| Purpose | Funded Amount |
|---------|--------------|
| Debt Consolidation | $230M |
| Credit Card | $30M |
| Home Improvement | $30M |
| Small Business | $20M |

📌 **Debt Consolidation is the most common reason for loans.**

### **Home Ownership Impact**
| Ownership Type | Funded Amount |
|---------------|--------------|
| Mortgage | $219.33M |
| Rent | $185.77M |

📌 **Mortgage holders receive the highest loan amounts.**

---

## 📌 Interest Rates & Debt-to-Income (DTI)

- **Average Interest Rate**: 12.0% (MTD: 12.4%, MOM: 3.5%)
- **Average Debt-to-Income (DTI) Ratio**: 13.3% (MTD: 13.7%, MOM: 2.7%)

---

## 🔍 Key Takeaways

✔ **Most loans (86.2%) are classified as "Good Loans," ensuring higher repayments.**  
✔ **Debt consolidation is the top loan purpose, making up a significant portion of the funded amount.**  
✔ **Long-term employment (10+ years) positively impacts loan funding.**  
✔ **Interest rates have slightly decreased, making loans more affordable.**  
✔ **Mortgage holders receive higher loan amounts compared to renters.**  

---

## 🚀 Technologies Used  

### 🔹 **Data Cleaning & Transformation:**  
✔ **Microsoft Excel** – Used for initial data cleaning and formatting  

### 🔹 **Database Management & Querying:**  
✔ **MySQL** – Used for storing, querying, and analyzing data  

### 🔹 **Data Visualization & Dashboarding:**  
✔ **Power BI** – Used to create interactive dashboards  

---

## 🚀 How to Run This Project?  

### 1️⃣ **MySQL Database Setup**  
1. Install **MySQL Server 8.0**  
2. Create a database:  
   ```sql
   CREATE DATABASE bank_db;
3. Import the dataset using sql/data_import.sql.
### 2️⃣ **Power BI Setup**
Open powerbi/dashboard.pbix file.
Connect to MySQL server and refresh the dataset.
### 3️⃣ **Excel Data Cleaning**
Open financial_loan.csv in Excel and ensure data is formatted correctly.

## 📜 License
This project is open-source and licensed under the MIT License.

## 💡 Future Improvements
📌 Integrate Machine Learning for Loan Default Prediction
📌 Automate Data Pipeline using Python

## 📩 Contact & Contributions
🔹 If you find this project helpful, feel free to ⭐ the repo!

---

🚀 **Developed & Analyzed by Punit**


---
