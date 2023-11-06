SELECT 
    p.name AS product_name,
    oi.quantity,
    (oi.quantity * oi.unit_price) AS total_amount
FROM
    Order_Items oi
        JOIN
    Products p ON oi.product_id = p.product_id
ORDER BY oi.order_id ASC;
