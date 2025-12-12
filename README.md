# 📦 PlusOrders Data Mart  
**Data Mart for Luxury Fashion E-Commerce Order Analytics**

## 📘 Overview  
This project focuses on designing and implementing a **data mart** based on customer order data from **PlusOrders**, an e-commerce company in the **luxury fashion** industry.  
The goal is to build an **analytics-optimized data structure** that supports business intelligence, reporting, and advanced insights into customer behavior, product performance, and sales trends.

---

## 🎯 Objectives  
- Develop a dimensional model adapted to e-commerce order analysis  
- Design and implement ETL/ELT pipelines for data extraction, transformation, and loading  
- Ensure data consistency, accuracy, and completeness through validation rules  
- Provide a schema optimized for high-performance analytical queries  
- Document all business rules, transformations, and structures  

---

## 🏗️ Architecture  

### ✨ Dimensional Model  
The data mart is based on a **Star Schema**, composed of:

#### **📌 Fact Table**
- **FactOrders**  
  Contains order metrics such as quantity, discounts, shipping costs, and other transactional details.

#### **🔹 Dimension Tables**
- **DimCustomer**  
- **DimProduct**  
- **DimDate**  
- **DimSite**  
- **DimSize**  
- **DimCurrency**
- **DimShipping**   

---

### 🔄 ETL / ELT Processes  
The ETL workflow was developed using:

- **SQL Server Integration Services (SSIS)** within **Microsoft Visual Studio**  
- **SQL Server** for data storage  

The pipeline includes:

- **Extraction** from source datasets  
- **Transformation** for cleaning, standardizing, and enriching the data  
- **Loading** into the dimensional model stored in SQL Server  


---

## 📊 Reporting & Analytics  
Data analysis and visualization were performed using:

- **Power BI**, leveraging DAX measures and optimized model relationships to generate dashboards and analytical reports

---

## 🤝 Contributors  
Jorge Cruz - 1221715

Ana Rita Silva - 1211152
