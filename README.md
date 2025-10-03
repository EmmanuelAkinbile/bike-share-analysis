# Bike-Share Analysis (Divvy Q1 2019 & Q1 2020)

Portfolio project demonstrating skills in **R, SQL, Power BI, and business problem solving** using Divvy bike-share data.

---

## 📌 Overview
This project analyzes Divvy bike-share data (Q1 2019 & Q1 2020) to explore differences between **casual riders** and **members**, and to identify strategies that could increase membership conversions.  

The case study follows the **Google Data Analytics Capstone** framework:
- **Ask**: Define the business task and guiding questions  
- **Prepare**: Collect and understand the data  
- **Process**: Clean datasets in R, align schema for SQL analysis  
- **Analyze**: Aggregate and explore patterns with SQL & Power BI  
- **Share**: Build dashboard visualizations to communicate insights  
- **Act**: Recommend data-driven membership strategies  

---

## 📂 Repository Contents
- `divvy_cleaned.Rmd` → R Markdown notebook showing data cleaning steps  
- `divvy_clean.nb.html` → Knitted HTML version (viewable without RStudio)  
- `bikes_2019.csv` / `bikes_2020.csv` → Cleaned datasets with aligned schema  
- `Cyclistic_Case_Study.docx` → Final case study deliverable  
- Power BI dashboard images (member vs casual analysis)  

---

## 🛠️ Tools & Skills Demonstrated
- **R** (tidyverse, lubridate, janitor) → cleaning, schema alignment  
- **SQL (SQL Server)** → combining datasets & aggregations  
- **Power BI** → dashboard & data storytelling  
- **GitHub** → version control & portfolio hosting  

---

## 📊 Key Steps in Data Processing
1. Imported 2019 & 2020 Q1 datasets into R.  
2. Standardized column names and formats (aligned schema).  
3. Exported cleaned 2019 and 2020 CSVs for SQL import.  
4. Combined datasets in SQL to create a single table.  
5. Filtered invalid rides (≤ 30 seconds, ≥ 24 hours).  
6. Created `ride_length_min` and `day_of_week` fields.  
7. Exported aggregations to Power BI for visualization.  

---

## 🔑 Insights
- **Members** → shorter, more frequent rides (commuting patterns).  
- **Casual riders** → longer rides, concentrated on weekends.  
- **Top stations** for casual riders differ from members, showing tourist/leisure usage.  
- **Business recommendation**: target casual riders with weekend discounts or annual membership offers.  

---

## 📖 How to View
- Open the R notebook: [`divvy_cleaned.Rmd`](./divvy_cleaned.Rmd)  
- Or view the HTML version: [`divvy_cleaned.html`](./divvy_cleaned.nb.html)
- See SQL analysis: [`bike_share_analysis.sql`](bike_share_analysis.sql)
- See visuals in `/powerbi_visuals` folder (PNG exports).
- Can also access full interactive dashboard: [`Cyclistic Dashboard`](https://drive.google.com/file/d/1eLuV5Y4MSi7VCiXl32RAEVPVy1Xcr0Lx/view?usp=sharing)
- View full case study PDF: [`Cyclistic Case Study`](https://docs.google.com/document/d/1CxIQSyvO_mTiUgl1qpxVZNpB_JqsRuxjeMu3DkHU_EU/edit?usp=sharing)

---

## 👤 Author
**Emmanuel Akinbile**  
- [LinkedIn](https://www.linkedin.com/in/emmanuel-akinbile/)  
- [GitHub](https://github.com/EmmanuelAkinbile)  
