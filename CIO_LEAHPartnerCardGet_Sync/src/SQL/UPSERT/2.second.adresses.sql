MERGE INTO FOUNDATION.EET_ADDRESS
USING DUAL
	ON (
			SERVICECODE = 'CIO_LEAHPartnerCardGet_Sync_v1'
			AND PROTOCOL = 'XMLMSG/JMS'
			AND DIRECTION = 'IN'
			)
WHEN MATCHED
	THEN
		UPDATE
		SET ADDRESS_COMP = 'input.CIO_LEAHPartnerCardGet_Sync_v1.Get'
			,DESCRIPTION = 'Call LEAH service CardWS/getPartnerCard?pmid v1 by REST/JSON'
			,ENDPOINT_TYPE = 'QUEUE '
			,IS_REPLYING = 'T'
WHEN NOT MATCHED
	THEN
		INSERT (
			ID
			,ADDRESS_COMP
			,SERVICECODE
			,PROTOCOL
			,DESCRIPTION
			,ENDPOINT_TYPE
			,IS_REPLYING
			,DIRECTION
			)
		VALUES (
			FOUNDATION.EEQ_ADDRESS.NEXTVAL
			,'input.CIO_LEAHPartnerCardGet_Sync_v1.Get'
			,'CIO_LEAHPartnerCardGet_Sync_v1'
			,'XMLMSG/JMS'
			,'Call LEAH service CardWS/getPartnerCard?pmid v1 by REST/JSON'
			,'QUEUE'
			,'T'
			,'IN'
			);

MERGE INTO FOUNDATION.EET_ADDRESS
USING DUAL
	ON (
			SERVICECODE = 'CIO_LEAHPartnerCardGet_Sync_v1'
			AND PROTOCOL = 'SOAP/HTTP'
			AND DIRECTION = 'OUTBOUND_ESB'
			)
WHEN MATCHED
	THEN
		UPDATE
		SET ADDRESS_COMP = '${soapService}'
			,DESCRIPTION = 'Call to external REST Webservice'
			,ENDPOINT_TYPE = 'SOAP'
			,IS_REPLYING = 'T'
WHEN NOT MATCHED
	THEN
		INSERT (
			ID
			,ADDRESS_COMP
			,SERVICECODE
			,PROTOCOL
			,DESCRIPTION
			,ENDPOINT_TYPE
			,IS_REPLYING
			,DIRECTION
			)
		VALUES (
			FOUNDATION.EEQ_ADDRESS.NEXTVAL
			,'${soapService}'
			,'CIO_LEAHPartnerCardGet_Sync_v1'
			,'SOAP/HTTP'
			,'Call to external REST Webservice'
			,'SOAP'
			,'T'
			,'OUTBOUND_ESB'
			);