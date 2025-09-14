# Bike-Share Analysis

Portfolio project demonstrating skills in **R, data wrangling, visualization, and business problem solving** using Divvy bike-share data.

---

## 📌 Overview
This project analyzes Divvy bike-share data (Q1 2019 & Q1 2020) to explore differences between **casual riders** and **members**, and to identify strategies that could increase membership conversions.  

The case study follows the **Google Data Analytics Capstone** framework:  
- **Ask**: Define the business task and guiding questions  
- **Prepare**: Collect and understand the data  
- **Process**: Clean and combine datasets in R  
- **Analyze**: Summarize and visualize usage patterns  
- **Share**: Communicate insights and recommendations  
- **Act**: Suggest data-driven business strategies  

---

## 📂 Repository Contents
- `divvy_clean.Rmd` → R Markdown notebook showing the cleaning process  
- `divvy_clean.html` → Knitted HTML notebook (easier to view without RStudio)  
- `divvy_clean_sample.csv` → A sample of the cleaned dataset (10k rows, due to GitHub file size limits)  
- `Cyclistic_Case_Study_Outline.docx` → Written case study deliverable (business task → insights)  

---

## 🛠️ Tools & Skills Demonstrated
- **R** (dplyr, tidyr, lubridate) → data wrangling & cleaning  
- **R Markdown** → reproducible workflows & documentation  
- **Excel/Google Sheets** → calculated ride length, day-of-week fields  
- **Power BI / Tableau** → dashboard visualization  
- **GitHub** → portfolio hosting & version control  

---

## 📊 Key Steps in Data Processing
1. Imported Divvy Q1 2019 & Q1 2020 datasets into R.  
2. Standardized column names and formats.  
3. Added `rideable_type` column to 2019 dataset for consistency.  
4. Combined datasets using `bind_rows()`.  
5. Removed unnecessary columns and checked for duplicates.  
6. Exported cleaned dataset and created calculated fields (`ride_length`, `day_of_week`) in Sheets.  

---

## 🔑 Insights
- Members take shorter, more frequent rides compared to casual riders.  
- Casual riders use bikes more often on weekends, while members ride consistently throughout the week.  
- Casual riders generally ride longer, suggesting leisure vs. commute usage.  

**Business Recommendation:** Marketing efforts should focus on converting casual weekend riders into members, perhaps via discounted memberships or targeted weekend campaigns.  

---

## 📖 How to View
- Open the R notebook: [`divvy_clean.Rmd`](./divvy_clean.Rmd)  
- Or view the HTML version (no setup required): [`divvy_clean.html`](./divvy_clean.html)  
- Cleaned dataset sample: [`divvy_cleaned_sample.csv`](./divvy_clean_sample.csv)  

---

## 👤 Author
**Emmanuel Akinbile**  
- [LinkedIn](https://www.linkedin.com/in/emmanuel-akinbile/)  
- [GitHub](https://github.com/EmmanuelAkinbile)  

---


