-- Create table with each pair of tags within each tag_group
WITH tag_pairs AS (
    SELECT 
        tags1.tag_group_id, 
        tags1.tag_id AS tag1_id,
        tags1.tag AS tag1,
        tags2.tag_id AS tag2_id,
        tags2.tag AS tag2
    FROM {{ ref('dim_tags') }} AS tags1
    INNER JOIN {{ ref('dim_tags') }} AS tags2
    ON tags1.tag_group_id = tags2.tag_group_id AND tags1.tag_id < tags2.tag_id
),

tag_pairs_with_id AS (
    SELECT 
        *,
        ROW_NUMBER() OVER (ORDER BY tag_group_id, tag1_id, tag2_id) AS id,
        DENSE_RANK() OVER (ORDER BY tag1_id, tag2_id) AS tag_pair_id
    FROM tag_pairs
)

SELECT id, tag_group_id, tag_pair_id, tag1_id, tag1, tag2_id, tag2 FROM tag_pairs_with_id
