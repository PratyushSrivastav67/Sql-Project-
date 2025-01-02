-- 1. TOP 5  pizzas types which are selling most and  it's price ?

SELECT 
    pizzas.price, pizza_types.pizza_type_id
FROM
    pizza_types
        JOIN
    pizzas ON pizza_types.pizza_type_id = pizzas.pizza_type_id
ORDER BY pizzas.price DESC
LIMIT 5;

-- 2-- 
-- show pizza name and their size  size ARE  MEDIUM (M)

SELECT 
    pizza_types.name, pizzas.size
FROM
    pizza_types
        JOIN
    pizzas ON pizza_types.pizza_type_id = pizzas.pizza_type_id
WHERE
    size = ('M'); 


-- 3-- Identify the most common pizza size ordered.
SELECT 
    pizzas.size, COUNT(order_details.order_id)
FROM
    pizzas
        JOIN
    order_details ON pizzas.pizza_id = order_details.pizza_id
GROUP BY pizzas.size;

-- 4--
-- Top 5 pizzas sales and their size
 
SELECT 
    pizza_types.name, pizzas.size, SUM(pizzas.price)
FROM
    pizza_types
        JOIN
    pizzas ON pizza_types.pizza_type_id = pizzas.pizza_type_id
GROUP BY pizza_types.name , pizzas.size
ORDER BY pizzas.size DESC 
LIMIT 5;



-- 5--
-- FIND THE TOTAL M AND L SIZE PIZZA NAME AND PRICE

SELECT 
    pizza_types.name, SUM(pizzas.price), pizzas.size
FROM
    pizza_types
        JOIN
    pizzas ON pizza_types.pizza_type_id = pizzas.pizza_type_id
WHERE
    size IN ('M' , 'L')
GROUP BY pizza_types.name , size;






