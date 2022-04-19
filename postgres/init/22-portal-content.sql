--
-- PostgreSQL database dump
--

-- Dumped from database version 14.2 (Debian 14.2-1.pgdg110+1)
-- Dumped by pg_dump version 14.2

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
-- Data for Name: addresses; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY portal.addresses (id, date_created, date_last_changed, city, region, streetadditional, streetname, streetnumber, zipcode, country_alpha_2_code) FROM stdin;
b4db3945-19a7-4a50-97d6-e66e8dfd04fb	2022-03-24 18:01:33.306	2022-03-24 18:01:33.306	Munich	\N	\N	Street	1	00001	DE
12302f9b-418c-4b8c-aea8-3eedf67e6a02	2022-03-24 18:01:33.341	2022-03-24 18:01:33.341	Munich	\N	\N	Street	1	00001	DE
3a52099d-4988-4a56-9787-10a669c41338	2022-03-24 18:01:33.344	2022-03-24 18:01:33.344	Munich	\N	\N	Street	1	00001	DE
aa49c0ec-4e65-4115-a01c-7adfc36d220e	2022-03-24 18:01:33.391	2022-03-24 18:01:33.391	Munich	\N	\N	Street	1	00001	DE
c0e1d802-0c4b-4d0d-a763-b6d9d56e6f07	2022-03-24 18:01:33.428	2022-03-24 18:01:33.428	Munich	\N	\N	Street	1	00001	DE
86da3e1c-a634-41a6-ad44-9880746123e4	2022-03-24 18:01:33.435	2022-03-24 18:01:33.435	Munich	\N	\N	Street	1	00001	DE
0f562ea7-4cc1-47a9-bfee-b41b0ac67ebb	2022-03-24 18:01:33.443	2022-03-24 18:01:33.443	Munich	\N	\N	Street	1	00001	DE
095ca573-bef1-4092-ad60-b7f651678fcd	2022-03-24 18:01:33.428	2022-03-24 18:01:33.428	Munich	\N	\N	Street	1	00001	DE
081c8bfd-c6d1-4119-a5f8-a69726dfc11d	2022-03-24 18:01:33.428	2022-03-24 18:01:33.428	Munich	\N	\N	Street	1	00001	DE
\.


--
-- Data for Name: companies; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY portal.companies (id, date_created, bpn, tax_id, name, parent, shortname, company_status_id, address_id) FROM stdin;
2dc4249f-b5ca-4d42-bef1-7a7a950a4f87	2022-03-24 18:01:33.306	CAXSDUMMYCATENAZZ	0000000000	Catena-X	\N	Catena-X	1	b4db3945-19a7-4a50-97d6-e66e8dfd04fb
ac861325-bc54-4583-bcdc-9e9f2a38ff84	2022-03-24 18:01:33.341	CAXSDUMMYBMWZZ	0000000000	Bayerische Motorenwerke AG	\N	BMW AG	1	12302f9b-418c-4b8c-aea8-3eedf67e6a02
0dcd8209-85e2-4073-b130-ac094fb47106	2022-03-24 18:01:33.344	CAXSDUMMYSAPZZ	0000000000	SAP AG	\N	SAP	1	3a52099d-4988-4a56-9787-10a669c41338
220330ac-170d-4e22-8d72-9467ed042149	2022-03-24 18:01:33.393	CAXSCARFACTORY1ZZ	0000000000	Car Factory 1	\N	Car Factory 1	1	aa49c0ec-4e65-4115-a01c-7adfc36d220e
bdac6865-2a8d-4bfd-9373-9dfce8190895	2022-03-24 18:01:33.43	CAXSCARFACTORY2ZZ	0000000000	Car Factory 2	\N	Car Factory 2	1	c0e1d802-0c4b-4d0d-a763-b6d9d56e6f07
41fd2ab8-71cd-4546-9bef-a388d91b2542	2022-03-24 18:01:33.438	CAXSCARFACTORY3ZZ	0000000000	Car Factory 3	\N	Car Factory 3	1	86da3e1c-a634-41a6-ad44-9880746123e4
d14eba77-0b18-4e41-9d84-49ef875c0763	2022-03-24 18:01:33.442	CAXLDUMMYCORPZZ	0000000000	Dummy Corp. 1	\N	Dummy Corp. 1	1	0f562ea7-4cc1-47a9-bfee-b41b0ac67ebb
9d049598-0dac-4d26-8a21-8f5b64c799cf	2022-03-24 18:01:33.442	CAXLCDQCORPZZ	0000000000	CDQ	\N	CDQ	1	095ca573-bef1-4092-ad60-b7f651678fcd
cac8fa6a-9db7-4bad-9cbd-56298b74bac2	2022-03-24 18:01:33.442	CAXLBOSCHZZ	0000000000	BOSCH	\N	BOSCH	\N	081c8bfd-c6d1-4119-a5f8-a69726dfc11d
\.

--
-- Data for Name: identity_providers; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY portal.identity_providers (identity_provider_category_id, id, date_created) FROM stdin;
1	ac1cf001-7fbc-1f2f-817f-bce0571b0004	2022-03-24 18:01:33.33
1	ac1cf001-7fbc-1f2f-817f-bce057200005	2022-03-24 18:01:33.344
1	ac1cf001-7fbc-1f2f-817f-bce057230006	2022-03-24 18:01:33.347
1	ac1cf001-7fbc-1f2f-817f-bce0575a0012	2022-03-24 18:01:33.402
1	ac1cf001-7fbc-1f2f-817f-bce057770014	2022-03-24 18:01:33.431
1	ac1cf001-7fbc-1f2f-817f-bce0577f0016	2022-03-24 18:01:33.438
\.

COPY portal.company_identity_provider (company_id, identity_provider_id) FROM stdin;
ac861325-bc54-4583-bcdc-9e9f2a38ff84	ac1cf001-7fbc-1f2f-817f-bce0571b0004
0dcd8209-85e2-4073-b130-ac094fb47106	ac1cf001-7fbc-1f2f-817f-bce057200005
220330ac-170d-4e22-8d72-9467ed042149	ac1cf001-7fbc-1f2f-817f-bce057230006
bdac6865-2a8d-4bfd-9373-9dfce8190895	ac1cf001-7fbc-1f2f-817f-bce0575a0012
41fd2ab8-71cd-4546-9bef-a388d91b2542	ac1cf001-7fbc-1f2f-817f-bce057770014
d14eba77-0b18-4e41-9d84-49ef875c0763	ac1cf001-7fbc-1f2f-817f-bce0577f0016
\.

COPY portal.iam_identity_providers (identity_provider_id, iam_idp_alias) FROM stdin;
ac1cf001-7fbc-1f2f-817f-bce0575a0012	idp1
ac1cf001-7fbc-1f2f-817f-bce057770014	idp2
\.


--
-- Data for Name: apps; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY portal.apps (id, date_created, name, date_released, thumbnail_url,  app_url, marketing_url,  contact_email,  contact_number, provider, provider_company_id, app_status_id) FROM stdin;
ac1cf001-7fbc-1f2f-817f-bce0572c0007	2022-03-24 18:01:33.348	Part Chain	2022-03-24 18:01:33.348	\N	\N	\N	\N	\N	Catena-X	ac861325-bc54-4583-bcdc-9e9f2a38ff84	1
ac1cf001-7fbc-1f2f-817f-bce05748000d	2022-03-24 18:01:33.384	Material Traceability	2022-03-24 18:01:33.384	\N	\N	\N	\N	\N	Catena-X	0dcd8209-85e2-4073-b130-ac094fb47106	1
ac1cf001-7fbc-1f2f-817f-bce0573f0009	2022-03-24 18:01:33.375	Dismantler App	2022-03-24 18:01:33.375	\N	https://catenax-dt-rec.authentication.eu10.hana.ondemand.com/login	\N	\N	\N	SAP	0dcd8209-85e2-4073-b130-ac094fb47106	1
ac1cf001-7fbc-1f2f-817f-bce05744000b	2022-03-24 18:01:33.38	CE Marketplace	2022-03-24 18:01:33.38	\N	https://catenax-dt-rec.authentication.eu10.hana.ondemand.com/login	\N	\N	\N	Catena-X	0dcd8209-85e2-4073-b130-ac094fb47106	1
ac1cf001-7fbc-1f2f-817f-bce0574c000f	2022-03-24 18:01:33.388	Component Performance	2022-03-24 18:01:33.388	\N	https://impact.bmw.cloud/workspace/carbon/ri.carbon.main.workspace.7d7f6c71-3981-4b78-b731-1b4c8f243c97/ri.workshop.main.module.c9beba25-4387-40dd-9e59-8c4e3b3df3ff	\N	\N	\N	Catena-X	ac861325-bc54-4583-bcdc-9e9f2a38ff84	1
f9cad59d-84b3-4880-a550-4072c26a6b93	2022-03-24 18:01:33.388	BPDM Services	2022-03-24 18:01:33.388	\N	https://apps.cdq.com/signin/catenax	\N	\N	\N	Catena-X	9d049598-0dac-4d26-8a21-8f5b64c799cf	1
8488044e-b8df-403a-9cbd-16dad7e4a08c	2022-03-24 18:01:33.388	Covanto - AFQM	2022-03-24 18:01:33.388	\N	https://portal-staging.afqm-services.com/[#/auth/signin]	\N	\N	\N	Catena-X	cac8fa6a-9db7-4bad-9cbd-56298b74bac2	1
5cf74ef8-e0b7-4984-a872-474828beb5d8	2022-03-24 18:01:33.388	Test MultiApp	2022-03-24 18:01:33.388	\N	\N	\N	\N	\N	Catena-X	2dc4249f-b5ca-4d42-bef1-7a7a950a4f87	1
5cf74ef8-e0b7-4984-a872-474828beb5d1	2022-03-24 18:01:33.388	Test MultiApp 2	2022-03-24 18:01:33.388	\N	\N	\N	\N	\N	Catena-X	2dc4249f-b5ca-4d42-bef1-7a7a950a4f87	1
\.


--
-- Data for Name: app_tags; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY portal.app_tags (app_id, tag_name) FROM stdin;
ac1cf001-7fbc-1f2f-817f-bce0572c0007	Traceability
ac1cf001-7fbc-1f2f-817f-bce05748000d	Traceability
ac1cf001-7fbc-1f2f-817f-bce0573f0009	Dismantler
ac1cf001-7fbc-1f2f-817f-bce0573f0009	Circular Economy
ac1cf001-7fbc-1f2f-817f-bce05744000b	Circular Economy
ac1cf001-7fbc-1f2f-817f-bce0574c000f	Test
f9cad59d-84b3-4880-a550-4072c26a6b93	Data
f9cad59d-84b3-4880-a550-4072c26a6b93	Business Partner
f9cad59d-84b3-4880-a550-4072c26a6b93	Partner Network
8488044e-b8df-403a-9cbd-16dad7e4a08c	Traceability
5cf74ef8-e0b7-4984-a872-474828beb5d8	Test
\.


--
-- Data for Name: use_cases; Type: TABLE DATA; Schema: public; Owner: admin
--


--
-- Data for Name: agreements; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY portal.agreements (agreement_category_id, id, date_created, date_last_changed, agreement_type, name, app_id, issuer_company_id, use_case_id) FROM stdin;
1	aa0a0000-7fbc-1f2f-817f-bce0502c1010	2022-03-24 18:01:33.388	2022-03-24 18:01:33.388	\N	Terms & Conditions - Active Participant	\N	2dc4249f-b5ca-4d42-bef1-7a7a950a4f87	1aacde78-35ec-4df3-ba1e-f988cddcbbd9
1	aa0a0000-7fbc-1f2f-817f-bce0502c1011	2022-03-24 18:01:33.388	2022-03-24 18:01:33.388	\N	Terms & Conditions - App Provider	\N	2dc4249f-b5ca-4d42-bef1-7a7a950a4f87	1aacde78-35ec-4df3-ba1e-f988cddcbbd9
1	aa0a0000-7fbc-1f2f-817f-bce0502c1012	2022-03-24 18:01:33.388	2022-03-24 18:01:33.388	\N	Terms & Conditions - Consultant	\N	2dc4249f-b5ca-4d42-bef1-7a7a950a4f87	1aacde78-35ec-4df3-ba1e-f988cddcbbd9
\.


--
-- Data for Name: agreement_assigned_company_roles; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY portal.agreement_assigned_company_roles (agreement_id, company_role_id) FROM stdin;
\.


--
-- Data for Name: document_templates; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY portal.document_templates (id, date_created, date_last_changed, documenttemplatename, documenttemplateversion) FROM stdin;
\.


--
-- Data for Name: agreement_assigned_document_templates; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY portal.agreement_assigned_document_templates (agreement_id, document_template_id) FROM stdin;
\.


--
-- Data for Name: company_user_roles; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY portal.company_user_roles (id, company_user_role, namede, nameen) FROM stdin;
7410693c-c893-409e-852f-9ee886ce94a6	COMPANY_ADMIN	Unternehmensadministrator	Company Admin
58f897ec-0aad-4588-8ffa-5f45d6638632	CX	CX Admin	CX Admin
607818be-4978-41f4-bf63-fa8d2de51154	IT_ADMIN	IT Administrator	IT Admin
ceec23fd-6b26-485c-a4bb-90571a29e148	SIGNING_MANAGER	Signing Manager	Signing Manager
95fe4014-4d1b-47af-a22e-72a12f9470db	DEVELOPER	Entwickler	Developer
04231a30-df50-4d14-bb00-71ff012ae0cf	DATA_SPECIALIST	Data Specialist	Data Specialist
3ff68c40-6581-4e48-a03a-2a6c1c5aac89	APP_ADMIN	App(Store) Administrator	App(store) Admin
efc20368-9e82-46ff-b88f-6495b9810253	CE.Dismantler.Lead	CE.Dismantler.Lead	CE.Dismantler.Lead
aabcdfeb-6669-4c74-89f0-19cda090873f	CE.Dismantler.Manager	CE.Dismantler.Manager	CE.Dismantler.Manager
7d41c72f-5242-4168-828d-8b1c87c472e3	CE.Dismantler.Buy	CE.Dismantler.Buy	CE.Dismantler.Buy
ac6860f4-770b-4228-9a59-580d538490ff	CE.Dismantler.Seller	CE.Dismantler.Seller	CE.Dismantler.Seller
b05d86e1-6c98-4619-85fa-9a425e0800b6	BUSINESS_ADMIN	Unternehmensadministrator	Business Admin
\.


--
-- Data for Name: app_assigned_company_user_roles; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY portal.app_assigned_company_user_roles (app_id, company_user_role_id) FROM stdin;
\.


--
-- Data for Name: app_licenses; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY portal.app_licenses (id, licensetext) FROM stdin;
ac1cf001-7fbc-1f2f-817f-bce0573f0008	free of charge
ac1cf001-7fbc-1f2f-817f-bce05743000a	free of charge
ac1cf001-7fbc-1f2f-817f-bce05748000c	free of charge
ac1cf001-7fbc-1f2f-817f-bce0574c000e	free of charge
ac1cf001-7fbc-1f2f-817f-bce0574f0010	free of charge
500518a7-9b14-4b55-bdba-2ecd53cff831	free of charge
0f956bce-7ec3-4171-b6d2-ba7fc57c37d5	free of charge
37eee74c-95fb-40ee-ae9c-95953a80bd66	free of charge
\.


--
-- Data for Name: app_assigned_licenses; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY portal.app_assigned_licenses (app_id, app_license_id) FROM stdin;
ac1cf001-7fbc-1f2f-817f-bce0572c0007	ac1cf001-7fbc-1f2f-817f-bce0573f0008
ac1cf001-7fbc-1f2f-817f-bce0573f0009	ac1cf001-7fbc-1f2f-817f-bce05743000a
ac1cf001-7fbc-1f2f-817f-bce05744000b	ac1cf001-7fbc-1f2f-817f-bce05748000c
ac1cf001-7fbc-1f2f-817f-bce05748000d	ac1cf001-7fbc-1f2f-817f-bce0574c000e
ac1cf001-7fbc-1f2f-817f-bce0574c000f	ac1cf001-7fbc-1f2f-817f-bce0574f0010
f9cad59d-84b3-4880-a550-4072c26a6b93	0f956bce-7ec3-4171-b6d2-ba7fc57c37d5
8488044e-b8df-403a-9cbd-16dad7e4a08c	37eee74c-95fb-40ee-ae9c-95953a80bd66
5cf74ef8-e0b7-4984-a872-474828beb5d8	500518a7-9b14-4b55-bdba-2ecd53cff831
\.


--
-- Data for Name: app_assigned_use_cases; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY portal.app_assigned_use_cases (app_id, use_case_id) FROM stdin;
ac1cf001-7fbc-1f2f-817f-bce0572c0007	06b243a4-ba51-4bf3-bc40-5d79a2231b86
ac1cf001-7fbc-1f2f-817f-bce0573f0009	1aacde78-35ec-4df3-ba1e-f988cddcbbd8
ac1cf001-7fbc-1f2f-817f-bce05744000b	1aacde78-35ec-4df3-ba1e-f988cddcbbd8
ac1cf001-7fbc-1f2f-817f-bce05748000d	06b243a4-ba51-4bf3-bc40-5d79a2231b86
f9cad59d-84b3-4880-a550-4072c26a6b93	6909ccc7-37c8-4088-99ab-790f20702460
8488044e-b8df-403a-9cbd-16dad7e4a08c	41e4a4c0-aae4-41c0-97c9-ebafde410de4
5cf74ef8-e0b7-4984-a872-474828beb5d8	41e4a4c0-aae4-41c0-97c9-ebafde410de4
5cf74ef8-e0b7-4984-a872-474828beb5d8	06b243a4-ba51-4bf3-bc40-5d79a2231b86
ac1cf001-7fbc-1f2f-817f-bce0574c000f	41e4a4c0-aae4-41c0-97c9-ebafde410de4
5cf74ef8-e0b7-4984-a872-474828beb5d1	06b243a4-ba51-4bf3-bc40-5d79a2231b86
\.


--
-- Data for Name: app_descriptions; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY portal.app_descriptions (description_long, description_short, app_id, language_short_name) FROM stdin;
Seamless part traceability through the n.tier supply chain\n\nknowledge you get detailed information about the components of your direct suppliers as well as your direct customers. This lets your answer questions such as:\n\n\n\nWhat's the exact lead time between the produciton of a subcomponent an your own components?\nTo wehre in the world are my components distributed and where are my suppliers located?\nWhat's the exact composition of my component on a unique ID level?\n\n\nBecause all of that is important information. PartChain keeps a storng one-up, one-down visibilty rule. You and the other parties in the network always see - only their suppliers customers data well as own ata. Your competitors won't be able to get any sensitive information about your production data.	CX App Part Chain Details	ac1cf001-7fbc-1f2f-817f-bce0572c0007	en
The SAP Circular Economy Application for the Catena-X comprises different solutions to collaborate on digital twin information across the entire lifecycle, be it a component, a part or an entire vehicle.\n\n\n\nAt the core of the application is SAPs Digital Vehicle Hub powered by the SAP Asset Intelligence Network, which integrates and interacts seamlessly along the automotive & mobility value chain. The application contains pre-delivered content for a vehicle's structure to easily model vehicle objects (e.g. model data, configuration data, technical data, lifecycle status, location).\n\n\n\nThe solutions help to manage all types of vehicle related master, transactional and usage data to support collaborative business models and processes.	SAP App Dismantler App Details	ac1cf001-7fbc-1f2f-817f-bce0573f0009	en
The SAP Circular Economy Application for the Catena-X comprises different solutions to collaborate on digital twin information across the entire lifecycle, be it a component, a part or an entire vehicle.\n\n\n\nAt the core of the application is SAPs Digital Vehicle Hub powered by the SAP Asset Intelligence Network, which integrates and interacts seamlessly along the automotive & mobility value chain. The application contains pre-delivered content for a vehicle's structure to easily model vehicle objects (e.g. model data, configuration data, technical data, lifecycle status, location).\n\n\n\nThe solutions help to manage all types of vehicle related master, transactional and usage data to support collaborative business models and processes.	SAP App CE Marketplace Details	ac1cf001-7fbc-1f2f-817f-bce05744000b	en
Description\n\nCreate an Intelligent Enterprise with Advanced Logistic collabration and Insights. SAP Logistics Business Network, material traceability options connect partners for inter-company collaboration and transparency. It supports a comprehensive set capabilities, allowing to manage freight more efficiently, benefit form situational awareness through track and trace, and create a trust chain for up- and downstream product genealogy.	SAP App Material Traceability Details	ac1cf001-7fbc-1f2f-817f-bce05748000d	en
Automotive suppliers must constantly monitor product performance and resolve quality issues quickly to ensure they do not face costly claims. For quality analysts and engineers this involves a long, manual process of analyzing claims and failed parts that lacks vital information - including live vehicle data(such as Diagnostic Trouble Codes). Identifying root-cause issues is complex, issue resolution is slow, and costs quickly escalate. Component Performance Monitor (CPM) enables suppliers to better manage quality risk and significantly reduce the costs incurred from faulty parts by leveraging near-live vehicle data, empowering quality experts to:\n\nIdentify failure patterns and root- cause quality issues in real time\nMonitor the effectiveness of remediation measures in the fleet using live vehicle data\nand proactively request faulty parts for further analysis.\n\n...all in a single collaborative interface that supercharges the supplier to OEM feedback cycle, leading to faster proactive issue resolution, a reduction in claims, and better customer experiences.	BMW App Component Performance Monitor Details	ac1cf001-7fbc-1f2f-817f-bce0574c000f	en
Business Partner Services for Fraud & Data Management	Business Partner Services for Fraud & Data Management	f9cad59d-84b3-4880-a550-4072c26a6b93	en
Automatic monitoring (Early Warning System) of diagnostic data	Automatic monitoring (Early Warning System) of diagnostic data	8488044e-b8df-403a-9cbd-16dad7e4a08c	en
Works with multiple use cases	Works with multiple use cases	5cf74ef8-e0b7-4984-a872-474828beb5d8	en
smart MOM (Manufacturing Operations Management) consolidates all production processes and systems for managing manufacturing processes in order to increase efficiency. The smart MOM solution from German Edge Cloud includes various services and enables a holistic production management. This includes, for example, the management of production processes including specific production rules, bill of materials (BOM), recipient data, resource/asset management and much more.	smart MOM can be operated as part of our scalable Edge Cloud data center “GEC Digital Production System”, which can combine various MES (Manufacturing Execution System), MOM functionalities and integration services. Thus, smart MOM can use integrated dat	5cf74ef8-e0b7-4984-a872-474828beb5d1	en
\.


--
-- Data for Name: company_applications; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY portal.company_applications (id, date_created, date_last_changed, application_status_id, company_id) FROM stdin;
4f0146c6-32aa-4bb1-b844-df7e8babdcb6	2022-03-24 18:01:33.403	2022-03-24 18:01:33.403	5	220330ac-170d-4e22-8d72-9467ed042149
0195a85f-e465-4571-b980-d1351dd76a9f	2022-03-24 18:01:33.431	2022-03-24 18:01:33.431	5	bdac6865-2a8d-4bfd-9373-9dfce8190895
6b2d1263-c073-4a48-bfaf-704dc154ca9a	2022-03-24 18:01:33.439	2022-03-24 18:01:33.439	5	41fd2ab8-71cd-4546-9bef-a388d91b2542
\.


--
-- Data for Name: company_assigned_apps; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY portal.company_assigned_apps (company_id, app_id) FROM stdin;
\.


--
-- Data for Name: company_assigned_roles; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY portal.company_assigned_roles (company_id, company_role_id) FROM stdin;
2dc4249f-b5ca-4d42-bef1-7a7a950a4f87	1
2dc4249f-b5ca-4d42-bef1-7a7a950a4f87	2
ac861325-bc54-4583-bcdc-9e9f2a38ff84	1
ac861325-bc54-4583-bcdc-9e9f2a38ff84	2
0dcd8209-85e2-4073-b130-ac094fb47106	1
0dcd8209-85e2-4073-b130-ac094fb47106	2
9d049598-0dac-4d26-8a21-8f5b64c799cf	1
9d049598-0dac-4d26-8a21-8f5b64c799cf	2
cac8fa6a-9db7-4bad-9cbd-56298b74bac2	1
cac8fa6a-9db7-4bad-9cbd-56298b74bac2	2
\.


--
-- Data for Name: company_assigned_use_cases; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY portal.company_assigned_use_cases (company_id, use_case_id) FROM stdin;
2dc4249f-b5ca-4d42-bef1-7a7a950a4f87	1aacde78-35ec-4df3-ba1e-f988cddcbbd8
2dc4249f-b5ca-4d42-bef1-7a7a950a4f87	06b243a4-ba51-4bf3-bc40-5d79a2231b86
ac861325-bc54-4583-bcdc-9e9f2a38ff84	1aacde78-35ec-4df3-ba1e-f988cddcbbd8
ac861325-bc54-4583-bcdc-9e9f2a38ff84	06b243a4-ba51-4bf3-bc40-5d79a2231b86
0dcd8209-85e2-4073-b130-ac094fb47106	1aacde78-35ec-4df3-ba1e-f988cddcbbd8
0dcd8209-85e2-4073-b130-ac094fb47106	06b243a4-ba51-4bf3-bc40-5d79a2231b86
\.


--
-- Data for Name: company_users; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY portal.company_users (id, date_created, date_last_changed, email, firstname, lastlogin, lastname, company_id) FROM stdin;
ac1cf001-7fbc-1f2f-817f-bce0575a0011	2022-03-24 18:01:33.394	2022-03-24 18:01:33.394	\N	\N	\N	\N	220330ac-170d-4e22-8d72-9467ed042149
ac1cf001-7fbc-1f2f-817f-bce057770013	2022-03-24 18:01:33.431	2022-03-24 18:01:33.431	\N	\N	\N	\N	bdac6865-2a8d-4bfd-9373-9dfce8190895
ac1cf001-7fbc-1f2f-817f-bce0577e0015	2022-03-24 18:01:33.438	2022-03-24 18:01:33.438	\N	\N	\N	\N	41fd2ab8-71cd-4546-9bef-a388d91b2542
ac1cf001-7fbc-1f2f-817f-bce057850017	2022-03-24 18:01:33.445	2022-03-24 18:01:33.445	\N	\N	\N	\N	d14eba77-0b18-4e41-9d84-49ef875c0763
ac1cf001-7fbc-1f2f-817f-bce057880018	2022-03-24 18:01:33.447	2022-03-24 18:01:33.447	\N	\N	\N	\N	d14eba77-0b18-4e41-9d84-49ef875c0763
ac1cf001-7fbc-1f2f-817f-bce0578b0019	2022-03-24 18:01:33.45	2022-03-24 18:01:33.45	\N	\N	\N	\N	d14eba77-0b18-4e41-9d84-49ef875c0763
ac1cf001-7fbc-1f2f-817f-bce0578d001a	2022-03-24 18:01:33.453	2022-03-24 18:01:33.453	\N	\N	\N	\N	d14eba77-0b18-4e41-9d84-49ef875c0763
ac1cf001-7fbc-1f2f-817f-bce05790001b	2022-03-24 18:01:33.456	2022-03-24 18:01:33.456	\N	\N	\N	\N	d14eba77-0b18-4e41-9d84-49ef875c0763
ac1cf001-7fbc-1f2f-817f-bce05793001c	2022-03-24 18:01:33.459	2022-03-24 18:01:33.459	\N	\N	\N	\N	d14eba77-0b18-4e41-9d84-49ef875c0763
ac1cf001-7fbc-1f2f-817f-bce05796001d	2022-03-24 18:01:33.462	2022-03-24 18:01:33.462	\N	\N	\N	\N	d14eba77-0b18-4e41-9d84-49ef875c0763
ac1cf001-7fbc-1f2f-817f-bce05798001e	2022-03-24 18:01:33.464	2022-03-24 18:01:33.464	\N	\N	\N	\N	d14eba77-0b18-4e41-9d84-49ef875c0763
ac1cf001-7fbc-1f2f-817f-bce0579b001f	2022-03-24 18:01:33.467	2022-03-24 18:01:33.467	\N	\N	\N	\N	d14eba77-0b18-4e41-9d84-49ef875c0763
ac1cf001-7fbc-1f2f-817f-bce0579f0020	2022-03-24 18:01:33.47	2022-03-24 18:01:33.47	\N	\N	\N	\N	d14eba77-0b18-4e41-9d84-49ef875c0763
ac1cf001-7fbc-1f2f-817f-bce057a20021	2022-03-24 18:01:33.474	2022-03-24 18:01:33.474	\N	\N	\N	\N	d14eba77-0b18-4e41-9d84-49ef875c0763
ac1cf001-7fbc-1f2f-817f-bce057a40022	2022-03-24 18:01:33.476	2022-03-24 18:01:33.476	\N	\N	\N	\N	d14eba77-0b18-4e41-9d84-49ef875c0763
ac1cf001-7fbc-1f2f-817f-bce057a70023	2022-03-24 18:01:33.478	2022-03-24 18:01:33.478	\N	\N	\N	\N	d14eba77-0b18-4e41-9d84-49ef875c0763
ac1cf001-7fbc-1f2f-817f-bce057aa0024	2022-03-24 18:01:33.482	2022-03-24 18:01:33.482	\N	\N	\N	\N	d14eba77-0b18-4e41-9d84-49ef875c0763
ac1cf001-7fbc-1f2f-817f-bce057ad0025	2022-03-24 18:01:33.485	2022-03-24 18:01:33.485	\N	\N	\N	\N	d14eba77-0b18-4e41-9d84-49ef875c0763
ac1cf001-7fbc-1f2f-817f-bce057b00026	2022-03-24 18:01:33.488	2022-03-24 18:01:33.488	\N	\N	\N	\N	d14eba77-0b18-4e41-9d84-49ef875c0763
ac1cf001-7fbc-1f2f-817f-bce057b40027	2022-03-24 18:01:33.491	2022-03-24 18:01:33.491	\N	\N	\N	\N	d14eba77-0b18-4e41-9d84-49ef875c0763
ac1cf001-7fbc-1f2f-817f-bce057b60028	2022-03-24 18:01:33.494	2022-03-24 18:01:33.494	\N	\N	\N	\N	d14eba77-0b18-4e41-9d84-49ef875c0763
ac1cf001-7fbc-1f2f-817f-bce057b90029	2022-03-24 18:01:33.497	2022-03-24 18:01:33.497	\N	\N	\N	\N	d14eba77-0b18-4e41-9d84-49ef875c0763
ac1cf001-7fbc-1f2f-817f-bce057bd002a	2022-03-24 18:01:33.501	2022-03-24 18:01:33.501	\N	\N	\N	\N	d14eba77-0b18-4e41-9d84-49ef875c0763
ac1cf001-7fbc-1f2f-817f-bce057c2002b	2022-03-24 18:01:33.506	2022-03-24 18:01:33.506	\N	\N	\N	\N	d14eba77-0b18-4e41-9d84-49ef875c0763
ac1cf001-7fbc-1f2f-817f-bce057c6002c	2022-03-24 18:01:33.51	2022-03-24 18:01:33.51	\N	\N	\N	\N	d14eba77-0b18-4e41-9d84-49ef875c0763
ac1cf001-7fbc-1f2f-817f-bce057c8002d	2022-03-24 18:01:33.512	2022-03-24 18:01:33.512	\N	\N	\N	\N	d14eba77-0b18-4e41-9d84-49ef875c0763
ac1cf001-7fbc-1f2f-817f-bce057cc002e	2022-03-24 18:01:33.516	2022-03-24 18:01:33.516	\N	\N	\N	\N	d14eba77-0b18-4e41-9d84-49ef875c0763
ac1cf001-7fbc-1f2f-817f-bce057cf002f	2022-03-24 18:01:33.519	2022-03-24 18:01:33.519	\N	\N	\N	\N	d14eba77-0b18-4e41-9d84-49ef875c0763
ac1cf001-7fbc-1f2f-817f-bce057d20030	2022-03-24 18:01:33.522	2022-03-24 18:01:33.522	\N	\N	\N	\N	d14eba77-0b18-4e41-9d84-49ef875c0763
ac1cf001-7fbc-1f2f-817f-bce057d60031	2022-03-24 18:01:33.525	2022-03-24 18:01:33.525	\N	\N	\N	\N	d14eba77-0b18-4e41-9d84-49ef875c0763
ac1cf001-7fbc-1f2f-817f-bce057d90032	2022-03-24 18:01:33.528	2022-03-24 18:01:33.528	\N	\N	\N	\N	d14eba77-0b18-4e41-9d84-49ef875c0763
ac1cf001-7fbc-1f2f-817f-bce057dc0033	2022-03-24 18:01:33.532	2022-03-24 18:01:33.532	\N	\N	\N	\N	d14eba77-0b18-4e41-9d84-49ef875c0763
ac1cf001-7fbc-1f2f-817f-bce057e10034	2022-03-24 18:01:33.537	2022-03-24 18:01:33.537	\N	\N	\N	\N	d14eba77-0b18-4e41-9d84-49ef875c0763
ac1cf001-7fbc-1f2f-817f-bce057e40035	2022-03-24 18:01:33.54	2022-03-24 18:01:33.54	\N	\N	\N	\N	d14eba77-0b18-4e41-9d84-49ef875c0763
ac1cf001-7fbc-1f2f-817f-bce057e70036	2022-03-24 18:01:33.543	2022-03-24 18:01:33.543	\N	\N	\N	\N	d14eba77-0b18-4e41-9d84-49ef875c0763
ac1cf001-7fbc-1f2f-817f-bce057e90037	2022-03-24 18:01:33.545	2022-03-24 18:01:33.545	\N	\N	\N	\N	d14eba77-0b18-4e41-9d84-49ef875c0763
ac1cf001-7fbc-1f2f-817f-bce057ec0038	2022-03-24 18:01:33.548	2022-03-24 18:01:33.548	\N	\N	\N	\N	d14eba77-0b18-4e41-9d84-49ef875c0763
ac1cf001-7fbc-1f2f-817f-bce057ef0039	2022-03-24 18:01:33.551	2022-03-24 18:01:33.551	\N	\N	\N	\N	d14eba77-0b18-4e41-9d84-49ef875c0763
ac1cf001-7fbc-1f2f-817f-bce057f2003a	2022-03-24 18:01:33.554	2022-03-24 18:01:33.554	\N	\N	\N	\N	d14eba77-0b18-4e41-9d84-49ef875c0763
ac1cf001-7fbc-1f2f-817f-bce057f6003b	2022-03-24 18:01:33.557	2022-03-24 18:01:33.557	\N	\N	\N	\N	d14eba77-0b18-4e41-9d84-49ef875c0763
ac1cf001-7fbc-1f2f-817f-bce057f8003c	2022-03-24 18:01:33.56	2022-03-24 18:01:33.56	\N	\N	\N	\N	d14eba77-0b18-4e41-9d84-49ef875c0763
ac1cf001-7fbc-1f2f-817f-bce057fa003d	2022-03-24 18:01:33.562	2022-03-24 18:01:33.562	\N	\N	\N	\N	d14eba77-0b18-4e41-9d84-49ef875c0763
ac1cf001-7fbc-1f2f-817f-bce057fe003e	2022-03-24 18:01:33.565	2022-03-24 18:01:33.565	\N	\N	\N	\N	d14eba77-0b18-4e41-9d84-49ef875c0763
ac1cf001-7fbc-1f2f-817f-bce05802003f	2022-03-24 18:01:33.57	2022-03-24 18:01:33.57	\N	\N	\N	\N	d14eba77-0b18-4e41-9d84-49ef875c0763
\.


--
-- Data for Name: company_user_assigned_app_favourites; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY portal.company_user_assigned_app_favourites (company_user_id, app_id) FROM stdin;
\.


--
-- Data for Name: company_user_assigned_roles; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY portal.company_user_assigned_roles (company_user_id, user_role_id) FROM stdin;
ac1cf001-7fbc-1f2f-817f-bce0575a0011	b05d86e1-6c98-4619-85fa-9a425e0800b6
ac1cf001-7fbc-1f2f-817f-bce057770013	b05d86e1-6c98-4619-85fa-9a425e0800b6
ac1cf001-7fbc-1f2f-817f-bce0577e0015	b05d86e1-6c98-4619-85fa-9a425e0800b6
\.


--
-- Data for Name: documents; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY portal.documents (id, document, documenthash, documentname, documentuploaddate, documentversion, company_user_id) FROM stdin;
\.


--
-- Data for Name: consents; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY portal.consents (id, date_created, date_last_changed, comment, consent_status_id, target, "timestamp", agreement_id, company_id, document_id, company_user_id) FROM stdin;
ac1cf001-7fbc-1f2f-817f-bce0575a0100	2022-03-24 18:01:33.394	2022-03-24 18:01:33.394	\N	1	\N	E'\\000'::bytea	aa0a0000-7fbc-1f2f-817f-bce0502c1010	0dcd8209-85e2-4073-b130-ac094fb47106	\N	ac1cf001-7fbc-1f2f-817f-bce0575a0011
ac1cf001-7fbc-1f2f-817f-bce0575a0101	2022-03-24 18:01:33.394	2022-03-24 18:01:33.394	\N	1	\N	E'\\000'::bytea	aa0a0000-7fbc-1f2f-817f-bce0502c1011	0dcd8209-85e2-4073-b130-ac094fb47106	\N	ac1cf001-7fbc-1f2f-817f-bce0575a0011
ac1cf001-7fbc-1f2f-817f-bce0575a0102	2022-03-24 18:01:33.394	2022-03-24 18:01:33.394	\N	1	\N	E'\\000'::bytea	aa0a0000-7fbc-1f2f-817f-bce0502c1012	0dcd8209-85e2-4073-b130-ac094fb47106	\N	ac1cf001-7fbc-1f2f-817f-bce0575a0011
\.

--
-- Data for Name: identity_provider_users; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY portal.iam_users (user_entity_id, company_user_id) FROM stdin;
ad56702b-5908-44eb-a668-9a11a0e100d6	ac1cf001-7fbc-1f2f-817f-bce0575a0011
e9b1c0e4-953d-4539-b703-dca9e911eab5	ac1cf001-7fbc-1f2f-817f-bce057770013
3432d787-d7c8-46fb-96d7-cc984c6bfaac	ac1cf001-7fbc-1f2f-817f-bce0577e0015
8db1939d-7536-4a3b-8028-928268ce8145	ac1cf001-7fbc-1f2f-817f-bce057850017
dffd2eec-38d6-4dc7-944b-93622dacda14	ac1cf001-7fbc-1f2f-817f-bce057880018
c0ecb5b5-56a7-4ab1-bb05-ab214d90aced	ac1cf001-7fbc-1f2f-817f-bce0578b0019
9be54173-c150-41d8-9953-ace03f28356f	ac1cf001-7fbc-1f2f-817f-bce0578d001a
685e206d-4316-4162-928b-09bbbce56f22	ac1cf001-7fbc-1f2f-817f-bce05790001b
b007b2ea-76f7-419f-a4dc-17679b340be9	ac1cf001-7fbc-1f2f-817f-bce05793001c
4f717673-ed56-41ae-af61-5b99e8d5c7b9	ac1cf001-7fbc-1f2f-817f-bce05796001d
f6f1e6c9-6336-48c2-bf2d-b6b924573b37	ac1cf001-7fbc-1f2f-817f-bce05798001e
1df3d549-a7d5-476c-ba5b-7f40045f6d17	ac1cf001-7fbc-1f2f-817f-bce0579b001f
edffb495-6c50-4e5a-b774-e8ddebf88755	ac1cf001-7fbc-1f2f-817f-bce0579f0020
6e89bdcc-2f90-4331-a970-53bb4b982086	ac1cf001-7fbc-1f2f-817f-bce057a20021
4f516647-6def-4513-926c-e4409058405a	ac1cf001-7fbc-1f2f-817f-bce057a40022
a85489e7-b02c-48d3-908d-47ad20c52f83	ac1cf001-7fbc-1f2f-817f-bce057a70023
10543cba-9db7-4246-ba5f-83bea31376ef	ac1cf001-7fbc-1f2f-817f-bce057aa0024
f59dd7bc-3d1d-4aee-b9bf-6ddf011d57c5	ac1cf001-7fbc-1f2f-817f-bce057ad0025
aceb8af5-f10e-48b1-9031-40ffaac0f29c	ac1cf001-7fbc-1f2f-817f-bce057b00026
38a96dd6-25e4-4f63-847d-0414a29525d5	ac1cf001-7fbc-1f2f-817f-bce057b40027
850b531e-cc42-4b21-be52-f8091b4d1a60	ac1cf001-7fbc-1f2f-817f-bce057b60028
4eca11f3-9f50-410f-915a-78710bbc1c76	ac1cf001-7fbc-1f2f-817f-bce057b90029
6c87f1ff-dce9-435d-9e9b-fd458b43feee	ac1cf001-7fbc-1f2f-817f-bce057bd002a
38309859-cde9-4b78-9863-860abcca0992	ac1cf001-7fbc-1f2f-817f-bce057c2002b
507adf20-f96f-411e-98ae-a55e9d51b389	ac1cf001-7fbc-1f2f-817f-bce057c6002c
329f80e1-0b38-4253-b5c6-68107f2530b3	ac1cf001-7fbc-1f2f-817f-bce057c8002d
39375c19-3c7f-4d3d-8fa8-e5dedd610ed4	ac1cf001-7fbc-1f2f-817f-bce057cc002e
c5ec91a2-ee26-4bde-9923-fa957feba6e0	ac1cf001-7fbc-1f2f-817f-bce057cf002f
ab4d13e3-d28a-4337-b0a1-f48d226c5f0a	ac1cf001-7fbc-1f2f-817f-bce057d20030
ba42eca7-b888-45b9-85bd-a2aad29f582b	ac1cf001-7fbc-1f2f-817f-bce057d60031
8e01e3dd-b3e5-4019-8b2b-a89d20e08770	ac1cf001-7fbc-1f2f-817f-bce057d90032
785a73c4-bd99-41dd-96ab-d283448de173	ac1cf001-7fbc-1f2f-817f-bce057dc0033
588148ed-29e1-440b-8e12-28c438239968	ac1cf001-7fbc-1f2f-817f-bce057e10034
14b11c97-c2bf-4087-a05a-1a0c3a5b08f3	ac1cf001-7fbc-1f2f-817f-bce057e40035
89c29f40-239f-4001-8733-b82fba037125	ac1cf001-7fbc-1f2f-817f-bce057e70036
28e88974-abe5-4da1-a325-bff8f467e322	ac1cf001-7fbc-1f2f-817f-bce057e90037
4b66ddb5-f6e9-423a-a64e-46b6c07ef631	ac1cf001-7fbc-1f2f-817f-bce057ec0038
a708e70a-0d29-441d-bd19-8b07286cf2dc	ac1cf001-7fbc-1f2f-817f-bce057ef0039
32f3ad7e-661d-4049-ac01-783f5ea86333	ac1cf001-7fbc-1f2f-817f-bce057f2003a
1b005f48-c913-4627-862a-841043410fd9	ac1cf001-7fbc-1f2f-817f-bce057f6003b
de2225ca-7bb3-4f2a-af69-07360bbddb3e	ac1cf001-7fbc-1f2f-817f-bce057f8003c
cc40c57f-ab69-49bf-ab05-168c4d61ca36	ac1cf001-7fbc-1f2f-817f-bce057fa003d
e82ab43e-3d34-4c75-9961-6b31b00ec3cb	ac1cf001-7fbc-1f2f-817f-bce057fe003e
92095972-fcfc-4c94-9489-5711e0e73b71	ac1cf001-7fbc-1f2f-817f-bce05802003f
\.

--
-- Data for Name: invitations; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY portal.invitations (id, date_created, invitation_status_id, company_application_id, company_user_id) FROM stdin;
bd0d0302-3ec8-4bfe-99db-b89bdb6c4b94	2022-03-24 18:01:33.408	1	4f0146c6-32aa-4bb1-b844-df7e8babdcb6	ac1cf001-7fbc-1f2f-817f-bce0575a0011
3106e610-2740-4b5c-946c-5258b7a58a6c	2022-03-24 18:01:33.431	1	0195a85f-e465-4571-b980-d1351dd76a9f	ac1cf001-7fbc-1f2f-817f-bce057770013
d54db875-774c-479f-9f14-375f2cb8b257	2022-03-24 18:01:33.439	1	6b2d1263-c073-4a48-bfaf-704dc154ca9a	ac1cf001-7fbc-1f2f-817f-bce0577e0015
\.
