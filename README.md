# Audible SQL Data Cleaning & Practice Project

This project is designed for **learning and practicing SQL** with a real-world audiobook dataset from Audible.  
The dataset initially contained messy, inconsistent, and unstandardized data, making it ideal for hands-on SQL data cleaning exercises.

---

##  Project Overview

- **Dataset:** Audible audiobooks (source: Kaggle)  
- **Records:** ~87,000 rows  
- **Columns include:**  
  - `name` – Book title  
  - `author` – Author name  
  - `narrator` – Narrator name  
  - `time` – Duration in minutes  
  - `releasedate` – Standardized release date (`YYYY-MM-DD`)  
  - `language` – Language of audiobook  
  - `stars` – Average rating  
  - `ratings` – Number of ratings  
  - `price` – Price of audiobook  

> **Note:** Only a **sample of the dataset** is included here for GitHub. Full dataset is available on the original source.

---

##  Data Cleaning & SQL Skills Practiced

This project was created to **practice SQL data cleaning** and learn how to handle real-world messy data:

1. **String Manipulation**  
   - Removed unwanted prefixes (`Written by:`, `Narrated by:`)  
   - Used `REPLACE`, `TRIM`, `CHARINDEX`, `SUBSTRING`  

2. **Date Standardization**  
   - Converted multiple formats (`DD-MM-YY`, `DD-MM-YYYY`, etc.) to `YYYY-MM-DD`  
   - Used `CONVERT` and `TRY_CONVERT` safely  

3. **Numeric Conversion & Cleaning**  
   - Converted ratings, stars, and price fields to proper numeric types  
   - Removed commas and non-numeric characters  

4. **Duration Conversion**  
   - Converted audiobook duration from textual formats (e.g., `2 hrs 20 mins`) to total minutes  

5. **Safe Backup Practices**  
   - Used table-level backups (`SELECT INTO`)  
   - Implemented rollback-ready strategies to avoid accidental data loss  

6. **SQL Practice Ready**  
   - Learners can write queries to filter, aggregate, and analyze cleaned audiobook data  
   - Ideal for practicing `CASE`, `UPDATE`, `ALTER TABLE`, `JOIN`, `GROUP BY`, and numeric/date conversions  

---

##  Tools & Technologies

- **SQL Server**  
- **SQL Server Management Studio (SSMS)**  
- Core SQL concepts practiced:  
  - Data cleaning (`UPDATE`, `CASE`, `REPLACE`, `SUBSTRING`)  
  - Backup & restore (`SELECT INTO`)  
  - Type conversions (`TRY_CAST`, `TRY_CONVERT`)  
  - Safe transformations and null handling  

---

##  Learning Goals

- Understand **how to clean messy, real-world data using SQL**  
- Learn **string, numeric, and date transformations**  
- Practice **safe data management and backup strategies**  
- Explore **real datasets for analysis and query building**  

---

##  How to Use This Project

1. **Clone the repository**:  
   ```bash
   git clone https://github.com/yourusername/audible-sql-data-cleaning.git
