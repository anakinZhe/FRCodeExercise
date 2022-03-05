## Instructions
Please see instructions below:	
	
- This exercise has two parts, each with 2-3 questions.
- Please make a copy of the exercise, and label with your first and last name
- For the SQL exercise, please write your query in whatever version of SQL (PostgreSQL, MySQL, etc) you're most comfortable using but note it in your response.
- Feel free to use whatever format suits you best to send your responses back – as long as we can open & view the file, all good.
- You have 3 hours to complete this exercise. 
- Please send back your results including any assumptions you made and intermediate steps you took to get there. It's ok if you do not complete everything, just send whatever you have.

## SQL Exercise
See below the schema for several tables in our database.

**Definitions and notes:**
- Each subscription is given a unique Subscription ID. Assume each Subscription ID is a unique customer.
- Each order is given a unique Order Id. A customer could have multiple orders as part of their subscription.
- Monthly_payment is the $ amount the customer is paying for an order each month. Term is the length of time the customer wants the items (in months).
- A customer can choose to pay monthly over the course of their plan, or pay for their entire plan upfront. This is denoted by the field payment_type.
- Assume that if a customer has multiple orders in their subscription, they all have the same term and payment type.
- The subscription begins on the date of delivery. For example, if an order is created on August 31st, but is not delivered until September 4th, the subscription term begins in September, and we only recognize the revenue once the subscription begins. 
- The state field in the orders table refers to the status of an individual order – whether it is still active or has now been canceled
- A subscription is considered active if a customer has at least one active order associated with it.


**Prompt**

A) Write a query to get the daily, rolling 30 day average order value (where order value = monthly payment x term), split out by customers who paid monthly versus customers who paid upfront.

B) Write a query to get average customer subscription value (where subscription value = total value of all orders in a customer's subscription), churn rate (where churn rate = churned subscriptions/all subscriptions), and average term by monthly cohort. 

## Oliver Subscriptions Data Analysis

See below 6 months of raw data between September 2019 to Feb 2020

**Definitions and notes:**
- Each subscription is given a unique Subscription ID. Assume each Subscription ID is a unique customer.
- Order_creation_date is when the customer places the order on the website
- Actual_delivery_time is when the delivery occured. If you this column is blank, the order was cancelled before delivery. 
- Monthly_payment is the $ amount the customer is paying each month. Term is the length of time the customer wants the items.
- The subscription begins on the date of delivery. For example, if an order is created on August 31st, but is not delivered until September 4th, the subscription term begins in September, and we only recognize the revenue once the subscription begins. 

**Prompt**

A) Create a visualization of Oliver's revenue performance over this 6 month period, assuming there are no orders other than what you see in the below data set.

B) Create a visualization of active customer subscriptions through December 2021, assuming all customers with term lengths less than 6 month churn, but all those with term lengths greater than 6 month renew for the same duration as the original subscription.

C) If you have time, include any other visualizations, takeaways, or recommendations that you would find helpful to illustrate Oliver's performance over this period.
