SELECT
    tag_group,
    tag_group_id,
    count(*) AS number_of_questions
FROM {{ ref('int_question_tags') }}
GROUP BY tag_group, tag_group_id
