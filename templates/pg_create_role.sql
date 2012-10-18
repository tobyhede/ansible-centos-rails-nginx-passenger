DO
$body$
BEGIN
   IF NOT EXISTS (
      SELECT *
      FROM   pg_catalog.pg_user
      WHERE  usename = '{{username}}') THEN

      CREATE ROLE {{username}} WITH SUPERUSER CREATEDB LOGIN PASSWORD '{{password}}';
   END IF;
END
$body$

-- do 
-- $body$
-- declare 
--   num_users integer;
-- begin
--    SELECT count(*) 
--      into num_users
--    FROM pg_user
--    WHERE usename = '{{username}}';

--    IF num_users = 0 THEN
--       CREATE ROLE {{username}} LOGIN PASSWORD '{{password}}';
--    END IF;
-- end
-- $body$
-- ;