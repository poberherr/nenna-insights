CREATE TABLE IF NOT EXISTS event_masking (
    event_id String,
    timestamp DateTime,
    user_id UInt32,
    role_id Enum('Policy Admin' = 1, 'User' = 2, 'Operator' = 3, 'NULL' = 0) NULL,
    url String NULL,
    user_agent String NULL,
    organization_id String,
    user_input_language_code String,
    user_input_type Enum(
        'text/plain' = 1,
        'application/pdf' = 2,
        'application/msword' = 3,
        'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet' = 4,
        'application/vnd.ms-powerpoint' = 5,
        'image/jpeg' = 6,
        'video/mp4' = 7,
        'audio/mpeg' = 8,
        'NULL' = 0
    ) NULL,
    endpoint Enum('filter' = 1, 'filter_binary' = 2) DEFAULT 'filter',
    filtered_by_policy_id String NULL,
    event_trigger Enum('masking' = 1, 'de_masking' = 2, 'send' = 3),
    user_input String,
    total_detections UInt32 DEFAULT 0,
    detections_per_type Map(String, UInt32)
) ENGINE = MergeTree()
ORDER BY (timestamp, event_id);