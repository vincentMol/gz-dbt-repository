 {{ config(materialized='table') }}

SELECT
    date_date
    ,COUNT(*) AS nb_transaction
    ,ROUND(SUM(tot_revenue),2) AS revenue
    ,ROUND(AVG(tot_revenue),2) AS average_basket
    ,ROUND(SUM(operational_margin),1) AS operational_margin
    ,ROUND(SUM(tot_purchase),1) AS purchase_cost
    ,ROUND(SUM(shipping_fee),1) AS shipping_fee
    ,ROUND(SUM(logCost),2) AS logCost
    ,SUM(tot_qty) AS tot_qty_sold

FROM {{ ref('int_orders_operational') }}
GROUP BY date_date 
ORDER BY date_date DESC