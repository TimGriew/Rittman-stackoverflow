SELECT
    stg.id,
    stg.owner_user_id,
    stg.creation_date,
    stg.title,
    stg.body,
    stg.accepted_answer_id,
    stg.answer_count,
    stg.comment_count,
    stg.view_count,
    stg.favorite_count,
    stg.score,
    question_tags.tag_group_id

FROM {{ ref('stg_questions') }} AS stg
LEFT JOIN {{ ref("int_question_tags") }} AS question_tags
    ON stg.id = question_tags.question_id
