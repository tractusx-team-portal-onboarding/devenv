--
-- PostgreSQL database dump
--

-- Dumped from database version 14.2 (Debian 14.2-1.pgdg110)
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
SET time zone 'UTC';



--
-- Data for Name: addresses; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY portal.addresses (id, date_created, date_last_changed, city, region, streetadditional, streetname, streetnumber, zipcode, country_alpha2code) FROM stdin;
b4db3945-19a7-4a50-97d6-e66e8dfd04fb	2022-03-24 18:01:33.306	2022-03-24 18:01:33.306	Munich	\N	\N	Street	1	00001	DE
12302f9b-418c-4b8c-aea8-3eedf67e6a02	2022-03-24 18:01:33.341	2022-03-24 18:01:33.341	Munich	\N	\N	Street	2	00001	DE
3a52099d-4988-4a56-9787-10a669c41338	2022-03-24 18:01:33.344	2022-03-24 18:01:33.344	Munich	\N	\N	Street	3	00001	DE
aa49c0ec-4e65-4115-a01c-7adfc36d220e	2022-03-24 18:01:33.391	2022-03-24 18:01:33.391	Munich	\N	\N	Street	4	00001	DE
c0e1d802-0c4b-4d0d-a763-b6d9d56e6f07	2022-03-24 18:01:33.428	2022-03-24 18:01:33.428	Munich	\N	\N	Street	5	00001	DE
86da3e1c-a634-41a6-ad44-9880746123e4	2022-03-24 18:01:33.435	2022-03-24 18:01:33.435	Munich	\N	\N	Street	6	00001	DE
0f562ea7-4cc1-47a9-bfee-b41b0ac67ebb	2022-03-24 18:01:33.443	2022-03-24 18:01:33.443	Munich	\N	\N	Street	7	00001	DE
095ca573-bef1-4092-ad60-b7f651678fcd	2022-03-24 18:01:33.428	2022-03-24 18:01:33.428	Munich	\N	\N	Street	8	00001	DE
081c8bfd-c6d1-4119-a5f8-a69726dfc11d	2022-03-24 18:01:33.428	2022-03-24 18:01:33.428	Munich	\N	\N	Street	9	00001	DE
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
cac8fa6a-9db7-4bad-9cbd-56298b74bac2	2022-03-24 18:01:33.442	CAXLBOSCHZZ	0000000000	BOSCH	\N	BOSCH	1	081c8bfd-c6d1-4119-a5f8-a69726dfc11d
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
ac1cf001-7fbc-1f2f-817f-bce0572c0007	2022-03-24 18:01:33.348	Part Chain	2022-03-24 18:01:33.348	\N	\N	\N	\N	\N	BMW	ac861325-bc54-4583-bcdc-9e9f2a38ff84	1
ac1cf001-7fbc-1f2f-817f-bce05748000d	2022-03-24 18:01:33.384	Material Traceability	2022-03-24 18:01:33.384	\N	\N	\N	\N	\N	Catena-X	2dc4249f-b5ca-4d42-bef1-7a7a950a4f87	1
ac1cf001-7fbc-1f2f-817f-bce0573f0009	2022-03-24 18:01:33.375	Dismantler Cockpit	2022-03-24 18:01:33.375	\N	https://dismantler-cockpit.d13fe27.kyma.ondemand.com	\N	support@sap.com	\N	SAP	0dcd8209-85e2-4073-b130-ac094fb47106	1
ac1cf001-7fbc-1f2f-817f-bce05744000b	2022-03-24 18:01:33.38	Project Implementation: Earth Commerce	2022-03-24 18:01:33.38	CE_Marketplace_LP.png	https://catenax-dt-rec.authentication.eu10.hana.ondemand.com/login	\N	support@sap.com	\N	SAP	0dcd8209-85e2-4073-b130-ac094fb47106	1
ac1cf001-7fbc-1f2f-817f-bce0574c000f	2022-03-24 18:01:33.388	Component Performance	2022-03-24 18:01:33.388	\N	https://impact.bmw.cloud/workspace/carbon/ri.carbon.main.workspace.7d7f6c71-3981-4b78-b731-1b4c8f243c97/ri.workshop.main.module.c9beba25-4387-40dd-9e59-8c4e3b3df3ff	\N	\N	\N	Catena-X	ac861325-bc54-4583-bcdc-9e9f2a38ff84	1
f9cad59d-84b3-4880-a550-4072c26a6b93	2022-03-24 18:01:33.388	Fraud Dashboard	2022-03-24 18:01:33.388	\N	https://dash.catenax-cdq.com/	\N	\N	\N	Catena-X	2dc4249f-b5ca-4d42-bef1-7a7a950a4f87	1
f9cad59d-84b3-4880-a550-4072c26a6b94	2022-03-24 18:01:33.388	Fraud Reporter	2022-03-24 18:01:33.388	\N	https://apps.cdq.com/dashboard/fraud/report-fraud	\N	\N	\N	Catena-X	2dc4249f-b5ca-4d42-bef1-7a7a950a4f87	1
8488044e-b8df-403a-9cbd-16dad7e4a08c	2022-03-24 18:01:33.388	Covanto - AFQM	2022-03-24 18:01:33.388	\N	https://portal-staging.afqm-services.com/	\N	\N	\N	Catena-X	cac8fa6a-9db7-4bad-9cbd-56298b74bac2	1
5cf74ef8-e0b7-4984-a872-474828beb5d8	2022-03-24 18:01:33.388	Test MultiApp	2022-03-24 18:01:33.388	\N	\N	\N	\N	\N	Catena-X	2dc4249f-b5ca-4d42-bef1-7a7a950a4f87	1
5cf74ef8-e0b7-4984-a872-474828beb5d1	2022-03-24 18:01:33.388	Smart MOM	2022-03-24 18:01:33.388	logo-GEC.jpg	\N	\N	info@gec.io	+49 69 24747180	German Edge Cloud GmbH & Co. KG	2dc4249f-b5ca-4d42-bef1-7a7a950a4f87	1
5cf74ef8-e0b7-4984-a872-474828beb5d2	2022-03-24 18:01:33.388	DTC-Translator	2022-03-24 18:01:33.388	DTC-Translator_LP.svg	https://dtc-translator.adac.openresearch.com	\N	gerd.preuss@adac.de	\N	ADAC	2dc4249f-b5ca-4d42-bef1-7a7a950a4f87	1
5cf74ef8-e0b7-4984-a872-474828beb5d3	2022-03-24 18:01:33.388	Fleet Manager	2022-03-24 18:01:33.388	Fleet_Manager_LP.png	https://fleet-management.adac.openresearch.com	\N	gerd.preuss@adac.de	\N	ADAC	2dc4249f-b5ca-4d42-bef1-7a7a950a4f87	1
\.


-- Name: app_detail_image; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY portal.app_detail_images (id, app_id, image_url) FROM stdin;
5cf74ef8-a0a1-0000-a000-000000000001	5cf74ef8-e0b7-4984-a872-474828beb5d1	GEC_smartMOM_Maschinenzustaende.png
5cf74ef8-a0a1-0000-a000-000000000002	5cf74ef8-e0b7-4984-a872-474828beb5d1	GEC_smartMOM_Auftragsdetails.png
5cf74ef8-a0a1-0000-a000-000000000003	5cf74ef8-e0b7-4984-a872-474828beb5d1	GEC_smartMOM_SN_Buchung.png
5cf74ef8-a0a1-0000-a000-000000000004	5cf74ef8-e0b7-4984-a872-474828beb5d3	Fleet_Manager_Image1.png
5cf74ef8-a0a1-0000-a000-000000000005	5cf74ef8-e0b7-4984-a872-474828beb5d2	DTC-Translator_Image1.png
5cf74ef8-a0a1-0000-a000-000000000006	5cf74ef8-e0b7-4984-a872-474828beb5d2	DTC-Translator_Image2.png
5cf74ef8-a0a1-0000-a000-000000000007	ac1cf001-7fbc-1f2f-817f-bce05744000b	CE_Marketplace_Image1.png
5cf74ef8-a0a1-0000-a000-000000000008	ac1cf001-7fbc-1f2f-817f-bce05744000b	CE_Marketplace_Image2.png
5cf74ef8-a0a1-0000-a000-000000000009	ac1cf001-7fbc-1f2f-817f-bce05744000b	CE_Marketplace_Image3.png
\.


--
-- Data for Name: app_tags; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY portal.app_tags (app_id, tag_name) FROM stdin;
ac1cf001-7fbc-1f2f-817f-bce0572c0007	Traceability
ac1cf001-7fbc-1f2f-817f-bce05748000d	Traceability
ac1cf001-7fbc-1f2f-817f-bce0573f0009	Dismantler
ac1cf001-7fbc-1f2f-817f-bce0573f0009	Circular Economy
ac1cf001-7fbc-1f2f-817f-bce0574c000f	Test
f9cad59d-84b3-4880-a550-4072c26a6b93	Data
f9cad59d-84b3-4880-a550-4072c26a6b93	Business Partner
f9cad59d-84b3-4880-a550-4072c26a6b93	Partner Network
8488044e-b8df-403a-9cbd-16dad7e4a08c	Traceability
5cf74ef8-e0b7-4984-a872-474828beb5d8	Test
5cf74ef8-e0b7-4984-a872-474828beb5d1	Traceability
5cf74ef8-e0b7-4984-a872-474828beb5d2	Behavior Twin
5cf74ef8-e0b7-4984-a872-474828beb5d3	Behavior Twin
ac1cf001-7fbc-1f2f-817f-bce05744000b	Dismantler
ac1cf001-7fbc-1f2f-817f-bce05744000b	Circular Economy
\.


--
-- Data for Name: app_languages; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY portal.app_languages (app_id, language_short_name) FROM stdin;
5cf74ef8-e0b7-4984-a872-474828beb5d1	de
5cf74ef8-e0b7-4984-a872-474828beb5d1	en
5cf74ef8-e0b7-4984-a872-474828beb5d2	en
5cf74ef8-e0b7-4984-a872-474828beb5d3	en
f9cad59d-84b3-4880-a550-4072c26a6b93	de
f9cad59d-84b3-4880-a550-4072c26a6b93	en
f9cad59d-84b3-4880-a550-4072c26a6b94	de
f9cad59d-84b3-4880-a550-4072c26a6b94	en
ac1cf001-7fbc-1f2f-817f-bce05744000b	en
ac1cf001-7fbc-1f2f-817f-bce0573f0009	en
\.


--
-- Data for Name: agreements; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY portal.agreements (agreement_category_id, id, date_created, date_last_changed, agreement_type, name, app_id, issuer_company_id, use_case_id) FROM stdin;
1	aa0a0000-7fbc-1f2f-817f-bce0502c1010	2022-03-24 18:01:33.388	2022-03-24 18:01:33.388	\N	Terms & Conditions - Active Participant	\N	2dc4249f-b5ca-4d42-bef1-7a7a950a4f87	1aacde78-35ec-4df3-ba1e-f988cddcbbd9
1	aa0a0000-7fbc-1f2f-817f-bce0502c1011	2022-03-24 18:01:33.388	2022-03-24 18:01:33.388	\N	Terms & Conditions - App Provider	\N	2dc4249f-b5ca-4d42-bef1-7a7a950a4f87	1aacde78-35ec-4df3-ba1e-f988cddcbbd9
1	aa0a0000-7fbc-1f2f-817f-bce0502c1012	2022-03-24 18:01:33.388	2022-03-24 18:01:33.388	\N	Terms & Conditions - Consultant	\N	2dc4249f-b5ca-4d42-bef1-7a7a950a4f87	1aacde78-35ec-4df3-ba1e-f988cddcbbd9
1	aa0a0000-7fbc-1f2f-817f-bce0502c1013	2022-03-24 18:01:33.388	2022-03-24 18:01:33.388	\N	Security Regulations - Active Participant	\N	2dc4249f-b5ca-4d42-bef1-7a7a950a4f87	1aacde78-35ec-4df3-ba1e-f988cddcbbd9
\.


--
-- Data for Name: agreement_assigned_company_roles; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY portal.agreement_assigned_company_roles (agreement_id, company_role_id) FROM stdin;
aa0a0000-7fbc-1f2f-817f-bce0502c1010	1
aa0a0000-7fbc-1f2f-817f-bce0502c1011	2
aa0a0000-7fbc-1f2f-817f-bce0502c1013	1
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

COPY portal.iam_clients (id, client_client_id) FROM stdin;
0c9051d0-d032-11ec-9d64-0242ac120002	catenax-portal
f032a034-d035-11ec-9d64-0242ac120002	catenax-registration
\.

COPY portal.company_user_roles (id, company_user_role, iam_client_id) FROM stdin;
7410693c-c893-409e-852f-9ee886ce94a6	Company Admin	f032a034-d035-11ec-9d64-0242ac120002
58f897ec-0aad-4588-8ffa-5f45d6638632	CX Admin	0c9051d0-d032-11ec-9d64-0242ac120002
58f897ec-0aad-4588-8ffa-5f45d6638633	CX User	0c9051d0-d032-11ec-9d64-0242ac120002
607818be-4978-41f4-bf63-fa8d2de51154	IT Admin	0c9051d0-d032-11ec-9d64-0242ac120002
ceec23fd-6b26-485c-a4bb-90571a29e148	Signing Manager	f032a034-d035-11ec-9d64-0242ac120002
95fe4014-4d1b-47af-a22e-72a12f9470db	Developer	0c9051d0-d032-11ec-9d64-0242ac120002
04231a30-df50-4d14-bb00-71ff012ae0cf	Data Specialist	0c9051d0-d032-11ec-9d64-0242ac120002
3ff68c40-6581-4e48-a03a-2a6c1c5aac89	APP_ADMIN	0c9051d0-d032-11ec-9d64-0242ac120002
efc20368-9e82-46ff-b88f-6495b9810253	Vehicle Purchaser	0c9051d0-d032-11ec-9d64-0242ac120002
aabcdfeb-6669-4c74-89f0-19cda090873f	Dismantling Lead	0c9051d0-d032-11ec-9d64-0242ac120002
efc20368-9e82-46ff-b88f-6495b9810250	Buyer	0c9051d0-d032-11ec-9d64-0242ac120002
aabcdfeb-6669-4c74-89f0-19cda0908730	Advanced Buyer	0c9051d0-d032-11ec-9d64-0242ac120002
7d41c72f-5242-4168-828d-8b1c87c472e0	Content Manager	0c9051d0-d032-11ec-9d64-0242ac120002
ac6860f4-770b-4228-9a59-580d538490f0	Customer Administrator	0c9051d0-d032-11ec-9d64-0242ac120002
b05d86e1-6c98-4619-85fa-9a425e0800b6	Business Admin	0c9051d0-d032-11ec-9d64-0242ac120002
\.


COPY portal.company_user_role_descriptions (company_user_role_id, language_short_name, description) FROM stdin;
7410693c-c893-409e-852f-9ee886ce94a6	de	Unternehmensadministrator
7410693c-c893-409e-852f-9ee886ce94a6	en	Company Admin
58f897ec-0aad-4588-8ffa-5f45d6638632	de	CX Admin
58f897ec-0aad-4588-8ffa-5f45d6638632	en	CX Admin
58f897ec-0aad-4588-8ffa-5f45d6638633	de	CX User
58f897ec-0aad-4588-8ffa-5f45d6638633	en	CX User
607818be-4978-41f4-bf63-fa8d2de51154	de	IT Administrator
607818be-4978-41f4-bf63-fa8d2de51154	en	IT Admin
ceec23fd-6b26-485c-a4bb-90571a29e148	de	Signing Manager
ceec23fd-6b26-485c-a4bb-90571a29e148	en	Signing Manager
95fe4014-4d1b-47af-a22e-72a12f9470db	de	Entwickler
95fe4014-4d1b-47af-a22e-72a12f9470db	en	Developer
04231a30-df50-4d14-bb00-71ff012ae0cf	de	Data Specialist
04231a30-df50-4d14-bb00-71ff012ae0cf	en	Data Specialist
3ff68c40-6581-4e48-a03a-2a6c1c5aac89	de	App(Store) Administrator
3ff68c40-6581-4e48-a03a-2a6c1c5aac89	en	App(store) Admin
efc20368-9e82-46ff-b88f-6495b9810253	de	Vehicle Purchaser
efc20368-9e82-46ff-b88f-6495b9810253	en	Vehicle Purchaser
aabcdfeb-6669-4c74-89f0-19cda090873f	de	Dismantling Lead
aabcdfeb-6669-4c74-89f0-19cda090873f	en	Dismantling Lead
efc20368-9e82-46ff-b88f-6495b9810250	de	Einkäufer
efc20368-9e82-46ff-b88f-6495b9810250	en	Buyer
aabcdfeb-6669-4c74-89f0-19cda0908730	de	Advanced Buyer
aabcdfeb-6669-4c74-89f0-19cda0908730	en	Advanced Buyer
7d41c72f-5242-4168-828d-8b1c87c472e0	de	Content Manager
7d41c72f-5242-4168-828d-8b1c87c472e0	en	Content Manager
ac6860f4-770b-4228-9a59-580d538490f0	de	Customer Administrator
ac6860f4-770b-4228-9a59-580d538490f0	en	Customer Administrator
b05d86e1-6c98-4619-85fa-9a425e0800b6	de	Unternehmensadministrator
b05d86e1-6c98-4619-85fa-9a425e0800b6	en	Business Admin
\.


--
-- Data for Name: app_assigned_company_user_roles; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY portal.app_assigned_company_user_roles (app_id, company_user_role_id) FROM stdin;
ac1cf001-7fbc-1f2f-817f-bce0573f0009	efc20368-9e82-46ff-b88f-6495b9810253
ac1cf001-7fbc-1f2f-817f-bce0573f0009	aabcdfeb-6669-4c74-89f0-19cda090873f
ac1cf001-7fbc-1f2f-817f-bce05744000b	efc20368-9e82-46ff-b88f-6495b9810250
ac1cf001-7fbc-1f2f-817f-bce05744000b	aabcdfeb-6669-4c74-89f0-19cda0908730
ac1cf001-7fbc-1f2f-817f-bce05744000b	7d41c72f-5242-4168-828d-8b1c87c472e0
ac1cf001-7fbc-1f2f-817f-bce05744000b	ac6860f4-770b-4228-9a59-580d538490f0
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
5cf74ef8-e0b7-4984-a872-474828beb5d1	free of charge
5cf74ef8-e0b7-4984-a872-474828beb5d2	free of charge
5cf74ef8-e0b7-4984-a872-474828beb5d3	free of charge
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
5cf74ef8-e0b7-4984-a872-474828beb5d2	1aacde78-35ec-4df3-ba1e-f988cddcbbd9
5cf74ef8-e0b7-4984-a872-474828beb5d3	1aacde78-35ec-4df3-ba1e-f988cddcbbd9
f9cad59d-84b3-4880-a550-4072c26a6b94	6909ccc7-37c8-4088-99ab-790f20702460
\.


--
-- Data for Name: app_descriptions; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY portal.app_descriptions (description_long, description_short, app_id, language_short_name) FROM stdin;
Seamless part traceability through the n.tier supply chain\n\nknowledge you get detailed information about the components of your direct suppliers as well as your direct customers. This lets your answer questions such as:\n\n\n\nWhat's the exact lead time between the produciton of a subcomponent an your own components?\nTo wehre in the world are my components distributed and where are my suppliers located?\nWhat's the exact composition of my component on a unique ID level?\n\n\nBecause all of that is important information. PartChain keeps a storng one-up, one-down visibilty rule. You and the other parties in the network always see - only their suppliers customers data well as own ata. Your competitors won't be able to get any sensitive information about your production data.	CX App Part Chain Details	ac1cf001-7fbc-1f2f-817f-bce0572c0007	en
The Dismantler Cockpit provides decision support for Vehicle Purchaser and Dismantling lead. At a dismantling company, these are responsible for the procurement of end-of-life vehicles and the decisions on reuse, remanufacture or recycling of the whole vehicle, or of parts and components. The Dismantler Cockpit support these decisions by fetching data about a specific vehicle from the Catena-X-network and presenting the most relevant information about the potential of the vehicle and its components: The structure of the vehicle and the parts it contains are presented by visualizing the "Digital Twins" available from the OEM and the suppliers of the components (e.g. gearbox, high voltage battery). KPIs such as the material composition of the vehicle further serve to analyze the commercial potential in a circular value chain.	Dismantler buy decision and 3R strategy decision support	ac1cf001-7fbc-1f2f-817f-bce0573f0009	en
Cross-industry trading platform for buying and selling secondary components and materials, opening new opportunities for collaborating across the value chain and closing the loop on component and material level.	platform for buying and selling secondary components and materials	ac1cf001-7fbc-1f2f-817f-bce05744000b	en
Description\n\nCreate an Intelligent Enterprise with Advanced Logistic collabration and Insights. SAP Logistics Business Network, material traceability options connect partners for inter-company collaboration and transparency. It supports a comprehensive set capabilities, allowing to manage freight more efficiently, benefit form situational awareness through track and trace, and create a trust chain for up- and downstream product genealogy.	SAP App Material Traceability Details	ac1cf001-7fbc-1f2f-817f-bce05748000d	en
Automotive suppliers must constantly monitor product performance and resolve quality issues quickly to ensure they do not face costly claims. For quality analysts and engineers this involves a long, manual process of analyzing claims and failed parts that lacks vital information - including live vehicle data(such as Diagnostic Trouble Codes). Identifying root-cause issues is complex, issue resolution is slow, and costs quickly escalate. Component Performance Monitor (CPM) enables suppliers to better manage quality risk and significantly reduce the costs incurred from faulty parts by leveraging near-live vehicle data, empowering quality experts to:\n\nIdentify failure patterns and root- cause quality issues in real time\nMonitor the effectiveness of remediation measures in the fleet using live vehicle data\nand proactively request faulty parts for further analysis.\n\n...all in a single collaborative interface that supercharges the supplier to OEM feedback cycle, leading to faster proactive issue resolution, a reduction in claims, and better customer experiences.	BMW App Component Performance Monitor Details	ac1cf001-7fbc-1f2f-817f-bce0574c000f	en
The service provides information about new bank account fraud cases (e.g. invoices with fake bank details) reported by companies to the community.	Dashboard to manage and monitor fraud cases	f9cad59d-84b3-4880-a550-4072c26a6b93	en
Automatic monitoring (Early Warning System) of diagnostic data	Automatic monitoring (Early Warning System) of diagnostic data	8488044e-b8df-403a-9cbd-16dad7e4a08c	en
Works with multiple use cases	Works with multiple use cases	5cf74ef8-e0b7-4984-a872-474828beb5d8	en
smart MOM (Manufacturing Operations Management) consolidates all production processes and systems for managing manufacturing processes in order to increase efficiency. The smart MOM solution from German Edge Cloud includes various services and enables a holistic production management. This includes, for example, the management of production processes including specific production rules, bill of materials (BOM), recipient data, resource/asset management and much more.	smart MOM can be operated as part of our scalable Edge Cloud data center “GEC Digital Production System”, which can combine various MES (Manufacturing Execution System), MOM functionalities and integration services. Thus, smart MOM can use integrated dat	5cf74ef8-e0b7-4984-a872-474828beb5d1	en
Test	Test	5cf74ef8-e0b7-4984-a872-474828beb5d2	en
Test	Test	5cf74ef8-e0b7-4984-a872-474828beb5d2	de
Test	Test	5cf74ef8-e0b7-4984-a872-474828beb5d3	en
Test	Test	5cf74ef8-e0b7-4984-a872-474828beb5d3	de
The service provides the possibility to create a fraud case (e.g. invoices with fake bank details) and report them to business partners.	Report Fraud Cases	f9cad59d-84b3-4880-a550-4072c26a6b94	en
Test	Test	f9cad59d-84b3-4880-a550-4072c26a6b94	de
Test	Test	ac1cf001-7fbc-1f2f-817f-bce05744000b	de
Test	Test	ac1cf001-7fbc-1f2f-817f-bce0573f0009	de
\.


--
-- Data for Name: company_applications; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY portal.company_applications (id, date_created, date_last_changed, application_status_id, company_id) FROM stdin;
4f0146c6-32aa-4bb1-b844-df7e8babdcb1	2022-03-24 18:01:33.403	2022-03-24 18:01:33.403	8	2dc4249f-b5ca-4d42-bef1-7a7a950a4f87
4f0146c6-32aa-4bb1-b844-df7e8babdcb2	2022-03-24 18:01:33.403	2022-03-24 18:01:33.403	8	ac861325-bc54-4583-bcdc-9e9f2a38ff84
4f0146c6-32aa-4bb1-b844-df7e8babdcb3	2022-03-24 18:01:33.403	2022-03-24 18:01:33.403	8	0dcd8209-85e2-4073-b130-ac094fb47106
4f0146c6-32aa-4bb1-b844-df7e8babdcb4	2022-03-24 18:01:33.403	2022-03-24 18:01:33.403	8	9d049598-0dac-4d26-8a21-8f5b64c799cf
4f0146c6-32aa-4bb1-b844-df7e8babdcb5	2022-03-24 18:01:33.403	2022-03-24 18:01:33.403	8	cac8fa6a-9db7-4bad-9cbd-56298b74bac2
4f0146c6-32aa-4bb1-b844-df7e8babdcb6	2022-03-24 18:01:33.403	2022-03-24 18:01:33.403	7	220330ac-170d-4e22-8d72-9467ed042149
0195a85f-e465-4571-b980-d1351dd76a9f	2022-03-24 18:01:33.431	2022-03-24 18:01:33.431	7	bdac6865-2a8d-4bfd-9373-9dfce8190895
6b2d1263-c073-4a48-bfaf-704dc154ca9a	2022-03-24 18:01:33.439	2022-03-24 18:01:33.439	7	41fd2ab8-71cd-4546-9bef-a388d91b2542
\.


--
-- Data for Name: company_assigned_apps; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY portal.company_assigned_apps (company_id, app_id) FROM stdin;
ac861325-bc54-4583-bcdc-9e9f2a38ff84	ac1cf001-7fbc-1f2f-817f-bce0572c0007
ac861325-bc54-4583-bcdc-9e9f2a38ff84	ac1cf001-7fbc-1f2f-817f-bce05748000d
ac861325-bc54-4583-bcdc-9e9f2a38ff84	ac1cf001-7fbc-1f2f-817f-bce0573f0009
ac861325-bc54-4583-bcdc-9e9f2a38ff84	ac1cf001-7fbc-1f2f-817f-bce05744000b
ac861325-bc54-4583-bcdc-9e9f2a38ff84	ac1cf001-7fbc-1f2f-817f-bce0574c000f
ac861325-bc54-4583-bcdc-9e9f2a38ff84	f9cad59d-84b3-4880-a550-4072c26a6b93
ac861325-bc54-4583-bcdc-9e9f2a38ff84	f9cad59d-84b3-4880-a550-4072c26a6b94
ac861325-bc54-4583-bcdc-9e9f2a38ff84	8488044e-b8df-403a-9cbd-16dad7e4a08c
ac861325-bc54-4583-bcdc-9e9f2a38ff84	5cf74ef8-e0b7-4984-a872-474828beb5d8
ac861325-bc54-4583-bcdc-9e9f2a38ff84	5cf74ef8-e0b7-4984-a872-474828beb5d1
ac861325-bc54-4583-bcdc-9e9f2a38ff84	5cf74ef8-e0b7-4984-a872-474828beb5d2
ac861325-bc54-4583-bcdc-9e9f2a38ff84	5cf74ef8-e0b7-4984-a872-474828beb5d3
2dc4249f-b5ca-4d42-bef1-7a7a950a4f87	ac1cf001-7fbc-1f2f-817f-bce0572c0007
2dc4249f-b5ca-4d42-bef1-7a7a950a4f87	ac1cf001-7fbc-1f2f-817f-bce05748000d
2dc4249f-b5ca-4d42-bef1-7a7a950a4f87	ac1cf001-7fbc-1f2f-817f-bce0573f0009
2dc4249f-b5ca-4d42-bef1-7a7a950a4f87	ac1cf001-7fbc-1f2f-817f-bce05744000b
2dc4249f-b5ca-4d42-bef1-7a7a950a4f87	ac1cf001-7fbc-1f2f-817f-bce0574c000f
2dc4249f-b5ca-4d42-bef1-7a7a950a4f87	f9cad59d-84b3-4880-a550-4072c26a6b93
2dc4249f-b5ca-4d42-bef1-7a7a950a4f87	f9cad59d-84b3-4880-a550-4072c26a6b94
2dc4249f-b5ca-4d42-bef1-7a7a950a4f87	8488044e-b8df-403a-9cbd-16dad7e4a08c
2dc4249f-b5ca-4d42-bef1-7a7a950a4f87	5cf74ef8-e0b7-4984-a872-474828beb5d8
2dc4249f-b5ca-4d42-bef1-7a7a950a4f87	5cf74ef8-e0b7-4984-a872-474828beb5d1
2dc4249f-b5ca-4d42-bef1-7a7a950a4f87	5cf74ef8-e0b7-4984-a872-474828beb5d2
2dc4249f-b5ca-4d42-bef1-7a7a950a4f87	5cf74ef8-e0b7-4984-a872-474828beb5d3
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

COPY portal.company_users (id, date_created, date_last_changed, email, firstname, lastlogin, lastname, company_id, company_user_status_id) FROM stdin;
ac1cf001-7fbc-1f2f-817f-bce0575a0011	2022-03-24 18:01:33.394	2022-03-24 18:01:33.394	\N	\N	\N	\N	220330ac-170d-4e22-8d72-9467ed042149	1
ac1cf001-7fbc-1f2f-817f-bce057770013	2022-03-24 18:01:33.431	2022-03-24 18:01:33.431	\N	\N	\N	\N	bdac6865-2a8d-4bfd-9373-9dfce8190895	1
ac1cf001-7fbc-1f2f-817f-bce0577e0015	2022-03-24 18:01:33.438	2022-03-24 18:01:33.438	\N	\N	\N	\N	41fd2ab8-71cd-4546-9bef-a388d91b2542	1
ac1cf001-7fbc-1f2f-817f-bce058020000	2022-03-24 18:01:33.57	2022-03-24 18:01:33.57	julia.jeroch@bmw.de	Test User	\N	CX User	2dc4249f-b5ca-4d42-bef1-7a7a950a4f87	1
ac1cf001-7fbc-1f2f-817f-bce058020001	2022-03-24 18:01:33.57	2022-03-24 18:01:33.57	julia.jeroch@bmw.de	Test User	\N	CX Admin	2dc4249f-b5ca-4d42-bef1-7a7a950a4f87	1
\.


--
-- Data for Name: company_user_assigned_app_favourites; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY portal.company_user_assigned_app_favourites (company_user_id, app_id) FROM stdin;
ac1cf001-7fbc-1f2f-817f-bce058020000	f9cad59d-84b3-4880-a550-4072c26a6b93
ac1cf001-7fbc-1f2f-817f-bce058020000	f9cad59d-84b3-4880-a550-4072c26a6b94
ac1cf001-7fbc-1f2f-817f-bce058020001	f9cad59d-84b3-4880-a550-4072c26a6b93
ac1cf001-7fbc-1f2f-817f-bce058020001	f9cad59d-84b3-4880-a550-4072c26a6b94
\.


--
-- Data for Name: company_user_assigned_roles; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY portal.company_user_assigned_roles (company_user_id, user_role_id) FROM stdin;
ac1cf001-7fbc-1f2f-817f-bce0575a0011	b05d86e1-6c98-4619-85fa-9a425e0800b6
ac1cf001-7fbc-1f2f-817f-bce057770013	b05d86e1-6c98-4619-85fa-9a425e0800b6
ac1cf001-7fbc-1f2f-817f-bce0577e0015	b05d86e1-6c98-4619-85fa-9a425e0800b6
ac1cf001-7fbc-1f2f-817f-bce058020000	efc20368-9e82-46ff-b88f-6495b9810253
ac1cf001-7fbc-1f2f-817f-bce058020000	aabcdfeb-6669-4c74-89f0-19cda090873f
ac1cf001-7fbc-1f2f-817f-bce058020000	58f897ec-0aad-4588-8ffa-5f45d6638633
ac1cf001-7fbc-1f2f-817f-bce058020001	58f897ec-0aad-4588-8ffa-5f45d6638632
ac1cf001-7fbc-1f2f-817f-bce058020001	efc20368-9e82-46ff-b88f-6495b9810253
ac1cf001-7fbc-1f2f-817f-bce058020001	aabcdfeb-6669-4c74-89f0-19cda090873f
\.


--
-- Data for Name: documents; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY portal.documents (id, date_created, document, documenthash, documentname, document_type_id, company_user_id) FROM stdin;
\.


--
-- Data for Name: consents; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY portal.consents (id, date_created, comment, consent_status_id, target, agreement_id, company_id, document_id, company_user_id) FROM stdin;
ac1cf001-7fbc-1f2f-817f-bce0575a0100	2022-03-24 18:01:33.394	\N	1	\N	aa0a0000-7fbc-1f2f-817f-bce0502c1010	0dcd8209-85e2-4073-b130-ac094fb47106	\N	ac1cf001-7fbc-1f2f-817f-bce0575a0011
ac1cf001-7fbc-1f2f-817f-bce0575a0101	2022-03-24 18:01:33.394	\N	1	\N	aa0a0000-7fbc-1f2f-817f-bce0502c1011	0dcd8209-85e2-4073-b130-ac094fb47106	\N	ac1cf001-7fbc-1f2f-817f-bce0575a0011
ac1cf001-7fbc-1f2f-817f-bce0575a0102	2022-03-24 18:01:33.394	\N	1	\N	aa0a0000-7fbc-1f2f-817f-bce0502c1012	0dcd8209-85e2-4073-b130-ac094fb47106	\N	ac1cf001-7fbc-1f2f-817f-bce0575a0011
\.

--
-- Data for Name: identity_provider_users; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY portal.iam_users (user_entity_id, company_user_id) FROM stdin;
ad56702b-5908-44eb-a668-9a11a0e100d6	ac1cf001-7fbc-1f2f-817f-bce0575a0011
e9b1c0e4-953d-4539-b703-dca9e911eab5	ac1cf001-7fbc-1f2f-817f-bce057770013
3432d787-d7c8-46fb-96d7-cc984c6bfaac	ac1cf001-7fbc-1f2f-817f-bce0577e0015
1c6bb65e-5430-403b-8363-8e05b3eeeb46	ac1cf001-7fbc-1f2f-817f-bce058020000
2b89bee9-49b6-4296-bd8c-f5637034ed47	ac1cf001-7fbc-1f2f-817f-bce058020001
\.

--
-- Data for Name: invitations; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY portal.invitations (id, date_created, invitation_status_id, company_application_id, company_user_id) FROM stdin;
bd0d0302-3ec8-4bfe-99db-b89bdb6c4b94	2022-03-24 18:01:33.408	1	4f0146c6-32aa-4bb1-b844-df7e8babdcb6	ac1cf001-7fbc-1f2f-817f-bce0575a0011
3106e610-2740-4b5c-946c-5258b7a58a6c	2022-03-24 18:01:33.431	1	0195a85f-e465-4571-b980-d1351dd76a9f	ac1cf001-7fbc-1f2f-817f-bce057770013
d54db875-774c-479f-9f14-375f2cb8b257	2022-03-24 18:01:33.439	1	6b2d1263-c073-4a48-bfaf-704dc154ca9a	ac1cf001-7fbc-1f2f-817f-bce0577e0015
\.
