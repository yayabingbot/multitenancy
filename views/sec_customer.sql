create or replace secure view MULTITEN.DW_V.SEC_CUSTOMERS(
	C_CUSTKEY,
	C_NAME,
	TENANT_ID
) as
select c.c_custkey, c.c_name, c.tenant_id
from    multiten.internal.customer  c
inner join multiten.internal.entitlements e on e.tentant_id = c.tenant_id
where e.user_name = current_user();