select * from electronics limit 20;

-- 1) Total Revenue from Male vs Female
SELECT gender, SUM(revenue) AS total_revenue
FROM electronics
GROUP BY gender;

-- 2) Customers who used a discount but still spent more than the average "Total Spent"
select * from electronics
WHERE discount_percent > 0 
AND total_spent > (SELECT AVG(total_spent) FROM electronics);

-- 3) Top 5 Product Categories with the highest average Satisfaction Score
SELECT product_category, AVG(satisfaction_score) AS avg_satisfaction
FROM electronics
GROUP BY product_category
ORDER BY avg_satisfaction DESC
LIMIT 5;

-- 4) Average Revenue and Store Rating by Region
SELECT region, AVG(revenue) AS avg_revenue, AVG(store_rating) AS avg_store_rating
FROM electronics
GROUP BY region;

-- 5) Membership Value: Comparison of Average Spend and Loyalty Score
SELECT membership_status, AVG(total_spent) AS Avg_Spent, AVG(loyalty_score) AS Avg_Loyalty
FROM electronics
GROUP BY membership_status;

-- 6) Highest average Discount (%) by Product Category
SELECT product_category, AVG(discount_percent) AS Avg_Discount, SUM(items_purchased) AS Total_Items
FROM electronics
GROUP BY product_category
ORDER BY Avg_Discount DESC;

-- 7) Customer Segmentation based on Loyalty Score
SELECT 
    CASE 
        WHEN loyalty_score < 10 THEN 'Bronze'
        WHEN loyalty_score BETWEEN 10 AND 20 THEN 'Silver'
        ELSE 'Gold'
    END AS Loyalty_Segment,
    COUNT(*) AS Customer_Count,
    SUM(revenue) AS Total_Revenue
FROM electronics
GROUP BY loyalty_score;

-- 8) Total Revenue contribution by Age Group
select age_group,
sum(revenue) AS total_revenue
from electronics
group by age_group
ORDER BY total_revenue DESC;

-- 9) Average Satisfaction Score for customers with vs without Warranty Extension
SELECT warranty_extension, AVG(satisfaction_score) AS Avg_Satisfaction
FROM electronics
GROUP BY warranty_extension;

-- 10) Analyze performance and satisfaction based on Preferred Visit Time
SELECT 
    preferred_visit_time, 
    COUNT(*) AS total_customers,
    AVG(revenue) AS avg_revenue,
    AVG(satisfaction_score) AS avg_satisfaction
FROM electronics
GROUP BY preferred_visit_time
ORDER BY avg_revenue DESC;