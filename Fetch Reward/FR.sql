/*mysql*/
select
  rewards_receipt_status,
  sum(purchased_item_count) as total_number_of_items_purchased,
  avg(total_spent) as average_spend
from receipt
where rewards_receipt_status in ('Accepted', 'Rejected')
group by rewards_receipt_status
