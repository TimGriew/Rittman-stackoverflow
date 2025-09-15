WITH question_tags AS (
    SELECT 
        id AS question_id,
        tags 
    FROM {{ ref('stg_questions') }}
),

/* tags aren't always in alphabetical order, so create tag_group variable that is*/
tag_groups AS ( 
    SELECT 
        question_id,
        tags, 
        (
            SELECT string_agg(tag, '|' ORDER BY tag) 
            FROM UNNEST(SPLIT(tags, '|')) AS tag
        ) AS tag_group
    FROM question_tags
),

/*Use dense_rank() to assign a new id_variable - unique by tag_group*/
tag_groups_with_id AS (
    SELECT 
        question_id,
        tags,
        tag_group, 
        dense_rank() OVER (ORDER BY tag_group ASC) AS tag_group_id
    FROM tag_groups
)

SELECT * FROM tag_groups_with_id
