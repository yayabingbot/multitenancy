CREATE OR REPLACE PROCEDURE NEW_TENANT_ROLE(TENANT_NAME varchar)
RETURNS VARCHAR
LANGUAGE SQL
AS 
  BEGIN
      create role IDENTIFIER(:TENANT_NAME);
      grant usage on warehouse COMPUTE_WH to role IDENTIFIER(:TENANT_NAME);
      grant usage on database MULTITEN to role IDENTIFIER(:TENANT_NAME);
      grant usage on schema DW_V to role IDENTIFIER(:TENANT_NAME);
      grant select on all tables in schema DW_V to role IDENTIFIER(:TENANT_NAME);
      grant select on all views in schema DW_V to role IDENTIFIER(:TENANT_NAME);
      RETURN TENANT_NAME;
  END;
