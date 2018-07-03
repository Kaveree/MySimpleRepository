MERGE INTO FOUNDATION.EET_USAGE
USING DUAL
	ON (
			SERVICECODE = 'SM_LEAHDispatcherManage_Sync_v1'
			AND CALLED_SERVICECODE = 'CIO_LEAHPartnerCardGet_Sync_v1'
			)
WHEN NOT MATCHED
	THEN
		INSERT (
			SERVICECODE
			,CALLED_SERVICECODE
			)
		VALUES (
			'SM_LEAHDispatcherManage_Sync_v1'
			,'CIO_LEAHPartnerCardGet_Sync_v1'
			);
			
MERGE INTO FOUNDATION.EET_USAGE
USING DUAL
	ON (
			SERVICECODE = 'SM_ClientGetInfoClient_Sync_v1'
			AND CALLED_SERVICECODE = 'CIO_LEAHPartnerCardGet_Sync_v1'
			)
WHEN NOT MATCHED
	THEN
		INSERT (
			SERVICECODE
			,CALLED_SERVICECODE
			)
		VALUES (
			'SM_ClientGetInfoClient_Sync_v1'
			,'CIO_LEAHPartnerCardGet_Sync_v1'
			);