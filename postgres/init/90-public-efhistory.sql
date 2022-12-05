--
-- PostgreSQL database dump
--

-- Dumped from database version 14.5 (Debian 14.5-2.pgdg110+2)
-- Dumped by pg_dump version 15.0 (Debian 15.0-1.pgdg110+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: __efmigrations_history_portal; Type: TABLE; Schema: public; Owner: portal
--

CREATE TABLE public.__efmigrations_history_portal (
    migration_id character varying(150) NOT NULL,
    product_version character varying(32) NOT NULL
);


ALTER TABLE public.__efmigrations_history_portal OWNER TO portal;

--
-- Data for Name: __efmigrations_history_portal; Type: TABLE DATA; Schema: public; Owner: portal
--

COPY public.__efmigrations_history_portal (migration_id, product_version) FROM stdin;
20220519154644_InitialCreate	6.0.4
20220520103317_AddConnectors	6.0.4
20220520121416_RenameEnumEntityKeyColumns	6.0.4
20220523140724_CPLP-712_service_accounts	6.0.4
20220603124915_CPLP-1047-CompanyUser-BusinessPartners	6.0.4
20220607073601_CPLP-748-AddAppSubscriptionStatus	6.0.4
20220622143338_CPLP-1103-AddDocumentStatusAndContent	6.0.4
20220725103649_CPLP-1134-AddNotification	6.0.4
20220728080922_CPLP-1241-AddLastChangedDateToApp	6.0.4
20220729104549_CPLP-1247-ExtendNotificationTypes	6.0.4
20220811060613_CPLP-1248-app-notification	6.0.4
20220812133428_CPLP-1254-db-audit	6.0.4
20220816061525_CPLP-1213-AddServices	6.0.4
20220817151929_CPLP-1255-AuditCompanyApplications	6.0.4
20220822092105_CPLP-1353-MultiTenantApp	6.0.4
20220825071607_CPLP-1378-AddAppAssignedDocuments	6.0.4
20220906074920_CPLP-1212-ChangeAppToOffer	6.0.4
20220909133703_CPLP-1330-NotificationAppReleaseRequest	6.0.4
20220914063503_CPLP-1378-AddNewDocumentTypes	6.0.4
20220914081150_CPLP-1406-AddAgreementAssignedApps	6.0.4
20220916132329_CPLP-1406-AddConsentAssignedOfferSubscription	6.0.4
20220920100432_CPLP-831-AddConsentAssignedOffer	6.0.4
20220921112615_CPLP-1409-ExpandNotificationTypes	6.0.4
20220929071516_CPLP-1408-ServiceProviderCompanyDetail	6.0.4
20221005093339_CPLP-1440-DbAuditing	6.0.4
20221007102646_CPLP-1625-ChangeDocumentTypeIdtoNonNullable	6.0.4
20221012090843_CPLP-1422-AddSelfDescriptionDocuments	6.0.4
20221013113920_CPLP-1313-AuditOffer	6.0.4
20221017073929_CPLP-1317-AuditUserRole	6.0.4
20221018180404_CPLP-1417-RemoveCompanyAssignedUserRoleId	6.0.4
20221019082627_CPLP-1616-RenameToAgreementAssignedDocument	6.0.4
20221020131336_CPLP-1492-ExtendNotificationTypes	6.0.4
20221025132133_CPLP-1524-UserRoleCollection.cs	6.0.4
20221104115911_CPLP-1732-ChangeDocumentTypeEnum	6.0.4
20221109103920_CPLP-1634-AddNotificationTopics	6.0.4
20221116093330_CPLP-1803-AddServiceTypes	6.0.4
20221118061606_CPLP-1318-AuditAppSubscription	6.0.4
20221123144540_CPLP-1601-AddAppRoleEnumToNotificationTypeId	6.0.4
20221123180559_CPLP-1797-AddDapsRegistration	6.0.4
20221129054345_CPLP-1518-AddAppReleaseApprovalToNotificationTypeId	6.0.4
20221201134921_CPLP-1518-AddNotificationMapping	6.0.4
20221205180503_CPLP-1605-AddServiceReleaseNotification	6.0.4
\.


--
-- PostgreSQL database dump complete
--

