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
SET time zone 'UTC';



--
-- Data for Name: addresses; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY portal.addresses (id, date_created, date_last_changed, city, region, streetadditional, streetname, streetnumber, zipcode, country_alpha2code) FROM stdin;
b4db3945-19a7-4a50-97d6-e66e8dfd04fb	2022-03-24 18:01:33.306	2022-03-24 18:01:33.306	Munich	\N	\N	Street	1	00001	DE
b4db3945-19a7-4a50-97d6-e66e8dfd04fc	2022-03-24 18:01:33.306	2022-03-24 18:01:33.306	Munich	\N	\N	Street	1	00001	DE
b4db3945-19a7-4a50-97d6-e66e8dfd04fd	2022-03-24 18:01:33.306	2022-03-24 18:01:33.306	Munich	\N	\N	Street	1	00001	DE
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

COPY portal.companies (id, date_created, business_partner_number, tax_id, name, shortname, company_status_id, address_id) FROM stdin;
2dc4249f-b5ca-4d42-bef1-7a7a950a4f87	2022-03-24 18:01:33.306	CAXSDUMMYCATENAZZ	0000000000	Catena-X	Catena-X	1	b4db3945-19a7-4a50-97d6-e66e8dfd04fb
ac861325-bc54-4583-bcdc-9e9f2a38ff84	2022-03-24 18:01:33.341	CAXSDUMMYBMWZZ	0000000000	Bayerische Motorenwerke AG	BMW AG	1	12302f9b-418c-4b8c-aea8-3eedf67e6a02
0dcd8209-85e2-4073-b130-ac094fb47106	2022-03-24 18:01:33.344	CAXSDUMMYSAPZZ	0000000000	SAP AG	SAP	1	3a52099d-4988-4a56-9787-10a669c41338
220330ac-170d-4e22-8d72-9467ed042149	2022-03-24 18:01:33.393	CAXSCARFACTORY1ZZ	0000000000	Car Factory 1	Car Factory 1	1	aa49c0ec-4e65-4115-a01c-7adfc36d220e
bdac6865-2a8d-4bfd-9373-9dfce8190895	2022-03-24 18:01:33.43	CAXSCARFACTORY2ZZ	0000000000	Car Factory 2	Car Factory 2	1	c0e1d802-0c4b-4d0d-a763-b6d9d56e6f07
41fd2ab8-71cd-4546-9bef-a388d91b2542	2022-03-24 18:01:33.438	CAXSCARFACTORY3ZZ	0000000000	Car Factory 3	Car Factory 3	1	86da3e1c-a634-41a6-ad44-9880746123e4
d14eba77-0b18-4e41-9d84-49ef875c0763	2022-03-24 18:01:33.442	CAXLDUMMYCORPZZ	0000000000	Dummy Corp. 1	Dummy Corp. 1	1	0f562ea7-4cc1-47a9-bfee-b41b0ac67ebb
9d049598-0dac-4d26-8a21-8f5b64c799cf	2022-03-24 18:01:33.442	CAXLCDQCORPZZ	0000000000	CDQ	CDQ	1	095ca573-bef1-4092-ad60-b7f651678fcd
cac8fa6a-9db7-4bad-9cbd-56298b74bac2	2022-03-24 18:01:33.442	CAXLBOSCHZZ	0000000000	BOSCH	BOSCH	1	081c8bfd-c6d1-4119-a5f8-a69726dfc11d
dfd90abe-b20e-4aff-87c6-f30f2bf9b104	2022-08-08 18:01:33.442	BPNL000000000009	0000000000	Siemens	Siemens	2	b4db3945-19a7-4a50-97d6-e66e8dfd04fc
fe55fe20-5f19-401e-91a2-dfa37b44a0be	2022-08-08 18:01:33.442	BPNL000000000010	0000000000	German Edge Cloud GmbH & Co. KG	GEC	2	b4db3945-19a7-4a50-97d6-e66e8dfd04fd
\.


--
-- Data for Name: agreements; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY portal.agreements (id, agreement_category_id, date_created, date_last_changed, agreement_type, name, issuer_company_id, use_case_id) FROM stdin;
aa0a0000-7fbc-1f2f-817f-bce0502c1010	1	2022-03-24 18:01:33.388	2022-03-24 18:01:33.388	\N	Terms & Conditions - Active Participant	2dc4249f-b5ca-4d42-bef1-7a7a950a4f87	1aacde78-35ec-4df3-ba1e-f988cddcbbd9
aa0a0000-7fbc-1f2f-817f-bce0502c1011	1	2022-03-24 18:01:33.388	2022-03-24 18:01:33.388	\N	Terms & Conditions - App Provider	2dc4249f-b5ca-4d42-bef1-7a7a950a4f87	1aacde78-35ec-4df3-ba1e-f988cddcbbd9
aa0a0000-7fbc-1f2f-817f-bce0502c1012	1	2022-03-24 18:01:33.388	2022-03-24 18:01:33.388	\N	Terms & Conditions - Consultant	2dc4249f-b5ca-4d42-bef1-7a7a950a4f87	1aacde78-35ec-4df3-ba1e-f988cddcbbd9
aa0a0000-7fbc-1f2f-817f-bce0502c1013	1	2022-03-24 18:01:33.388	2022-03-24 18:01:33.388	\N	Security Regulations - Active Participant	2dc4249f-b5ca-4d42-bef1-7a7a950a4f87	1aacde78-35ec-4df3-ba1e-f988cddcbbd9
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
-- Data for Name: offers; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY portal.offers (id, name, date_created, date_released, thumbnail_url, marketing_url, contact_email, contact_number, provider, provider_company_id, offer_status_id, date_last_changed, sales_manager_id, offer_type_id) FROM stdin;
ac1cf001-7fbc-1f2f-817f-bce0572c0007	Trace-X	2022-03-24 18:01:33.348	2022-03-24 18:01:33.348	Part Chain.png	\N	\N	0000	Catena-X	2dc4249f-b5ca-4d42-bef1-7a7a950a4f87	3	2022-03-24 18:01:33.348	ac1cf001-7fbc-1f2f-817f-bce058020001	1
ac1cf001-7fbc-1f2f-817f-bce05748000d	Trusted Traceability	2022-03-24 18:01:33.384	2022-03-24 18:01:33.384	STT.png	\N	\N	0000	Catena-X	dfd90abe-b20e-4aff-87c6-f30f2bf9b104	3	2022-03-24 18:01:33.384	ac1cf001-7fbc-1f2f-817f-bce058020001	1
ac1cf001-7fbc-1f2f-817f-bce0573f0009	Dismantler Cockpit	2022-03-24 18:01:33.375	2022-03-24 18:01:33.375	CE_Marketplace_LP.png	\N	support@sap.com	0000	SAP	0dcd8209-85e2-4073-b130-ac094fb47106	3	2022-03-24 18:01:33.375	ac1cf001-7fbc-1f2f-817f-bce058020001	1
ac1cf001-7fbc-1f2f-817f-bce05744000b	Project Implementation: Earth Commerce	2022-03-24 18:01:33.38	2022-03-24 18:01:33.38	CE_Marketplace_LP.png	\N	support@sap.com	0000	SAP	0dcd8209-85e2-4073-b130-ac094fb47106	3	2022-03-24 18:01:33.38	ac1cf001-7fbc-1f2f-817f-bce058020001	1
ac1cf001-7fbc-1f2f-817f-bce0574c000f	Component Performance	2022-03-24 18:01:33.388	2022-03-24 18:01:33.388	\N	\N	\N	0000	Catena-X	ac861325-bc54-4583-bcdc-9e9f2a38ff84	3	2022-03-24 18:01:33.388	ac1cf001-7fbc-1f2f-817f-bce058020001	1
f9cad59d-84b3-4880-a550-4072c26a6b93	Fraud Dashboard	2022-03-24 18:01:33.388	2022-03-24 18:01:33.388	Fraud Dash.png	\N	\N	0000	Catena-X	2dc4249f-b5ca-4d42-bef1-7a7a950a4f87	3	2022-03-24 18:01:33.388	ac1cf001-7fbc-1f2f-817f-bce058020001	1
f9cad59d-84b3-4880-a550-4072c26a6b94	Fraud Reporter	2022-03-24 18:01:33.388	2022-03-24 18:01:33.388	lead.png	\N	\N	0000	Catena-X	2dc4249f-b5ca-4d42-bef1-7a7a950a4f87	3	2022-03-24 18:01:33.388	ac1cf001-7fbc-1f2f-817f-bce058020001	1
8488044e-b8df-403a-9cbd-16dad7e4a08c	Covanto - AFQM	2022-03-24 18:01:33.388	2022-03-24 18:01:33.388	AFQM_screen.jpg	\N	\N	0000	Catena-X	cac8fa6a-9db7-4bad-9cbd-56298b74bac2	3	2022-03-24 18:01:33.388	ac1cf001-7fbc-1f2f-817f-bce058020001	1
5cf74ef8-e0b7-4984-a872-474828beb5d1	Smart MOM	2022-03-24 18:01:33.388	2022-03-24 18:01:33.388	logo-GEC.jpg	\N	info@gec.io	+49 69 24747180	German Edge Cloud GmbH & Co. KG	fe55fe20-5f19-401e-91a2-dfa37b44a0be	3	2022-03-24 18:01:33.388	ac1cf001-7fbc-1f2f-817f-bce058020001	1
5cf74ef8-e0b7-4984-a872-474828beb5d2	DTC-Translator	2022-03-24 18:01:33.388	2022-03-24 18:01:33.388	DTC-Translator_LP.svg	\N	gerd.preuss@adac.de	0000	ADAC	2dc4249f-b5ca-4d42-bef1-7a7a950a4f87	3	2022-03-24 18:01:33.388	ac1cf001-7fbc-1f2f-817f-bce058020001	1
5cf74ef8-e0b7-4984-a872-474828beb5d3	Fleet Manager	2022-03-24 18:01:33.388	2022-03-24 18:01:33.388	Fleet_Manager_LP.png	\N	gerd.preuss@adac.de	0000	ADAC	2dc4249f-b5ca-4d42-bef1-7a7a950a4f87	3	2022-03-24 18:01:33.388	ac1cf001-7fbc-1f2f-817f-bce058020001	1
5cf74ef8-e0b7-4984-a872-474828beb5d4	up2parts cloud	2022-03-24 18:01:33.388	2022-03-24 18:01:33.388	up2parts.png	\N	info@up2parts.com	0000	up2parts GmbH	2dc4249f-b5ca-4d42-bef1-7a7a950a4f87	3	2022-03-24 18:01:33.388	ac1cf001-7fbc-1f2f-817f-bce058020001	1
5cf74ef8-e0b7-4984-a872-474828beb5d5	Smart Factory Web Portal	2022-06-29 18:01:33.388	2022-03-24 18:01:33.388	Smart Factory.png	\N	florian.patzer@iosb.fraunhofer.de	0000	Fraunhofer IOSB	2dc4249f-b5ca-4d42-bef1-7a7a950a4f87	3	2022-06-29 18:01:33.388	ac1cf001-7fbc-1f2f-817f-bce058020001	1
5cf74ef8-e0b7-4984-a872-474828beb5d6	Production Planning and Control	2022-06-29 18:01:33.388	2022-03-24 18:01:33.388	PP&C.png	\N	Cemil Can	0000	ISTOS GmbH	2dc4249f-b5ca-4d42-bef1-7a7a950a4f87	3	2022-06-29 18:01:33.388	ac1cf001-7fbc-1f2f-817f-bce058020001	1
5cf74ef8-e0b7-4984-a872-474828beb5d7	Logistics Network, Material Traceability (LBN-MT)	2022-06-29 18:01:33.388	2022-03-24 18:01:33.388	LBN.png	\N	janina.reintjes@sap.com	0000	SAP	0dcd8209-85e2-4073-b130-ac094fb47106	3	2022-06-29 18:01:33.388	ac1cf001-7fbc-1f2f-817f-bce058020001	1
9b957704-3505-4445-822c-d7ef80f27fcd	Portal	2022-03-24 18:01:33.388	2022-03-24 18:01:33.388	\N	\N	\N	0000	Catena-X	ac861325-bc54-4583-bcdc-9e9f2a38ff84	3	2022-03-24 18:01:33.388	ac1cf001-7fbc-1f2f-817f-bce058020001	2
9ef01c20-6d9d-41ef-b336-fa64e1e2e4c2	Registration	2022-03-24 18:01:33.388	2022-03-24 18:01:33.388	\N	\N	\N	0000	Catena-X	ac861325-bc54-4583-bcdc-9e9f2a38ff84	3	2022-03-24 18:01:33.388	ac1cf001-7fbc-1f2f-817f-bce058020001	2
0ffcb416-1101-4ba6-8d4a-a9dfa31745a4	Technical User Management	2022-03-24 18:01:33.388	2022-03-24 18:01:33.388	\N	\N	\N	0000	Catena-X	ac861325-bc54-4583-bcdc-9e9f2a38ff84	3	2022-03-24 18:01:33.388	ac1cf001-7fbc-1f2f-817f-bce058020001	2
5cf74ef8-e0b7-4984-a872-474828beb5d8	AM Network	2022-08-28 00:00:00	2022-08-28 00:00:00	\N	\N	additive.manufacturing.industry@siemens.com	0000	Siemens	dfd90abe-b20e-4aff-87c6-f30f2bf9b104	3	2022-08-28 00:00:00	ac1cf001-7fbc-1f2f-817f-bce058020001	1
5cf74ef8-e0b7-4984-a872-474828beb5d9	mipart GmbH	2022-08-28 00:00:00	2022-08-28 00:00:00	\N	\N	info@mipart.com	0000	mipart GmbH	2dc4249f-b5ca-4d42-bef1-7a7a950a4f87	3	2022-08-28 00:00:00	ac1cf001-7fbc-1f2f-817f-bce058020001	1
\.


--
-- Data for Name: agreement_assigned_offers; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY portal.agreement_assigned_offers (agreement_id, offer_id) FROM stdin;
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
ac1cf001-7fbc-1f2f-817f-bce0574c000f	41e4a4c0-aae4-41c0-97c9-ebafde410de4
5cf74ef8-e0b7-4984-a872-474828beb5d1	06b243a4-ba51-4bf3-bc40-5d79a2231b86
5cf74ef8-e0b7-4984-a872-474828beb5d2	1aacde78-35ec-4df3-ba1e-f988cddcbbd9
5cf74ef8-e0b7-4984-a872-474828beb5d3	1aacde78-35ec-4df3-ba1e-f988cddcbbd9
f9cad59d-84b3-4880-a550-4072c26a6b94	6909ccc7-37c8-4088-99ab-790f20702460
5cf74ef8-e0b7-4984-a872-474828beb5d4	06b243a4-ba51-4bf3-bc40-5d79a2231b88
5cf74ef8-e0b7-4984-a872-474828beb5d5	06b243a4-ba51-4bf3-bc40-5d79a2231b88
5cf74ef8-e0b7-4984-a872-474828beb5d6	06b243a4-ba51-4bf3-bc40-5d79a2231b88
5cf74ef8-e0b7-4984-a872-474828beb5d7	06b243a4-ba51-4bf3-bc40-5d79a2231b86
5cf74ef8-e0b7-4984-a872-474828beb5d8	06b243a4-ba51-4bf3-bc40-5d79a2231b86
5cf74ef8-e0b7-4984-a872-474828beb5d9	06b243a4-ba51-4bf3-bc40-5d79a2231b86
\.


--
-- Data for Name: iam_clients; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY portal.iam_clients (id, client_client_id) FROM stdin;
0c9051d0-d032-11ec-9d64-0242ac120002	Cl2-CX-Portal
f032a034-d035-11ec-9d64-0242ac120002	Cl1-CX-Registration
f032a035-d035-11ec-9d64-0242ac120002	Cl3-CX-Semantic
f032a036-d035-11ec-9d64-0242ac120002	Cl4-CX-DigitalTwin
f032a037-d035-11ec-9d64-0242ac120002	Cl5-CX-Custodian
f032a038-d035-11ec-9d64-0242ac120002	Cl6-CX-xx
f032a039-d035-11ec-9d64-0242ac120002	Cl7-CX-BPDM
f032a040-d035-11ec-9d64-0242ac120002	Cl8-CDQ-Fraud
f032a041-d035-11ec-9d64-0242ac120002	Cl9-CDQ-Fraud
f032a042-d035-11ec-9d64-0242ac120002	Cl10-CX-xx
f032a043-d035-11ec-9d64-0242ac120002	Cl11-ADAC-Fleet
f032a044-d035-11ec-9d64-0242ac120002	Cl12-CX-TestManager
f032a045-d035-11ec-9d64-0242ac120002	not yet known-1
f032a046-d035-11ec-9d64-0242ac120002	not yet known-2
f032a047-d035-11ec-9d64-0242ac120002	not yet known-3
f032a048-d035-11ec-9d64-0242ac120002	not yet known-4
f032a050-d035-11ec-9d64-0242ac120002	not yet known-5
f032a051-d035-11ec-9d64-0242ac120002	not yet known-6
789e31ee-0fdb-4e42-a819-23e0cfb1179b	https://catenax-dt-rec.authentication.eu10.hana.ondemand.com
cf207afb-d213-4c33-becc-0cabeef174a7	https://catenax-int-dismantler-s66pftcc.authentication.eu10.hana.ondemand.com
f032a049-d035-11ec-9d64-0242ac120002	technical_roles_management
\.


--
-- Data for Name: app_instances; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY portal.app_instances (id, app_id, iam_client_id) FROM stdin;
2c252614-ae87-4efc-8af8-4d011e70544b	ac1cf001-7fbc-1f2f-817f-bce0573f0009	789e31ee-0fdb-4e42-a819-23e0cfb1179b
ab25c218-9ab3-4f1a-b6f4-6394fbc33c5a	ac1cf001-7fbc-1f2f-817f-bce05744000b	cf207afb-d213-4c33-becc-0cabeef174a7
b161d570-f6ff-45b4-a077-243f72487af6	ac1cf001-7fbc-1f2f-817f-bce0572c0007	f032a042-d035-11ec-9d64-0242ac120002
d69075b4-9bce-489c-ba80-8f7f08c4a011	f9cad59d-84b3-4880-a550-4072c26a6b93	f032a040-d035-11ec-9d64-0242ac120002
cdea99b7-1068-426a-ad7f-7b10f21fc4d6	f9cad59d-84b3-4880-a550-4072c26a6b94	f032a041-d035-11ec-9d64-0242ac120002
7e828901-27cb-4078-bd15-00efd247c56a	5cf74ef8-e0b7-4984-a872-474828beb5d3	f032a043-d035-11ec-9d64-0242ac120002
d6bc1bc6-dce9-46fc-a2f2-370688ba3212	5cf74ef8-e0b7-4984-a872-474828beb5d5	f032a045-d035-11ec-9d64-0242ac120002
9c272eb4-0a60-43b3-aaa6-f57ea09a8271	5cf74ef8-e0b7-4984-a872-474828beb5d6	f032a046-d035-11ec-9d64-0242ac120002
148e9fbe-1a78-4796-aed2-46dbbbe46674	5cf74ef8-e0b7-4984-a872-474828beb5d4	f032a047-d035-11ec-9d64-0242ac120002
476b0600-965b-4f10-8eb5-e4568859a885	5cf74ef8-e0b7-4984-a872-474828beb5d7	f032a048-d035-11ec-9d64-0242ac120002
47fa908a-99a4-4265-9936-2c890ad97a4c	9b957704-3505-4445-822c-d7ef80f27fcd	0c9051d0-d032-11ec-9d64-0242ac120002
e080bb4b-567b-477e-adcf-080efc457d38	9ef01c20-6d9d-41ef-b336-fa64e1e2e4c2	f032a034-d035-11ec-9d64-0242ac120002
1ef3a9b0-e8ef-48cc-9b88-65bacd6f05fb	0ffcb416-1101-4ba6-8d4a-a9dfa31745a4	f032a049-d035-11ec-9d64-0242ac120002
476b0600-965b-4f10-8eb5-e4568859a886	5cf74ef8-e0b7-4984-a872-474828beb5d8	f032a050-d035-11ec-9d64-0242ac120002
476b0600-965b-4f10-8eb5-e4568859a887	5cf74ef8-e0b7-4984-a872-474828beb5d9	f032a051-d035-11ec-9d64-0242ac120002
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
5cf74ef8-e0b7-4984-a872-474828beb5d4	en
5cf74ef8-e0b7-4984-a872-474828beb5d4	de
5cf74ef8-e0b7-4984-a872-474828beb5d5	en
5cf74ef8-e0b7-4984-a872-474828beb5d6	en
5cf74ef8-e0b7-4984-a872-474828beb5d7	en
5cf74ef8-e0b7-4984-a872-474828beb5d7	de
5cf74ef8-e0b7-4984-a872-474828beb5d7	pt
5cf74ef8-e0b7-4984-a872-474828beb5d7	es
5cf74ef8-e0b7-4984-a872-474828beb5d7	fr
5cf74ef8-e0b7-4984-a872-474828beb5d7	ru
5cf74ef8-e0b7-4984-a872-474828beb5d7	jp
5cf74ef8-e0b7-4984-a872-474828beb5d7	cn
5cf74ef8-e0b7-4984-a872-474828beb5d8	en
5cf74ef8-e0b7-4984-a872-474828beb5d9	en
\.


--
-- Data for Name: offer_subscriptions; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY portal.offer_subscriptions (company_id, offer_id, offer_subscription_status_id, requester_id, id, last_editor_id, display_name, description) FROM stdin;
ac861325-bc54-4583-bcdc-9e9f2a38ff84	ac1cf001-7fbc-1f2f-817f-bce0572c0007	2	ac1cf001-7fbc-1f2f-817f-bce058020001	56d878d9-9574-4673-b32a-ebf5753042f5	\N	\N	\N
ac861325-bc54-4583-bcdc-9e9f2a38ff84	ac1cf001-7fbc-1f2f-817f-bce05748000d	2	ac1cf001-7fbc-1f2f-817f-bce058020001	b1964680-474d-45dd-b1c4-91f39f9a4c48	\N	\N	\N
ac861325-bc54-4583-bcdc-9e9f2a38ff84	ac1cf001-7fbc-1f2f-817f-bce0573f0009	2	ac1cf001-7fbc-1f2f-817f-bce058020001	56faf2e0-88ec-4ee5-a736-6c52688250f8	\N	\N	\N
ac861325-bc54-4583-bcdc-9e9f2a38ff84	ac1cf001-7fbc-1f2f-817f-bce05744000b	2	ac1cf001-7fbc-1f2f-817f-bce058020001	0b2ca541-206d-48ad-bc02-fb61fbcb5552	\N	\N	\N
ac861325-bc54-4583-bcdc-9e9f2a38ff84	ac1cf001-7fbc-1f2f-817f-bce0574c000f	2	ac1cf001-7fbc-1f2f-817f-bce058020001	1ab2e5e1-df8f-496b-aa12-c11067805992	\N	\N	\N
ac861325-bc54-4583-bcdc-9e9f2a38ff84	f9cad59d-84b3-4880-a550-4072c26a6b93	2	ac1cf001-7fbc-1f2f-817f-bce058020001	02d5575d-b110-43f0-b0dd-53dbc37147dc	\N	\N	\N
ac861325-bc54-4583-bcdc-9e9f2a38ff84	f9cad59d-84b3-4880-a550-4072c26a6b94	2	ac1cf001-7fbc-1f2f-817f-bce058020001	4e861f6a-86ad-4188-8ba7-0f214248b120	\N	\N	\N
ac861325-bc54-4583-bcdc-9e9f2a38ff84	8488044e-b8df-403a-9cbd-16dad7e4a08c	2	ac1cf001-7fbc-1f2f-817f-bce058020001	34a93025-18de-4c7a-8677-0fd9801248d1	\N	\N	\N
ac861325-bc54-4583-bcdc-9e9f2a38ff84	5cf74ef8-e0b7-4984-a872-474828beb5d1	2	ac1cf001-7fbc-1f2f-817f-bce058020001	028265dd-82a8-4924-ab9a-a7b47dc2adfd	\N	\N	\N
ac861325-bc54-4583-bcdc-9e9f2a38ff84	5cf74ef8-e0b7-4984-a872-474828beb5d2	2	ac1cf001-7fbc-1f2f-817f-bce058020001	93eecd4e-ca47-4dd2-85bf-775ea72eb312	\N	\N	\N
ac861325-bc54-4583-bcdc-9e9f2a38ff84	5cf74ef8-e0b7-4984-a872-474828beb5d3	2	ac1cf001-7fbc-1f2f-817f-bce058020001	846ec83b-4b84-4c29-b7ce-3e57d7405844	\N	\N	\N
2dc4249f-b5ca-4d42-bef1-7a7a950a4f87	ac1cf001-7fbc-1f2f-817f-bce0572c0007	2	ac1cf001-7fbc-1f2f-817f-bce058020001	ed4de48d-fd4b-4384-a72f-ecae3c6cc5ba	\N	\N	\N
2dc4249f-b5ca-4d42-bef1-7a7a950a4f87	ac1cf001-7fbc-1f2f-817f-bce05748000d	2	ac1cf001-7fbc-1f2f-817f-bce058020001	85064593-0aaa-48c4-95a2-2700223aca5e	\N	\N	\N
2dc4249f-b5ca-4d42-bef1-7a7a950a4f87	ac1cf001-7fbc-1f2f-817f-bce0573f0009	2	ac1cf001-7fbc-1f2f-817f-bce058020001	60f00bd0-98fe-4ed3-ad3b-90045921660c	\N	\N	\N
2dc4249f-b5ca-4d42-bef1-7a7a950a4f87	ac1cf001-7fbc-1f2f-817f-bce05744000b	2	ac1cf001-7fbc-1f2f-817f-bce058020001	d65e367c-0968-4be9-bd2a-6c3d6339d65c	\N	\N	\N
2dc4249f-b5ca-4d42-bef1-7a7a950a4f87	ac1cf001-7fbc-1f2f-817f-bce0574c000f	2	ac1cf001-7fbc-1f2f-817f-bce058020001	1d28a224-6293-4148-8b60-6714a0f1465d	\N	\N	\N
2dc4249f-b5ca-4d42-bef1-7a7a950a4f87	f9cad59d-84b3-4880-a550-4072c26a6b93	2	ac1cf001-7fbc-1f2f-817f-bce058020001	6da4b991-b594-4b80-933a-26383d6d465f	\N	\N	\N
2dc4249f-b5ca-4d42-bef1-7a7a950a4f87	f9cad59d-84b3-4880-a550-4072c26a6b94	2	ac1cf001-7fbc-1f2f-817f-bce058020001	773e7152-8d94-4f90-8689-956a7bdf4f4e	\N	\N	\N
2dc4249f-b5ca-4d42-bef1-7a7a950a4f87	8488044e-b8df-403a-9cbd-16dad7e4a08c	2	ac1cf001-7fbc-1f2f-817f-bce058020001	4ba33360-72e6-4a56-a253-59761d694d2c	\N	\N	\N
2dc4249f-b5ca-4d42-bef1-7a7a950a4f87	5cf74ef8-e0b7-4984-a872-474828beb5d1	2	ac1cf001-7fbc-1f2f-817f-bce058020001	4d44eb62-7ac8-4a4a-a0d0-fc3daca5edd5	\N	\N	\N
2dc4249f-b5ca-4d42-bef1-7a7a950a4f87	5cf74ef8-e0b7-4984-a872-474828beb5d2	2	ac1cf001-7fbc-1f2f-817f-bce058020001	11fd3bb9-6922-4b36-bc28-d30aded20231	\N	\N	\N
2dc4249f-b5ca-4d42-bef1-7a7a950a4f87	5cf74ef8-e0b7-4984-a872-474828beb5d3	2	ac1cf001-7fbc-1f2f-817f-bce058020001	1ab6c7c9-ff68-47da-aad4-b88d83b757cd	\N	\N	\N
\.


--
-- Data for Name: app_subscription_details; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY portal.app_subscription_details (id, offer_subscription_id, app_instance_id, app_subscription_url) FROM stdin;
a9aa870a-450b-4a58-8381-0cfe7f9f43e7	56d878d9-9574-4673-b32a-ebf5753042f5	b161d570-f6ff-45b4-a077-243f72487af6	\N
e9e97133-a311-419c-8421-fd70264de9cb	b1964680-474d-45dd-b1c4-91f39f9a4c48	\N	\N
f550c647-f94f-4e58-bcb9-b3d338af9009	56faf2e0-88ec-4ee5-a736-6c52688250f8	2c252614-ae87-4efc-8af8-4d011e70544b	https://dismantler-cockpit.d13fe27.kyma.ondemand.com
88b0661c-cc22-4a4a-9721-fc4f3cec21f8	0b2ca541-206d-48ad-bc02-fb61fbcb5552	ab25c218-9ab3-4f1a-b6f4-6394fbc33c5a	https://ec-qas.d13fe27.kyma.ondemand.com
3c7f7825-b2c4-43b8-b91e-8ab6f8e28fac	1ab2e5e1-df8f-496b-aa12-c11067805992	\N	https://impact.bmw.cloud/workspace/carbon/ri.carbon.main.workspace.7d7f6c71-3981-4b78-b731-1b4c8f243c97/ri.workshop.main.module.c9beba25-4387-40dd-9e59-8c4e3b3df3ff
aa97bc61-149f-4b85-babb-eb40f0424ef5	02d5575d-b110-43f0-b0dd-53dbc37147dc	d69075b4-9bce-489c-ba80-8f7f08c4a011	https://dash.catenax-cdq.com/
83e9da7d-1208-42b9-91d5-5a4fd7daa2df	4e861f6a-86ad-4188-8ba7-0f214248b120	cdea99b7-1068-426a-ad7f-7b10f21fc4d6	https://apps.cdq.com/dashboard/fraud/report-fraud
cb0d1b6a-29fd-4583-a924-641dcf3b26a9	34a93025-18de-4c7a-8677-0fd9801248d1	\N	https://portal-staging.afqm-services.com/
3cafae15-4f03-49c3-9786-b6ca2e29fa76	028265dd-82a8-4924-ab9a-a7b47dc2adfd	\N	\N
9c5cb134-b77b-4b22-ae34-63b686b3b5b9	93eecd4e-ca47-4dd2-85bf-775ea72eb312	\N	https://dtc-translator.adac.openresearch.com
f21f3782-b2e4-462e-b0c0-986f49359536	846ec83b-4b84-4c29-b7ce-3e57d7405844	7e828901-27cb-4078-bd15-00efd247c56a	https://fleet-management.adac.openresearch.com
bedb45bf-7094-4da0-9e69-0695db782a16	ed4de48d-fd4b-4384-a72f-ecae3c6cc5ba	b161d570-f6ff-45b4-a077-243f72487af6	\N
d3796e27-d0bb-4376-80c3-2ffb49847424	85064593-0aaa-48c4-95a2-2700223aca5e	\N	\N
22835697-99ea-45c8-bce6-9b2553a95c50	60f00bd0-98fe-4ed3-ad3b-90045921660c	2c252614-ae87-4efc-8af8-4d011e70544b	https://dismantler-cockpit.d13fe27.kyma.ondemand.com
f9262016-7400-49a5-9908-c46257b4790f	d65e367c-0968-4be9-bd2a-6c3d6339d65c	ab25c218-9ab3-4f1a-b6f4-6394fbc33c5a	https://ec-qas.d13fe27.kyma.ondemand.com
ac6413b0-b179-462a-9074-e7d0bcc5ee5a	1d28a224-6293-4148-8b60-6714a0f1465d	\N	https://impact.bmw.cloud/workspace/carbon/ri.carbon.main.workspace.7d7f6c71-3981-4b78-b731-1b4c8f243c97/ri.workshop.main.module.c9beba25-4387-40dd-9e59-8c4e3b3df3ff
9741fa8d-74f3-44f8-8ec0-51c83399e508	6da4b991-b594-4b80-933a-26383d6d465f	d69075b4-9bce-489c-ba80-8f7f08c4a011	https://dash.catenax-cdq.com/
6da8bdef-2a21-474b-9618-ec0acffc6703	773e7152-8d94-4f90-8689-956a7bdf4f4e	cdea99b7-1068-426a-ad7f-7b10f21fc4d6	https://apps.cdq.com/dashboard/fraud/report-fraud
ed4116b0-f4bc-451e-aaa9-5df08969e1b4	4ba33360-72e6-4a56-a253-59761d694d2c	\N	https://portal-staging.afqm-services.com/
7f9888cb-2f78-4f71-b7dd-a9231888aa55	4d44eb62-7ac8-4a4a-a0d0-fc3daca5edd5	\N	\N
3d8cb906-76a3-4cd7-ae99-4f9225437a27	11fd3bb9-6922-4b36-bc28-d30aded20231	\N	https://dtc-translator.adac.openresearch.com
37241577-3730-4d39-ab5b-3555a0d11c42	1ab6c7c9-ff68-47da-aad4-b88d83b757cd	7e828901-27cb-4078-bd15-00efd247c56a	https://fleet-management.adac.openresearch.com
\.


--
-- Data for Name: company_applications; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY portal.company_applications (id, date_created, date_last_changed, application_status_id, company_id, last_editor_id) FROM stdin;
4f0146c6-32aa-4bb1-b844-df7e8babdcb2	2022-03-24 18:01:33.403	2022-03-24 18:01:33.403	8	ac861325-bc54-4583-bcdc-9e9f2a38ff84	\N
4f0146c6-32aa-4bb1-b844-df7e8babdcb3	2022-03-24 18:01:33.403	2022-03-24 18:01:33.403	8	0dcd8209-85e2-4073-b130-ac094fb47106	\N
4f0146c6-32aa-4bb1-b844-df7e8babdcb4	2022-03-24 18:01:33.403	2022-03-24 18:01:33.403	8	9d049598-0dac-4d26-8a21-8f5b64c799cf	\N
4f0146c6-32aa-4bb1-b844-df7e8babdcb5	2022-03-24 18:01:33.403	2022-03-24 18:01:33.403	8	cac8fa6a-9db7-4bad-9cbd-56298b74bac2	\N
4f0146c6-32aa-4bb1-b844-df7e8babdcb6	2022-03-24 18:01:33.403	2022-03-24 18:01:33.403	7	d14eba77-0b18-4e41-9d84-49ef875c0763	\N
0195a85f-e465-4571-b980-d1351dd76a9f	2022-03-24 18:01:33.431	2022-03-24 18:01:33.431	9	bdac6865-2a8d-4bfd-9373-9dfce8190895	\N
6b2d1263-c073-4a48-bfaf-704dc154ca9a	2022-03-24 18:01:33.439	2022-03-24 18:01:33.439	3	2dc4249f-b5ca-4d42-bef1-7a7a950a4f87	\N
6b2d1263-c073-4a48-bfaf-704dc154ca9c	2022-03-24 18:01:33.439	2022-03-24 18:01:33.439	1	220330ac-170d-4e22-8d72-9467ed042149	\N
6b2d1263-c073-4a48-bfaf-704dc154ca9d	2022-05-05 18:01:33.439	2022-05-05 18:01:33.439	1	bdac6865-2a8d-4bfd-9373-9dfce8190895	\N
6b2d1263-c073-4a48-bfaf-704dc154ca9e	2022-05-05 18:01:33.439	2022-05-05 18:01:33.439	1	41fd2ab8-71cd-4546-9bef-a388d91b2542	\N
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
220330ac-170d-4e22-8d72-9467ed042149	1
bdac6865-2a8d-4bfd-9373-9dfce8190895	1
41fd2ab8-71cd-4546-9bef-a388d91b2542	1
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
-- Data for Name: identity_providers; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY portal.identity_providers (id, date_created, identity_provider_category_id) FROM stdin;
ac1cf001-7fbc-1f2f-817f-bce0571b0004	2022-05-05 18:01:33.33	2
ac1cf001-7fbc-1f2f-817f-bce057230006	2022-05-05 18:01:33.33	1
ac1cf001-7fbc-1f2f-817f-bce057230007	2022-05-05 18:01:33.33	1
ac1cf001-7fbc-1f2f-817f-bce057230008	2022-05-05 18:01:33.33	1
ac1cf001-7fbc-1f2f-817f-bce0575a0012	2022-05-05 18:01:33.33	1
ac1cf001-7fbc-1f2f-817f-bce057770014	2022-05-05 18:01:33.33	1
ac1cf001-7fbc-1f2f-817f-bce057770015	2022-05-05 18:01:33.33	1
\.


--
-- Data for Name: company_identity_providers; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY portal.company_identity_providers (company_id, identity_provider_id) FROM stdin;
ac861325-bc54-4583-bcdc-9e9f2a38ff84	ac1cf001-7fbc-1f2f-817f-bce0571b0004
220330ac-170d-4e22-8d72-9467ed042149	ac1cf001-7fbc-1f2f-817f-bce057230006
bdac6865-2a8d-4bfd-9373-9dfce8190895	ac1cf001-7fbc-1f2f-817f-bce057230007
41fd2ab8-71cd-4546-9bef-a388d91b2542	ac1cf001-7fbc-1f2f-817f-bce057230008
41fd2ab8-71cd-4546-9bef-a388d91b2542	ac1cf001-7fbc-1f2f-817f-bce057770014
2dc4249f-b5ca-4d42-bef1-7a7a950a4f87	ac1cf001-7fbc-1f2f-817f-bce057770015
\.


--
-- Data for Name: company_service_accounts; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY portal.company_service_accounts (id, date_created, company_id, name, description, company_service_account_status_id) FROM stdin;
7e85a0b8-0001-ab67-10d1-0ef508201006	2022-06-01 18:01:33.439	2dc4249f-b5ca-4d42-bef1-7a7a950a4f87	Service Account 01	sa-cl5-custodian-1	1
7e85a0b8-0001-ab67-10d1-0ef508201007	2022-06-01 18:01:33.439	2dc4249f-b5ca-4d42-bef1-7a7a950a4f87	Service Account 02	sa-cl5-custodian-2	1
7e85a0b8-0001-ab67-10d1-0ef508201008	2022-06-01 18:01:33.439	2dc4249f-b5ca-4d42-bef1-7a7a950a4f87	Service Account 03	sa-cl5-custodian-internaltest	1
7e85a0b8-0001-ab67-10d1-0ef508201009	2022-06-01 18:01:33.439	2dc4249f-b5ca-4d42-bef1-7a7a950a4f87	Service Account 04	sa-cl6-cx-1	1
7e85a0b8-0001-ab67-10d1-0ef508201010	2022-06-01 18:01:33.439	2dc4249f-b5ca-4d42-bef1-7a7a950a4f87	Service Account 05	sa-cl6-cx-2	1
7e85a0b8-0001-ab67-10d1-0ef508201011	2022-06-01 18:01:33.439	ac861325-bc54-4583-bcdc-9e9f2a38ff84	Service Account 06	sa-cl6-cx-3	1
7e85a0b8-0001-ab67-10d1-0ef508201012	2022-06-01 18:01:33.439	2dc4249f-b5ca-4d42-bef1-7a7a950a4f87	Service Account 07	sa-cl6-cx-4	1
7e85a0b8-0001-ab67-10d1-0ef508201013	2022-06-01 18:01:33.439	2dc4249f-b5ca-4d42-bef1-7a7a950a4f87	Service Account 08	sa-cl6-cx-5	1
7e85a0b8-0001-ab67-10d1-0ef508201014	2022-06-01 18:01:33.439	2dc4249f-b5ca-4d42-bef1-7a7a950a4f87	Service Account 09	sa-cl6-cx-6	1
7e85a0b8-0001-ab67-10d1-0ef508201015	2022-06-01 18:01:33.439	2dc4249f-b5ca-4d42-bef1-7a7a950a4f87	sa-cl6-cx-7	sa-cl6-cx-7	1
7e85a0b8-0001-ab67-10d1-0ef508201016	2022-06-01 18:01:33.439	2dc4249f-b5ca-4d42-bef1-7a7a950a4f87	sa-cl6-cx-8	sa-cl6-cx-8	1
7e85a0b8-0001-ab67-10d1-0ef508201017	2022-06-01 18:01:33.439	2dc4249f-b5ca-4d42-bef1-7a7a950a4f87	sa-cl6-cx-9	sa-cl6-cx-9	1
7e85a0b8-0001-ab67-10d1-0ef508201018	2022-06-01 18:01:33.439	2dc4249f-b5ca-4d42-bef1-7a7a950a4f87	sa-cl6-cx-10	sa-cl6-cx-10	1
7e85a0b8-0001-ab67-10d1-0ef508201019	2022-06-01 18:01:33.439	2dc4249f-b5ca-4d42-bef1-7a7a950a4f87	sa-cl6-cx-11	sa-cl6-cx-11	1
7e85a0b8-0001-ab67-10d1-0ef508201020	2022-06-01 18:01:33.439	2dc4249f-b5ca-4d42-bef1-7a7a950a4f87	sa-cl6-cx-12	sa-cl6-cx-12	1
7e85a0b8-0001-ab67-10d1-0ef508201021	2022-06-01 18:01:33.439	2dc4249f-b5ca-4d42-bef1-7a7a950a4f87	sa-cl6-cx-13	sa-cl6-cx-13	1
7e85a0b8-0001-ab67-10d1-0ef508201022	2022-06-01 18:01:33.439	2dc4249f-b5ca-4d42-bef1-7a7a950a4f87	sa-cl5-cx-1	sa-cl5-cx-1	1
\.


--
-- Data for Name: company_users; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY portal.company_users (id, date_created, date_last_changed, email, firstname, lastlogin, lastname, company_id, company_user_status_id, last_editor_id) FROM stdin;
ac1cf001-7fbc-1f2f-817f-bce0575a0011	2022-03-24 18:01:33.394	2022-03-24 18:01:33.394	\N	\N	\N	\N	0dcd8209-85e2-4073-b130-ac094fb47106	1	\N
ac1cf001-7fbc-1f2f-817f-bce0577e0015	2022-03-24 18:01:33.438	2022-03-24 18:01:33.438	\N	\N	\N	\N	41fd2ab8-71cd-4546-9bef-a388d91b2542	1	\N
ac1cf001-7fbc-1f2f-817f-bce058019990	2022-03-24 18:01:33.57	2022-03-24 18:01:33.57	julia.jeroch@bmw.de	Test User	\N	cx-user-2	2dc4249f-b5ca-4d42-bef1-7a7a950a4f87	1	\N
ac1cf001-7fbc-1f2f-817f-bce058019991	2022-03-24 18:01:33.57	2022-03-24 18:01:33.57	julia.jeroch@bmw.de	Test User	\N	cx-admin-2	2dc4249f-b5ca-4d42-bef1-7a7a950a4f87	1	\N
ac1cf001-7fbc-1f2f-817f-bce058019992	2022-03-24 18:01:33.57	2022-03-24 18:01:33.57	julia.jeroch@bmw.de	Test User	\N	company-admin-2	2dc4249f-b5ca-4d42-bef1-7a7a950a4f87	1	\N
ac1cf001-7fbc-1f2f-817f-bce058019993	2022-03-24 18:01:33.57	2022-03-24 18:01:33.57	julia.jeroch@bmw.de	Test User	\N	it-admin-2	2dc4249f-b5ca-4d42-bef1-7a7a950a4f87	1	\N
ac1cf001-7fbc-1f2f-817f-bce058020000	2022-03-24 18:01:33.57	2022-03-24 18:01:33.57	julia.jeroch@bmw.de	Test User	\N	CX User	2dc4249f-b5ca-4d42-bef1-7a7a950a4f87	1	\N
ac1cf001-7fbc-1f2f-817f-bce058020001	2022-03-24 18:01:33.57	2022-03-24 18:01:33.57	julia.jeroch@bmw.de	Test User	\N	CX Admin	2dc4249f-b5ca-4d42-bef1-7a7a950a4f87	1	\N
ac1cf001-7fbc-1f2f-817f-bce058020002	2022-03-24 18:01:33.57	2022-03-24 18:01:33.57	julia.jeroch@bmw.de	Test User	\N	Company Admin 1	220330ac-170d-4e22-8d72-9467ed042149	1	\N
ac1cf001-7fbc-1f2f-817f-bce058020003	2022-03-24 18:01:33.57	2022-03-24 18:01:33.57	julia.jeroch@bmw.de	Test User	\N	Company Admin 2	bdac6865-2a8d-4bfd-9373-9dfce8190895	1	\N
ac1cf001-7fbc-1f2f-817f-bce058020004	2022-03-24 18:01:33.57	2022-03-24 18:01:33.57	julia.jeroch@bmw.de	Test User	\N	Company Admin 3	41fd2ab8-71cd-4546-9bef-a388d91b2542	1	\N
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
-- Data for Name: company_user_assigned_business_partners; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY portal.company_user_assigned_business_partners (company_user_id, business_partner_number) FROM stdin;
ac1cf001-7fbc-1f2f-817f-bce0575a0011	CAXSDUMMYSAPZZ
ac1cf001-7fbc-1f2f-817f-bce0577e0015	CAXSCARFACTORY3ZZ
ac1cf001-7fbc-1f2f-817f-bce058020000	CAXSDUMMYCATENAZZ
ac1cf001-7fbc-1f2f-817f-bce058020001	CAXSDUMMYCATENAZZ
\.


--
-- Data for Name: user_roles; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY portal.user_roles (id, user_role, offer_id) FROM stdin;
7410693c-c893-409e-852f-9ee886ce94a6	Company Admin	9ef01c20-6d9d-41ef-b336-fa64e1e2e4c2
7410693c-c893-409e-852f-9ee886ce94a7	Legal Admin	9ef01c20-6d9d-41ef-b336-fa64e1e2e4c2
58f897ec-0aad-4588-8ffa-5f45d6638632	CX Admin	9b957704-3505-4445-822c-d7ef80f27fcd
58f897ec-0aad-4588-8ffa-5f45d6638633	CX User	9b957704-3505-4445-822c-d7ef80f27fcd
607818be-4978-41f4-bf63-fa8d2de51154	IT Admin	9b957704-3505-4445-822c-d7ef80f27fcd
ceec23fd-6b26-485c-a4bb-90571a29e148	Signing Manager	9ef01c20-6d9d-41ef-b336-fa64e1e2e4c2
95fe4014-4d1b-47af-a22e-72a12f9470db	Developer	9b957704-3505-4445-822c-d7ef80f27fcd
04231a30-df50-4d14-bb00-71ff012ae0cf	Data Specialist	9b957704-3505-4445-822c-d7ef80f27fcd
916e4be9-0ff7-48fb-bb80-97d2e93fca14	Data Specialist (INT only)	9b957704-3505-4445-822c-d7ef80f27fcd
0d9eb9e4-b6df-49bd-b045-d9cef96a879d	Technical User Semantic & Digital Twin	9b957704-3505-4445-822c-d7ef80f27fcd
3ff68c40-6581-4e48-a03a-2a6c1c5aac89	App Administrator	9b957704-3505-4445-822c-d7ef80f27fcd
efc20368-9e82-46ff-b88f-6495b9810253	EarthCommerce.AdministratorRC_QAS2	ac1cf001-7fbc-1f2f-817f-bce05744000b
aabcdfeb-6669-4c74-89f0-19cda090873f	EarthCommerce.Advanced.BuyerRC_QAS2	ac1cf001-7fbc-1f2f-817f-bce05744000b
efc20368-9e82-46ff-b88f-6495b9810250	EarthCommerce.BuyerRC_QAS2	ac1cf001-7fbc-1f2f-817f-bce05744000b
aabcdfeb-6669-4c74-89f0-19cda0908730	EarthCommerce.Content.ManagerRC_QAS2	ac1cf001-7fbc-1f2f-817f-bce05744000b
aabcdfeb-6669-4c74-89f0-19cda0908731	EarthCommerce.UserRC_QAS2	ac1cf001-7fbc-1f2f-817f-bce05744000b
b05d86e1-6c98-4619-85fa-9a425e0800b6	Business Admin	9b957704-3505-4445-822c-d7ef80f27fcd
b05d86e1-6c98-4619-85fa-9a425e080000	fraud_app_manager	f9cad59d-84b3-4880-a550-4072c26a6b93
b05d86e1-6c98-4619-85fa-9a425e080001	fraud_app_user	f9cad59d-84b3-4880-a550-4072c26a6b93
b05d86e1-6c98-4619-85fa-9a425e080002	fraud_app_manager	f9cad59d-84b3-4880-a550-4072c26a6b94
b05d86e1-6c98-4619-85fa-9a425e080003	fraud_app_user	f9cad59d-84b3-4880-a550-4072c26a6b94
855eeefb-a2ef-4d74-ac10-34a87afcb865	admin	5cf74ef8-e0b7-4984-a872-474828beb5d3
545c2616-2fce-4f52-b881-331db2fc1e35	customer	5cf74ef8-e0b7-4984-a872-474828beb5d3
7a9e0777-2b13-4463-a7c4-f699afff3527	oem	5cf74ef8-e0b7-4984-a872-474828beb5d3
b05d86e1-6c98-4619-85fa-9a425e080004	Buyer	5cf74ef8-e0b7-4984-a872-474828beb5d5
b05d86e1-6c98-4619-85fa-9a425e080005	Supplier	5cf74ef8-e0b7-4984-a872-474828beb5d5
b05d86e1-6c98-4619-85fa-9a425e080006	Buyer	5cf74ef8-e0b7-4984-a872-474828beb5d6
b05d86e1-6c98-4619-85fa-9a425e080007	Supplier	5cf74ef8-e0b7-4984-a872-474828beb5d6
b05d86e1-6c98-4619-85fa-9a425e080008	Administrator	5cf74ef8-e0b7-4984-a872-474828beb5d4
b05d86e1-6c98-4619-85fa-9a425e080009	User	5cf74ef8-e0b7-4984-a872-474828beb5d4
b05d86e1-6c98-4619-85fa-9a425e080010	Viewer	5cf74ef8-e0b7-4984-a872-474828beb5d4
b05d86e1-6c98-4619-85fa-9a425e080011	Modifier	5cf74ef8-e0b7-4984-a872-474828beb5d4
b05d86e1-6c98-4619-85fa-9a425e080012	Network Owner	5cf74ef8-e0b7-4984-a872-474828beb5d7
b05d86e1-6c98-4619-85fa-9a425e080013	Network Participant	5cf74ef8-e0b7-4984-a872-474828beb5d7
b05d86e1-6c98-4619-85fa-9a425e080014	Data Contributor	5cf74ef8-e0b7-4984-a872-474828beb5d7
607818be-4978-41f4-bf63-fa8d2de51155	Digital Twin Management	0ffcb416-1101-4ba6-8d4a-a9dfa31745a4
607818be-4978-41f4-bf63-fa8d2de51156	Semantic Model Management	0ffcb416-1101-4ba6-8d4a-a9dfa31745a4
607818be-4978-41f4-bf63-fa8d2de51157	Wallet Management	0ffcb416-1101-4ba6-8d4a-a9dfa31745a4
607818be-4978-41f4-bf63-fa8d2de51158	Buyer	5cf74ef8-e0b7-4984-a872-474828beb5d8
607818be-4978-41f4-bf63-fa8d2de51159	Supplier	5cf74ef8-e0b7-4984-a872-474828beb5d8
607818be-4978-41f4-bf63-fa8d2de51160	Buyer	5cf74ef8-e0b7-4984-a872-474828beb5d9
607818be-4978-41f4-bf63-fa8d2de51161	Supplier	5cf74ef8-e0b7-4984-a872-474828beb5d9
\.


--
-- Data for Name: company_user_assigned_roles; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY portal.company_user_assigned_roles (company_user_id, user_role_id, id, last_editor_id) FROM stdin;
ac1cf001-7fbc-1f2f-817f-bce0575a0011	b05d86e1-6c98-4619-85fa-9a425e0800b6	735148ca-e203-4de4-a634-a0595fd35484	\N
ac1cf001-7fbc-1f2f-817f-bce0577e0015	b05d86e1-6c98-4619-85fa-9a425e0800b6	860b9193-1ac6-438d-9df1-3f6783dff556	\N
ac1cf001-7fbc-1f2f-817f-bce058020000	efc20368-9e82-46ff-b88f-6495b9810253	d2f38052-bad0-4682-b1d1-0402141bb408	\N
ac1cf001-7fbc-1f2f-817f-bce058020000	aabcdfeb-6669-4c74-89f0-19cda090873f	fb2d01d8-a0c9-462a-b2f3-3f846fc658bd	\N
ac1cf001-7fbc-1f2f-817f-bce058020000	58f897ec-0aad-4588-8ffa-5f45d6638633	3b9d5bce-435f-4872-92e8-c637af18c62e	\N
ac1cf001-7fbc-1f2f-817f-bce058020001	58f897ec-0aad-4588-8ffa-5f45d6638632	d09f371d-54ca-4ff0-add4-10a5f2af437f	\N
ac1cf001-7fbc-1f2f-817f-bce058020001	efc20368-9e82-46ff-b88f-6495b9810253	7b371b0d-c2fb-41b8-8f01-721b30af375f	\N
ac1cf001-7fbc-1f2f-817f-bce058020001	aabcdfeb-6669-4c74-89f0-19cda090873f	4b366a2a-edb2-47c8-b96a-0698a470437b	\N
ac1cf001-7fbc-1f2f-817f-bce058020002	7410693c-c893-409e-852f-9ee886ce94a6	ea9bedb7-05f6-491a-b515-68033cf359d5	\N
ac1cf001-7fbc-1f2f-817f-bce058020003	7410693c-c893-409e-852f-9ee886ce94a6	20b22570-a723-47ec-93c4-c1b4781e85c6	\N
ac1cf001-7fbc-1f2f-817f-bce058020004	7410693c-c893-409e-852f-9ee886ce94a6	f55295fd-8904-440e-983c-826916fa2dfa	\N
ac1cf001-7fbc-1f2f-817f-bce058019990	58f897ec-0aad-4588-8ffa-5f45d6638633	689bb435-39c1-4625-a736-1853d2bc3e37	\N
ac1cf001-7fbc-1f2f-817f-bce058019991	58f897ec-0aad-4588-8ffa-5f45d6638632	9ac2746d-f43a-4be7-990c-0f432fc3981f	\N
ac1cf001-7fbc-1f2f-817f-bce058019992	7410693c-c893-409e-852f-9ee886ce94a6	25d12d7d-56e0-4bbc-9256-8cf9d7c6fb24	\N
ac1cf001-7fbc-1f2f-817f-bce058019993	607818be-4978-41f4-bf63-fa8d2de51154	d606f60c-3550-40e5-b828-e85e756ccdf8	\N
\.


--
-- Data for Name: connectors; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY portal.connectors (id, name, connector_url, type_id, status_id, provider_id, host_id, location_id) FROM stdin;
7e86a0b8-6903-496b-96d1-0ef508206833	Test Connector 1	www.google.de	1	1	2dc4249f-b5ca-4d42-bef1-7a7a950a4f87	2dc4249f-b5ca-4d42-bef1-7a7a950a4f87	DE
7e86a0b8-6903-496b-96d1-0ef508206834	Test Connector 2	www.google.de	1	2	2dc4249f-b5ca-4d42-bef1-7a7a950a4f87	2dc4249f-b5ca-4d42-bef1-7a7a950a4f87	DE
7e86a0b8-6903-496b-96d1-0ef508206835	Test Connector 3	www.google.de	1	2	2dc4249f-b5ca-4d42-bef1-7a7a950a4f87	2dc4249f-b5ca-4d42-bef1-7a7a950a4f87	DE
7e86a0b8-6903-496b-96d1-0ef508206836	Test Connector 4	www.google.de	1	2	ac861325-bc54-4583-bcdc-9e9f2a38ff84	ac861325-bc54-4583-bcdc-9e9f2a38ff84	DE
7e86a0b8-6903-496b-96d1-0ef508206837	Test Connector 5	www.google.de	1	1	ac861325-bc54-4583-bcdc-9e9f2a38ff84	ac861325-bc54-4583-bcdc-9e9f2a38ff84	DE
7e86a0b8-6903-496b-96d1-0ef508206838	Test Connector 6	www.google.de	1	1	cac8fa6a-9db7-4bad-9cbd-56298b74bac2	2dc4249f-b5ca-4d42-bef1-7a7a950a4f87	DE
\.


--
-- Data for Name: documents; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY portal.documents (id, date_created, document_name, document_type_id, company_user_id, document_hash, document_content, document_status_id) FROM stdin;
\.


--
-- Data for Name: consents; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY portal.consents (id, date_created, comment, consent_status_id, target, agreement_id, company_id, document_id, company_user_id) FROM stdin;
ac1cf001-7fbc-1f2f-817f-bce0575a0100	2022-03-24 18:01:33.394	\N	1	\N	aa0a0000-7fbc-1f2f-817f-bce0502c1010	0dcd8209-85e2-4073-b130-ac094fb47106	\N	ac1cf001-7fbc-1f2f-817f-bce0575a0011
ac1cf001-7fbc-1f2f-817f-bce0575a0101	2022-03-24 18:01:33.394	\N	1	\N	aa0a0000-7fbc-1f2f-817f-bce0502c1011	0dcd8209-85e2-4073-b130-ac094fb47106	\N	ac1cf001-7fbc-1f2f-817f-bce0575a0011
ac1cf001-7fbc-1f2f-817f-bce0575a0102	2022-03-24 18:01:33.394	\N	1	\N	aa0a0000-7fbc-1f2f-817f-bce0502c1012	0dcd8209-85e2-4073-b130-ac094fb47106	\N	ac1cf001-7fbc-1f2f-817f-bce0575a0011
ac1cf001-7fbc-1f2f-817f-bce0575a0103	2022-03-24 18:01:33.394	\N	1	\N	aa0a0000-7fbc-1f2f-817f-bce0502c1010	2dc4249f-b5ca-4d42-bef1-7a7a950a4f87	\N	ac1cf001-7fbc-1f2f-817f-bce058020001
ac1cf001-7fbc-1f2f-817f-bce0575a0104	2022-03-24 18:01:33.394	\N	1	\N	aa0a0000-7fbc-1f2f-817f-bce0502c1010	220330ac-170d-4e22-8d72-9467ed042149	\N	ac1cf001-7fbc-1f2f-817f-bce058020002
ac1cf001-7fbc-1f2f-817f-bce0575a0105	2022-03-24 18:01:33.394	\N	1	\N	aa0a0000-7fbc-1f2f-817f-bce0502c1010	bdac6865-2a8d-4bfd-9373-9dfce8190895	\N	ac1cf001-7fbc-1f2f-817f-bce058020003
ac1cf001-7fbc-1f2f-817f-bce0575a0106	2022-03-24 18:01:33.394	\N	1	\N	aa0a0000-7fbc-1f2f-817f-bce0502c1010	41fd2ab8-71cd-4546-9bef-a388d91b2542	\N	ac1cf001-7fbc-1f2f-817f-bce058020004
\.


--
-- Data for Name: iam_identity_providers; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY portal.iam_identity_providers (iam_idp_alias, identity_provider_id) FROM stdin;
bmw-wen-oidc	ac1cf001-7fbc-1f2f-817f-bce0571b0004
Company-1	ac1cf001-7fbc-1f2f-817f-bce057230006
Company-2	ac1cf001-7fbc-1f2f-817f-bce057230007
Company-3	ac1cf001-7fbc-1f2f-817f-bce057230008
idp2	ac1cf001-7fbc-1f2f-817f-bce057770014
CX-Test-Access	ac1cf001-7fbc-1f2f-817f-bce057770015
\.


--
-- Data for Name: iam_users; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY portal.iam_users (user_entity_id, company_user_id) FROM stdin;
ad56702b-5908-44eb-a668-9a11a0e100d6	ac1cf001-7fbc-1f2f-817f-bce0575a0011
3432d787-d7c8-46fb-96d7-cc984c6bfaac	ac1cf001-7fbc-1f2f-817f-bce0577e0015
623770c5-cf38-4b9f-9a35-f8b9ae972e2d	ac1cf001-7fbc-1f2f-817f-bce058020000
3d8142f1-860b-48aa-8c2b-1ccb18699f65	ac1cf001-7fbc-1f2f-817f-bce058020001
4a23930a-30b6-461c-9ad4-58d3e761a0b5	ac1cf001-7fbc-1f2f-817f-bce058020002
ee93d4e6-2088-4352-b6e4-21f3fa7f390e	ac1cf001-7fbc-1f2f-817f-bce058020003
e756e57e-e236-4f6e-b410-92a16ff8be85	ac1cf001-7fbc-1f2f-817f-bce058020004
623770c5-cf38-4b9f-9a35-f8b9ae972e2e	ac1cf001-7fbc-1f2f-817f-bce058019990
3d8142f1-860b-48aa-8c2b-1ccb18699f66	ac1cf001-7fbc-1f2f-817f-bce058019991
47ea7f1f-f10d-4cb2-acaf-b77323ef25b4	ac1cf001-7fbc-1f2f-817f-bce058019992
070e2c20-4b09-4670-84c8-af882589e7eb	ac1cf001-7fbc-1f2f-817f-bce058019993
\.


--
-- Data for Name: invitations; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY portal.invitations (id, date_created, invitation_status_id, company_application_id, company_user_id) FROM stdin;
bd0d0302-3ec8-4bfe-99db-b89bdb6c4b94	2022-03-24 18:01:33.408	1	4f0146c6-32aa-4bb1-b844-df7e8babdcb6	ac1cf001-7fbc-1f2f-817f-bce0575a0011
d54db875-774c-479f-9f14-375f2cb8b257	2022-03-24 18:01:33.439	3	6b2d1263-c073-4a48-bfaf-704dc154ca9a	ac1cf001-7fbc-1f2f-817f-bce058020001
d54db875-774c-479f-9f14-375f2cb8b258	2022-03-24 18:01:33.439	3	6b2d1263-c073-4a48-bfaf-704dc154ca9a	ac1cf001-7fbc-1f2f-817f-bce058020000
d54db875-774c-479f-9f14-375f2cb8b260	2022-03-24 18:01:33.439	1	6b2d1263-c073-4a48-bfaf-704dc154ca9c	ac1cf001-7fbc-1f2f-817f-bce058020002
d54db875-774c-479f-9f14-375f2cb8b261	2022-03-24 18:01:33.439	1	6b2d1263-c073-4a48-bfaf-704dc154ca9d	ac1cf001-7fbc-1f2f-817f-bce058020003
d54db875-774c-479f-9f14-375f2cb8b262	2022-03-24 18:01:33.439	1	6b2d1263-c073-4a48-bfaf-704dc154ca9e	ac1cf001-7fbc-1f2f-817f-bce058020004
d54db875-774c-479f-9f14-375f2cb8b263	2022-03-24 18:01:33.439	3	6b2d1263-c073-4a48-bfaf-704dc154ca9a	ac1cf001-7fbc-1f2f-817f-bce058019990
d54db875-774c-479f-9f14-375f2cb8b264	2022-03-24 18:01:33.439	3	6b2d1263-c073-4a48-bfaf-704dc154ca9a	ac1cf001-7fbc-1f2f-817f-bce058019991
d54db875-774c-479f-9f14-375f2cb8b265	2022-03-24 18:01:33.439	3	6b2d1263-c073-4a48-bfaf-704dc154ca9a	ac1cf001-7fbc-1f2f-817f-bce058019992
d54db875-774c-479f-9f14-375f2cb8b266	2022-03-24 18:01:33.439	3	6b2d1263-c073-4a48-bfaf-704dc154ca9a	ac1cf001-7fbc-1f2f-817f-bce058019993
\.


--
-- Data for Name: notifications; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY portal.notifications (id, receiver_user_id, date_created, content, notification_type_id, is_read, due_date, creator_user_id) FROM stdin;
b753cd7f-24c7-44a7-a88e-08ed00c31600	ac1cf001-7fbc-1f2f-817f-bce058020001	2022-08-10 18:01:33.57	\N	3	f	2022-09-10 18:01:33.57	ac1cf001-7fbc-1f2f-817f-bce058020001
b753cd7f-24c7-44a7-a88e-08ed00c31601	ac1cf001-7fbc-1f2f-817f-bce058020001	2022-08-10 18:01:33.57	\N	4	f	2022-09-10 18:01:33.57	ac1cf001-7fbc-1f2f-817f-bce058020001
b753cd7f-24c7-44a7-a88e-08ed00c31602	ac1cf001-7fbc-1f2f-817f-bce058020001	2022-08-10 18:01:33.57	\N	5	f	2022-09-10 18:01:33.57	ac1cf001-7fbc-1f2f-817f-bce058020001
b753cd7f-24c7-44a7-a88e-08ed00c31603	ac1cf001-7fbc-1f2f-817f-bce058020001	2022-08-10 18:01:33.57	\N	6	f	2022-09-10 18:01:33.57	ac1cf001-7fbc-1f2f-817f-bce058020001
b753cd7f-24c7-44a7-a88e-08ed00c31604	ac1cf001-7fbc-1f2f-817f-bce058020001	2022-08-10 18:01:33.57	\N	7	f	2022-09-10 18:01:33.57	ac1cf001-7fbc-1f2f-817f-bce058020001
\.


--
-- Data for Name: offer_assigned_documents; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY portal.offer_assigned_documents (offer_id, document_id) FROM stdin;
\.


--
-- Data for Name: offer_licenses; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY portal.offer_licenses (id, licensetext) FROM stdin;
ac1cf001-7fbc-1f2f-817f-bce0573f0008	free of charge
ac1cf001-7fbc-1f2f-817f-bce05743000a	free of charge
ac1cf001-7fbc-1f2f-817f-bce05748000c	free of charge
ac1cf001-7fbc-1f2f-817f-bce0574c000e	free of charge
ac1cf001-7fbc-1f2f-817f-bce0574f0010	free of charge
500518a7-9b14-4b55-bdba-2ecd53cff831	free of charge
0f956bce-7ec3-4171-b6d2-ba7fc57c37d5	free of charge
37eee74c-95fb-40ee-ae9c-95953a80bd66	free of charge
37eee74c-95fb-40ee-ae9c-95953a80bd67	free of charge
37eee74c-95fb-40ee-ae9c-95953a80bd68	free of charge
37eee74c-95fb-40ee-ae9c-95953a80bd69	free of charge
37eee74c-95fb-40ee-ae9c-95953a80bd70	free of charge
\.


--
-- Data for Name: offer_assigned_licenses; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY portal.offer_assigned_licenses (offer_id, offer_license_id) FROM stdin;
ac1cf001-7fbc-1f2f-817f-bce0572c0007	ac1cf001-7fbc-1f2f-817f-bce0573f0008
ac1cf001-7fbc-1f2f-817f-bce0573f0009	ac1cf001-7fbc-1f2f-817f-bce05743000a
ac1cf001-7fbc-1f2f-817f-bce05744000b	ac1cf001-7fbc-1f2f-817f-bce05748000c
ac1cf001-7fbc-1f2f-817f-bce05748000d	ac1cf001-7fbc-1f2f-817f-bce0574c000e
ac1cf001-7fbc-1f2f-817f-bce0574c000f	ac1cf001-7fbc-1f2f-817f-bce0574f0010
f9cad59d-84b3-4880-a550-4072c26a6b93	0f956bce-7ec3-4171-b6d2-ba7fc57c37d5
8488044e-b8df-403a-9cbd-16dad7e4a08c	37eee74c-95fb-40ee-ae9c-95953a80bd66
f9cad59d-84b3-4880-a550-4072c26a6b94	37eee74c-95fb-40ee-ae9c-95953a80bd67
5cf74ef8-e0b7-4984-a872-474828beb5d1	37eee74c-95fb-40ee-ae9c-95953a80bd68
5cf74ef8-e0b7-4984-a872-474828beb5d2	37eee74c-95fb-40ee-ae9c-95953a80bd69
5cf74ef8-e0b7-4984-a872-474828beb5d3	37eee74c-95fb-40ee-ae9c-95953a80bd70
\.


--
-- Data for Name: offer_descriptions; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY portal.offer_descriptions (offer_id, language_short_name, description_long, description_short) FROM stdin;
ac1cf001-7fbc-1f2f-817f-bce0572c0007	en	Seamless part traceability through the n.tier supply chain\n\nknowledge you get detailed information about the components of your direct suppliers as well as your direct customers. This lets your answer questions such as:\n\n\n\nWhat's the exact lead time between the produciton of a subcomponent an your own components?\nTo wehre in the world are my components distributed and where are my suppliers located?\nWhat's the exact composition of my component on a unique ID level?\n\n\nBecause all of that is important information. PartChain keeps a storng one-up, one-down visibilty rule. You and the other parties in the network always see - only their suppliers customers data well as own ata. Your competitors won't be able to get any sensitive information about your production data.	CX App Part Chain Details
ac1cf001-7fbc-1f2f-817f-bce0573f0009	en	The Dismantler Cockpit provides decision support for Vehicle Purchaser and Dismantling lead. At a dismantling company, these are responsible for the procurement of end-of-life vehicles and the decisions on reuse, remanufacture or recycling of the whole vehicle, or of parts and components. The Dismantler Cockpit support these decisions by fetching data about a specific vehicle from the Catena-X-network and presenting the most relevant information about the potential of the vehicle and its components: The structure of the vehicle and the parts it contains are presented by visualizing the "Digital Twins" available from the OEM and the suppliers of the components (e.g. gearbox, high voltage battery). KPIs such as the material composition of the vehicle further serve to analyze the commercial potential in a circular value chain.	Dismantler buy decision and 3R strategy decision support
ac1cf001-7fbc-1f2f-817f-bce05744000b	en	Cross-industry trading platform for buying and selling secondary components and materials, opening new opportunities for collaborating across the value chain and closing the loop on component and material level.	platform for buying and selling secondary components and materials
ac1cf001-7fbc-1f2f-817f-bce05748000d	en	Description\n\nCreate an Intelligent Enterprise with Advanced Logistic collabration and Insights. SAP Logistics Business Network, material traceability options connect partners for inter-company collaboration and transparency. It supports a comprehensive set capabilities, allowing to manage freight more efficiently, benefit form situational awareness through track and trace, and create a trust chain for up- and downstream product genealogy.	SAP App Material Traceability Details
ac1cf001-7fbc-1f2f-817f-bce0574c000f	en	Automotive suppliers must constantly monitor product performance and resolve quality issues quickly to ensure they do not face costly claims. For quality analysts and engineers this involves a long, manual process of analyzing claims and failed parts that lacks vital information - including live vehicle data(such as Diagnostic Trouble Codes). Identifying root-cause issues is complex, issue resolution is slow, and costs quickly escalate. Component Performance Monitor (CPM) enables suppliers to better manage quality risk and significantly reduce the costs incurred from faulty parts by leveraging near-live vehicle data, empowering quality experts to:\n\nIdentify failure patterns and root- cause quality issues in real time\nMonitor the effectiveness of remediation measures in the fleet using live vehicle data\nand proactively request faulty parts for further analysis.\n\n...all in a single collaborative interface that supercharges the supplier to OEM feedback cycle, leading to faster proactive issue resolution, a reduction in claims, and better customer experiences.	BMW App Component Performance Monitor Details
f9cad59d-84b3-4880-a550-4072c26a6b93	en	The service provides information about new bank account fraud cases (e.g. invoices with fake bank details) reported by companies to the community.	Dashboard to manage and monitor fraud cases
8488044e-b8df-403a-9cbd-16dad7e4a08c	en	Automatic monitoring (Early Warning System) of diagnostic data	Automatic monitoring (Early Warning System) of diagnostic data
5cf74ef8-e0b7-4984-a872-474828beb5d1	en	smart MOM (Manufacturing Operations Management) consolidates all production processes and systems for managing manufacturing processes in order to increase efficiency. The smart MOM solution from German Edge Cloud includes various services and enables a holistic production management. This includes, for example, the management of production processes including specific production rules, bill of materials (BOM), recipient data, resource/asset management and much more.	smart MOM can be operated as part of our scalable Edge Cloud data center “GEC Digital Production System”, which can combine various MES (Manufacturing Execution System), MOM functionalities and integration services. Thus, smart MOM can use integrated dat
5cf74ef8-e0b7-4984-a872-474828beb5d2	en	This is only a test text	This is only a test text
5cf74ef8-e0b7-4984-a872-474828beb5d2	de	This is only a test text	This is only a test text
5cf74ef8-e0b7-4984-a872-474828beb5d3	en	This is only a test text	This is only a test text
5cf74ef8-e0b7-4984-a872-474828beb5d3	de	This is only a test text	This is only a test text
f9cad59d-84b3-4880-a550-4072c26a6b94	en	The service provides the possibility to create a fraud case (e.g. invoices with fake bank details) and report them to business partners.	Report Fraud Cases
f9cad59d-84b3-4880-a550-4072c26a6b94	de	This is only a test text	This is only a test text
ac1cf001-7fbc-1f2f-817f-bce05744000b	de	This is only a test text	This is only a test text
ac1cf001-7fbc-1f2f-817f-bce0573f0009	de	This is only a test text	This is only a test text
5cf74ef8-e0b7-4984-a872-474828beb5d4	de	AI-based software solutions enable manufacturing companies to digitalize the entire process chain in production and therefor a real increase in efficiency and competitiveness. The self-learning algorithm is the centerpiece of up2parts. It combines component information from 3D models with existing processes with the individual manufacturing expertise. As up2parts is used, the company-specific artificial intelligence is continuously trained and optimized. Production companies use up2parts to automate their work scheduling and quotation with the assistance of their own company specific artificial intelligence. The result: Automatic calculation proposals only take a few seconds, the quotation takes just 2 clicks and acceleration of the processes in production planning to the maximum. Thanks to the permanently self-training AI, the human expert knowledge in the company can be utilized optimally and is preserved in the long term. up2parts GmbH is a software company specialist in the development of efficiency-enhancing solutions for the digitalization of production processes. The company was founded in 2019, as the former software department of the contract manufacturer BAM GmbH. The experience and daily work of today's sister company BAM are used by up2parts as a basis for the development of innovative software solutions.	Enable manufacturing companies to digitalize the entire process chain in production.
5cf74ef8-e0b7-4984-a872-474828beb5d8	en	Siemens’ AM Network is an online order-to-delivery collaboration platform for the industrial additive manufacturing community. We connect the AM ecosystem, simplify the collaboration process, and streamline the AM production process. Siemens’ AM Network digitalizes and consistently improves your processes and ultimately accelerates the value in using Additive Manufacturing.	Online order-to-delivery collaboration platform for the industrial additive manufacturing community.
5cf74ef8-e0b7-4984-a872-474828beb5d4	en	AI-based software solutions enable manufacturing companies to digitalize the entire process chain in production and therefor a real increase in efficiency and competitiveness. The self-learning algorithm is the centerpiece of up2parts. It combines component information from 3D models with existing processes with the individual manufacturing expertise. As up2parts is used, the company-specific artificial intelligence is continuously trained and optimized. Production companies use up2parts to automate their work scheduling and quotation with the assistance of their own company specific artificial intelligence. The result: Automatic calculation proposals only take a few seconds, the quotation takes just 2 clicks and acceleration of the processes in production planning to the maximum. Thanks to the permanently self-training AI, the human expert knowledge in the company can be utilized optimally and is preserved in the long term. up2parts GmbH is a software company specialist in the development of efficiency-enhancing solutions for the digitalization of production processes. The company was founded in 2019, as the former software department of the contract manufacturer BAM GmbH. The experience and daily work of today's sister company BAM are used by up2parts as a basis for the development of innovative software solutions.	Enable manufacturing companies to digitalize the entire process chain in production.
5cf74ef8-e0b7-4984-a872-474828beb5d5	de	The Smart Factory Web Portal is a web-based application to allow suppliers and MaaS platforms to offer production capabilities and capacities. At the same time, the Smart Factory Web Portal offers a search environment where a buyer can upload engineering files and configure procurement requirements which the Smart Factory Web Search Engine the portal exploits uses to calculate all possible supply chain alternatives by matching it to the registered supplier information. This matching is able to use up-to-date information about the capabilities and status of assets in the factory, as well as characteristics of the products - availability, quality, price, carbon emissions and so on - which provides a basis for possible negotiation between competing offers.	Das ist nur ein Test
5cf74ef8-e0b7-4984-a872-474828beb5d5	en	The Smart Factory Web Portal is a web-based application to allow suppliers and MaaS platforms to offer production capabilities and capacities. At the same time, the Smart Factory Web Portal offers a search environment where a buyer can upload engineering files and configure procurement requirements which the Smart Factory Web Search Engine the portal exploits uses to calculate all possible supply chain alternatives by matching it to the registered supplier information. This matching is able to use up-to-date information about the capabilities and status of assets in the factory, as well as characteristics of the products - availability, quality, price, carbon emissions and so on - which provides a basis for possible negotiation between competing offers.	This is only a test text
5cf74ef8-e0b7-4984-a872-474828beb5d6	en	PRODUCTION PLANNING & CONTROL consists of the three coordinated applications PLANNING BOARD, PRODUCTION FEEDBACK and PRODUCTION COCKPIT. As a web-based solution from the cloud, it provides an easy entry into the optimization of production planning and control. PLANNING BOARD is intuitive tool for manual production planning with assistance functions. The software is suitable for easy replacement of EXCEL or paper and takes limited resources into account, such as workstations, machines and employees.PRODUCTION FEEDBACK provides real-time feedback from the shop floor, gives the machine operator an overview of all current production tasks and is directly connected to PLANNING BOARD. PRODUCTION COCKPIT is a simply structured dashboard that visualizes all manufacturing information. Depending on whether delivery reliability, order figures or the status of relevant. It can be configured individually.	This is only a test text
5cf74ef8-e0b7-4984-a872-474828beb5d6	de	PRODUCTION PLANNING & CONTROL consists of the three coordinated applications PLANNING BOARD, PRODUCTION FEEDBACK and PRODUCTION COCKPIT. As a web-based solution from the cloud, it provides an easy entry into the optimization of production planning and control. PLANNING BOARD is intuitive tool for manual production planning with assistance functions. The software is suitable for easy replacement of EXCEL or paper and takes limited resources into account, such as workstations, machines and employees. PRODUCTION FEEDBACK provides real-time feedback from the shop floor, gives the machine operator an overview of all current production tasks and is directly connected to PLANNING BOARD. PRODUCTION COCKPIT is a simply structured dashboard that visualizes all manufacturing information. Depending on whether delivery reliability, order figures or the status of relevant. It can be configured individually.	This is only a test text
5cf74ef8-e0b7-4984-a872-474828beb5d7	en	The "SAP Logistics Business Network, Material Traceability (LBN-MT)" is a solution for cross-company supply chain transparency and material traceability. The network-based solution approach creates a data basis for automotive manufacturers and suppliers alike to shorten response times in case of anomalies and to execute recalls along the supply chain more precisely. The analysis and capture of the entire batch and serial number genealogy is simple, structured, and user-friendly by using Fiori UI. Furthermore, these can be displayed graphically via a network graph. The existing standard integration with S/4HANA and ECC enables seamless data provision from the backend system in the network. Other systems can be integrated, and data provided via corresponding interfaces. With LBN-MT, customers can operate according to the principles of data interoperability and sovereignty in the Catena-X network with all relevant business partners and establish new business models along the value chain.	This is only a test text
5cf74ef8-e0b7-4984-a872-474828beb5d7	de	Das „SAP Logistics Business Network, Material Traceability (LBN-MT)“ stellt eine Lösung zur unternehmensübergreifenden Lieferkettentransparenz und Material Rückverfolgbarkeit dar. Der netzwerkbasierte Lösungsansatz schafft eine Datengrundlage für Automobilhersteller und Zulieferer gleichermaßen, um Reaktionszeiten bei Anomalien zu verkürzen und Rückrufe entlang der Lieferkette präziser auszuführen. Die Analyse und Erfassung der gesamten Chargen- und Serialnummerngeneralogie ist mittels Fiori UI einfach, strukturiert und anwenderfreundlich. Ebenso lässt sich diese über einen Netzwerkgrafen graphisch darstellen. Durch die vorhandene Standardintegration mit S/4HANA und ECC ist eine nahtlose Datenbereitstellung aus dem Backendsystem im Netzwerk möglich. Andere Systeme können über entsprechende Schnittstellen integriert und Daten bereitgestellt werden. Mit LBN-MT können Kunden nach den Prinzipien der Dateninteroperabilität und Souveränität im Catena-X Netzwerk mit allen relevanten Geschäftspartnern agieren und neue Geschäftsfelder entlang der Wertschöpfungskette etablieren.	This is only a test text
5cf74ef8-e0b7-4984-a872-474828beb5d8	de	Siemens’ AM Network is an online order-to-delivery collaboration platform for the industrial additive manufacturing community. We connect the AM ecosystem, simplify the collaboration process, and streamline the AM production process. Siemens’ AM Network digitalizes and consistently improves your processes and ultimately accelerates the value in using Additive Manufacturing.	Online order-to-delivery collaboration platform for the industrial additive manufacturing community.
5cf74ef8-e0b7-4984-a872-474828beb5d9	de	mipart is an on-demand manufacturing platform for the digital procurement of components. B2B and B2C customers can simply upload their CAD model, configure it online and order their component. The centerpiece of the mipart MaaS solution is an AI-based algorithm that analyzes and calculates the CAD models uploaded to the configurator in real time and generates a quotation within seconds. The customer can then order his component directly. What takes several days in the traditional way via paper correspondence, e-mail data exchange, and 2D component drawings, happens on mipart in just a few seconds. The manufacturing companies connected to mipart can use this new digital business model without investment costs and generate orders. Customers benefit from transparent processes and very short order times. miparts portfolio includes turned and milled parts, sheet metal processing and 3D printing. Individual parts and prototypes are just as possible as small series.	On demand manufacturing platform.
5cf74ef8-e0b7-4984-a872-474828beb5d9	en	mipart is an on-demand manufacturing platform for the digital procurement of components. B2B and B2C customers can simply upload their CAD model, configure it online and order their component. The centerpiece of the mipart MaaS solution is an AI-based algorithm that analyzes and calculates the CAD models uploaded to the configurator in real time and generates a quotation within seconds. The customer can then order his component directly. What takes several days in the traditional way via paper correspondence, e-mail data exchange, and 2D component drawings, happens on mipart in just a few seconds. The manufacturing companies connected to mipart can use this new digital business model without investment costs and generate orders. Customers benefit from transparent processes and very short order times. miparts portfolio includes turned and milled parts, sheet metal processing and 3D printing. Individual parts and prototypes are just as possible as small series.	On demand manufacturing platform.
\.


--
-- Data for Name: offer_detail_images; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY portal.offer_detail_images (id, offer_id, image_url) FROM stdin;
5cf74ef8-a0a1-0000-a000-000000000001	5cf74ef8-e0b7-4984-a872-474828beb5d1	GEC_smartMOM_Maschinenzustaende.png
5cf74ef8-a0a1-0000-a000-000000000002	5cf74ef8-e0b7-4984-a872-474828beb5d1	GEC_smartMOM_Auftragsdetails.png
5cf74ef8-a0a1-0000-a000-000000000003	5cf74ef8-e0b7-4984-a872-474828beb5d1	GEC_smartMOM_SN_Buchung.png
5cf74ef8-a0a1-0000-a000-000000000004	5cf74ef8-e0b7-4984-a872-474828beb5d3	Fleet_Manager_Image1.png
5cf74ef8-a0a1-0000-a000-000000000005	5cf74ef8-e0b7-4984-a872-474828beb5d2	DTC-Translator_Image1.png
5cf74ef8-a0a1-0000-a000-000000000006	5cf74ef8-e0b7-4984-a872-474828beb5d2	DTC-Translator_Image2.png
5cf74ef8-a0a1-0000-a000-000000000007	ac1cf001-7fbc-1f2f-817f-bce05744000b	CE_Marketplace_Image1.png
5cf74ef8-a0a1-0000-a000-000000000008	ac1cf001-7fbc-1f2f-817f-bce05744000b	CE_Marketplace_Image2.png
5cf74ef8-a0a1-0000-a000-000000000009	ac1cf001-7fbc-1f2f-817f-bce05744000b	CE_Marketplace_Image3.png
5cf74ef8-a0a1-0000-a000-000000000010	5cf74ef8-e0b7-4984-a872-474828beb5d5	Smart Factory-Details1.png
5cf74ef8-a0a1-0000-a000-000000000011	5cf74ef8-e0b7-4984-a872-474828beb5d5	Smart Factory-Details2.png
5cf74ef8-a0a1-0000-a000-000000000012	5cf74ef8-e0b7-4984-a872-474828beb5d5	Smart Factory-Details3.png
5cf74ef8-a0a1-0000-a000-000000000013	f9cad59d-84b3-4880-a550-4072c26a6b93	Test-Image1.png
5cf74ef8-a0a1-0000-a000-000000000014	f9cad59d-84b3-4880-a550-4072c26a6b93	Test-Image2.png
5cf74ef8-a0a1-0000-a000-000000000015	f9cad59d-84b3-4880-a550-4072c26a6b94	Test-Image1.png
5cf74ef8-a0a1-0000-a000-000000000016	f9cad59d-84b3-4880-a550-4072c26a6b94	Test-Image2.png
5cf74ef8-a0a1-0000-a000-000000000017	8488044e-b8df-403a-9cbd-16dad7e4a08c	Test-Image1.png
5cf74ef8-a0a1-0000-a000-000000000018	8488044e-b8df-403a-9cbd-16dad7e4a08c	Test-Image2.png
5cf74ef8-a0a1-0000-a000-000000000019	ac1cf001-7fbc-1f2f-817f-bce0572c0007	Test-Image1.png
5cf74ef8-a0a1-0000-a000-000000000020	ac1cf001-7fbc-1f2f-817f-bce0572c0007	Test-Image2.png
5cf74ef8-a0a1-0000-a000-000000000021	ac1cf001-7fbc-1f2f-817f-bce0573f0009	Test-Image1.png
5cf74ef8-a0a1-0000-a000-000000000022	ac1cf001-7fbc-1f2f-817f-bce0573f0009	Test-Image2.png
5cf74ef8-a0a1-0000-a000-000000000023	ac1cf001-7fbc-1f2f-817f-bce05748000d	Test-Image1.png
5cf74ef8-a0a1-0000-a000-000000000024	ac1cf001-7fbc-1f2f-817f-bce05748000d	Test-Image2.png
5cf74ef8-a0a1-0000-a000-000000000025	5cf74ef8-e0b7-4984-a872-474828beb5d6	PP&C.png
5cf74ef8-a0a1-0000-a000-000000000026	5cf74ef8-e0b7-4984-a872-474828beb5d6	Test-Image1.png
5cf74ef8-a0a1-0000-a000-000000000027	5cf74ef8-e0b7-4984-a872-474828beb5d6	Test-Image2.png
5cf74ef8-a0a1-0000-a000-000000000028	5cf74ef8-e0b7-4984-a872-474828beb5d4	Test-Image1.png
5cf74ef8-a0a1-0000-a000-000000000029	5cf74ef8-e0b7-4984-a872-474828beb5d4	Test-Image2.png
5cf74ef8-a0a1-0000-a000-000000000030	5cf74ef8-e0b7-4984-a872-474828beb5d7	LBN1.png
5cf74ef8-a0a1-0000-a000-000000000031	5cf74ef8-e0b7-4984-a872-474828beb5d7	LBN2.png
5cf74ef8-a0a1-0000-a000-000000000032	5cf74ef8-e0b7-4984-a872-474828beb5d7	LBN3.png
5cf74ef8-a0a1-0000-a000-000000000033	5cf74ef8-e0b7-4984-a872-474828beb5d8	Test-Image1.png
5cf74ef8-a0a1-0000-a000-000000000034	5cf74ef8-e0b7-4984-a872-474828beb5d8	Test-Image2.png
5cf74ef8-a0a1-0000-a000-000000000035	5cf74ef8-e0b7-4984-a872-474828beb5d9	Test-Image1.png
5cf74ef8-a0a1-0000-a000-000000000036	5cf74ef8-e0b7-4984-a872-474828beb5d9	Test-Image2.png
\.


--
-- Data for Name: offer_tags; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY portal.offer_tags (offer_id, tag_name) FROM stdin;
ac1cf001-7fbc-1f2f-817f-bce0572c0007	Traceability
ac1cf001-7fbc-1f2f-817f-bce05748000d	Traceability
ac1cf001-7fbc-1f2f-817f-bce0573f0009	Dismantler
ac1cf001-7fbc-1f2f-817f-bce0573f0009	Circular Economy
ac1cf001-7fbc-1f2f-817f-bce0574c000f	Test
f9cad59d-84b3-4880-a550-4072c26a6b93	Data
f9cad59d-84b3-4880-a550-4072c26a6b93	Business Partner
f9cad59d-84b3-4880-a550-4072c26a6b93	Partner Network
8488044e-b8df-403a-9cbd-16dad7e4a08c	Traceability
5cf74ef8-e0b7-4984-a872-474828beb5d1	Traceability
5cf74ef8-e0b7-4984-a872-474828beb5d2	Behavior Twin
5cf74ef8-e0b7-4984-a872-474828beb5d3	Behavior Twin
ac1cf001-7fbc-1f2f-817f-bce05744000b	Dismantler
ac1cf001-7fbc-1f2f-817f-bce05744000b	Circular Economy
5cf74ef8-e0b7-4984-a872-474828beb5d4	Test
5cf74ef8-e0b7-4984-a872-474828beb5d4	Chain
5cf74ef8-e0b7-4984-a872-474828beb5d4	Production
5cf74ef8-e0b7-4984-a872-474828beb5d5	Manufacturer-as-a-service
5cf74ef8-e0b7-4984-a872-474828beb5d5	Network
5cf74ef8-e0b7-4984-a872-474828beb5d5	Chain
5cf74ef8-e0b7-4984-a872-474828beb5d6	Manufacturer-as-a-service
5cf74ef8-e0b7-4984-a872-474828beb5d6	Network
5cf74ef8-e0b7-4984-a872-474828beb5d6	Chain
5cf74ef8-e0b7-4984-a872-474828beb5d7	Manufacturer-as-a-service
5cf74ef8-e0b7-4984-a872-474828beb5d7	Network
5cf74ef8-e0b7-4984-a872-474828beb5d7	Traceability
5cf74ef8-e0b7-4984-a872-474828beb5d8	Network
5cf74ef8-e0b7-4984-a872-474828beb5d8	Manufacturer-as-a-service
5cf74ef8-e0b7-4984-a872-474828beb5d8	Delivery
5cf74ef8-e0b7-4984-a872-474828beb5d9	Network
5cf74ef8-e0b7-4984-a872-474828beb5d9	Manufacturer-as-a-service
5cf74ef8-e0b7-4984-a872-474828beb5d9	Delivery
\.


--
-- Data for Name: user_role_descriptions; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY portal.user_role_descriptions (user_role_id, language_short_name, description) FROM stdin;
7410693c-c893-409e-852f-9ee886ce94a6	de	Unternehmensadministrator
7410693c-c893-409e-852f-9ee886ce94a6	en	Company Admin
7410693c-c893-409e-852f-9ee886ce94a7	de	Legal Admin
7410693c-c893-409e-852f-9ee886ce94a7	en	Legal Admin
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
0d9eb9e4-b6df-49bd-b045-d9cef96a879d	de	Technischer User Semantik & Zwillinge
0d9eb9e4-b6df-49bd-b045-d9cef96a879d	en	Technical User Semantic & Digital Twin
916e4be9-0ff7-48fb-bb80-97d2e93fca14	de	Data Specialist (INT only)
916e4be9-0ff7-48fb-bb80-97d2e93fca14	en	Data Specialist (INT only)
3ff68c40-6581-4e48-a03a-2a6c1c5aac89	de	App Administrator
3ff68c40-6581-4e48-a03a-2a6c1c5aac89	en	App Admin
efc20368-9e82-46ff-b88f-6495b9810253	de	Vehicle Purchaser
efc20368-9e82-46ff-b88f-6495b9810253	en	Vehicle Purchaser
aabcdfeb-6669-4c74-89f0-19cda090873f	de	Dismantling Lead
aabcdfeb-6669-4c74-89f0-19cda090873f	en	Dismantling Lead
efc20368-9e82-46ff-b88f-6495b9810250	de	Einkäufer
efc20368-9e82-46ff-b88f-6495b9810250	en	Buyer
aabcdfeb-6669-4c74-89f0-19cda0908730	de	Advanced Buyer
aabcdfeb-6669-4c74-89f0-19cda0908730	en	Advanced Buyer
b05d86e1-6c98-4619-85fa-9a425e0800b6	de	Unternehmensadministrator
b05d86e1-6c98-4619-85fa-9a425e0800b6	en	Business Admin
b05d86e1-6c98-4619-85fa-9a425e080000	de	Betrugsmanager
b05d86e1-6c98-4619-85fa-9a425e080000	en	Fraud Manager
b05d86e1-6c98-4619-85fa-9a425e080001	de	Betrugsreporter
b05d86e1-6c98-4619-85fa-9a425e080001	en	Fraud User
b05d86e1-6c98-4619-85fa-9a425e080002	de	Betrugsmanager
b05d86e1-6c98-4619-85fa-9a425e080002	en	Fraud Manager
b05d86e1-6c98-4619-85fa-9a425e080003	de	Betrugsreporter
b05d86e1-6c98-4619-85fa-9a425e080003	en	Fraud User
855eeefb-a2ef-4d74-ac10-34a87afcb865	de	Administrator
855eeefb-a2ef-4d74-ac10-34a87afcb865	en	Administrator
545c2616-2fce-4f52-b881-331db2fc1e35	de	Kunde
545c2616-2fce-4f52-b881-331db2fc1e35	en	Customer
7a9e0777-2b13-4463-a7c4-f699afff3527	de	Erstausrüster
7a9e0777-2b13-4463-a7c4-f699afff3527	en	Original Equipment Manufacturer
607818be-4978-41f4-bf63-fa8d2de51155	de	Hinzufügen, Ändern und Löschen von eigenen Digitalen Zwillingen
607818be-4978-41f4-bf63-fa8d2de51155	en	Add, Change and Delete own Digital Twins
607818be-4978-41f4-bf63-fa8d2de51156	de	Hinzufügen, Ändern und Löschen von Semantic Models
607818be-4978-41f4-bf63-fa8d2de51156	en	Add, Change and Delete Semnatic Models
607818be-4978-41f4-bf63-fa8d2de51157	de	Anzeigen und Ändern des Unternehmens-Wallets
607818be-4978-41f4-bf63-fa8d2de51157	en	View and modify own company wallet
\.


--
-- PostgreSQL database dump complete
--

