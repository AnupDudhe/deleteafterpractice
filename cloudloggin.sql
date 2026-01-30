Use Case	Query Example
Find all errors	severity=ERROR
Find logs from a specific service	resource.type="gce_instance"
Find all admin audit logs	logName:"cloudaudit.googleapis.com%2Factivity"
Find logs with a specific HTTP error	httpRequest.status>=500
Search for a specific phrase	"user registration failed"
Find logs from a specific server	resource.labels.instance_id="1234567890"
Troubleshoot a specific function call	resource.type="cloud_function" AND "Trace ID: 1a2b3c"
Find authentication failures	logName:"cloudaudit.googleapis.com%2Fdata_access" AND jsonPayload.status.code=7 (PERMISSION_DENIED)
