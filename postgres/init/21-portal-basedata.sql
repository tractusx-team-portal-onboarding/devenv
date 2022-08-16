--
-- PostgreSQL database dump
--

-- Dumped from database version 14.5 (Debian 14.5-1.pgdg110+1)
-- Dumped by pg_dump version 14.4 (Debian 14.4-1.pgdg110+1)

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

--
-- Data for Name: agreement_categories; Type: TABLE DATA; Schema: portal; Owner: portal
--

COPY portal.agreement_categories (id, label) FROM stdin;
1	CX_FRAME_CONTRACT
2	APP_CONTRACT
3	DATA_CONTRACT
\.


--
-- Data for Name: app_statuses; Type: TABLE DATA; Schema: portal; Owner: portal
--

COPY portal.app_statuses (id, label) FROM stdin;
1	CREATED
2	IN_REVIEW
3	ACTIVE
4	INACTIVE
\.


--
-- Data for Name: app_subscription_statuses; Type: TABLE DATA; Schema: portal; Owner: portal
--

COPY portal.app_subscription_statuses (id, label) FROM stdin;
1	PENDING
2	ACTIVE
3	INACTIVE
\.


--
-- Data for Name: audit_company_assigned_apps_cplp_1254_db_audit; Type: TABLE DATA; Schema: portal; Owner: portal
--

COPY portal.audit_company_assigned_apps_cplp_1254_db_audit (id, audit_id, date_last_changed, audit_operation_id, company_id, app_id, app_subscription_status_id, requester_id, last_editor_id) FROM stdin;
b2c3c99f-7220-4222-b8ed-17bd5faeb82a	56d878d9-9574-4673-b32a-ebf5753042f5	2022-08-16 00:00:00+00	1	ac861325-bc54-4583-bcdc-9e9f2a38ff84	ac1cf001-7fbc-1f2f-817f-bce0572c0007	2	ac1cf001-7fbc-1f2f-817f-bce058020001	\N
aa0d527a-b840-4a4f-a190-3758bd360740	b1964680-474d-45dd-b1c4-91f39f9a4c48	2022-08-16 00:00:00+00	1	ac861325-bc54-4583-bcdc-9e9f2a38ff84	ac1cf001-7fbc-1f2f-817f-bce05748000d	2	ac1cf001-7fbc-1f2f-817f-bce058020001	\N
fd45e105-f886-4386-aad5-0b9e48c94ad7	56faf2e0-88ec-4ee5-a736-6c52688250f8	2022-08-16 00:00:00+00	1	ac861325-bc54-4583-bcdc-9e9f2a38ff84	ac1cf001-7fbc-1f2f-817f-bce0573f0009	2	ac1cf001-7fbc-1f2f-817f-bce058020001	\N
836d8d31-9477-4b09-9aa7-2817edfd360b	0b2ca541-206d-48ad-bc02-fb61fbcb5552	2022-08-16 00:00:00+00	1	ac861325-bc54-4583-bcdc-9e9f2a38ff84	ac1cf001-7fbc-1f2f-817f-bce05744000b	2	ac1cf001-7fbc-1f2f-817f-bce058020001	\N
f06353ee-b98a-4176-a2ae-fa5941e7c5b1	1ab2e5e1-df8f-496b-aa12-c11067805992	2022-08-16 00:00:00+00	1	ac861325-bc54-4583-bcdc-9e9f2a38ff84	ac1cf001-7fbc-1f2f-817f-bce0574c000f	2	ac1cf001-7fbc-1f2f-817f-bce058020001	\N
a6b17a5c-7e76-4232-8229-5c3c65d6553e	02d5575d-b110-43f0-b0dd-53dbc37147dc	2022-08-16 00:00:00+00	1	ac861325-bc54-4583-bcdc-9e9f2a38ff84	f9cad59d-84b3-4880-a550-4072c26a6b93	2	ac1cf001-7fbc-1f2f-817f-bce058020001	\N
7ec5d606-42ef-4950-8f41-c7941487e3ad	4e861f6a-86ad-4188-8ba7-0f214248b120	2022-08-16 00:00:00+00	1	ac861325-bc54-4583-bcdc-9e9f2a38ff84	f9cad59d-84b3-4880-a550-4072c26a6b94	2	ac1cf001-7fbc-1f2f-817f-bce058020001	\N
a629c9dd-e00f-4370-b15b-81028ba39390	34a93025-18de-4c7a-8677-0fd9801248d1	2022-08-16 00:00:00+00	1	ac861325-bc54-4583-bcdc-9e9f2a38ff84	8488044e-b8df-403a-9cbd-16dad7e4a08c	2	ac1cf001-7fbc-1f2f-817f-bce058020001	\N
e763f686-0138-4d02-a868-23acfa5fc002	52c8a212-83a9-4de1-b3de-eb684e75e1f7	2022-08-16 00:00:00+00	1	ac861325-bc54-4583-bcdc-9e9f2a38ff84	5cf74ef8-e0b7-4984-a872-474828beb5d8	2	ac1cf001-7fbc-1f2f-817f-bce058020001	\N
574b2d5e-6de8-44f0-b32d-5fb874e6bf6c	028265dd-82a8-4924-ab9a-a7b47dc2adfd	2022-08-16 00:00:00+00	1	ac861325-bc54-4583-bcdc-9e9f2a38ff84	5cf74ef8-e0b7-4984-a872-474828beb5d1	2	ac1cf001-7fbc-1f2f-817f-bce058020001	\N
f59de7c0-bf4f-45bd-9b34-31a10bedad5c	93eecd4e-ca47-4dd2-85bf-775ea72eb312	2022-08-16 00:00:00+00	1	ac861325-bc54-4583-bcdc-9e9f2a38ff84	5cf74ef8-e0b7-4984-a872-474828beb5d2	2	ac1cf001-7fbc-1f2f-817f-bce058020001	\N
f69f3fa8-0099-4da7-9b41-fd01aacdf0f4	846ec83b-4b84-4c29-b7ce-3e57d7405844	2022-08-16 00:00:00+00	1	ac861325-bc54-4583-bcdc-9e9f2a38ff84	5cf74ef8-e0b7-4984-a872-474828beb5d3	2	ac1cf001-7fbc-1f2f-817f-bce058020001	\N
99abe9e0-ea6c-4ded-b365-ee96d4a51462	ed4de48d-fd4b-4384-a72f-ecae3c6cc5ba	2022-08-16 00:00:00+00	1	2dc4249f-b5ca-4d42-bef1-7a7a950a4f87	ac1cf001-7fbc-1f2f-817f-bce0572c0007	2	ac1cf001-7fbc-1f2f-817f-bce058020001	\N
63550f3a-1657-445e-925c-d073d2be5b36	85064593-0aaa-48c4-95a2-2700223aca5e	2022-08-16 00:00:00+00	1	2dc4249f-b5ca-4d42-bef1-7a7a950a4f87	ac1cf001-7fbc-1f2f-817f-bce05748000d	2	ac1cf001-7fbc-1f2f-817f-bce058020001	\N
0fae4591-6b5f-4e99-a122-89c97b03526a	60f00bd0-98fe-4ed3-ad3b-90045921660c	2022-08-16 00:00:00+00	1	2dc4249f-b5ca-4d42-bef1-7a7a950a4f87	ac1cf001-7fbc-1f2f-817f-bce0573f0009	2	ac1cf001-7fbc-1f2f-817f-bce058020001	\N
e878b16e-c10a-4025-8d29-125c31b5fb03	d65e367c-0968-4be9-bd2a-6c3d6339d65c	2022-08-16 00:00:00+00	1	2dc4249f-b5ca-4d42-bef1-7a7a950a4f87	ac1cf001-7fbc-1f2f-817f-bce05744000b	2	ac1cf001-7fbc-1f2f-817f-bce058020001	\N
4779fd8c-40b7-4319-b111-c8e01a5969a7	1d28a224-6293-4148-8b60-6714a0f1465d	2022-08-16 00:00:00+00	1	2dc4249f-b5ca-4d42-bef1-7a7a950a4f87	ac1cf001-7fbc-1f2f-817f-bce0574c000f	2	ac1cf001-7fbc-1f2f-817f-bce058020001	\N
1becbdd9-9baa-476c-838f-a3b3e09354ad	6da4b991-b594-4b80-933a-26383d6d465f	2022-08-16 00:00:00+00	1	2dc4249f-b5ca-4d42-bef1-7a7a950a4f87	f9cad59d-84b3-4880-a550-4072c26a6b93	2	ac1cf001-7fbc-1f2f-817f-bce058020001	\N
48bea735-6e32-4eed-ae8f-4f650dd17285	773e7152-8d94-4f90-8689-956a7bdf4f4e	2022-08-16 00:00:00+00	1	2dc4249f-b5ca-4d42-bef1-7a7a950a4f87	f9cad59d-84b3-4880-a550-4072c26a6b94	2	ac1cf001-7fbc-1f2f-817f-bce058020001	\N
5e7f3532-b8ad-4cfe-9e6e-511266bfb7c8	4ba33360-72e6-4a56-a253-59761d694d2c	2022-08-16 00:00:00+00	1	2dc4249f-b5ca-4d42-bef1-7a7a950a4f87	8488044e-b8df-403a-9cbd-16dad7e4a08c	2	ac1cf001-7fbc-1f2f-817f-bce058020001	\N
8641732e-85e3-4994-8522-23e5231a68fb	769a8864-64fb-4533-9c85-2a0b0ddc8c88	2022-08-16 00:00:00+00	1	2dc4249f-b5ca-4d42-bef1-7a7a950a4f87	5cf74ef8-e0b7-4984-a872-474828beb5d8	2	ac1cf001-7fbc-1f2f-817f-bce058020001	\N
c54adac6-d909-42af-a5bd-7462597cd479	4d44eb62-7ac8-4a4a-a0d0-fc3daca5edd5	2022-08-16 00:00:00+00	1	2dc4249f-b5ca-4d42-bef1-7a7a950a4f87	5cf74ef8-e0b7-4984-a872-474828beb5d1	2	ac1cf001-7fbc-1f2f-817f-bce058020001	\N
556e17ce-6a3b-4a27-b3fd-a3494ab01414	11fd3bb9-6922-4b36-bc28-d30aded20231	2022-08-16 00:00:00+00	1	2dc4249f-b5ca-4d42-bef1-7a7a950a4f87	5cf74ef8-e0b7-4984-a872-474828beb5d2	2	ac1cf001-7fbc-1f2f-817f-bce058020001	\N
2aca9d4a-2032-4bb9-acfe-d30881bd591a	1ab6c7c9-ff68-47da-aad4-b88d83b757cd	2022-08-16 00:00:00+00	1	2dc4249f-b5ca-4d42-bef1-7a7a950a4f87	5cf74ef8-e0b7-4984-a872-474828beb5d3	2	ac1cf001-7fbc-1f2f-817f-bce058020001	\N
\.


--
-- Data for Name: company_user_statuses; Type: TABLE DATA; Schema: portal; Owner: portal
--

COPY portal.company_user_statuses (id, label) FROM stdin;
1	ACTIVE
2	INACTIVE
3	DELETED
\.


--
-- Data for Name: audit_company_users_cplp_1254_db_audit; Type: TABLE DATA; Schema: portal; Owner: portal
--

COPY portal.audit_company_users_cplp_1254_db_audit (id, audit_id, audit_operation_id, date_last_changed, date_created, email, firstname, lastlogin, lastname, company_id, company_user_status_id, last_editor_id) FROM stdin;
17f84917-244b-4425-a198-dc5cb4340890	ac1cf001-7fbc-1f2f-817f-bce0575a0011	1	2022-08-16 00:00:00+00	2022-03-24 18:01:33.394+00	\N	\N	\N	\N	0dcd8209-85e2-4073-b130-ac094fb47106	1	\N
3b2435aa-d27e-4818-a401-1e3913a80a8c	ac1cf001-7fbc-1f2f-817f-bce0577e0015	1	2022-08-16 00:00:00+00	2022-03-24 18:01:33.438+00	\N	\N	\N	\N	41fd2ab8-71cd-4546-9bef-a388d91b2542	1	\N
e4d05831-8a8d-45d0-94b8-fea94cda74c9	ac1cf001-7fbc-1f2f-817f-bce058019990	1	2022-08-16 00:00:00+00	2022-03-24 18:01:33.57+00	julia.jeroch@bmw.de	Test User	\N	cx-user-2	2dc4249f-b5ca-4d42-bef1-7a7a950a4f87	1	\N
7c2b8f35-19c6-4e93-baa5-eee1f52a866d	ac1cf001-7fbc-1f2f-817f-bce058019991	1	2022-08-16 00:00:00+00	2022-03-24 18:01:33.57+00	julia.jeroch@bmw.de	Test User	\N	cx-admin-2	2dc4249f-b5ca-4d42-bef1-7a7a950a4f87	1	\N
5d34f388-6aa8-4a29-877b-0f977c20b5d6	ac1cf001-7fbc-1f2f-817f-bce058019992	1	2022-08-16 00:00:00+00	2022-03-24 18:01:33.57+00	julia.jeroch@bmw.de	Test User	\N	company-admin-2	2dc4249f-b5ca-4d42-bef1-7a7a950a4f87	1	\N
6a437b6c-00b4-4739-b3b0-a4ec452e1d40	ac1cf001-7fbc-1f2f-817f-bce058019993	1	2022-08-16 00:00:00+00	2022-03-24 18:01:33.57+00	julia.jeroch@bmw.de	Test User	\N	it-admin-2	2dc4249f-b5ca-4d42-bef1-7a7a950a4f87	1	\N
0f6433e2-e008-41f7-a6f5-e54058da21be	ac1cf001-7fbc-1f2f-817f-bce058020000	1	2022-08-16 00:00:00+00	2022-03-24 18:01:33.57+00	julia.jeroch@bmw.de	Test User	\N	CX User	2dc4249f-b5ca-4d42-bef1-7a7a950a4f87	1	\N
e50d0996-a686-444e-806a-056da3e0dbb1	ac1cf001-7fbc-1f2f-817f-bce058020001	1	2022-08-16 00:00:00+00	2022-03-24 18:01:33.57+00	julia.jeroch@bmw.de	Test User	\N	CX Admin	2dc4249f-b5ca-4d42-bef1-7a7a950a4f87	1	\N
52388d86-ad64-4e9d-9c4e-768f24f19554	ac1cf001-7fbc-1f2f-817f-bce058020002	1	2022-08-16 00:00:00+00	2022-03-24 18:01:33.57+00	julia.jeroch@bmw.de	Test User	\N	Company Admin 1	220330ac-170d-4e22-8d72-9467ed042149	1	\N
60ce835b-20bb-4fa8-876d-4178e8b92b92	ac1cf001-7fbc-1f2f-817f-bce058020003	1	2022-08-16 00:00:00+00	2022-03-24 18:01:33.57+00	julia.jeroch@bmw.de	Test User	\N	Company Admin 2	bdac6865-2a8d-4bfd-9373-9dfce8190895	1	\N
830dcdd9-f3ac-49f3-be5d-857c233c94f0	ac1cf001-7fbc-1f2f-817f-bce058020004	1	2022-08-16 00:00:00+00	2022-03-24 18:01:33.57+00	julia.jeroch@bmw.de	Test User	\N	Company Admin 3	41fd2ab8-71cd-4546-9bef-a388d91b2542	1	\N
\.


--
-- Data for Name: audit_operation; Type: TABLE DATA; Schema: portal; Owner: portal
--

COPY portal.audit_operation (id, label) FROM stdin;
1	INSERT
2	UPDATE
3	DELETE
\.


--
-- Data for Name: audit_services_cplp_1213_add_services; Type: TABLE DATA; Schema: portal; Owner: portal
--

COPY portal.audit_services_cplp_1213_add_services (id, audit_id, date_last_changed, audit_operation_id, date_created, name, thumbnail_url, provider_company_id, service_status_id, contact_email, sales_manager_id, last_editor_id) FROM stdin;
\.


--
-- Data for Name: company_application_statuses; Type: TABLE DATA; Schema: portal; Owner: portal
--

COPY portal.company_application_statuses (id, label) FROM stdin;
1	CREATED
2	ADD_COMPANY_DATA
3	INVITE_USER
4	SELECT_COMPANY_ROLE
5	UPLOAD_DOCUMENTS
6	VERIFY
7	SUBMITTED
8	CONFIRMED
9	DECLINED
\.


--
-- Data for Name: company_roles; Type: TABLE DATA; Schema: portal; Owner: portal
--

COPY portal.company_roles (id, label) FROM stdin;
1	ACTIVE_PARTICIPANT
2	APP_PROVIDER
3	SERVICE_PROVIDER
\.


--
-- Data for Name: languages; Type: TABLE DATA; Schema: portal; Owner: portal
--

COPY portal.languages (short_name, long_name_de, long_name_en) FROM stdin;
de	deutsch	german
en	englisch	english
pt	portugisisch	portuguese
es	spanisch	spanish
fr	franzoesisch	french
ru	russisch	russian
jp	japanisch	japanese
cn	chinesisch	chinese
\.


--
-- Data for Name: company_role_descriptions; Type: TABLE DATA; Schema: portal; Owner: portal
--

COPY portal.company_role_descriptions (company_role_id, language_short_name, description) FROM stdin;
1	de	Der Netzwerkteilnehmer deckt die Rollen Datenanbieter-, Datenkonsumenten- und App-Benutzer ab. Als Teilnehmer sind Sie ein aktives Mitglied des Netzwerks mit allen Diensten, um als Mitwirkender und Benutzer teilzunehmen.
1	en	The participant role is covering the data provider, data consumer or app user scenario. As participant you are an active member of the network with enabled services to particiapte as contributer and user.
2	de	Als App-Anbieter können Anwednungen über den CX-Marktplatz angeboten werden. Als App-Anbieter können außerdem am Developer Hub teilnehmen, Anwendungen im Netzwerk anbieten und diese verwalten.
2	en	The App Provider is a company which is providing application software via the CX marketplace. As app provider you can participate and use the developer hub, release and offer applications to the network and manage your applications.
3	de	Als Service Anbieter können 3rd Party angebote - wie z.b. Dataspace Services, EDCs und ähnliches im Netzwerk angeboten werden.
3	en	The Service Provider is able to offer 3rd party services, such as dataspace service offerings to CX Members. CX members can subscribe for those services.
\.


--
-- Data for Name: company_service_account_statuses; Type: TABLE DATA; Schema: portal; Owner: portal
--

COPY portal.company_service_account_statuses (id, label) FROM stdin;
1	ACTIVE
2	INACTIVE
\.


--
-- Data for Name: company_statuses; Type: TABLE DATA; Schema: portal; Owner: portal
--

COPY portal.company_statuses (id, label) FROM stdin;
1	PENDING
2	ACTIVE
3	REJECTED
4	INACTIVE
5	DELETED
\.


--
-- Data for Name: connector_statuses; Type: TABLE DATA; Schema: portal; Owner: portal
--

COPY portal.connector_statuses (id, label) FROM stdin;
1	PENDING
2	ACTIVE
\.


--
-- Data for Name: connector_types; Type: TABLE DATA; Schema: portal; Owner: portal
--

COPY portal.connector_types (id, label) FROM stdin;
1	COMPANY_CONNECTOR
2	CONNECTOR_AS_A_SERVICE
\.


--
-- Data for Name: consent_statuses; Type: TABLE DATA; Schema: portal; Owner: portal
--

COPY portal.consent_statuses (id, label) FROM stdin;
1	ACTIVE
2	INACTIVE
\.


--
-- Data for Name: countries; Type: TABLE DATA; Schema: portal; Owner: portal
--

COPY portal.countries (alpha2code, alpha3code, country_name_de, country_name_en) FROM stdin;
AD	AND	Andorra	Andorra
AE	ARE	United Arab Emirates (the)	United Arab Emirates (the)
AF	AFG	Afghanistan	Afghanistan
AG	ATG	Antigua and Barbuda	Antigua and Barbuda
AI	AIA	Anguilla	Anguilla
AL	ALB	Albania	Albania
AM	ARM	Armenia	Armenia
AO	AGO	Angola	Angola
AQ	ATA	Antarctica	Antarctica
AR	ARG	Argentina	Argentina
AS	ASM	American Samoa	American Samoa
AT	AUT	Austria	Austria
AU	AUS	Australia	Australia
AW	ABW	Aruba	Aruba
AX	ALA	Åland Islands	Åland Islands
AZ	AZE	Azerbaijan	Azerbaijan
BA	BIH	Bosnien and Herzegovenien	Bosnia and Herzegovina
BB	BRB	Barbados	Barbados
BD	BGD	Bangladesh	Bangladesh
BE	BEL	Belgium	Belgium
BF	BFA	Burkina Faso	Burkina Faso
BG	BGR	Bulgarien	Bulgaria
BH	BHR	Bahrain	Bahrain
BI	BDI	Burundi	Burundi
BJ	BEN	Benin	Benin
BL	BLM	Saint Barthélemy	Saint Barthélemy
BM	BMU	Bermuda	Bermuda
BN	BRN	Brunei Darussalam	Brunei Darussalam
BO	BOL	Bolivien	Bolivia (Plurinational State of)
BQ	BES	Bonaire, Sint Eustatius and Saba	Bonaire, Sint Eustatius and Saba
BR	BRA	Brasilien	Brazil
BS	BHS	Bahamas	Bahamas (the)
BT	BTN	Bhutan	Bhutan
BV	BVT	Bouvet Island	Bouvet Island
BW	BWA	Botswana	Botswana
BY	BLR	Belarus	Belarus
BZ	BLZ	Belize	Belize
CA	CAN	Kanada	Canada
CC	CCK	Cocos (Keeling) Islands (the)	Cocos (Keeling) Islands (the)
CD	COD	Kongo	Congo (the Democratic Republic of the)
CF	CAF	Central African Republic (the)	Central African Republic (the)
CH	CHE	Switzerland	Switzerland
CI	CIV	Côte d'Ivoire	Côte d'Ivoire
CK	COK	Cook Islands	Cook Islands (the)
CL	CHL	Chile	Chile
CM	CMR	Cameroon	Cameroon
CN	CHN	China	China
CO	COL	Kolumbien	Colombia
CR	CRI	Costa Rica	Costa Rica
CU	CUB	Kuba	Cuba
CV	CPV	Cabo Verde	Cabo Verde
CW	CUW	Curaçao	Curaçao
CX	CXR	Weihnachtsinseln	Christmas Island
CY	CYP	Zypern	Cyprus
CZ	CZE	Tschechien	Czechia
DE	DEU	Deutschland	Germany
DJ	DJI	Djibouti	Djibouti
DK	DNK	Dänemark	Denmark
DM	DMA	Dominica	Dominica
DO	DOM	Dominikanische Republik	Dominican Republic (the)
DZ	DZA	Algeria	Algeria
EC	ECU	Ecuador	Ecuador
EE	EST	Estonia	Estonia
EG	EGY	Ägypten	Egypt
EH	ESH	Western Sahara*	Western Sahara*
ER	ERI	Eritrea	Eritrea
ES	ESP	Spain	Spain
ET	ETH	Ethiopia	Ethiopia
FI	FIN	Finland	Finland
FJ	FJI	Fiji	Fiji
FK	FLK	Falkland Islands (the) [Malvinas]	Falkland Islands (the) [Malvinas]
FM	FSM	Micronesia (Federated States of)	Micronesia (Federated States of)
FO	FRO	Faroe Islands (the)	Faroe Islands (the)
FR	FRA	Frankreich	France
GA	GAB	Gabon	Gabon
GB	GBR	United Kingdom of Great Britain and Northern Ireland (the)	United Kingdom of Great Britain and Northern Ireland (the)
GD	GRD	Grenada	Grenada
GE	GEO	Georgia	Georgia
GF	GUF	French Guiana	French Guiana
GG	GGY	Guernsey	Guernsey
GH	GHA	Ghana	Ghana
GI	GIB	Gibraltar	Gibraltar
GL	GRL	Greenland	Greenland
GM	GMB	Gambia (the)	Gambia (the)
GN	GIN	Guinea	Guinea
GP	GLP	Guadeloupe	Guadeloupe
GQ	GNQ	Equatorial Guinea	Equatorial Guinea
GR	GRC	Greece	Greece
GS	SGS	South Georgia and the South Sandwich Islands	South Georgia and the South Sandwich Islands
GT	GTM	Guatemala	Guatemala
GU	GUM	Guam	Guam
GW	GNB	Guinea-Bissau	Guinea-Bissau
GY	GUY	Guyana	Guyana
HK	HKG	Hong Kong	Hong Kong
HM	HMD	Heard Island and McDonald Islands	Heard Island and McDonald Islands
HN	HND	Honduras	Honduras
HR	HRV	Kroatien	Croatia
HT	HTI	Haiti	Haiti
HU	HUN	Hungary	Hungary
ID	IDN	Indonesia	Indonesia
IE	IRL	Ireland	Ireland
IL	ISR	Israel	Israel
IM	IMN	Isle of Man	Isle of Man
IN	IND	India	India
IO	IOT	British Indian Ocean Territory	British Indian Ocean Territory (the)
IQ	IRQ	Iraq	Iraq
IR	IRN	Iran (Islamic Republic of)	Iran (Islamic Republic of)
IS	ISL	Iceland	Iceland
IT	ITA	Italy	Italy
JE	JEY	Jersey	Jersey
JM	JAM	Jamaica	Jamaica
JO	JOR	Jordan	Jordan
JP	JPN	Japan	Japan
KE	KEN	Kenya	Kenya
KG	KGZ	Kyrgyzstan	Kyrgyzstan
KH	KHM	Cambodia	Cambodia
KI	KIR	Kiribati	Kiribati
KM	COM	Comoros	Comoros (the)
KN	KNA	Saint Kitts and Nevis	Saint Kitts and Nevis
KP	PRK	Korea (the Democratic People's Republic of)	Korea (the Democratic People's Republic of)
KR	KOR	Korea (the Republic of)	Korea (the Republic of)
KW	KWT	Kuwait	Kuwait
KY	CYM	Cayman Islands (the)	Cayman Islands (the)
KZ	KAZ	Kazakhstan	Kazakhstan
LA	LAO	Lao People's Democratic Republic (the)	Lao People's Democratic Republic (the)
LB	LBN	Lebanon	Lebanon
LC	LCA	Saint Lucia	Saint Lucia
LI	LIE	Liechtenstein	Liechtenstein
LK	LKA	Sri Lanka	Sri Lanka
LR	LBR	Liberia	Liberia
LS	LSO	Lesotho	Lesotho
LT	LTU	Lithuania	Lithuania
LU	LUX	Luxembourg	Luxembourg
LV	LVA	Latvia	Latvia
LY	LBY	Libya	Libya
MA	MAR	Morocco	Morocco
MC	MCO	Monaco	Monaco
MD	MDA	Moldova (the Republic of)	Moldova (the Republic of)
ME	MNE	Montenegro	Montenegro
MF	MAF	Saint Martin (French part)	Saint Martin (French part)
MG	MDG	Madagascar	Madagascar
MH	MHL	Marshall Islands (the)	Marshall Islands (the)
MK	MKD	North Macedonia	North Macedonia
ML	MLI	Mali	Mali
MM	MMR	Myanmar	Myanmar
MN	MNG	Mongolia	Mongolia
MO	MAC	Macao	Macao
MP	MNP	Northern Mariana Islands (the)	Northern Mariana Islands (the)
MQ	MTQ	Martinique	Martinique
MR	MRT	Mauritania	Mauritania
MS	MSR	Montserrat	Montserrat
MT	MLT	Malta	Malta
MU	MUS	Mauritius	Mauritius
MV	MDV	Maldives	Maldives
MW	MWI	Malawi	Malawi
MX	MEX	Mexico	Mexico
MY	MYS	Malaysia	Malaysia
MZ	MOZ	Mozambique	Mozambique
NA	NAM	Namibia	Namibia
NC	NCL	New Caledonia	New Caledonia
NE	NER	Niger (the)	Niger (the)
NF	NFK	Norfolk Island	Norfolk Island
NG	NGA	Nigeria	Nigeria
NI	NIC	Nicaragua	Nicaragua
NL	NLD	Netherlands (the)	Netherlands (the)
NO	NOR	Norway	Norway
NP	NPL	Nepal	Nepal
NR	NRU	Nauru	Nauru
NU	NIU	Niue	Niue
NZ	NZL	New Zealand	New Zealand
OM	OMN	Oman	Oman
PA	PAN	Panama	Panama
PE	PER	Peru	Peru
PF	PYF	French Polynesia	French Polynesia
PG	PNG	Papua New Guinea	Papua New Guinea
PH	PHL	Philippines (the)	Philippines (the)
PK	PAK	Pakistan	Pakistan
PL	POL	Poland	Poland
PM	SPM	Saint Pierre and Miquelon	Saint Pierre and Miquelon
PN	PCN	Pitcairn	Pitcairn
PR	PRI	Puerto Rico	Puerto Rico
PS	PSE	Palestine, State of	Palestine, State of
PT	PRT	Portugal	Portugal
PW	PLW	Palau	Palau
PY	PRY	Paraguay	Paraguay
QA	QAT	Qatar	Qatar
RE	REU	Réunion	Réunion
RO	ROU	Romania	Romania
RS	SRB	Serbia	Serbia
RU	RUS	Russian Federation (the)	Russian Federation (the)
RW	RWA	Rwanda	Rwanda
SA	SAU	Saudi Arabia	Saudi Arabia
SB	SLB	Solomon Islands	Solomon Islands
SC	SYC	Seychelles	Seychelles
SD	SDN	Sudan (the)	Sudan (the)
SE	SWE	Sweden	Sweden
SG	SGP	Singapore	Singapore
SH	SHN	Saint Helena, Ascension and Tristan da Cunha	Saint Helena, Ascension and Tristan da Cunha
SI	SVN	Slovenia	Slovenia
SJ	SJM	Svalbard and Jan Mayen	Svalbard and Jan Mayen
SK	SVK	Slovakia	Slovakia
SL	SLE	Sierra Leone	Sierra Leone
SM	SMR	San Marino	San Marino
SN	SEN	Senegal	Senegal
SO	SOM	Somalia	Somalia
SR	SUR	Suriname	Suriname
SS	SSD	South Sudan	South Sudan
ST	STP	Sao Tome and Principe	Sao Tome and Principe
SV	SLV	El Salvador	El Salvador
SX	SXM	Sint Maarten (Dutch part)	Sint Maarten (Dutch part)
SY	SYR	Syrian Arab Republic (the)	Syrian Arab Republic (the)
SZ	SWZ	Eswatini	Eswatini
TC	TCA	Turks and Caicos Islands (the)	Turks and Caicos Islands (the)
TD	TCD	Chad	Chad
TF	ATF	French Southern Territories (the)	French Southern Territories (the)
TG	TGO	Togo	Togo
TH	THA	Thailand	Thailand
TJ	TJK	Tajikistan	Tajikistan
TK	TKL	Tokelau	Tokelau
TL	TLS	Timor-Leste	Timor-Leste
TM	TKM	Turkmenistan	Turkmenistan
TN	TUN	Tunisia	Tunisia
TO	TON	Tonga	Tonga
TR	TUR	Turkey	Turkey
TT	TTO	Trinidad and Tobago	Trinidad and Tobago
TV	TUV	Tuvalu	Tuvalu
TW	TWN	Taiwan (Province of China)	Taiwan (Province of China)
TZ	TZA	Tanzania, the United Republic of	Tanzania, the United Republic of
UA	UKR	Ukraine	Ukraine
UG	UGA	Uganda	Uganda
UM	UMI	United States Minor Outlying Islands (the)	United States Minor Outlying Islands (the)
US	USA	United States of America (the)	United States of America (the)
UY	URY	Uruguay	Uruguay
UZ	UZB	Uzbekistan	Uzbekistan
VA	VAT	Holy See (the)	Holy See (the)
VC	VCT	Saint Vincent and the Grenadines	Saint Vincent and the Grenadines
VE	VEN	Venezuela (Bolivarian Republic of)	Venezuela (Bolivarian Republic of)
VG	VGB	Virgin Islands (British)	Virgin Islands (British)
VI	VIR	Virgin Islands (U.S.)	Virgin Islands (U.S.)
VN	VNM	Viet Nam	Viet Nam
VU	VUT	Vanuatu	Vanuatu
WF	WLF	Wallis and Futuna	Wallis and Futuna
WS	WSM	Samoa	Samoa
YE	YEM	Yemen	Yemen
YT	MYT	Mayotte	Mayotte
ZA	ZAF	South Africa	South Africa
ZM	ZMB	Zambia	Zambia
\.


--
-- Data for Name: document_status; Type: TABLE DATA; Schema: portal; Owner: portal
--

COPY portal.document_status (id, label) FROM stdin;
1	PENDING
2	LOCKED
3	INACTIVE
\.


--
-- Data for Name: document_types; Type: TABLE DATA; Schema: portal; Owner: portal
--

COPY portal.document_types (id, label) FROM stdin;
1	CX_FRAME_CONTRACT
2	COMMERCIAL_REGISTER_EXTRACT
3	APP_CONTRACT
4	DATA_CONTRACT
\.


--
-- Data for Name: identity_provider_categories; Type: TABLE DATA; Schema: portal; Owner: portal
--

COPY portal.identity_provider_categories (id, label) FROM stdin;
1	KEYCLOAK_SHARED
2	KEYCLOAK_OIDC
3	KEYCLOAK_SAML
\.


--
-- Data for Name: invitation_statuses; Type: TABLE DATA; Schema: portal; Owner: portal
--

COPY portal.invitation_statuses (id, label) FROM stdin;
1	CREATED
2	PENDING
3	ACCEPTED
4	DECLINED
\.


--
-- Data for Name: notification_type; Type: TABLE DATA; Schema: portal; Owner: portal
--

COPY portal.notification_type (id, label) FROM stdin;
1	INFO
2	ACTION
3	WELCOME
4	WELCOME_USE_CASES
5	WELCOME_SERVICE_PROVIDER
6	WELCOME_CONNECTOR_REGISTRATION
7	WELCOME_APP_MARKETPLACE
8	APP_SUBSCRIPTION_REQUEST
9	APP_SUBSCRIPTION_ACTIVATION
10	CONNECTOR_REGISTERED
\.


--
-- Data for Name: service_licenses; Type: TABLE DATA; Schema: portal; Owner: portal
--

COPY portal.service_licenses (id, license_text) FROM stdin;
\.


--
-- Data for Name: service_statuses; Type: TABLE DATA; Schema: portal; Owner: portal
--

COPY portal.service_statuses (id, label) FROM stdin;
1	CREATED
2	IN_REVIEW
3	ACTIVE
4	INACTIVE
\.


--
-- Data for Name: services; Type: TABLE DATA; Schema: portal; Owner: portal
--

COPY portal.services (id, date_created, name, thumbnail_url, provider_company_id, service_status_id, contact_email, sales_manager_id, last_editor_id) FROM stdin;
\.


--
-- Data for Name: service_assigned_licenses; Type: TABLE DATA; Schema: portal; Owner: portal
--

COPY portal.service_assigned_licenses (service_id, service_license_id) FROM stdin;
\.


--
-- Data for Name: service_descriptions; Type: TABLE DATA; Schema: portal; Owner: portal
--

COPY portal.service_descriptions (id, description, service_id, language_short_name) FROM stdin;
\.


--
-- Data for Name: service_subscription_statuses; Type: TABLE DATA; Schema: portal; Owner: portal
--

COPY portal.service_subscription_statuses (id, label) FROM stdin;
1	PENDING
2	ACTIVE
3	INACTIVE
\.


--
-- Data for Name: use_cases; Type: TABLE DATA; Schema: portal; Owner: portal
--

COPY portal.use_cases (id, name, shortname) FROM stdin;
06b243a4-ba51-4bf3-bc40-5d79a2231b86	Traceability	T
06b243a4-ba51-4bf3-bc40-5d79a2231b87	Sustainability & CO2-Footprint	CO2
06b243a4-ba51-4bf3-bc40-5d79a2231b88	Manufacturing as a Service	MaaS
06b243a4-ba51-4bf3-bc40-5d79a2231b89	Real-Time Control	RTC
06b243a4-ba51-4bf3-bc40-5d79a2231b90	Modular Production	MP
1aacde78-35ec-4df3-ba1e-f988cddcbbd8	Circular Economy	CE
1aacde78-35ec-4df3-ba1e-f988cddcbbd9	None	None
41e4a4c0-aae4-41c0-97c9-ebafde410de4	Demand and Capacity Management	DCM
6909ccc7-37c8-4088-99ab-790f20702460	Business Partner Management	BPDM
c065a349-f649-47f8-94d5-1a504a855419	Quality Management	QM
\.


--
-- PostgreSQL database dump complete
--

