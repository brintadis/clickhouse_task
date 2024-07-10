CREATE TABLE script_logs_raw (
    timestamp DateTime64(6),
    -- Для этого поля я выбрал тип данных DateTime64 с 6 знаками после запятой, так как подумал, что в анализе может пригодиться точностью между звонками
    level String,
    sys String,
    mrf Nullable(String),
    user String,
    script_id String,
    script_name Nullable(String),
    script_key Nullable(String),
    script_version Nullable(Float64),
    script_process Nullable(String),
    action String,
    action_entity Nullable(String),
    action_id Nullable(String),
    action_data Nullable(String),
    message String,
    script_step_id Nullable(String),
    script_step_name Nullable(String),
    current_script_name Nullable(String),
    current_script_key Nullable(String),
    current_script_version Nullable(Float64),
    block_type String,
    parameters Nullable(String),
    -- Параметры в формате JSON, выбрал строковой тип данных для их хранения
    -- В параметрах содержатся ключевые поля: ACCOUNT_NUMBER, CALLER_ID, COMMUNICATION_THEME, COMMUNICATION_DETAIL, COMMUNICATION_RESULT
    timezone String,
    communication_id Nullable(Float64),
    communication_number Int64,
    integration_service_id Nullable(String),
    duration Float64,
    client_mrf String,
    session Nullable(Float64),
    script_owner Nullable(String),
    current_script_owner Nullable(String),
    script_responsible Nullable(String),
    current_script_responsible Nullable(String),
    crm_departament Nullable(String)
) ENGINE = MergeTree() -- MergeTree() с сортировкой по timestamp. Использовал для оптимизации исходя из документации CLickhouse
ORDER BY timestamp;

INSERT INTO script_logs_raw
FROM INFILE '/tmp/sm_test_data.csv' -- Здесь путь указан для докер контейнера
FORMAT CSV;
