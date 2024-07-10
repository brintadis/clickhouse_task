INSERT INTO script_logs
SELECT
    timestamp,
    user,
    communication_number,
    communication_id,
    mrf,
    client_mrf,
    crm_departament,
    script_id,
    script_name,
    script_owner,
    current_script_owner,
    script_responsible,
    current_script_responsible,
    nullIf(JSONExtractString(parameters, 'ACCOUNT_NUMBER'), '') AS account_number,
    nullIf(JSONExtractString(parameters, 'CALLER_ID'), '') AS caller_id,
    nullIf(JSONExtractString(parameters, 'COMMUNICATION_THEME'), '') AS communication_theme,
    nullIf(JSONExtractString(parameters, 'COMMUNICATION_DETAIL'), '') AS communication_detail,
    nullIf(JSONExtractString(parameters, 'COMMUNICATION_RESULT'), '') AS communication_result
FROM script_logs_raw;