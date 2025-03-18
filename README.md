# 📊 Bank Loan Analysis using Excel, MySQL, and Power BI  

## 📌 Project Overview  
This project analyzes **bank loan data** using **Excel for preprocessing, MySQL for data storage & querying, and Power BI for visualization**.  
The goal is to extract insights, track key performance indicators (KPIs), and support decision-making in the banking sector.  

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

### **Dashboard 3: Detailed Loan View**  
✔ Grid View of Loan Data  
✔ Key Metrics at a Glance  

---

## 📈 Project Results & Insights  

🔹 Most loan applications are received in **Q4**, indicating seasonal trends.  
🔹 Loans with **longer terms** have a higher repayment rate.  
🔹 **Debt-to-Income Ratio (DTI)** is a strong predictor of loan defaults.  
🔹 **Homeowners** tend to take **higher-value loans** compared to renters.  

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
Open loan_data.csv in Excel and ensure data is formatted correctly.

## 📜 License
This project is open-source and licensed under the MIT License.

## 💡 Future Improvements
📌 Integrate Machine Learning for Loan Default Prediction
📌 Automate Data Pipeline using Python

## 📩 Contact & Contributions
🔹 If you find this project helpful, feel free to ⭐ the repo!
