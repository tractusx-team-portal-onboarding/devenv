GRANT ALL ON TABLE portal.app_licenses TO portal;
GRANT ALL ON TABLE portal.company_roles TO portal;
GRANT ALL ON TABLE portal.company_user_roles TO portal;
GRANT ALL ON TABLE portal.countries TO portal;
GRANT ALL ON TABLE portal.document_templates TO portal;
GRANT ALL ON TABLE portal.identity_provider_categories TO portal;
GRANT ALL ON TABLE portal.identity_providers TO portal;
GRANT ALL ON TABLE portal.iam_identity_providers TO portal;
GRANT ALL ON TABLE portal.languages TO portal;
GRANT ALL ON TABLE portal.use_cases TO portal;
GRANT ALL ON TABLE portal.addresses TO portal;
GRANT ALL ON TABLE portal.company_status TO portal;
GRANT ALL ON TABLE portal.companies TO portal;
GRANT ALL ON TABLE portal.company_identity_provider TO portal;
GRANT ALL ON TABLE portal.apps TO portal;
GRANT ALL ON TABLE portal.company_users TO portal;
GRANT ALL ON TABLE portal.iam_users TO portal;
GRANT ALL ON TABLE portal.documents TO portal;
GRANT ALL ON TABLE portal.agreements TO portal;
GRANT ALL ON TABLE portal.agreement_assigned_company_roles TO portal;
GRANT ALL ON TABLE portal.agreement_assigned_document_templates TO portal;
GRANT ALL ON TABLE portal.app_assigned_company_user_roles TO portal;
GRANT ALL ON TABLE portal.app_assigned_licenses TO portal;
GRANT ALL ON TABLE portal.app_assigned_use_cases TO portal;
GRANT ALL ON TABLE portal.app_descriptions TO portal;
GRANT ALL ON TABLE portal.company_application_status TO portal;
GRANT ALL ON TABLE portal.company_applications TO portal;
GRANT ALL ON TABLE portal.company_assigned_apps TO portal;
GRANT ALL ON TABLE portal.company_assigned_roles TO portal;
GRANT ALL ON TABLE portal.company_assigned_use_cases TO portal;
GRANT ALL ON TABLE portal.company_user_assigned_app_favourites TO portal;
GRANT ALL ON TABLE portal.company_user_assigned_roles TO portal;
GRANT ALL ON TABLE portal.consent_status TO portal;
GRANT ALL ON TABLE portal.consents TO portal;
GRANT ALL ON TABLE portal.invitation_status TO portal;
GRANT ALL ON TABLE portal.invitations TO portal;

GRANT ALL ON TABLE provisioning.client_sequence TO provisioning;
GRANT ALL ON TABLE provisioning.identity_provider_sequence TO provisioning;

GRANT ALL ON SEQUENCE provisioning.client_sequence_sequence_id_seq TO provisioning;
GRANT ALL ON SEQUENCE provisioning.identity_provider_sequence_sequence_id_seq TO provisioning;

