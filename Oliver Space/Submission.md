# Analytical Exercise
Zhengzhe Jia 2020.02

## Part 1. SQL Exercise
- Write a query to get the daily, rolling 30 day average order value (where order value = monthly payment x term), split out by customers who paid monthly versus customers who paid upfront.
```SQL SERVER
/*SQL SERVER*/
With monthly_order_values as (
SELECT id, created_at, monthly_payment * term order_value
FROM Orders
WHERE payment_type = ‘monthly’ AND state = ‘active’
),
upfront _order_values as (
SELECT id, created_at, monthly_payment order_value
FROM Orders
WHERE payment_type = ‘upfront’ AND state = ‘active’),
SELECT AVG(order_value), ‘monthly’ payment_type FROM monthly_order_values
WHERE created_at >= DATEADD(DAY, -30, GETDATE())
UNION ALL
SELECT AVG(order_value), ‘upfront’ payment_type FROM upfront _order_values
WHERE created_at >= DATEADD(DAY, -30, GETDATE())

```
- Write a query to get average customer subscription value (where subscription value = total value of all orders in a customer's subscription), churn rate (where churn rate = churned subscriptions/all subscriptions), and average term by monthly cohort. 
```SQL SERVER
/*SQL SERVER*/

WITH User_Orders AS (
SELECT s.id user_id, s.order_id, s.state subscription_state, 
MONTH(s.created_at) cohort, o.term,
CASE
 WHEN o.payment_type = ‘monthly’ THEN o.monthly_payment * o.term
 WHEN o.payment_type = ‘upfront’ THEN o.monthly_payment
END AS order_value,
CASE 
 WHEN s.state = ‘churned’ THEN 1
 WHEN s.state != ‘churned’ THEN 0
END churned
FROM Subscriptions s
INNER JOIN
Orders o
ON s.order_id = o.id
WHERE o.state = ‘active’),
User_Agg As (
SELECT user_id, SUM(order_value) subscription_value, MAX(churned) churned, MAX(term) term, MAX(cohort) cohort
FROM   User_Orders
GROUP BY user_id                                                                             
)
SELECT AVG(subscription_value) average_subscription_value, SUM(churned) / COUNT(*) churn_rate, AVG(term) average_term
FROM User_Agg
GROUP BY cohort
```

## Part 2. Oliver Subscriptions Data Analysis

### Create a visualization of Oliver's revenue performance over this 6 month period, assuming there are no orders other than what you see in the below data set.

I assume that revenue here means monthly cash flow. In this section, I created charts of cash flow and other metrics relative to revenue. 
<img width="630" alt="image" src="https://user-images.githubusercontent.com/47021692/154384332-eb52c39e-fd5b-4d88-ad3b-7d8edbaf5ec1.png">

Fig 1, Monthly Revenue (Cash Flow) from 2019-09 to 2020-02

<img width="624" alt="image" src="https://user-images.githubusercontent.com/47021692/154385171-01aaecab-e16b-444c-9e8f-73f3d1a5c2e9.png">

Fig 2, Order Values that Become Active Each Month from 2019-09 to 2020-04

<img width="314" alt="image" src="https://user-images.githubusercontent.com/47021692/154385584-3e36d902-d0e5-49d7-8052-e89527640f47.png">

Fig 3, Number of Orders that Become Active Each Month from 2019-09 to 2020-04

<img width="328" alt="image" src="https://user-images.githubusercontent.com/47021692/154385752-99a25a8b-68bf-48b3-b2e2-db9f1907cd73.png">

Fig 4, Average Term of Orders that Become Active Each Month from 2019-09 to 2020-04

### Create a visualization of active customer subscriptions through December 2021, assuming all customers with term lengths less than 6 month churn, but all those with term lengths greater than 6 month renew for the same duration as the original subscription.
<img width="877" alt="image" src="https://user-images.githubusercontent.com/47021692/154387684-6be2b3fd-c72a-4d3e-bab4-f7665eab9bd6.png">

Fig 5, Active Customer Subscriptions from 2019-09 to 2021-12

### If you have time, include any other visualizations, takeaways, or recommendations that you would find helpful to illustrate Oliver's performance over this period.

With new customers coming in, the avenue or cash flow increases every month. If we look at number of orders each month(Fig 3), it shows that more orders became active in Jan 2020. (around 30% more than other months) I guess people tend to move and buy new furniture at the beginning of a new year. As for the order value, the value of Sept 2019 is much larger than other months, even twice the value of some months. Given that total orders becoming active that month was at the average level, I believe customers bought more expensive items that month. 

I will suggest that we create special promotion plans for these two months. If information on users can be introduced, we can target on specific users in these two months as well. 
