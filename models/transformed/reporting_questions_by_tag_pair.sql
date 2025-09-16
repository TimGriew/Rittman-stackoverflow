SELECT
    questions_by_tag_group.*,
    tag_pairs.tag_pair
FROM {{ ref("reporting_questions_by_tag_group") }} AS questions_by_tag_group
INNER JOIN {{ ref("dim_tag_pairs") }} AS tag_pairs
    ON questions_by_tag_group.tag_group_id = tag_pairs.tag_group_id
