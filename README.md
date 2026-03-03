# Brazil E-Commerce SQL Analysis

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

---

## 💰 Revenue Validation Query

```sql
SELECT 
    OrderStage,
    ROUND(SUM(payment_value), 0) AS total_payment
FROM (
    SELECT 
        CASE 
            WHEN o.order_status IN ('created','approved','invoiced','processing')
                THEN 'Pending'
            WHEN o.order_status = 'shipped'
                THEN 'Shipped'
            WHEN o.order_status = 'delivered'
                THEN 'Completed'
            WHEN o.order_status IN ('canceled','unavailable')
                THEN 'Failed'
            ELSE 'Other'
        END AS OrderStage,
        p.payment_value
    FROM olist_orders_dataset o
    LEFT JOIN olist_order_payments_dataset p
        ON o.order_id = p.order_id
) t
GROUP BY OrderStage
ORDER BY total_payment DESC;
```
Result:




