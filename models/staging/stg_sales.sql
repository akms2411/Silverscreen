(select 
    movie_id,
    date_trunc('month',transaction_date) as transaction_month,
    'NJ_001' as location_id,
    sum(ticket_amount) as total_tickets,
    sum(transaction_total) as total_revenue
from {{ source('public', 'nj_001') }}
group by movie_id, transaction_month
)
union all
(select 
    movie_id,
    date_trunc('month',date) as transaction_month,
    'NJ_002' as location_id,
    sum(ticket_amount) as total_tickets,
    sum(total_earned) as total_revenue
from {{ source('public', 'nj_002') }}
group by movie_id, transaction_month
)
union all
(select 
    details as movie_id,
    date_trunc('month', transaction_date) as transaction_month,
    'NJ_003' as location_id,
    sum(amount) as total_tickets,
    sum(total_value) as total_revenue
from {{ source('public', 'nj_003') }}
where product_type = 'ticket'
group by movie_id, transaction_month
)
