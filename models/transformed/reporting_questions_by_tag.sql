SELECT
    questions_by_tag_group.*,
    tags.tag
FROM {{ ref("reporting_questions_by_tag_group") }} AS questions_by_tag_group
INNER JOIN {{ ref("dim_tags") }} AS tags
    ON questions_by_tag_group.tag_group_id = tags.tag_group_id
