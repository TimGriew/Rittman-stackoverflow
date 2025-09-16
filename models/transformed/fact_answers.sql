SELECT 
    id,
    owner_user_id,
    parent_question_id,
    parent_question_tag_group_id,
    creation_date,
    score,
    comment_count,
    is_accepted_answer,
    parent_question_has_accepted_answer,
    parent_question_answer_count,
    parent_question_comment_count,
    parent_question_view_count,
    parent_question_favorite_count,
    parent_question_score

FROM {{ ref('int_answers') }}
