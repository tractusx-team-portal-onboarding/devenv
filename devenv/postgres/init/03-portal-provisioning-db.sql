CREATE TABLE portal.iam_client(
          uuid UUID PRIMARY KEY,
          clientid VARCHAR(255) NOT NULL
);

CREATE TABLE portal.iam_client_company(
          companyid VARCHAR(255) NOT NULL,
          client_uuid UUID NOT NULL,
          PRIMARY KEY(companyid,client_uuid),
          CONSTRAINT fk_company
            FOREIGN KEY(companyid)
              REFERENCES portal.company(companyid),
          CONSTRAINT fk_client
            FOREIGN KEY(client_uuid)
              REFERENCES portal.iam_client(uuid)
);

CREATE TABLE portal.iam_client_sequence(
          id SERIAL PRIMARY KEY
);

CREATE TABLE portal.iam_identityprovider(
          uuid UUID PRIMARY KEY,
          alias VARCHAR(255) NOT NULL
);

CREATE TABLE portal.iam_identityprovider_company(
          companyid VARCHAR(255) NOT NULL,
          identityprovider_uuid UUID NOT NULL,
          PRIMARY KEY(companyid, identityprovider_uuid),
          CONSTRAINT fk_company
            FOREIGN KEY(companyid)
              REFERENCES portal.company(companyid),
          CONSTRAINT fk_identityprovider
            FOREIGN KEY(identityprovider_uuid)
              REFERENCES portal.iam_identityprovider(uuid)
);

CREATE TABLE portal.iam_identityprovider_sequence(
          id SERIAL PRIMARY KEY
);

CREATE TABLE portal.iam_user(
          uuid UUID PRIMARY KEY,
          identityprovider_uuid UUID NOT NULL,
          iam_userid UUID,
          provider_userid VARCHAR(255),
          provider_username VARCHAR(255) NOT NULL,
          company_user_uuid VARCHAR(255) NOT NULL,
          CONSTRAINT fk_company_user
            FOREIGN KEY(company_user_uuid)
              REFERENCES portal.company_user(uuid),
          CONSTRAINT fk_identityprovider
            FOREIGN KEY(identityprovider_uuid)
              REFERENCES portal.iam_identityprovider(uuid)
);

