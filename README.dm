# 🇧🇷 Brazil E-Commerce SQL Analysis

## 📌 Project Overview
This project analyzes the Brazilian e-commerce dataset using SQL.  
The objective is to explore revenue patterns, order status performance, 
and validate financial consistency across transactional tables.

---

## 📊 Key Business Questions

1. How does revenue differ by order status?
2. Is item-level revenue consistent with payment-level transactions?
3. What business insights can be derived from order lifecycle data?

---

## 🗂 Dataset Tables Used

- `olist_orders_dataset`
- `olist_order_items_dataset`
- `olist_order_payments_dataset`
- `olist_customers_dataset`
- `olist_order_reviews_dataset`

---

## 📁 SQL Structure
  sql/
 ├── revenue_validation.sql
 ├── kpi_scorecard.sql
 ├── product_analysis.sql
 └── geo_analysis.sql

  
---

## 🔍 Example Analysis: Revenue by Order Status

This analysis compares:

- Item-level total price
- Freight value
- Payment value

Grouped by order status to understand revenue distribution.

---

## 📈 Tools Used

- SQL Server
- Tableau (for visualization)

````markdown
## 💰 Revenue Validation by Order Status

```sql
SELECT 
    o.order_status,
    SUM(ISNULL(i.total_price, 0))   AS total_price,
    SUM(ISNULL(i.total_freight, 0)) AS total_freight,
    SUM(ISNULL(p.total_payment, 0)) AS total_payment
FROM olist_orders_dataset o
LEFT JOIN (
    SELECT 
        order_id,
        SUM(price) AS total_price,
        SUM(freight_value) AS total_freight
    FROM olist_order_items_dataset
    GROUP BY order_id
) i ON o.order_id = i.order_id
LEFT JOIN (
    SELECT 
        order_id,
        SUM(payment_value) AS total_payment
    FROM olist_order_payments_dataset
    GROUP BY order_id
) p ON o.order_id = p.order_id
GROUP BY o.order_status
ORDER BY total_payment DESC;
```



---

## 💡 Business Insight Focus

This project demonstrates:

- Multi-table joins
- Order-level aggregation
- Revenue validation logic
- KPI calculation
- Business-oriented SQL analysis

---

👩‍💻 Author: Melody
