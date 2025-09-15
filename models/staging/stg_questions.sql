SELECT
    id,
    owner_user_id,
    creation_date,
    title,
    body,
    accepted_answer_id,
    answer_count,
    comment_count,
    view_count,
    favorite_count,
    score,
    tags

FROM {{ source('stackoverflow', 'posts_questions') }}
