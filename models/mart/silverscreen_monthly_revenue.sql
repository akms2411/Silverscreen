select
    i.movie_id, 
    m.movie_title, 
    m.genre, 
    i.studio,
    i.month,
    i.location_id as loaction,
    i.total_invoice_sum as rental_cost,
    s.total_tickets as tickets_sold,
    s.total_revenue as revenue 
from {{ ref('stg_invoices') }} i 
left join {{ ref('stg_sales') }} s 
on i.movie_id = s.movie_id and i.month = s.transaction_month and i.location_id = s.location_id
left join {{ ref('stg_public__movie_catalouge') }} m 
on i.movie_id = m.movie_id 
