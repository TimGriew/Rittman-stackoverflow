SELECT
    id,
    owner_user_id,
    parent_id AS parent_question_id,
    creation_date,
    body,
    score,
    comment_count

FROM {{ source('stackoverflow', 'posts_answers') }}
WHERE EXTRACT(YEAR FROM creation_date) >= {{ var('earliest_year_of_interest') }}
