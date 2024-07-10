SELECT
    timestamp,
    user,
    communication_number,
    communication_id,
    script_id,
    script_name,
    mrf,
    client_mrf,
    script_owner,
    current_script_owner,
    script_responsible,
    current_script_responsible,
    crm_departament,
    account_number,
    caller_id,
    communication_theme,
    communication_detail,
    communication_result
FROM script_logs
WHERE script_id = ''; -- Фильтруем по нужному script_id
