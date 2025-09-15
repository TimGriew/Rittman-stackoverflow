select
    id,
    title,
    body,
    creation_date,
    owner_user_id,
    parent_id,
    accepted_answer_id,
    view_count,
    answer_count,
    comment_count,
    favorite_count,
    tags


from {{ source('stackoverflow', 'posts_questions') }}