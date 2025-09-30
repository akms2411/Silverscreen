



    select
        movie_id,
        movie_title,
        COALESCE(genre,'Unknown') as genre,
        studio,
        rating
    from {{ source('public', 'movie_catalouge') }}

