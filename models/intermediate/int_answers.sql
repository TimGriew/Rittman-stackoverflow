WITH answers AS (
    SELECT 
        stg_answers.id,
        stg_answers.owner_user_id,
        stg_answers.parent_question_id,
        parent_question.tag_group_id AS parent_question_tag_group_id,
        stg_answers.creation_date,
        stg_answers.body,
        stg_answers.score,
        stg_answers.comment_count,
        CASE 
            WHEN stg_answers.id = parent_question.accepted_answer_id THEN 1
            ELSE 0
        END AS is_accepted_answer,
        parent_question.has_accepted_answer AS parent_question_has_accepted_answer,
        parent_question.answer_count AS parent_question_answer_count,
        parent_question.comment_count AS parent_question_comment_count,
        parent_question.view_count AS parent_question_view_count,
        parent_question.favorite_count AS parent_question_favorite_count,
        parent_question.score AS parent_question_score

    FROM {{ ref('stg_answers') }}
    INNER JOIN {{ ref('fact_questions') }} AS parent_question
        ON stg_answers.parent_question_id = parent_question.id

)

SELECT * FROM answers
