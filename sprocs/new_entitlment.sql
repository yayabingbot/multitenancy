CREATE OR REPLACE PROCEDURE new_entitlement(user_name varchar, tenant_id varchar)
RETURNS VARCHAR NOT NULL
LANGUAGE SQL
AS
BEGIN
  INSERT INTO entitlements VALUES (:tenant_id,:user_name );
  RETURN 'Rows inserted: ' || SQLROWCOUNT;
END;
