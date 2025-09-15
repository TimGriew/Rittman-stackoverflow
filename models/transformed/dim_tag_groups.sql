SELECT
    tag_group_id as id,
    tag_group,
    count(*) AS number_of_questions
FROM {{ ref('int_question_tags') }}
GROUP BY tag_group_id, tag_group
