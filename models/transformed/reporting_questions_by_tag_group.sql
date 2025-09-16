SELECT
    questions.*,
    tag_groups.tag_group
FROM {{ ref("fact_questions") }} AS questions
INNER JOIN {{ ref("dim_tag_groups") }} AS tag_groups
    ON questions.tag_group_id = tag_groups.id
