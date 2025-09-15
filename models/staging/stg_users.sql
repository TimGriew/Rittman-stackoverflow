SELECT
    id,
    age,
    creation_date,
    location,
    reputation,
    up_votes,
    down_votes,
    views
 
FROM {{ source('stackoverflow', 'users') }}
