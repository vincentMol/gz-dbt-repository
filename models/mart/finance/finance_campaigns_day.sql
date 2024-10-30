SELECT
    *

FROM {{ ref('int_campaigns_days') }}
JOIN {{ ref('finance_days') }}
USING(date_date)
