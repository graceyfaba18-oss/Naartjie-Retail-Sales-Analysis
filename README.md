# Project 2 — Naartjie Kids South Africa
## Retail Sales Performance Analysis

**Author:** Gracey F.
**Tools:** SQL (SQLite) | Microsoft Excel | DB Browser for SQLite
**Dataset:** Modelled on Sample Superstore Sales Dataset (Kaggle public dataset)
**Source:** https://www.kaggle.com/datasets/vivek468/superstore-dataset-final
**Note:** This is a publicly available retail sample dataset reframed within a South African children's clothing retail context, based on my experience as a Sales Representative at Naartjie Kids.

---

## Business Context

Naartjie Kids is a South African children's clothing retailer with stores across major shopping centres. I worked as a Sales Representative at Naartjie and this project mirrors the type of sales performance analysis that informs stock planning, promotional decisions, and regional target-setting in a retail environment.

---

## What This Project Analyses

- Year on year sales and profit growth from 2021 to 2024
- Sales and profit margin by province
- Top 10 best-selling products by revenue
- Product category performance and margin comparison
- Impact of discounts on profit margins
- Customer segment behaviour (Regular, Loyalty, Wholesale)
- Shipping mode efficiency

---

## Key Findings

Gauteng generates the highest sales volume driven by population density and mall footfall. Kids Clothing accounts for approximately 60% of all transactions but Footwear carries a slightly higher average profit margin. Products with discounts above 20% consistently produce profit margins below 10%, highlighting a pricing strategy risk that directly impacts store profitability. Loyalty members show a higher average order value than regular customers, supporting the business case for investment in loyalty programme development.

---

## Project Structure

```
project2_naartjie/
├── data/
│   ├── naartjie_sales.db       — SQLite database (2 500 transactions)
│   └── naartjie_sales.csv      — Raw sales data CSV
├── sql/
│   └── naartjie_queries.sql    — 10 SQL business queries
├── excel/
│   └── Naartjie_Sales_Dashboard.xlsx  — 4-sheet Excel dashboard
└── README.md
```

---

## How to Run the SQL Queries

1. Install DB Browser for SQLite: https://sqlitebrowser.org/dl/
2. Click Open Database and select naartjie_sales.db
3. Click Execute SQL tab
4. Open naartjie_queries.sql in Notepad
5. Copy any query and paste into DB Browser
6. Press F5 to run

---

*This project is part of the Gracey F. Data Analytics Portfolio.*
*Full portfolio: https://github.com/gracey-faba/DATA-ANALYST-PORTFOLIO*
