SELECT

    orders_id
    ,date_date
    ,ROUND(SUM((tot_margin + shipping_fee) - (logCost + ship_cost)),2) AS operational_margin
    ,ROUND(SUM(tot_revenue),2) AS tot_revenue
    ,ROUND(SUM(tot_qty),2) AS tot_qty
    ,ROUND(SUM(tot_purchase),2) AS tot_purchase
    ,ROUND(SUM(tot_margin),2) AS tot_margin
    ,sum(logCost) AS logCost
    ,SUM(shipping_fee) AS shipping_fee
    ,SUM(ship_cost) AS shipcost

FROM {{ ref('int_orders_margin') }}
JOIN {{ ref('stg_raw__ship') }}
USING(orders_id)
GROUP BY orders_id, date_date
ORDER BY orders_id DESC