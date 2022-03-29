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

COPY portal.addresses (address_id, date_created, date_last_changed, city, region, streetadditional, streetname, streetnumber, zipcode, country_alpha_2_code) FROM stdin;
b4db3945-19a7-4a50-97d6-e66e8dfd04fb	2022-03-24 18:01:33.306	2022-03-24 18:01:33.306	\N	\N	\N	\N	\N	\N	\N
12302f9b-418c-4b8c-aea8-3eedf67e6a02	2022-03-24 18:01:33.341	2022-03-24 18:01:33.341	\N	\N	\N	\N	\N	\N	\N
3a52099d-4988-4a56-9787-10a669c41338	2022-03-24 18:01:33.344	2022-03-24 18:01:33.344	\N	\N	\N	\N	\N	\N	\N
aa49c0ec-4e65-4115-a01c-7adfc36d220e	2022-03-24 18:01:33.391	2022-03-24 18:01:33.391	\N	\N	\N	\N	\N	\N	\N
c0e1d802-0c4b-4d0d-a763-b6d9d56e6f07	2022-03-24 18:01:33.428	2022-03-24 18:01:33.428	\N	\N	\N	\N	\N	\N	\N
86da3e1c-a634-41a6-ad44-9880746123e4	2022-03-24 18:01:33.435	2022-03-24 18:01:33.435	\N	\N	\N	\N	\N	\N	\N
0f562ea7-4cc1-47a9-bfee-b41b0ac67ebb	2022-03-24 18:01:33.443	2022-03-24 18:01:33.443	\N	\N	\N	\N	\N	\N	\N
\.


--
-- Data for Name: companies; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY portal.companies (company_id, date_created, date_last_changed, bpn, name, parent, shortname, company_status_id, address_id) FROM stdin;
2dc4249f-b5ca-4d42-bef1-7a7a950a4f87	2022-03-24 18:01:33.306	2022-03-24 18:01:33.306	CAXSDUMMYCATENAZZ	Catena-X	\N	Catena-X	1	b4db3945-19a7-4a50-97d6-e66e8dfd04fb
ac861325-bc54-4583-bcdc-9e9f2a38ff84	2022-03-24 18:01:33.341	2022-03-24 18:01:33.341	CAXSDUMMYBMWZZ	Bayerische Motorenwerke AG	\N	BMW AG	1	12302f9b-418c-4b8c-aea8-3eedf67e6a02
0dcd8209-85e2-4073-b130-ac094fb47106	2022-03-24 18:01:33.344	2022-03-24 18:01:33.344	CAXSDUMMYSAPZZ	SAP AG	\N	SAP	1	3a52099d-4988-4a56-9787-10a669c41338
220330ac-170d-4e22-8d72-9467ed042149	2022-03-24 18:01:33.393	2022-03-24 18:01:33.393	CAXSCARFACTORY1ZZ	Car Factory 1	\N	Car Factory 1	1	aa49c0ec-4e65-4115-a01c-7adfc36d220e
bdac6865-2a8d-4bfd-9373-9dfce8190895	2022-03-24 18:01:33.43	2022-03-24 18:01:33.43	CAXSCARFACTORY2ZZ	Car Factory 2	\N	Car Factory 2	1	c0e1d802-0c4b-4d0d-a763-b6d9d56e6f07
41fd2ab8-71cd-4546-9bef-a388d91b2542	2022-03-24 18:01:33.438	2022-03-24 18:01:33.438	CAXSCARFACTORY3ZZ	Car Factory 3	\N	Car Factory 3	1	86da3e1c-a634-41a6-ad44-9880746123e4
d14eba77-0b18-4e41-9d84-49ef875c0763	2022-03-24 18:01:33.442	2022-03-24 18:01:33.442	CAXLDUMMYCORPZZ	Dummy Corp. 1	\N	Dummy Corp. 1	1	0f562ea7-4cc1-47a9-bfee-b41b0ac67ebb
\.

--
-- Data for Name: identity_providers; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY portal.identity_providers (identity_provider_category_id, identity_provider_id, date_created, date_last_changed) FROM stdin;
1	ac1cf001-7fbc-1f2f-817f-bce0571b0004	2022-03-24 18:01:33.33	2022-03-24 18:01:33.33
1	ac1cf001-7fbc-1f2f-817f-bce057200005	2022-03-24 18:01:33.344	2022-03-24 18:01:33.344
1	ac1cf001-7fbc-1f2f-817f-bce057230006	2022-03-24 18:01:33.347	2022-03-24 18:01:33.347
1	ac1cf001-7fbc-1f2f-817f-bce0575a0012	2022-03-24 18:01:33.402	2022-03-24 18:01:33.402
1	ac1cf001-7fbc-1f2f-817f-bce057770014	2022-03-24 18:01:33.431	2022-03-24 18:01:33.431
1	ac1cf001-7fbc-1f2f-817f-bce0577f0016	2022-03-24 18:01:33.438	2022-03-24 18:01:33.438
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
ac1cf001-7fbc-1f2f-817f-bce0575a0012	idp20
ac1cf001-7fbc-1f2f-817f-bce057770014	idp21
ac1cf001-7fbc-1f2f-817f-bce0577f0016	idp27
\.


--
-- Data for Name: apps; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY portal.apps (app_id, date_created, date_last_changed, name, date_released, thumbnail_url, vendor_company_id) FROM stdin;
ac1cf001-7fbc-1f2f-817f-bce0572c0007	2022-03-24 18:01:33.348	2022-03-24 18:01:33.348	Part Chain	\N	\N	ac861325-bc54-4583-bcdc-9e9f2a38ff84
ac1cf001-7fbc-1f2f-817f-bce0573f0009	2022-03-24 18:01:33.375	2022-03-24 18:01:33.375	Dismantler App	\N	\N	0dcd8209-85e2-4073-b130-ac094fb47106
ac1cf001-7fbc-1f2f-817f-bce05744000b	2022-03-24 18:01:33.38	2022-03-24 18:01:33.38	CE Marketplace	\N	\N	0dcd8209-85e2-4073-b130-ac094fb47106
ac1cf001-7fbc-1f2f-817f-bce05748000d	2022-03-24 18:01:33.384	2022-03-24 18:01:33.384	Material Traceability	\N	\N	0dcd8209-85e2-4073-b130-ac094fb47106
ac1cf001-7fbc-1f2f-817f-bce0574c000f	2022-03-24 18:01:33.388	2022-03-24 18:01:33.388	Component Performance	\N	\N	ac861325-bc54-4583-bcdc-9e9f2a38ff84
\.


--
-- Data for Name: use_cases; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY portal.use_cases (use_case_id, date_created, date_last_changed, name, shortname) FROM stdin;
ac1cf001-7fbc-1f2f-817f-bce056f90000	2022-03-24 18:01:33.297	2022-03-24 18:01:33.297	Circular Economy	CE
ac1cf001-7fbc-1f2f-817f-bce056fa0001	2022-03-24 18:01:33.306	2022-03-24 18:01:33.306	Traceability	Traceability
ac1cf001-7fbc-1f2f-817f-bce056fa0002	2022-03-24 18:01:33.306	2022-03-24 18:01:33.306	Quality Management	QM
ac1cf001-7fbc-1f2f-817f-bce056fa0003	2022-03-24 18:01:33.306	2022-03-24 18:01:33.306	Demand Management	DM
\.


--
-- Data for Name: agreements; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY portal.agreements (agreement_category_id, agreement_id, date_created, date_last_changed, agreement_type, name, app_id, issuer_company_id, use_case_id) FROM stdin;
\.


--
-- Data for Name: agreement_assigned_company_roles; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY portal.agreement_assigned_company_roles (agreement_id, company_role_id) FROM stdin;
\.


--
-- Data for Name: document_templates; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY portal.document_templates (document_template_id, date_created, date_last_changed, documenttemplatename, documenttemplateversion) FROM stdin;
\.


--
-- Data for Name: agreement_assigned_document_templates; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY portal.agreement_assigned_document_templates (agreement_id, document_template_id) FROM stdin;
\.


--
-- Data for Name: company_user_roles; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY portal.company_user_roles (company_user_role_id, company_user_role, date_created, date_last_changed, namede, nameen) FROM stdin;
7410693c-c893-409e-852f-9ee886ce94a6	COMPANY_ADMIN	2022-03-24 18:01:33.244	2022-03-24 18:01:33.244	Unternehmensadministrator	Company Admin
58f897ec-0aad-4588-8ffa-5f45d6638632	CX	2022-03-24 18:01:33.26	2022-03-24 18:01:33.26	CX Admin	CX Admin
607818be-4978-41f4-bf63-fa8d2de51154	IT_ADMIN	2022-03-24 18:01:33.263	2022-03-24 18:01:33.263	IT Administrator	IT Admin
ceec23fd-6b26-485c-a4bb-90571a29e148	SIGNING_MANAGER	2022-03-24 18:01:33.266	2022-03-24 18:01:33.266	Signing Manager	Signing Manager
95fe4014-4d1b-47af-a22e-72a12f9470db	DEVELOPER	2022-03-24 18:01:33.27	2022-03-24 18:01:33.27	Entwickler	Developer
04231a30-df50-4d14-bb00-71ff012ae0cf	DATA_SPECIALIST	2022-03-24 18:01:33.273	2022-03-24 18:01:33.273	Data Specialist	Data Specialist
3ff68c40-6581-4e48-a03a-2a6c1c5aac89	APP_ADMIN	2022-03-24 18:01:33.277	2022-03-24 18:01:33.277	App(Store) Administrator	App(store) Admin
efc20368-9e82-46ff-b88f-6495b9810253	CE.Dismantler.Lead	2022-03-24 18:01:33.28	2022-03-24 18:01:33.28	CE.Dismantler.Lead	CE.Dismantler.Lead
aabcdfeb-6669-4c74-89f0-19cda090873f	CE.Dismantler.Manager	2022-03-24 18:01:33.282	2022-03-24 18:01:33.282	CE.Dismantler.Manager	CE.Dismantler.Manager
7d41c72f-5242-4168-828d-8b1c87c472e3	CE.Dismantler.Buy	2022-03-24 18:01:33.284	2022-03-24 18:01:33.284	CE.Dismantler.Buy	CE.Dismantler.Buy
ac6860f4-770b-4228-9a59-580d538490ff	CE.Dismantler.Seller	2022-03-24 18:01:33.286	2022-03-24 18:01:33.286	CE.Dismantler.Seller	CE.Dismantler.Seller
b05d86e1-6c98-4619-85fa-9a425e0800b6	BUSINESS_ADMIN	2022-03-24 18:01:33.26	2022-03-24 18:01:33.26	Unternehmensadministrator	Business Admin
\.


--
-- Data for Name: app_assigned_company_user_roles; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY portal.app_assigned_company_user_roles (app_id, company_user_role_id) FROM stdin;
\.


--
-- Data for Name: app_licenses; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY portal.app_licenses (app_license_id, date_created, date_last_changed, licensetext) FROM stdin;
ac1cf001-7fbc-1f2f-817f-bce0573f0008	2022-03-24 18:01:33.366	2022-03-24 18:01:33.366	free of charge
ac1cf001-7fbc-1f2f-817f-bce05743000a	2022-03-24 18:01:33.379	2022-03-24 18:01:33.379	free of charge
ac1cf001-7fbc-1f2f-817f-bce05748000c	2022-03-24 18:01:33.383	2022-03-24 18:01:33.383	free of charge
ac1cf001-7fbc-1f2f-817f-bce0574c000e	2022-03-24 18:01:33.387	2022-03-24 18:01:33.387	free of charge
ac1cf001-7fbc-1f2f-817f-bce0574f0010	2022-03-24 18:01:33.39	2022-03-24 18:01:33.39	free of charge
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
\.


--
-- Data for Name: app_assigned_use_cases; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY portal.app_assigned_use_cases (app_id, use_case_id) FROM stdin;
ac1cf001-7fbc-1f2f-817f-bce0572c0007	ac1cf001-7fbc-1f2f-817f-bce056fa0001
ac1cf001-7fbc-1f2f-817f-bce0573f0009	ac1cf001-7fbc-1f2f-817f-bce056f90000
ac1cf001-7fbc-1f2f-817f-bce05744000b	ac1cf001-7fbc-1f2f-817f-bce056f90000
ac1cf001-7fbc-1f2f-817f-bce05748000d	ac1cf001-7fbc-1f2f-817f-bce056fa0001
ac1cf001-7fbc-1f2f-817f-bce0574c000f	ac1cf001-7fbc-1f2f-817f-bce056fa0002
\.


--
-- Data for Name: app_descriptions; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY portal.app_descriptions (date_created, date_last_changed, description_long, description_short, app_id, language_short_name) FROM stdin;
2022-03-24 18:01:33.356	2022-03-24 18:01:33.356	Seamless part traceability through the n.tier supply chain\n\nknowledge you get detailed information about the components of your direct suppliers as well as your direct customers. This lets your answer questions such as:\n\n\n\nWhat's the exact lead time between the produciton of a subcomponent an your own components?\nTo wehre in the world are my components distributed and where are my suppliers located?\nWhat's the exact composition of my component on a unique ID level?\n\n\nBecause all of that is important information. PartChain keeps a storng one-up, one-down visibilty rule. You and the other parties in the network always see - only their suppliers customers data well as own ata. Your competitors won't be able to get any sensitive information about your production data.	CX App Part Chain Details	ac1cf001-7fbc-1f2f-817f-bce0572c0007	en
2022-03-24 18:01:33.376	2022-03-24 18:01:33.376	The SAP Circular Economy Application for the Catena-X comprises different solutions to collaborate on digital twin information across the entire lifecycle, be it a component, a part or an entire vehicle.\n\n\n\nAt the core of the application is SAPs Digital Vehicle Hub powered by the SAP Asset Intelligence Network, which integrates and interacts seamlessly along the automotive & mobility value chain. The application contains pre-delivered content for a vehicle's structure to easily model vehicle objects (e.g. model data, configuration data, technical data, lifecycle status, location).\n\n\n\nThe solutions help to manage all types of vehicle related master, transactional and usage data to support collaborative business models and processes.	SAP App Dismantler App Details	ac1cf001-7fbc-1f2f-817f-bce0573f0009	en
2022-03-24 18:01:33.38	2022-03-24 18:01:33.38	The SAP Circular Economy Application for the Catena-X comprises different solutions to collaborate on digital twin information across the entire lifecycle, be it a component, a part or an entire vehicle.\n\n\n\nAt the core of the application is SAPs Digital Vehicle Hub powered by the SAP Asset Intelligence Network, which integrates and interacts seamlessly along the automotive & mobility value chain. The application contains pre-delivered content for a vehicle's structure to easily model vehicle objects (e.g. model data, configuration data, technical data, lifecycle status, location).\n\n\n\nThe solutions help to manage all types of vehicle related master, transactional and usage data to support collaborative business models and processes.	SAP App CE Marketplace Details	ac1cf001-7fbc-1f2f-817f-bce05744000b	en
2022-03-24 18:01:33.384	2022-03-24 18:01:33.384	Description\n\nCreate an Intelligent Enterprise with Advanced Logistic collabration and Insights. SAP Logistics Business Network, material traceability options connect partners for inter-company collaboration and transparency. It supports a comprehensive set capabilities, allowing to manage freight more efficiently, benefit form situational awareness through track and trace, and create a trust chain for up- and downstream product genealogy.	SAP App Material Traceability Details	ac1cf001-7fbc-1f2f-817f-bce05748000d	en
2022-03-24 18:01:33.388	2022-03-24 18:01:33.388	Automotive suppliers must constantly monitor product performance and resolve quality issues quickly to ensure they don’t face costly claims. For quality analysts and engineers this involves a long, manual process of analyzing claims and failed parts that lacks vital information — including live vehicle data(such as Diagnostic Trouble Codes). Identifying root-cause issues is complex, issue resolution is slow, and costs quickly escalate. Component Performance Monitor (CPM) enables suppliers to better manage quality risk and significantly reduce the costs incurred from faulty parts by leveraging near-live vehicle data, empowering quality experts to:\n\nIdentify failure patterns and root- cause quality issues in real time\nMonitor the effectiveness of remediation measures in the fleet using live vehicle data\nand proactively request faulty parts for further analysis.\n\n...all in a single collaborative interface that supercharges the supplier to OEM feedback cycle, leading to faster proactive issue resolution, a reduction in claims, and better customer experiences.	BMW App Component Performance Monitor Details	ac1cf001-7fbc-1f2f-817f-bce0574c000f	en
\.


--
-- Data for Name: company_applications; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY portal.company_applications (company_application_id, date_created, date_last_changed, application_status_id, company_id) FROM stdin;
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
\.


--
-- Data for Name: company_assigned_use_cases; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY portal.company_assigned_use_cases (company_id, use_case_id) FROM stdin;
2dc4249f-b5ca-4d42-bef1-7a7a950a4f87	ac1cf001-7fbc-1f2f-817f-bce056f90000
2dc4249f-b5ca-4d42-bef1-7a7a950a4f87	ac1cf001-7fbc-1f2f-817f-bce056fa0001
2dc4249f-b5ca-4d42-bef1-7a7a950a4f87	ac1cf001-7fbc-1f2f-817f-bce056fa0002
ac861325-bc54-4583-bcdc-9e9f2a38ff84	ac1cf001-7fbc-1f2f-817f-bce056f90000
ac861325-bc54-4583-bcdc-9e9f2a38ff84	ac1cf001-7fbc-1f2f-817f-bce056fa0001
ac861325-bc54-4583-bcdc-9e9f2a38ff84	ac1cf001-7fbc-1f2f-817f-bce056fa0002
0dcd8209-85e2-4073-b130-ac094fb47106	ac1cf001-7fbc-1f2f-817f-bce056f90000
0dcd8209-85e2-4073-b130-ac094fb47106	ac1cf001-7fbc-1f2f-817f-bce056fa0001
0dcd8209-85e2-4073-b130-ac094fb47106	ac1cf001-7fbc-1f2f-817f-bce056fa0002
\.


--
-- Data for Name: company_users; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY portal.company_users (company_user_id, date_created, date_last_changed, email, firstname, lastlogin, lastname, company_id) FROM stdin;
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

COPY portal.documents (document_id, date_created, date_last_changed, document, documenthash, documentname, documentuploaddate, documentversion, company_user_id) FROM stdin;
\.


--
-- Data for Name: consents; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY portal.consents (consent_id, date_created, date_last_changed, comment, consent_status_id, target, "timestamp", agreement_id, company_id, documents_id, company_user_id) FROM stdin;
\.


--
-- Data for Name: invitations; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY portal.invitations (invitation_id, date_created, date_last_changed, invitation_status_id, company_application_id, company_user_id) FROM stdin;
bd0d0302-3ec8-4bfe-99db-b89bdb6c4b94	2022-03-24 18:01:33.408	2022-03-24 18:01:33.408	1	4f0146c6-32aa-4bb1-b844-df7e8babdcb6	ac1cf001-7fbc-1f2f-817f-bce0575a0011
3106e610-2740-4b5c-946c-5258b7a58a6c	2022-03-24 18:01:33.431	2022-03-24 18:01:33.431	1	0195a85f-e465-4571-b980-d1351dd76a9f	ac1cf001-7fbc-1f2f-817f-bce057770013
d54db875-774c-479f-9f14-375f2cb8b257	2022-03-24 18:01:33.439	2022-03-24 18:01:33.439	1	6b2d1263-c073-4a48-bfaf-704dc154ca9a	ac1cf001-7fbc-1f2f-817f-bce0577e0015
\.

