CREATE USER kccentral WITH PASSWORD 'pwkccentral';
CREATE USER kcshared WITH PASSWORD 'pwkcshared';
CREATE USER portal WITH PASSWORD 'pwportal';
CREATE USER provisioning WITH PASSWORD 'pwprovisioning';
CREATE USER kccentralro WITH PASSWORD 'pwkccentralro';
CREATE USER hub WITH PASSWORD 'pwhub';
GRANT pg_read_all_data TO kccentralro;

