SELECT 
    s.products_id, 
    date_date, 
    orders_id,
    revenue, 
    quantity, 
    purchase_price, 
    ROUND(quantity*p.purchase_price,2) AS purchase_cost,
    s.revenue - ROUND(s.quantity*p.purchase_price,1) AS margin
FROM {{ref("stg_raw__sales")}} s
LEFT JOIN {{ref("stg_raw__product")}} p 
		USING (products_id) 