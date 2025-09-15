SELECT
    id,
    owner_user_id,
    parent_id,
    creation_date,
    body,
    score,
    comment_count

FROM {{ source('stackoverflow', 'posts_answers') }}
