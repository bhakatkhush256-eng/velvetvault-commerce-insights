# 🛒 VelvetVault Commerce Insights

> End-to-end SQL data analysis project on a Pakistani e-commerce business — transforming raw transactional data into revenue insights, customer intelligence, and product performance metrics using MySQL.

---

## 📊 Project Visualizations

### Revenue by Product Category
![Revenue by Category](charts/chart1_revenue_by_category.png)

### Top 5 Customers by Total Spend
![Top Customers](charts/chart2_top_customers.png)

### Monthly Revenue vs Profit Trend
![Monthly Trend](charts/chart3_monthly_trend.png)

### Order Status Distribution
![Order Status](charts/chart4_order_status.png)

---

## 📌 Project Overview

VelvetVault is a fictional Pakistani fashion and lifestyle e-commerce brand. This project simulates a real analyst workflow — from database design to business insight extraction — using a custom MySQL database (`luxe_market_db`) built with 4 relational tables.

The analysis is structured around 3 core business questions every e-commerce company asks:
- **Who** are our most valuable customers?
- **What** products are driving revenue and profit?
- **How** is the business growing month over month?

---

## 🗄️ Database Schema

```
luxe_market_db
│
├── customers     →  customer_id, full_name, city, gender, signup_date, loyalty_tier
├── products      →  product_id, product_name, category, unit_price, cost_price
├── orders        →  order_id, customer_id, order_date, order_status
└── order_items   →  item_id, order_id, product_id, quantity, discount_pct
```

---

## 🔍 Analysis Sections & Queries

### Section 1 — Customer Analysis
| # | Query | Business Purpose |
|---|-------|-----------------|
| 1 | Top 5 customers by total spend | Identify VIP customers for loyalty rewards |
| 2 | Customer count by city | Plan city-specific promotions and logistics |
| 3 | Revenue by loyalty tier | Measure retained vs new customer revenue |

### Section 2 — Product Performance
| # | Query | Business Purpose |
|---|-------|-----------------|
| 4 | Revenue & profit by category | Decide which categories to invest in |
| 5 | Top 10 best-selling products | Feature hero products in campaigns |
| 6 | Highest profit margin products | Prioritize promoting high-margin items |

### Section 3 — Revenue & Order Analysis
| # | Query | Business Purpose |
|---|-------|-----------------|
| 7 | Monthly revenue & profit trend | Spot growth trends and slow months |
| 8 | Order status breakdown | Monitor cancellation and return rates |
| 9 | Average order value by city | Identify premium markets |
| 10 | Revenue contribution by gender | Align product mix with buyer demographics |

---

## 🔧 SQL Skills Demonstrated

| Skill | Used In |
|-------|---------|
| `JOIN` (INNER) | All queries — linking customers, orders, products |
| `GROUP BY` | Revenue aggregation by category, city, month |
| `ORDER BY` + `LIMIT` | Top N rankings (customers, products) |
| `AGGREGATE FUNCTIONS` | SUM, COUNT, AVG, ROUND |
| `Subqueries` | Percentage share calculations |
| `DATE_FORMAT` | Monthly revenue grouping |
| `WHERE` filtering | Delivered orders only |
| `FOREIGN KEY` constraints | Relational database design |

---

## 💡 Key Business Insights

- **Electronics** generated the highest revenue (PKR 7.65M) despite fewer units sold — driven by high unit price
- **Top 5 customers** accounted for a disproportionate share of delivered revenue — strong case for a Gold loyalty programme
- **March** showed 63% higher revenue than January — indicating strong seasonal growth in Q1
- **Cancellation rate of 9%** signals a need to investigate delivery SLAs in Tier-2 cities

---

## 🛠️ Tools Used

![MySQL](https://img.shields.io/badge/MySQL-4479A1?style=for-the-badge&logo=mysql&logoColor=white)
![Python](https://img.shields.io/badge/Python-3776AB?style=for-the-badge&logo=python&logoColor=white)
![Matplotlib](https://img.shields.io/badge/Matplotlib-11557C?style=for-the-badge&logo=python&logoColor=white)

---

## 📁 Repository Structure

```
velvetvault-commerce-insights/
│
├── velvetvault_analysis.sql     ← Full SQL project (schema + 10 queries)
├── README.md                    ← This file
└── charts/
    ├── chart1_revenue_by_category.png
    ├── chart2_top_customers.png
    ├── chart3_monthly_trend.png
    └── chart4_order_status.png
```

---

## 👩‍💻 About

**Khushbakhat** — BSIT Student at Government College University, Faisalabad  
Aspiring Data Analyst | SQL · Excel · Power BI · Python

[![LinkedIn](https://img.shields.io/badge/LinkedIn-0077B5?style=flat&logo=linkedin&logoColor=white)](https://linkedin.com/in/your-profile)
[![GitHub](https://img.shields.io/badge/GitHub-100000?style=flat&logo=github&logoColor=white)](https://github.com/bhakatkhush256-eng)

---

*This project is part of my data analyst portfolio. All data is fictional and created for educational purposes.*
