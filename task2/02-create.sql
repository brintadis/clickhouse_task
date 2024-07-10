CREATE TABLE script_logs (
    timestamp DateTime64(6),
    user String,
    communication_number Int64,
    communication_id Nullable(Float64),
    mrf Nullable(String),
    client_mrf String,
    crm_departament Nullable(String),
    script_id String,
    script_name Nullable(String),
    script_owner Nullable(String),
    current_script_owner Nullable(String),
    script_responsible Nullable(String),
    current_script_responsible Nullable(String),
    account_number Nullable(String),
    caller_id Nullable(String),
    communication_theme Nullable(String),
    communication_detail Nullable(String),
    communication_result Nullable(String)
) ENGINE = MergeTree()
ORDER BY timestamp;
