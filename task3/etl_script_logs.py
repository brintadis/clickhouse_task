from airflow import DAG
from airflow_clickhouse_plugin.operators.clickhouse import ClickHouseOperator
from airflow.utils.dates import days_ago

default_args = {
    'owner': 'airflow',
    'retries': 1,
}

with DAG(
    dag_id='etl_script_logs',
    default_args=default_args,
    start_date=days_ago(2),
    schedule_interval='@hourly',
) as dag:

    run_clickhouse_query = ClickHouseOperator(
        task_id='run_clickhouse_query',
        database='default',
        sql='''
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
            FROM script_logs_raw
            WHERE timestamp NOT IN (SELECT timestamp FROM script_logs);
        ''',
        clickhouse_conn_id='clickhouse_default',
    )

    run_clickhouse_query
