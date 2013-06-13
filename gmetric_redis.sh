#!/bin/bash

/usr/bin/gmetric --name Redis_email_queue --value `/usr/local/bin/redis-cli llen resque:queue:email | /bin/sed 's/(integer)//'` --type int32 --unit email
/usr/bin/gmetric --name Redis_transition_queue --value `/usr/local/bin/redis-cli llen resque:queue:transition | /bin/sed 's/(integer)//'` --type int32 --unit transition
/usr/bin/gmetric --name Redis_each_employer_queue --value `/usr/local/bin/redis-cli llen resque:queue:each_employer | /bin/sed 's/(integer)//'` --type int32 --unit each_employer
/usr/bin/gmetric --name Redis_statused_queue --value `/usr/local/bin/redis-cli llen resque:queue:statused | /bin/sed 's/(integer)//'` --type int32 --unit statused
/usr/bin/gmetric --name Redis_reporting_etl_queue --value `/usr/local/bin/redis-cli llen resque:queue:reporting_etl | /bin/sed 's/(integer)//'` --type int32 --unit reporting_etl
/usr/bin/gmetric --name Redis_reports_queue --value `/usr/local/bin/redis-cli llen resque:queue:reports | /bin/sed 's/(integer)//'` --type int32 --unit reports
/usr/bin/gmetric --name Redis_integration_jobs_queue --value `/usr/local/bin/redis-cli llen resque:queue:integration_jobs | /bin/sed 's/(integer)//'` --type int32 --unit integration
/usr/bin/gmetric --name Redis_reporting_s3_upload_queue --value `/usr/local/bin/redis-cli llen resque:queue:reporting_s3_upload | /bin/sed 's/(integer)//'` --type int32 --unit repor
/usr/bin/gmetric --name Redis_system_event_queue --value `/usr/local/bin/redis-cli llen resque:queue:system_event | /bin/sed 's/(integer)//'` --type int32 --unit system_event
/usr/bin/gmetric --name Redis_keyword_index_deltas_queue --value `/usr/local/bin/redis-cli llen resque:queue:keyword_index_deltas | /bin/sed 's/(integer)//'` --type int32 --unit key
/usr/bin/gmetric --name Redis_reporting_db_copy_queue --value `/usr/local/bin/redis-cli llen resque:queue:reporting_db_copy | /bin/sed 's/(integer)//'` --type int32 --unit reporting
/usr/bin/gmetric --name Redis_pdf_queue --value `/usr/local/bin/redis-cli llen resque:queue:pdf | /bin/sed 's/(integer)//'` --type int32 --unit pdf
/usr/bin/gmetric --name Redis_import_export_queue --value `/usr/local/bin/redis-cli llen resque:queue:import_export | /bin/sed 's/(integer)//'` --type int32 --unit import_export
