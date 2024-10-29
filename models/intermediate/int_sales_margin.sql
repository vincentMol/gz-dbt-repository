SELECT

    *
    ,ROUND(quantity * purchase_price,2) AS purchase_cost
    ,ROUND(revenue - (quantity * purchase_price),2) AS margin
    

FROM {{ ref('stg_raw__sales') }}
JOIN {{ ref('stg_raw__product') }}
USING(products_id)