select
        movie_id,
        invoice_id,
        month,
        location_id,
        studio,
        release_date,
        weekly_price,
        total_invoice_sum

from {{ source('public', 'invoices') }}
where invoice_id IN (select invoice_id from {{ source('public', 'invoices') }} group by invoice_id having count(*)>1)
order by invoice_id
    