select 
    *
from {{ ref('stg_invoices') }}
where weekly_price * 4 <> total_invoice_sum