-- Create a table with each tag per tag_group

-- Split tag_group string into an array
WITH tag_group_arrays AS (
    SELECT
        tag_group_id,
        SPLIT(tag_group, '|') AS tag_array
    FROM {{ ref('dim_tag_groups')}}
),

-- Then unnest array so we have one row per tag per tag_group
unnested_tags AS (
    SELECT
        tag_group_id,
        tag
    FROM tag_group_arrays
    CROSS JOIN UNNEST(tag_group_arrays.tag_array) AS tag
),

-- Create ID variables
unnested_tags_with_ids AS (
    SELECT 
        tag_group_id,
        tag,
        ROW_NUMBER() OVER (ORDER BY tag_group_id, tag) AS id,
        DENSE_RANK() OVER (ORDER BY tag) AS tag_id
    FROM unnested_tags
)

SELECT id, tag_group_id, tag_id, tag FROM unnested_tags_with_ids
