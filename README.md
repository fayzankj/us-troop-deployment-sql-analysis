# 🇺🇸 US Troop Deployment SQL Analysis

This project analyzes the global deployment of U.S. military troops between **2006 and 2015** using SQL. It focuses on cleaning, auditing, and querying deployment data to identify trends, unusual patterns, and regional presence across military branches.

## 📊 Dataset Overview

- **Source**: [U.S. troop deployments to Europe: 2006–2015](https://www.kaggle.com/datasets/iskk97/usa-troop-data-in-europe)  
- **Contributors**: Alejandro Navas González
- **Rows**: 279  
- **Columns**: 9  
- **Fields**:
  - `country`: Host country of deployment  
  - `code`, `iso3c`: Standardized country codes  
  - `year`: Year of observation  
  - `troops`: Total troops deployed  
  - `army`, `navy`, `air`, `marine`: Troop count per military branch  

## 🛠️ Audit & Cleaning Steps

- ✅ Null check across all columns  
- ✅ Duplicate validation (`country`, `year`)  
- ✅ Logic validation: `troops = army + navy + air + marine`  
- ✅ Fixed data inconsistency for UK 2014 deployment  
- ✅ Cleaned structure and verified row counts post-load  

## ❓ Analytical Questions

### 📍 Basic Analysis

- Total number of deployments (troops) by year  
- Top 10 countries with most deployed troops  
- Year-wise deployment trend in **Germany**  
- Identify countries with increasing deployment over the years  

### 🔍 Advanced Analysis

- Which branch had the **highest average deployment** overall?  
- Compare deployment between **Cold War years (2006–2010)** and **Post-Cold War (2011–2015)**  
- Branch-wise percentage distribution of troops per year  
- Flag countries with **unusual deployment patterns** (e.g., `navy > army + air`)  

## 📁 Folder Contents

| File | Description |
|------|-------------|
| `Data Audit and Cleaning.sql` | Main SQL script with cleaning + Auditing Data |
| `Basic Questions.sql` | Main SQL script Solving Basic Queries |
| `Advanced Questions.sql` | Main SQL script Solving Advanced Queries |
| `README.md` | Project overview |
| `questions.pdf` | Formatted list of analysis questions (for reference) |

---

## 📌 Badges

![Rows](https://img.shields.io/badge/Total%20Rows-279-blue)  
![Columns](https://img.shields.io/badge/Total%20Columns-9-blue)  
![SQL](https://img.shields.io/badge/Tech-SQL-informational)  
![Status](https://img.shields.io/badge/Status-Completed-success)
