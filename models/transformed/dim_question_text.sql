SELECT id, title, body FROM {{ ref("stg_questions") }}
