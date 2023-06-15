CREATE OR REPLACE PROCEDURE MULTITEN.DW_V.NEW_USER(USER_NAME varchar, TENANT_NAME varchar)
RETURNS VARCHAR(16777216)
LANGUAGE SQL
EXECUTE AS OWNER
AS '
  BEGIN
    CREATE USER IDENTIFIER(:USER_NAME)
    PASSWORD = ''apples'';
    grant role IDENTIFIER(:TENANT_NAME) to user IDENTIFIER(:USER_NAME);
    RETURN USER_NAME;
  END;
 
  ';
