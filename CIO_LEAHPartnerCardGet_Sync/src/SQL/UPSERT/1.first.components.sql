MERGE INTO FOUNDATION.EET_COMPONENT
USING DUAL
ON (SERVICECODE='CIO_LEAHPartnerCardGet_Sync_v1')
WHEN MATCHED THEN
UPDATE SET
    COMP_NAME='CIO_LEAHPartnerCardGet_Sync',
    COMP_LABEL='Call LEAH service CardWS/getPartnerCard?pmid v1 by REST/JSON',
    COMP_TYPE='CIO',
    BUSINESS_DOMAIN='customer',
    COMP_VERSION='1.0.0-SNAPSHOT'
WHEN NOT MATCHED THEN
INSERT
(
    SERVICECODE,
    COMP_NAME,
    COMP_LABEL,
    COMP_TYPE,
    BUSINESS_DOMAIN,
    COMP_VERSION
) VALUES
(
    'CIO_LEAHPartnerCardGet_Sync_v1',
    'CIO_LEAHPartnerCardGet_Sync',
    'Call LEAH service CardWS/getPartnerCard?pmid v1 by REST/JSON',
    'CIO',
    'customer',
    '1.0.0-SNAPSHOT'
);
