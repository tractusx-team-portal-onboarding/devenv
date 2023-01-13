CREATE SCHEMA portal;
ALTER SCHEMA portal OWNER TO portal;
CREATE SCHEMA provisioning;
ALTER SCHEMA provisioning OWNER TO provisioning;
CREATE TABLE public.__efmigrations_history_portal (
    migration_id character varying(150) NOT NULL,
    product_version character varying(32) NOT NULL
);
ALTER TABLE public.__efmigrations_history_portal OWNER TO portal;
CREATE TABLE public.__efmigrations_history_provisioning (
    migration_id character varying(150) NOT NULL,
    product_version character varying(32) NOT NULL
);
ALTER TABLE public.__efmigrations_history_provisioning OWNER TO provisioning;
