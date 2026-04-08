### 1. Last booked room per user
SELECT user_id, room_no
FROM (
    SELECT user_id, room_no,
           ROW_NUMBER() OVER (PARTITION BY user_id ORDER BY booking_date DESC) AS rn
    FROM bookings
) t
WHERE rn = 1;


### 2. Total billing (Nov 2021)
SELECT b.booking_id,
       SUM(bc.item_quantity * i.item_rate) AS total_amount
FROM bookings b
JOIN booking_commercials bc ON b.booking_id = bc.booking_id
JOIN items i ON bc.item_id = i.item_id
WHERE strftime('%m', b.booking_date) = '11'
  AND strftime('%Y', b.booking_date) = '2021'
GROUP BY b.booking_id;


### 3. Bills > 1000 (Oct 2021)
SELECT bc.bill_id,
       SUM(bc.item_quantity * i.item_rate) AS bill_amount
FROM booking_commercials bc
JOIN items i ON bc.item_id = i.item_id
WHERE strftime('%m', bc.bill_date) = '10'
  AND strftime('%Y', bc.bill_date) = '2021'
GROUP BY bc.bill_id
HAVING SUM(bc.item_quantity * i.item_rate) > 1000;

### 4. Most & least ordered item per month
WITH item_orders AS (
    SELECT strftime('%m', bill_date) AS month,
           item_id,
           SUM(item_quantity) AS total_qty
    FROM booking_commercials
    GROUP BY month, item_id
),
ranked AS (
    SELECT *,
           RANK() OVER (PARTITION BY month ORDER BY total_qty DESC) AS rnk_desc,
           RANK() OVER (PARTITION BY month ORDER BY total_qty ASC) AS rnk_asc
    FROM item_orders
)
SELECT *
FROM ranked
WHERE rnk_desc = 1 OR rnk_asc = 1;

### 5. Second highest bill per month
WITH bill_values AS (
    SELECT strftime('%m', bill_date) AS month,
           bill_id,
           SUM(item_quantity * i.item_rate) AS total_amount
    FROM booking_commercials bc
    JOIN items i ON bc.item_id = i.item_id
    GROUP BY month, bill_id
),
ranked AS (
    SELECT *,
           DENSE_RANK() OVER (PARTITION BY month ORDER BY total_amount DESC) AS rnk
    FROM bill_values
)
SELECT *
FROM ranked
WHERE rnk = 2;