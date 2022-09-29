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
-- Data for Name: addresses; Type: TABLE DATA; Schema: portal; Owner: portal
--

COPY portal.addresses (id, date_created, date_last_changed, city, region, streetadditional, streetname, streetnumber, zipcode, country_alpha2code) FROM stdin;
b4db3945-19a7-4a50-97d6-e66e8dfd04fb	2022-03-24 18:01:33.306+00	2022-03-24 18:01:33.306+00	Munich	\N	\N	Street	1	00001	DE
b4db3945-19a7-4a50-97d6-e66e8dfd04fc	2022-03-24 18:01:33.306+00	2022-03-24 18:01:33.306+00	Munich	\N	\N	Street	1	00001	DE
b4db3945-19a7-4a50-97d6-e66e8dfd04fd	2022-03-24 18:01:33.306+00	2022-03-24 18:01:33.306+00	Munich	\N	\N	Street	1	00001	DE
12302f9b-418c-4b8c-aea8-3eedf67e6a02	2022-03-24 18:01:33.341+00	2022-03-24 18:01:33.341+00	Munich	\N	\N	Street	2	00001	DE
3a52099d-4988-4a56-9787-10a669c41338	2022-03-24 18:01:33.344+00	2022-03-24 18:01:33.344+00	Munich	\N	\N	Street	3	00001	DE
aa49c0ec-4e65-4115-a01c-7adfc36d220e	2022-03-24 18:01:33.391+00	2022-03-24 18:01:33.391+00	Munich	\N	\N	Street	4	00001	DE
c0e1d802-0c4b-4d0d-a763-b6d9d56e6f07	2022-03-24 18:01:33.428+00	2022-03-24 18:01:33.428+00	Munich	\N	\N	Street	5	00001	DE
86da3e1c-a634-41a6-ad44-9880746123e4	2022-03-24 18:01:33.435+00	2022-03-24 18:01:33.435+00	Munich	\N	\N	Street	6	00001	DE
0f562ea7-4cc1-47a9-bfee-b41b0ac67ebb	2022-03-24 18:01:33.443+00	2022-03-24 18:01:33.443+00	Munich	\N	\N	Street	7	00001	DE
095ca573-bef1-4092-ad60-b7f651678fcd	2022-03-24 18:01:33.428+00	2022-03-24 18:01:33.428+00	Munich	\N	\N	Street	8	00001	DE
081c8bfd-c6d1-4119-a5f8-a69726dfc11d	2022-03-24 18:01:33.428+00	2022-03-24 18:01:33.428+00	Munich	\N	\N	Street	9	00001	DE
\.


--
-- Data for Name: companies; Type: TABLE DATA; Schema: portal; Owner: portal
--

COPY portal.companies (id, date_created, business_partner_number, tax_id, name, shortname, company_status_id, address_id) FROM stdin;
2dc4249f-b5ca-4d42-bef1-7a7a950a4f87	2022-03-24 18:01:33.306+00	BPNL00000003CRHK	0000000000	Catena-X	Catena-X	2	b4db3945-19a7-4a50-97d6-e66e8dfd04fb
ac861325-bc54-4583-bcdc-9e9f2a38ff84	2022-03-24 18:01:33.341+00	BPNL00000003AYRE	0000000000	Bayerische Motorenwerke AG	BMW AG	2	12302f9b-418c-4b8c-aea8-3eedf67e6a02
0dcd8209-85e2-4073-b130-ac094fb47106	2022-03-24 18:01:33.344+00	BPNL00000003LLHA	0000000000	SAP AG	SAP	1	3a52099d-4988-4a56-9787-10a669c41338
220330ac-170d-4e22-8d72-9467ed042149	2022-03-24 18:01:33.393+00	BPNL00000001LLHA	0000000000	Car Factory 1	Car Factory 1	1	aa49c0ec-4e65-4115-a01c-7adfc36d220e
bdac6865-2a8d-4bfd-9373-9dfce8190895	2022-03-24 18:01:33.43+00	BPNL00000002LLHA	0000000000	Car Factory 2	Car Factory 2	1	c0e1d802-0c4b-4d0d-a763-b6d9d56e6f07
41fd2ab8-71cd-4546-9bef-a388d91b2542	2022-03-24 18:01:33.438+00	BPNL00000003LLHA	0000000000	Car Factory 3	Car Factory 3	1	86da3e1c-a634-41a6-ad44-9880746123e4
d14eba77-0b18-4e41-9d84-49ef875c0763	2022-03-24 18:01:33.442+00	BPNL00000003LLHB	0000000000	Dummy Corp. 1	Dummy Corp. 1	1	0f562ea7-4cc1-47a9-bfee-b41b0ac67ebb
9d049598-0dac-4d26-8a21-8f5b64c799cf	2022-03-24 18:01:33.442+00	CAXLCDQCORPZZ	0000000000	CDQ	CDQ	1	095ca573-bef1-4092-ad60-b7f651678fcd
cac8fa6a-9db7-4bad-9cbd-56298b74bac2	2022-03-24 18:01:33.442+00	CAXLBOSCHZZ	0000000000	BOSCH	BOSCH	2	081c8bfd-c6d1-4119-a5f8-a69726dfc11d
dfd90abe-b20e-4aff-87c6-f30f2bf9b104	2022-08-08 18:01:33.442+00	BPNL000000000009	0000000000	Siemens	Siemens	2	b4db3945-19a7-4a50-97d6-e66e8dfd04fc
fe55fe20-5f19-401e-91a2-dfa37b44a0be	2022-08-08 18:01:33.442+00	BPNL00000003CSGV	0000000000	German Edge Cloud GmbH & Co. KG	GEC	2	b4db3945-19a7-4a50-97d6-e66e8dfd04fd
\.


--
-- Data for Name: agreements; Type: TABLE DATA; Schema: portal; Owner: portal
--

COPY portal.agreements (id, agreement_category_id, date_created, date_last_changed, agreement_type, name, issuer_company_id, use_case_id) FROM stdin;
aa0a0000-7fbc-1f2f-817f-bce0502c1010	1	2022-03-24 18:01:33.388+00	2022-03-24 18:01:33.388+00	\N	Terms & Conditions - Active Participant	2dc4249f-b5ca-4d42-bef1-7a7a950a4f87	1aacde78-35ec-4df3-ba1e-f988cddcbbd9
aa0a0000-7fbc-1f2f-817f-bce0502c1011	1	2022-03-24 18:01:33.388+00	2022-03-24 18:01:33.388+00	\N	Terms & Conditions - App Provider	2dc4249f-b5ca-4d42-bef1-7a7a950a4f87	1aacde78-35ec-4df3-ba1e-f988cddcbbd9
aa0a0000-7fbc-1f2f-817f-bce0502c1012	1	2022-03-24 18:01:33.388+00	2022-03-24 18:01:33.388+00	\N	Terms & Conditions - Consultant	2dc4249f-b5ca-4d42-bef1-7a7a950a4f87	1aacde78-35ec-4df3-ba1e-f988cddcbbd9
aa0a0000-7fbc-1f2f-817f-bce0502c1013	1	2022-03-24 18:01:33.388+00	2022-03-24 18:01:33.388+00	\N	Security Regulations - Active Participant	2dc4249f-b5ca-4d42-bef1-7a7a950a4f87	1aacde78-35ec-4df3-ba1e-f988cddcbbd9
aa0a0000-7fbc-1f2f-817f-bce0502c1014	4	2022-09-18 00:00:00+00	2022-09-18 00:00:00+00		Terms & Conditions - Service Marketplace	2dc4249f-b5ca-4d42-bef1-7a7a950a4f87	1aacde78-35ec-4df3-ba1e-f988cddcbbd9
aa0a0000-7fbc-1f2f-817f-bce0502c1015	2	2022-09-18 00:00:00+00	2022-09-18 00:00:00+00		Service Agreement DFT	ac861325-bc54-4583-bcdc-9e9f2a38ff84	1aacde78-35ec-4df3-ba1e-f988cddcbbd9
aa0a0000-7fbc-1f2f-817f-bce0502c1016	2	2022-09-18 00:00:00+00	2022-09-18 00:00:00+00		Service Agreement DFT	2dc4249f-b5ca-4d42-bef1-7a7a950a4f87	1aacde78-35ec-4df3-ba1e-f988cddcbbd9
\.


--
-- Data for Name: agreement_assigned_company_roles; Type: TABLE DATA; Schema: portal; Owner: portal
--

COPY portal.agreement_assigned_company_roles (agreement_id, company_role_id) FROM stdin;
aa0a0000-7fbc-1f2f-817f-bce0502c1010	1
aa0a0000-7fbc-1f2f-817f-bce0502c1011	2
aa0a0000-7fbc-1f2f-817f-bce0502c1013	1
\.


--
-- Data for Name: document_templates; Type: TABLE DATA; Schema: portal; Owner: portal
--

COPY portal.document_templates (id, date_created, date_last_changed, documenttemplatename, documenttemplateversion) FROM stdin;
\.


--
-- Data for Name: agreement_assigned_document_templates; Type: TABLE DATA; Schema: portal; Owner: portal
--

COPY portal.agreement_assigned_document_templates (agreement_id, document_template_id) FROM stdin;
\.


--
-- Data for Name: agreement_assigned_offer_types; Type: TABLE DATA; Schema: portal; Owner: portal
--

COPY portal.agreement_assigned_offer_types (agreement_id, offer_type_id) FROM stdin;
aa0a0000-7fbc-1f2f-817f-bce0502c1014	3
aa0a0000-7fbc-1f2f-817f-bce0502c1015	1
aa0a0000-7fbc-1f2f-817f-bce0502c1016	1
\.


--
-- Data for Name: offers; Type: TABLE DATA; Schema: portal; Owner: portal
--

COPY portal.offers (id, name, date_created, date_released, thumbnail_url, marketing_url, contact_email, contact_number, provider, provider_company_id, offer_status_id, date_last_changed, sales_manager_id, offer_type_id) FROM stdin;
ac1cf001-7fbc-1f2f-817f-bce0572c0007	Trace-X	2022-03-24 18:01:33.348+00	2022-03-24 18:01:33.348+00	Part Chain.png	\N	\N	0000	Catena-X	2dc4249f-b5ca-4d42-bef1-7a7a950a4f87	3	2022-03-24 18:01:33.348+00	ac1cf001-7fbc-1f2f-817f-bce058020001	1
ac1cf001-7fbc-1f2f-817f-bce05748000d	Trusted Traceability	2022-03-24 18:01:33.384+00	2022-03-24 18:01:33.384+00	STT.png	\N	\N	0000	Catena-X	dfd90abe-b20e-4aff-87c6-f30f2bf9b104	3	2022-03-24 18:01:33.384+00	ac1cf001-7fbc-1f2f-817f-bce058020001	1
ac1cf001-7fbc-1f2f-817f-bce0573f0009	Dismantler Cockpit	2022-03-24 18:01:33.375+00	2022-03-24 18:01:33.375+00	CE_Marketplace_LP.png	\N	support@sap.com	0000	SAP	0dcd8209-85e2-4073-b130-ac094fb47106	3	2022-03-24 18:01:33.375+00	ac1cf001-7fbc-1f2f-817f-bce058020001	1
ac1cf001-7fbc-1f2f-817f-bce05744000b	Project Implementation: Earth Commerce	2022-03-24 18:01:33.38+00	2022-03-24 18:01:33.38+00	CE_Marketplace_LP.png	\N	support@sap.com	0000	SAP	0dcd8209-85e2-4073-b130-ac094fb47106	3	2022-03-24 18:01:33.38+00	ac1cf001-7fbc-1f2f-817f-bce058020001	1
ac1cf001-7fbc-1f2f-817f-bce0574c000f	Component Performance Monitor	2022-03-24 18:01:33.388+00	2022-03-24 18:01:33.388+00	Palantir.png	https://www.palantir.com/explore/cpm/	cpm-info@palantir.com	0000	Palantir Technologies	ac861325-bc54-4583-bcdc-9e9f2a38ff84	3	2022-03-24 18:01:33.388+00	ac1cf001-7fbc-1f2f-817f-bce058020001	1
f9cad59d-84b3-4880-a550-4072c26a6b93	Fraud Dashboard	2022-03-24 18:01:33.388+00	2022-03-24 18:01:33.388+00	Fraud Dash.png	\N	\N	0000	Catena-X	2dc4249f-b5ca-4d42-bef1-7a7a950a4f87	3	2022-03-24 18:01:33.388+00	ac1cf001-7fbc-1f2f-817f-bce058020001	1
f9cad59d-84b3-4880-a550-4072c26a6b94	Fraud Reporter	2022-03-24 18:01:33.388+00	2022-03-24 18:01:33.388+00	lead.png	\N	\N	0000	Catena-X	2dc4249f-b5ca-4d42-bef1-7a7a950a4f87	3	2022-03-24 18:01:33.388+00	ac1cf001-7fbc-1f2f-817f-bce058020001	1
8488044e-b8df-403a-9cbd-16dad7e4a08c	Covanto - AFQM	2022-03-24 18:01:33.388+00	2022-03-24 18:01:33.388+00	AFQM_screen.jpg	\N	\N	0000	Catena-X	cac8fa6a-9db7-4bad-9cbd-56298b74bac2	3	2022-03-24 18:01:33.388+00	ac1cf001-7fbc-1f2f-817f-bce058020001	1
5cf74ef8-e0b7-4984-a872-474828beb5d1	Smart MOM	2022-03-24 18:01:33.388+00	2022-03-24 18:01:33.388+00	logo-GEC.jpg	\N	info@gec.io	+49 69 24747180	German Edge Cloud GmbH & Co. KG	fe55fe20-5f19-401e-91a2-dfa37b44a0be	3	2022-03-24 18:01:33.388+00	ac1cf001-7fbc-1f2f-817f-bce058020001	1
5cf74ef8-e0b7-4984-a872-474828beb5d2	DTC-Translator	2022-03-24 18:01:33.388+00	2022-03-24 18:01:33.388+00	DTC-Translator_LP.svg	\N	gerd.preuss@adac.de	0000	ADAC	2dc4249f-b5ca-4d42-bef1-7a7a950a4f87	3	2022-03-24 18:01:33.388+00	ac1cf001-7fbc-1f2f-817f-bce058020001	1
5cf74ef8-e0b7-4984-a872-474828beb5d3	Fleet Manager	2022-03-24 18:01:33.388+00	2022-03-24 18:01:33.388+00	Fleet_Manager_LP.png	\N	gerd.preuss@adac.de	0000	ADAC	2dc4249f-b5ca-4d42-bef1-7a7a950a4f87	3	2022-03-24 18:01:33.388+00	ac1cf001-7fbc-1f2f-817f-bce058020001	1
5cf74ef8-e0b7-4984-a872-474828beb5d4	up2parts cloud	2022-03-24 18:01:33.388+00	2022-03-24 18:01:33.388+00	up2parts.png	\N	info@up2parts.com	0000	up2parts GmbH	2dc4249f-b5ca-4d42-bef1-7a7a950a4f87	3	2022-03-24 18:01:33.388+00	ac1cf001-7fbc-1f2f-817f-bce058020001	1
5cf74ef8-e0b7-4984-a872-474828beb5d5	Smart Factory Web Portal	2022-06-29 18:01:33.388+00	2022-03-24 18:01:33.388+00	Smart Factory.png	\N	florian.patzer@iosb.fraunhofer.de	0000	Fraunhofer IOSB	2dc4249f-b5ca-4d42-bef1-7a7a950a4f87	3	2022-06-29 18:01:33.388+00	ac1cf001-7fbc-1f2f-817f-bce058020001	1
5cf74ef8-e0b7-4984-a872-474828beb5d6	Production Planning and Control	2022-06-29 18:01:33.388+00	2022-03-24 18:01:33.388+00	PP&C.png	\N	Cemil Can	0000	ISTOS GmbH	2dc4249f-b5ca-4d42-bef1-7a7a950a4f87	3	2022-06-29 18:01:33.388+00	ac1cf001-7fbc-1f2f-817f-bce058020001	1
5cf74ef8-e0b7-4984-a872-474828beb5d7	Logistics Network, Material Traceability (LBN-MT)	2022-06-29 18:01:33.388+00	2022-03-24 18:01:33.388+00	LBN.png	\N	janina.reintjes@sap.com	0000	SAP	0dcd8209-85e2-4073-b130-ac094fb47106	3	2022-06-29 18:01:33.388+00	ac1cf001-7fbc-1f2f-817f-bce058020001	1
9b957704-3505-4445-822c-d7ef80f27fcd	Portal	2022-03-24 18:01:33.388+00	2022-03-24 18:01:33.388+00	\N	\N	\N	0000	Catena-X	ac861325-bc54-4583-bcdc-9e9f2a38ff84	3	2022-03-24 18:01:33.388+00	ac1cf001-7fbc-1f2f-817f-bce058020001	2
9ef01c20-6d9d-41ef-b336-fa64e1e2e4c2	Registration	2022-03-24 18:01:33.388+00	2022-03-24 18:01:33.388+00	\N	\N	\N	0000	Catena-X	ac861325-bc54-4583-bcdc-9e9f2a38ff84	3	2022-03-24 18:01:33.388+00	ac1cf001-7fbc-1f2f-817f-bce058020001	2
0ffcb416-1101-4ba6-8d4a-a9dfa31745a4	Technical User Management	2022-03-24 18:01:33.388+00	2022-03-24 18:01:33.388+00	\N	\N	\N	0000	Catena-X	ac861325-bc54-4583-bcdc-9e9f2a38ff84	3	2022-03-24 18:01:33.388+00	ac1cf001-7fbc-1f2f-817f-bce058020001	2
5cf74ef8-e0b7-4984-a872-474828beb5d8	AM Network	2022-08-28 00:00:00+00	2022-08-28 00:00:00+00	\N	\N	additive.manufacturing.industry@siemens.com	0000	Siemens	dfd90abe-b20e-4aff-87c6-f30f2bf9b104	3	2022-08-28 00:00:00+00	ac1cf001-7fbc-1f2f-817f-bce058020001	1
5cf74ef8-e0b7-4984-a872-474828beb5d9	mipart GmbH	2022-08-28 00:00:00+00	2022-08-28 00:00:00+00	\N	\N	info@mipart.com	0000	mipart GmbH	2dc4249f-b5ca-4d42-bef1-7a7a950a4f87	3	2022-08-28 00:00:00+00	ac1cf001-7fbc-1f2f-817f-bce058020001	1
\.


--
-- Data for Name: agreement_assigned_offers; Type: TABLE DATA; Schema: portal; Owner: portal
--

COPY portal.agreement_assigned_offers (agreement_id, offer_id) FROM stdin;
\.


--
-- Data for Name: app_assigned_use_cases; Type: TABLE DATA; Schema: portal; Owner: portal
--

COPY portal.app_assigned_use_cases (app_id, use_case_id) FROM stdin;
ac1cf001-7fbc-1f2f-817f-bce0572c0007	06b243a4-ba51-4bf3-bc40-5d79a2231b86
ac1cf001-7fbc-1f2f-817f-bce0573f0009	1aacde78-35ec-4df3-ba1e-f988cddcbbd8
ac1cf001-7fbc-1f2f-817f-bce05744000b	1aacde78-35ec-4df3-ba1e-f988cddcbbd8
ac1cf001-7fbc-1f2f-817f-bce05748000d	06b243a4-ba51-4bf3-bc40-5d79a2231b86
f9cad59d-84b3-4880-a550-4072c26a6b93	6909ccc7-37c8-4088-99ab-790f20702460
8488044e-b8df-403a-9cbd-16dad7e4a08c	41e4a4c0-aae4-41c0-97c9-ebafde410de4
ac1cf001-7fbc-1f2f-817f-bce0574c000f	c065a349-f649-47f8-94d5-1a504a855419
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
-- Data for Name: iam_clients; Type: TABLE DATA; Schema: portal; Owner: portal
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
-- Data for Name: app_instances; Type: TABLE DATA; Schema: portal; Owner: portal
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
-- Data for Name: app_languages; Type: TABLE DATA; Schema: portal; Owner: portal
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
-- Data for Name: offer_subscriptions; Type: TABLE DATA; Schema: portal; Owner: portal
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
-- Data for Name: app_subscription_details; Type: TABLE DATA; Schema: portal; Owner: portal
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
-- Data for Name: company_applications; Type: TABLE DATA; Schema: portal; Owner: portal
--

COPY portal.company_applications (id, date_created, date_last_changed, application_status_id, company_id, last_editor_id) FROM stdin;
4f0146c6-32aa-4bb1-b844-df7e8babdcb2	2022-03-24 18:01:33.403+00	2022-03-24 18:01:33.403+00	8	ac861325-bc54-4583-bcdc-9e9f2a38ff84	\N
4f0146c6-32aa-4bb1-b844-df7e8babdcb3	2022-03-24 18:01:33.403+00	2022-03-24 18:01:33.403+00	8	0dcd8209-85e2-4073-b130-ac094fb47106	\N
4f0146c6-32aa-4bb1-b844-df7e8babdcb4	2022-03-24 18:01:33.403+00	2022-03-24 18:01:33.403+00	8	9d049598-0dac-4d26-8a21-8f5b64c799cf	\N
4f0146c6-32aa-4bb1-b844-df7e8babdcb5	2022-03-24 18:01:33.403+00	2022-03-24 18:01:33.403+00	8	cac8fa6a-9db7-4bad-9cbd-56298b74bac2	\N
4f0146c6-32aa-4bb1-b844-df7e8babdcb6	2022-03-24 18:01:33.403+00	2022-03-24 18:01:33.403+00	7	d14eba77-0b18-4e41-9d84-49ef875c0763	\N
0195a85f-e465-4571-b980-d1351dd76a9f	2022-03-24 18:01:33.431+00	2022-03-24 18:01:33.431+00	9	bdac6865-2a8d-4bfd-9373-9dfce8190895	\N
6b2d1263-c073-4a48-bfaf-704dc154ca9a	2022-03-24 18:01:33.439+00	2022-03-24 18:01:33.439+00	3	2dc4249f-b5ca-4d42-bef1-7a7a950a4f87	\N
6b2d1263-c073-4a48-bfaf-704dc154ca9c	2022-03-24 18:01:33.439+00	2022-03-24 18:01:33.439+00	1	220330ac-170d-4e22-8d72-9467ed042149	\N
6b2d1263-c073-4a48-bfaf-704dc154ca9d	2022-05-05 18:01:33.439+00	2022-05-05 18:01:33.439+00	1	bdac6865-2a8d-4bfd-9373-9dfce8190895	\N
6b2d1263-c073-4a48-bfaf-704dc154ca9e	2022-05-05 18:01:33.439+00	2022-05-05 18:01:33.439+00	1	41fd2ab8-71cd-4546-9bef-a388d91b2542	\N
\.


--
-- Data for Name: company_assigned_roles; Type: TABLE DATA; Schema: portal; Owner: portal
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
-- Data for Name: company_assigned_use_cases; Type: TABLE DATA; Schema: portal; Owner: portal
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
-- Data for Name: identity_providers; Type: TABLE DATA; Schema: portal; Owner: portal
--

COPY portal.identity_providers (id, date_created, identity_provider_category_id) FROM stdin;
ac1cf001-7fbc-1f2f-817f-bce0571b0004	2022-05-05 18:01:33.33+00	2
ac1cf001-7fbc-1f2f-817f-bce057230006	2022-05-05 18:01:33.33+00	1
ac1cf001-7fbc-1f2f-817f-bce057230007	2022-05-05 18:01:33.33+00	1
ac1cf001-7fbc-1f2f-817f-bce057230008	2022-05-05 18:01:33.33+00	1
ac1cf001-7fbc-1f2f-817f-bce0575a0012	2022-05-05 18:01:33.33+00	1
ac1cf001-7fbc-1f2f-817f-bce057770014	2022-05-05 18:01:33.33+00	1
ac1cf001-7fbc-1f2f-817f-bce057770015	2022-05-05 18:01:33.33+00	1
\.


--
-- Data for Name: company_identity_providers; Type: TABLE DATA; Schema: portal; Owner: portal
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
-- Data for Name: company_service_accounts; Type: TABLE DATA; Schema: portal; Owner: portal
--

COPY portal.company_service_accounts (id, date_created, company_id, name, description, company_service_account_status_id) FROM stdin;
7e85a0b8-0001-ab67-10d1-0ef508201006	2022-06-01 18:01:33.439+00	2dc4249f-b5ca-4d42-bef1-7a7a950a4f87	Service Account 01	sa-cl5-custodian-1	1
7e85a0b8-0001-ab67-10d1-0ef508201007	2022-06-01 18:01:33.439+00	2dc4249f-b5ca-4d42-bef1-7a7a950a4f87	Service Account 02	sa-cl5-custodian-2	1
7e85a0b8-0001-ab67-10d1-0ef508201008	2022-06-01 18:01:33.439+00	2dc4249f-b5ca-4d42-bef1-7a7a950a4f87	Service Account 03	sa-cl5-custodian-internaltest	1
7e85a0b8-0001-ab67-10d1-0ef508201009	2022-06-01 18:01:33.439+00	2dc4249f-b5ca-4d42-bef1-7a7a950a4f87	Service Account 04	sa-cl6-cx-1	1
7e85a0b8-0001-ab67-10d1-0ef508201010	2022-06-01 18:01:33.439+00	2dc4249f-b5ca-4d42-bef1-7a7a950a4f87	Service Account 05	sa-cl6-cx-2	1
7e85a0b8-0001-ab67-10d1-0ef508201011	2022-06-01 18:01:33.439+00	ac861325-bc54-4583-bcdc-9e9f2a38ff84	Service Account 06	sa-cl6-cx-3	1
7e85a0b8-0001-ab67-10d1-0ef508201012	2022-06-01 18:01:33.439+00	2dc4249f-b5ca-4d42-bef1-7a7a950a4f87	Service Account 07	sa-cl6-cx-4	1
7e85a0b8-0001-ab67-10d1-0ef508201013	2022-06-01 18:01:33.439+00	2dc4249f-b5ca-4d42-bef1-7a7a950a4f87	Service Account 08	sa-cl6-cx-5	1
7e85a0b8-0001-ab67-10d1-0ef508201014	2022-06-01 18:01:33.439+00	2dc4249f-b5ca-4d42-bef1-7a7a950a4f87	Service Account 09	sa-cl6-cx-6	1
7e85a0b8-0001-ab67-10d1-0ef508201015	2022-06-01 18:01:33.439+00	2dc4249f-b5ca-4d42-bef1-7a7a950a4f87	sa-cl6-cx-7	sa-cl6-cx-7	1
7e85a0b8-0001-ab67-10d1-0ef508201016	2022-06-01 18:01:33.439+00	2dc4249f-b5ca-4d42-bef1-7a7a950a4f87	sa-cl6-cx-8	sa-cl6-cx-8	1
7e85a0b8-0001-ab67-10d1-0ef508201017	2022-06-01 18:01:33.439+00	2dc4249f-b5ca-4d42-bef1-7a7a950a4f87	sa-cl6-cx-9	sa-cl6-cx-9	1
7e85a0b8-0001-ab67-10d1-0ef508201018	2022-06-01 18:01:33.439+00	2dc4249f-b5ca-4d42-bef1-7a7a950a4f87	sa-cl6-cx-10	sa-cl6-cx-10	1
7e85a0b8-0001-ab67-10d1-0ef508201019	2022-06-01 18:01:33.439+00	2dc4249f-b5ca-4d42-bef1-7a7a950a4f87	sa-cl6-cx-11	sa-cl6-cx-11	1
7e85a0b8-0001-ab67-10d1-0ef508201020	2022-06-01 18:01:33.439+00	2dc4249f-b5ca-4d42-bef1-7a7a950a4f87	sa-cl6-cx-12	sa-cl6-cx-12	1
7e85a0b8-0001-ab67-10d1-0ef508201021	2022-06-01 18:01:33.439+00	2dc4249f-b5ca-4d42-bef1-7a7a950a4f87	sa-cl6-cx-13	sa-cl6-cx-13	1
7e85a0b8-0001-ab67-10d1-0ef508201022	2022-06-01 18:01:33.439+00	2dc4249f-b5ca-4d42-bef1-7a7a950a4f87	sa-cl5-cx-1	sa-cl5-cx-1	1
\.


--
-- Data for Name: company_users; Type: TABLE DATA; Schema: portal; Owner: portal
--

COPY portal.company_users (id, date_created, date_last_changed, email, firstname, lastlogin, lastname, company_id, company_user_status_id, last_editor_id) FROM stdin;
ac1cf001-7fbc-1f2f-817f-bce0575a0011	2022-03-24 18:01:33.394+00	2022-03-24 18:01:33.394+00	\N	\N	\N	\N	0dcd8209-85e2-4073-b130-ac094fb47106	1	\N
ac1cf001-7fbc-1f2f-817f-bce0577e0015	2022-03-24 18:01:33.438+00	2022-03-24 18:01:33.438+00	\N	\N	\N	\N	41fd2ab8-71cd-4546-9bef-a388d91b2542	1	\N
ac1cf001-7fbc-1f2f-817f-bce058019990	2022-03-24 18:01:33.57+00	2022-03-24 18:01:33.57+00	julia.jeroch@bmw.de	Test User	\N	cx-user-2	2dc4249f-b5ca-4d42-bef1-7a7a950a4f87	1	\N
ac1cf001-7fbc-1f2f-817f-bce058019991	2022-03-24 18:01:33.57+00	2022-03-24 18:01:33.57+00	julia.jeroch@bmw.de	Test User	\N	cx-admin-2	2dc4249f-b5ca-4d42-bef1-7a7a950a4f87	1	\N
ac1cf001-7fbc-1f2f-817f-bce058019992	2022-03-24 18:01:33.57+00	2022-03-24 18:01:33.57+00	julia.jeroch@bmw.de	Test User	\N	company-admin-2	2dc4249f-b5ca-4d42-bef1-7a7a950a4f87	1	\N
ac1cf001-7fbc-1f2f-817f-bce058019993	2022-03-24 18:01:33.57+00	2022-03-24 18:01:33.57+00	julia.jeroch@bmw.de	Test User	\N	it-admin-2	2dc4249f-b5ca-4d42-bef1-7a7a950a4f87	1	\N
ac1cf001-7fbc-1f2f-817f-bce058020000	2022-03-24 18:01:33.57+00	2022-03-24 18:01:33.57+00	julia.jeroch@bmw.de	Test User	\N	CX User	2dc4249f-b5ca-4d42-bef1-7a7a950a4f87	1	\N
ac1cf001-7fbc-1f2f-817f-bce058020001	2022-03-24 18:01:33.57+00	2022-03-24 18:01:33.57+00	julia.jeroch@bmw.de	Test User	\N	CX Admin	2dc4249f-b5ca-4d42-bef1-7a7a950a4f87	1	\N
ac1cf001-7fbc-1f2f-817f-bce058020002	2022-03-24 18:01:33.57+00	2022-03-24 18:01:33.57+00	julia.jeroch@bmw.de	Test User	\N	Company Admin 1	220330ac-170d-4e22-8d72-9467ed042149	1	\N
ac1cf001-7fbc-1f2f-817f-bce058020003	2022-03-24 18:01:33.57+00	2022-03-24 18:01:33.57+00	julia.jeroch@bmw.de	Test User	\N	Company Admin 2	bdac6865-2a8d-4bfd-9373-9dfce8190895	1	\N
ac1cf001-7fbc-1f2f-817f-bce058020004	2022-03-24 18:01:33.57+00	2022-03-24 18:01:33.57+00	julia.jeroch@bmw.de	Test User	\N	Company Admin 3	41fd2ab8-71cd-4546-9bef-a388d91b2542	1	\N
\.


--
-- Data for Name: company_user_assigned_app_favourites; Type: TABLE DATA; Schema: portal; Owner: portal
--

COPY portal.company_user_assigned_app_favourites (company_user_id, app_id) FROM stdin;
ac1cf001-7fbc-1f2f-817f-bce058020000	f9cad59d-84b3-4880-a550-4072c26a6b93
ac1cf001-7fbc-1f2f-817f-bce058020000	f9cad59d-84b3-4880-a550-4072c26a6b94
ac1cf001-7fbc-1f2f-817f-bce058020001	f9cad59d-84b3-4880-a550-4072c26a6b93
ac1cf001-7fbc-1f2f-817f-bce058020001	f9cad59d-84b3-4880-a550-4072c26a6b94
\.


--
-- Data for Name: company_user_assigned_business_partners; Type: TABLE DATA; Schema: portal; Owner: portal
--

COPY portal.company_user_assigned_business_partners (company_user_id, business_partner_number) FROM stdin;
ac1cf001-7fbc-1f2f-817f-bce0575a0011	CAXSDUMMYSAPZZ
ac1cf001-7fbc-1f2f-817f-bce0577e0015	CAXSCARFACTORY3ZZ
ac1cf001-7fbc-1f2f-817f-bce058020000	CAXSDUMMYCATENAZZ
ac1cf001-7fbc-1f2f-817f-bce058020001	CAXSDUMMYCATENAZZ
\.


--
-- Data for Name: user_roles; Type: TABLE DATA; Schema: portal; Owner: portal
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
607818be-4978-41f4-bf63-fa8d2de51162	BPDM Management	0ffcb416-1101-4ba6-8d4a-a9dfa31745a4
607818be-4978-41f4-bf63-fa8d2de51163	BPDM Partner Gate	0ffcb416-1101-4ba6-8d4a-a9dfa31745a4
\.


--
-- Data for Name: company_user_assigned_roles; Type: TABLE DATA; Schema: portal; Owner: portal
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
-- Data for Name: connectors; Type: TABLE DATA; Schema: portal; Owner: portal
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
-- Data for Name: documents; Type: TABLE DATA; Schema: portal; Owner: portal
--

COPY portal.documents (id, date_created, document_name, document_type_id, company_user_id, document_hash, document_content, document_status_id) FROM stdin;
fda6c9cb-62be-4a98-99c1-d9c5a2df4aaa	2022-09-06 00:00:00+00	App Test Contract	3	ac1cf001-7fbc-1f2f-817f-bce058020001	\\xe3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855	\\x255044462d312e370a0a342030206f626a0a3c3c0a2f46696c746572202f466c6174654465636f64650a2f4c656e6774682031323331350a3e3e0a73747265616d0a789ced5dcd8eecb86edef753d43a801a922cc9f6130408904592451e608064105407483679fdd85512f951a4abca5dee3e7d66ea0273d18776d93225f1f723e5dfc7ec97ff9dfcbbf7f20fa7af8d736c7ffef1f1f63f6fa1fd4bfff1bffff9a61ff9f13685a2a867a4069f0b5ff036f9cfb7ff78fb97bbef1fd2fb342d7f071cc038f9f7b9781f230e00a8cb9bf2fb34cc7329cb057e86a4b71198efd8fad1e65bec41fdf9f6efff70faefe5259a91f4c7bffee35b38fdd3f2df7fbd0522fef3c298b1f8d3ffbdc579780f619ee77c4a65e211223dc5f7651cf39c9657fedbe5a33effbe212d8b6679d6349dd232a769e1420837de17a7e93d2c1feed342f7edfe368eb03d0eba340ce13daebc8ecb1bc7f7b8be7d5e57e7fe8f88eff9f211d6ba756978f7e932a771b8bcd0afe304729adecbe5bb56f2b0f07a5d01f1941786c47af7fc5eaecf8b177e5d679988cb7e9bdad4bb32bfa77479801b16be107d1cdee7958fd3c9c5caba9e3ebe0f445ec67af9c7b21223dffdf42c23cf4b9bf06596334dc030cd6dc2f7cc6699c7f7bcfc6a2c0b3f699d7c6a3697214e5bb3395d769b18c175b1aed340fc03daf2e77099f4d3e98f37a48fe93de70bdfcf823e0def79fd413ad1bb5c98fd552e6410b2405c1eedf2441b082f9dd72bf365d104f923971796554ee36b259d877979095ea22f3bcb0bc4067c338f1b064ac4e5d97fee98ec98c275ed2f93ed537bdaf15bd7b7955fae4cbb7c6ac8d78debd79d31d3865936db182e2b78e62dea867819dd42751104f4fa901ceb3ca67508be6aadca52871b9da9cbcf86a3f6628ca54ded2affea3c7d207d98c3fbb0fc39e527de775958178d92dee3ba2f17d19ba7b60a3f247d6ee261cfde075d30a4a13de153cba10dd65a0ebc8487360bf12aa21752b98aed75a9d43f98b4acee2a9491ca72959fc734dc1a4ca51be979fabdf85a7e19a8821d2a92d7c59087f6e75dc6fabdfb6cd03bcab161b76c85705584abe69af3653b85093ed32d9641d59abc3bdda2401bf17daed394c6a6755d08edcecb1312cd6ee43f8740b70f3c5dfc6e17e736b6cb4368f491384fdfe6c270bdd7e2da5e01b8d8807edd33c36988f9eb26c637bd149aade1df4baadf457b2036ca44fc2416a6c6b5dce419318417675bcc97155b85a123a99769ef4466ea44a4441c8c3c2d4d5e83e86cef7f9ef9432171b398497991fad3fc18f3fdc2fcf430ef87b65ac8e6a8145acf1753454cc2850d9525f407cb179e84dc1e3e111398ab9e054ef48d7f75f1d2ab1cce1b5d76b054024de5fc00ef3fafbcc334be97f1ba1d6652211f1bf4b0b814d5445ead87fab430557b6b5ca873332f96e1ed591843b362c1bafd0ab3a4eec1458435538bb81e97b53f568ba3cdd42236d9089dda8c0f739befd51d99da564f68a758e455569299d2961812c7b668f671cfe7c6f561c88f6dab8d5801d068e14ded7563d9f8e3b275c62889b0516645f1f49944e4b5ceb6817e95c397d2d80c197577ebfcc7e3fc6dca755cf84b4ef573fc0dacd19ee52f3dea33fc2d5ef1b7788bbfc57f8abf9fdfc0c0f51443933b1f829e4b1fbff8bc551f1693bd8abcb46ca82a8e1651b83868f5e5ab287cdaaaa7f72dde5c8d5eac6293dfb7388ed5094fabd7d2de17c6b1c51b5298afa6c01af80853227e84c812e8797e2c766bbe2cf56126bdbdaa86995dc8aa58c743f8b148cc95098b145b7cedea482df3ed431b47f2915dff55eac1bc103f6cfa3a8b4d462e2faa1ac67ee7219a352efed41a6c5c1f3dc1f42e0e5b8b17ac4e62bde57cc8fb6adc494c9778dff47cd891b727c52d8634b565b06ecf81e98583297179c845a92ef4c5bfa87eeb3a5d74d35075e6653b474fb1a821cd17b32d0cfb9c5b56bc5f19eb8823072468fb2dce6ab3f552be2edf357cc8c278f9a48b3b768d0e457217d62864dde5e70dfaeae0555f6ea5d6c7acd19066c48fe47cd587b7514dc37ba9f70ce96a80c4935b235b2b77c6d31a5b6d239cf255af0c354846b78fb9addad57469e3cb1c9759beb80d6af11ad9b5716199ebcbc4afbca02b6e2487155c4bd7221d019c923a124577b9868202e82557426319daea1679a5d521b3299f39a00ce6bacb14f6e589cfc4f0448f3468174fb7c048e1deba77c113b68864173eb1710762775a27e13a95cb3a2eb447d6bc4015206bbe20b6707a1a3ce61162dbb82992c85de829b32d0f91f8a7a36ee6f8e4b85b1628df18dfd3e3184a9376290e4dbf6c8fe3d9f7a59114532a305f484fa0179f7d5f0e64ef884cc3d6fb5221ef639d97d5c10afb3210d973462a909afea4a05ec4ee663e29b6ad172985744672c2f4ce30369190abe68a97d4518b1b90490c44994faa1ee070c927790a838f91c4779cd85e437a974faab9af23f3492bcf2b31b1265f66797120abb73fb0a1b76b3613a5a1869c1f0ef2ec9e4d744e98fd4d1d91a2a369125165d683e4e073f899d2472ce0c9995f033681423b94dde0f4c26a04148ac99616f0a154c5f501743369cde049997194140c8a458bd7d5b13e8102a2ebf2a80a2b641ad722ef62cd8697e6640071f5273d2fc2d4fe5cee68e1de30d3aa9b29928be1095e8ca97d25a9e3c401b87ee29eb4adafeb6161659333438e6c7be6522ea9a471b181178ba0aa9ebc583d6bc8775c947b49cdc2cc8bd5d19e5172b32f9fd2af6d70b9e5538794393b940bef8b44d1b5bcd86aebfcc5f162e656c16b538f18dc3051ca480cae1a7ed15facf62adcf3c2dcb0fc390e0b9539b778dd8dcaba7057c42ac791b3d9e1a9bcd32d19c1f67f6ac9c4f35ba6c4225257be54a791c4b04de57c47b36e96e7b3c52b2286636c8a6dcd8254fae2afb72dc9488514db9b563d70d946c34e9e96d4002d439cbf4e8bb2dce53812ff954916b33c45b1e16a62ac0ac5760be7801d272d06b2b44b7bfefa8421348937713495fe9c58626adac51d22d78c911a679bec203d9ad92fa0492be42ded9ba975b2eb265cbff12a7a0e8ad73a1d50746644d1c5a692f8464a77f0e380044c24aa580eb98f213a3baee8ee0416a72d2eec0cdce64433bf06c6abc8fd6d194d29d2c318fd5511dcaa6cb26fea382d360d45f4567af3ccd8423c3fafdc66d69a638d91ac4838a0271f9ad23bc0869ec9f618c6993db35292417ffe7d2590f25ebf8322e2401f2672becf6f65e010dd061d9e73c0f822270d27302e807ee8fbba79ad72f4caff35aa3b79a49f2ff4fa9015474321c83c53985dd07760e87cbea8aa69f9f2e6c685cf0a9a81f2358468615235b591c4c125a4f6996ff62991c4ea8b73ce931a959b14b88649cb6f33892170a00d221b07f40e26e16032787425d103959b87247a472fe7762a8d1228dffdec5c3a63329d319b16ed2abd1b79808080410d3a00411003e6d6056cd02685064437022b7aca6aca368f99886783665172cf82cbd3869e1d642522c927cd163206799573189a62ad06e982ae51548ed4d3a0184a43df23de3bf1c7b501d21a374897ef55547ec92d929833d85d0691b15a145ae7bb707705d8735eadc004068ea2c955490f15ab72bffc009b1f237006d5650a7cb0a1cf34fc4a411ed4cfd99c421a04ea91dcf629d27844c66ed92570380a389407f354f7ad54fa834231bd36c13d05c4a9fb21ed4ba00c45fd7064f041ef75d16070ce29660a334e34e2a9459bdb2490a89fda9764b07d69cd660ed4261618843fa62d2e687503110d7458689f4728bb48328288e4119fdfe8a7141fa3c703a54c92825f1019440db4983669c47aa0248d779bd40f39bcddc6af293879a00c762df994c9322df3511e70fd03f62b2a41a66df847a3f26859a21ab4fee73388c2db0fb05eb431a6d47f087f65b0e50efd9ad0a21f064d6381e81ec48502d1b709275c2bbdbea75cc23c0cb4a4ad6c10016907105422f1481c603339eaa490c29a74c9f8b6fd43d4b34574a4e1119d9e345b38bbcfa366e8330177056d800016251f385b9c0c6d66d044ea82a8678bc89183c4d34f297a180f0ea7be9062773417c59a14604ee5257110b0ca3d656f102750b400aa2a8e8f6bd287414e6ea6053bb5f8e479057cb4b234c2d72f3330bea74165ef5ad86306a3eccc7c5bd32c138b71daf78905fed34e7284f2c0e5faea175f7225915050c3949e87d15110260c94fe6060c7f23e0c5200bce0f9f78516411a268aabaeefcb140c9aca679cfa9c0910b886059e2b8c1bcbdd248587ed1edb768a4dc8b69c624dce87ab57514db348158dcb82aabb79a0d462c482494e22c6d2f0ce857388635bf113993229b730fc7c65f57cc9f6148285cc43cb7e14df322a3cc59c1b993c2436064fa64960bc41834a058e1365cac3cf53c329addf3e3478d25c5a9e7da45425ffc5df5628efb24618a870909f9f43cb7932f426fb867b4a0978f72c0867453212a806411603214c53067460ca2316f3d65d7ca537b00d47f5167aa4adb082540e03addae393e3e6fce1f6f89e1e87a76ab53444de4c5be3d8530e4b4f28545e7c7835ac4b6b9dd37516c1867689f3412c0e00ee44460b12197c700198f185b1b09c7529139f96dd7151662be06fcc0dc2341160d5654f6b66a43cfae5e113d58f4ec41d970abd9245040e44080e31f4e5f57528677901ca6a81296b156e15c4c842205facd636a933e0d53828c254ce40c2fb80c8a35bc3264c876252a616e5dedd5833a77d955381a70c70e3c76359a9eec993dd42d12216f816ed0a09a93275ac49de7809e390581564064272ea7583bc3ea2eab221b0a54ba2a5d5ddced7c00d09ef06fb5b46cc59ff3051998f455c9f30d21356c6d5d7217895015f0920471e9eb1636a87a9f130a4b941dd0f9fda008133aaec130978b2e5bdfa3681f759a7a80e1840bc03c17287d470b312720425a1917c8e0a04b910c9fd3089abc582e15bca0b58d4a66b96b541aece48a6519c0e54e5a190dc0c9c645e18cec09d3010aa3124da312112c21aa98190d6fb9651265915d8083cbe48893cf8b18b3aaff34370b84604185ee828280ad905f52ae6e5f43b4510c688b66028e86b8b94962dd16cdac850bb0f415f71e4cd5e7b7ab1713e79adfba9b52b6b510e219c03b70159b8d14a83c24ca35b075ac7b656c554dbfe0864b9279360ad1fadeaf463831e0381a4d7321ce0621b1c7fc81383e3062a046b0e5c40f1b1d0697a42484dc20f8c930b81ec5ca47a9421e202d7fdf02b57a3f2aa51008832638790e7bf8f9a4104169aebf751b94668ad31e205b8d76aa0c0653479f4a58323044588230f83c23c61551ab55c7fa038d02a67d92e3ba2b54eab12cb54f3b60ece7ae101ad7c9afa590348f4791f177a9d93e8699bacd48a538d9e76fcc03923d8e44730235206aa1b5ca2412f83abcc1840672febbe454bd8f9fcc2c1256e84620ffa889922a91a390af971a137d3139951f8b381195f365330b82407a7077d0433ac595ddf472ea158a014c0118b99a93c5107ad8cc665c90ceb85e72f7c1faf81908e64bef5dc8f0d597244bb31434bad22911a40cc848205b4f144252feb2aacca9b89874c3417efb2c52b1801f4756875141db56e5fa05ed43815a6e2eda81fa836bbd31acf43f4e90bb9b81b1efc21e93c8cc006217ea137b8b47e61abfbe8d8144c36059b4d077f212b5c465e1dac708db5f871e145d5acb06eb9e40d5678a03d70accd667ef0ca88892d0f3680b8a7141a4b01ec3b74969f1f5c6cec910673a05e2d683a065a9268667edde08c19f9c03183c5cd063c1ae74815b63c5c00d33f502907ba09268f0e1173d6defbd8107f5fa9dc234a442a9738428c5762f73ea21ffc3eeaa71807b4e458e2c781ea5b576a8b70b5d2cd886d4f639c8f94f891323a71a0d0e395f9340c5e89dc392b72ea638894c38d032dd5835622712ee04a14f4b6d722e1ad05d5fac0430647223cc6113927e8647d52bbdbc895ef823a1d29a3e0ab5b57bbd819cc0bbd2972d6c12bb5211ecc0f3c6470330f8212bcd2098ddc560ab62bfb3e0357f14556b1070daead22c939dec54cb73fc5a61e142ed062e0e30da216910dcc8eda406f489d0e750ab7d61c3b852b7ee5383fc8da3cebfbc80186cf3ee27dd692fbcaefdb5a89541918b188ff083faf0a84956fb02d2dfd758c1ed6dfd12d665aa047bccf5a171f1b5ae62bf969a9cb5d1d5e593ac6217d193a282ba4ed0cd849c2e8365286bac319e0f33545c2f53221a866714093f877a643e2939e09347c3b90b13a78b38fab07cdbb2b331e68b904cf65589fabd79915a6766d044239cec2fda6b9f32e171d406126172c709fc7094b7bb817e804759d2df33aebc6ad6e9625a59c96a697f2aba08d1234fb13d30bfd49b9c9047f2aa67bb9c57a94451b51d17909c8665830301803a359a0fb05d70105af4b7378595dd758e817e63235d0fedd43cd4ee2a54f9da728efc8bd3aae0323a60db0b78a2722b545e6c70e880c07f6f2cdd00076d0d0ee750c754f5d61e025294e4257de60d4ee883582642e0fe32a1d2e3e2bb41403febc71111a9c1995439c952d0891ceba281ace1641e2bec201d213cb6ea7be1e9fdbed3cf224b67b5f877d367ebe0e1b80ea75f102cc026a36743f62942a48d4ad54cec04924b200c8cc49584bf993fccde4041fc1dfb661247fa37f94bf3dbcfce30dfa36037fd364f0b74c067fd364f0b77845e4ca0dc9df386df0f78e9db2f0a8643a68e3c2db6a5f7d2c1706b1a809ad292f440631cb47c1856f3d23e7a1055508a8b98c9492319fc4a5d03c532d9b6ef0dd43562e058f755bd055687cdbff11a14d54504b835680ee038ef14dcfcd91b8b2b7f5838652a4d891846ee71b498927a8fd8dfab52c55b0d4a32f3f43121c0540164d84666540643363ec449c837ee9d1eb0f194081d46dc3881fe028d7da3a28592abdeed27d8ef1b59e4bf0a8953dedfa5c7a0a33c06ad94fab4ad5997b59124b2b93b5eadcbd0b5b7030aecee9d22a21de918ad5db4cc58e24897ea5b5bbd11d00c1b20eb60e9dd7a03bd24be895b272f97111cab4f9b80ea8cac2666d91beab79150334688f5347bb5698a9662ac0367e245bc5a28da8d5bcc858d0cec0a15d30ccc036aefc4bc6d743cb551a13fe55704c990c12c56faed9028e88ba320f38c8beea979fc80b02dfcdf0501a5bd00e1c92504ac67e85232974c64fd7b2a24d38eca1a4375be5abf41277d835855a142f6a88ba561fd7a183bfa257444cbab06aeea92094ea2bc04262b5a09194dc87aced04c62440ad2ef73c210c35573c9344adfb120bfd690f64569ff54564fd788e2c8c5aa4645dea9ac1ef21e537e3ae9e7b4d07c7a494a923e1872235f6eeb3811d0de84906f5455860ab8ee3104d35b087539db9333b0748b4ed5cb020ea7c7fb0c9423498e5be943b81df46cb69e02273aac0ec0f5f42f601d177ea12cca09814ef00763bb7fb8973939797cc7635b87d7af5ea402d47b40fe66e6c78ce8a9f1409d649d025b27046059fe442f69af08a43370bf415899bf3f4f3f918d678f511d6c2b5abcfb5fcdfe583e39a742f6b19ceb5951646b9164f602488487f81caad160ab80e636c36fd369dde7c7e74dc5c6229c73d8536a46e781325b6fa0bd4bc498e6fad28bc769ddca61be37eace6cb0377a96df4933d7f506c945e9268634b483fb4ac7af500a147d12d084d6a56e614d023cd834740615b452ee5008b45158cc3db85e0668b09457c219a6e7a2055860a20e28da47f92f16aacc1279d1afb6f419d80428fa94a79e81a0727e59efa26ec37a1cfa04a86f8c28e04a0e888686b0c8712b3fed5b59b22c16b1c25a5fc4fa1c4e0b343af8291348255c3ebcde86b4881ae42b3178c994f60f771e321f59da29f93308559718fea91b84802aedadc0f5398ee43eff3bacee250bd28ccee8ca8912ca3c321f7552b2febafbdf6ef4c3d7b0fb07f0dfbdcb07f55cc59ec55af3ae5fc3cfb37376bf786fd3b77942dfb973a14fd54fb973c7dde46947a0c4a78cba672ca773cb3f7f088fd4b5d996edabfc499dbf62f59bb7d9325b07fa749b10f88bebbfa6df62ff0e79ef94b1aa7d08c50e51cefb1becb4fa77b5413df63ccdf7e3a4958dd3724473ebd4906c9471fec20b9bc00b170f9a89f1c241f4304e9fc640e3bab2ac8335a67091aec616c89773ddb6c7c3025a795448f27956d02f555b4cee3be49527543ba951e692518b1f11ce8d411e462fbcc11d439679627b49687d2dfca0276d43d91e4dbf1cc46b687e9b02608e471ef40081f32c332840f33a452e96423e04856b3253a9b2723b90be739197ddb2734a5221c80a16220225fdc6453972f4e8a79ac39b0d364a08f8c180d0e3d47048dc55cfb486c8a25629f96c998946bd4e54d94ef74b642e3fbfcca545a53ffe06beb9d525bc9661fd6bff51fdbc954dd72cf0a049f11986152f1014579974864248578aa4dcda2d1db6d2a3c81990cc45dfdc108abbd307916a7737e82c93d3ec919115b30f145c75038b09acf300017820da2819c0e81c81994dbc28fc4b39c336d208f165c1b288ad35b9d5e47c8c6183b1537b4efec191650c2fe2b6c31b5d116154414fb1e47ed3bfb0b910fd40904ac20546a64e83089ac442679af7f8bad95316e60513109cada8d8303ed0b453f472317220ce9be4341979e33fcf734299212ce9d4b4f796fd6e9a177d4a451cbdf12b50b913a9b5c7c31f2860c6726a939c5c3120c2ac6d221ef69a44871afa67ed0320da3d409866ea8a1b2cafa0aae6af717840a19c3def32fd3d4dfb6795092cc74a1a0af2ffd10c4de496035881a8fd7065333cf2f935267cabb6c1e0b0c7eb0327378996633655c38ef5dbf144c46165242c6f16b8a767284c5c99f3263e03ff64332639401ac33b191e79e418216542ca88b90d291a0608a45653c228d97dd2e95485d3d169548073b7d4e25ea1cecd9223abd940dd2496225f8c67eb738bda584eb8afab9376b0cd442175b5791150fcccfdd8a1661423467c86634893cb0f39b88095a540f4e19cab5a25c20ab39b097012425e1ddeda3f2bac08206193c489356bc213cedb9e25fef038212e9ab4d6b3882c219081c612172d6266af98f8b8b6f249012836428fc09cb17404f7c2345d655c7616f3a86ccf7a483b8c2730258091e086035c26765a056de49c2c4215e1015f332604b92377e5eb8a53ae0636c2a423993cea5099a92b6ae43fa04a516924648094410ec08ccc0595939a6a9165862da9d81327078f8d634753499a0c05b93ef1f69a4cc65822218b318742c7bcbf2855942753f7ec6ab1ed1e17b7aeb071d2c33264a5093cee20a7016d30a46bb941926ec9110354dc4e755084e982e6caddf355d4635e7484bbea3c96584b74eeae7bc32c5db7911c3e17e7c9e9eb66da5e1942c13c40c677c4e5860080e8b7da28aa1159dd460075732aa406a30d1ad8c2ff4534793b35c603fcffde841f96cc6d0c6de50d2b557023db86b07d2d9f1cf875c0cdb2f18a7acd8c719b9dba73604c34c8f32043df77ec259ae768b5acc3a019b4aa154712e844d8527a0e43488d93c6dc2a6c249241b4a80697eda64a6c83ab99b875838e3000ee9bdd966a8024c4a65648642bc57241be5fc48cc04bf2580cbfa5818251806b1115cc17904bbff99b0820e226ce266655861c7969fb925eeaf8eb246fa5152121ae37a39767f495d940cfcf9dd282b0aeecf4459db07ffcc28ab374c0f34907f469475ec6def1d51564b8a3c1d6655526347985599d01879ed7127e2938de0ab196655a45f1b6655b2cf50f78787591f9487df1166c5986a0f13f9549875e88d153bccea6c1a1b9247c659533fcc67e3ac289b7e4c9c752a60073f1767b590517698f581c8ab08e4e18d0f445e9f0fb38ebd21a62bdcb05e4c84592b554654abc236895d4035f95b546f625f8ca3e13622a6a2e24f198577eddbbb61d68762a71b61d63b53f5b928eb0cbd35d2b5d16d0e4f2e708e747567d92ae41984d4bc3e284dce82117d13719a646c750b14bc81089ec852345b68709afe76be3fc8a8883eda7dd087e03a38b40f3e1d60b34aa01989032f635149df483639db38a46e0572bd07fe39eb8c51efd590ff84e80a54f423449fd96c9008bd0b35a4c4439c81ca4224d5bfbaf264428a36a643f11493527bdc60e818a3f614a79baa9d45e16a4aeac65b154930669a1dac01499322f525d04268187927434662a084a631aaa46d509126f4f961213066c8ac912494afca6a75e74af615fc0e8a4e55683398514ca37438e8c0a4f03a21853228ff1125962af6befeda323a9836d223d5a6972908746aa7a4ff2abd3c3bdd0516195d0664898501b331cd31b4e6440e4107b96f1ebeec92595aefec83a97b974044dd914aebcfb0d481e80d1a08d6fa3a90c97d5382938449b701002a9a557f8ff517a225e9480892eaceee4e16adb2c2583149e70dedd611903bdb652bf0c11d0704850d03d48a10a920e6e93b7178ed410fe0f0421f0d7206e2eef43d383c0619fffe383c0c827c0a87670481ebe8ba208f0a2b9b01a2c9fcad11405663314241a72fc0e1a9b8cf160e8f5d290810f17e8300918a1a9931a3a3717846d8c83aede907e1f0a211adf875383c05b07b1a8737a99fefc2e159c524c5ebcf1686c6a77078be9f9bddf1a16b21d32dbdb69e605bcf954598c2b25a7c9d91415c38cb0bc3b5b37e4e970bf028bcf0e30a99d63312eb11bd9780011ed6fdf980813c5b5f8174448cc52aa81d0ddf4ba411f47ab305aa4359990c5da43ab3ca0c663492fae8b5b5d5687872c2ae61d6007c8c8da23e30208c780fe63e6dfcc977acf0b2c65ac5a9cd94c8c3e10212d7b7c305da79fc30687622a14f3788b118d83e543b24b045ee9abc515e23a17727b58ebef24f39a850637fcf674d5edda8dc58684f07ab153a39b5319bfe6e3678a5cbad0dc718e18630e780d7613f4d85ad13a4dc04da50171b27031a8218ba94f4b8ddedfe60d8ea0b0021d168a67bafb43fe34cabf608ce6b3f1ff7ef082ad9d32ce9fe0f4ef7cd74ba119eeb9ae829974ff8ceed4706ad77bd795254130711850d16339211d94637b8f152f8b288b61c0c8d7e03d429656dd22c1434155191eb0831801860e178163a8c5aac67634d64a915da4abb0d8b456b4820039505e9d00cd488ed6ca36ab2eeff97b4af9344017be9ad265c0b7d0714b1ba0ce4abd146043794e1e8124b60a3006d4ff8623dd5e7bb60a512516ea58a541b1967b84aa70e00a771ca8833efad7c61cfa044224341ed302f37d818d58d06989d6c964f80d97ba52163a9786731c49b82adaf3fb783900a9b215c0bd0c719043fc74298c63b9c556ef4c6cf11ffaae41fbc5d8462b30607c377e283d833145076051b15e0d8a4c626c0ad8883e516394da422b8552125a59cbb8983b50268c28a32db051450cd1c054b1e7edec8d02a9e97bd45145e90434c4f1dc98794be58e96c348d3701100a962d3d54845bc7a469b9183f47381bdb40746cbe51b120344232ba2f25c314c0e8a8e88ca06aa99c11f316469d30e0acda08d5a8c46d163c64e3d6d807f9848317ac45168cee17f85730fcc37dfa6686dcfa0f44543e192fe725f8aa5bf77f6544e556bcfc1940e53375eb06a0d288973f03a87cd5adff7c40e533f1f2e700955f53b8fef700540638fef355dbd7cda47bd5f65d1ff0aaedeb35ef83b57d773256c3041110ea97b7c8eba15c5f9efa8c151f5add5f88ef65b81e5f0c8f5a2fd079dffd053a70fe9239aa58eaf5c2c85dfc92d1c5ef21b992eaa2bb0c34b7b3739ecb4b19e906a382aeeb3c4ed0bfb6c48c435200ae98d12dabefc50aa6d23f8e7689884b674e3728b315ad602b46642b27cb830dbd9b711d36b7a26b8344c49afa68e95ce0891e59396476253cbcdd6bc7d3eb64c2165c55dff0f1e66eb7d50886040f5295ebd3e030d7c0e8639f8c0fc21eb0ec5d7bdf3fd2f0b8e56c041d6172468fe52ef446540ee9aa045a62d3d43a30053d98d2ad55a78f1b12912303f7834095caf060620d0cd7de7034e40ad8216172b044e1cb72a9b497e5e2fd2fb45ca67e00bf95e52236a1fe63b55d2a90655e0fc4cba1990f1f6f70ea2f5e38cb0b8b81530fa338cb47e185652cfff0c3e036e57a56c665a89dd0d9fcd103f539245eec6cbd0e001b991839f3c9a8bfcdda7e92d2c51be91044b3712ca4f4d1f6ebcf95bb2f723ea31297d9860ad98034cb0282b763e84f4740b1d9d16884392cb233f0f982262ae91459d06e941e74b93d7f7d913cb1d4207679f2a98f04081a87899906a34fb0ec748157069dc53458372843955122f21f6a2dc904460608825e4b49afa53e47a7718a4833756201fd9794d04755922dad6436f41df92c548328f44f8120bd4545adc4c3c201ce4a2b615b6be194f0f7296004a89a6406ef61468b01f528c6f97b5d327328fd40517db2dbe1fba99379a602f020e6071ba5cc0f01142a6aa046cf17a166273b9c381991c7c9885022d028f4f3813feecfc814dadc08649a61553bfeaa12ee687f1a715f8c7c6b9378977d3efa76ac9342a66efe68273255e738ad0e8e41174c4975731b996a80fa6572fd1e3275eabdf9eb6ee034db31c8545d21b5894ced3b6e3a5d6fe51e46a6ee28642dfd001f2e64b590a94e972138b3d2b14f7988c160ee8636c46d68aa5912f940ee4bc821f37c18853d08a608bc094da575701f9a4a3854f6c68ac12b321a8236043082113a39d6396d432f650c0fa487a60e2af2637bddde774c3f75c806e60e372ed21aa783a66ad7cdae8852f010e9e9233455d986cf415305e2941b5732ad58d6fd3d70aa6a072055a08d18be0b4ebddd25e02e3875562116ab93e82e70ea50344da1506510f011706a568e04064414bed2dd05a71a7da2dc26385503d6d05ed0d8c74f81531560e9b4014e9dfac9b4c1a9a8047f0438759cde7356c5449fb25e7e797431285b7f5774f136b20e744c305cad5dd1c56cfcfcaf195d2cbda5bfe11e79b2fdbf3a2fca2edf0fe9791a26384dec8bb7a0c487ebd0d71e80776a6f0fbd8d76bfe3389de5a914f8fd8ee346bdcf43b86d9167125a7e565afe2fdb71bcf10c6b6098c616331b94967dec8c1a0b4153adc56560e4931dc70f03e05a39d5db005c67403a0fe8381ee69f123c78b2acf5e9e08159d67a7cf0604759ebaf0a1e7cbe0bd6e3c1835f55d7fa2dc183e4d58d3f287840a4afad6bdd113c78acae75337860d5b55ac1031615df1d3c40d2ddd8c1a385ad7f97d841f49af68db183870b5b77c50e14d4fb77881d7c5f61ab7d9ab28045cc6651ebc77261b83eadf4c84dbc209a90e0a3ac26248f1952783219163db95016e9305c00a00eafc94b60c0e5e94a1da70daa78ccb9212b3ee1ad997d73a7ee3e67575d38a364c3d9b559aa56e4f487ec38427525ce284bb1a9ceee8ab551efc3375806b7ae910df676b51192cab975deeef377b3573b4ec1feee5cb7dbb7c38d8f14209dcce31d4c9262e749562a911da5cc78e30813f15bb0ae545fba00529795b9a1cbbd869860d70a964f5ef71f34abbfdb1c892e9646475b9875a429c4b0d4ba463f5d810e1e7bdbe0ba91acd611b78b58cc1a986c3409428c3447b320a660e4f19d59a768d73836868c6c0f2b9c841147bbcc36632fead41a475860b88e578aa1bfcf5b44d6eaca27c87a2dcbca2a4605ccbdf7052003abae0a3d7b5d81950d575a84780d988233aac99cd1ae54fe3c19074d24ed42f232ebad50e544def42c4e88e130bd92fa13dbfec517d38d73bf698c8cc0092b1001bdad20fa588fca5b189d90a9fd9623c6f5229278a631f44085982a42619cb329d6b1e77adba8dd62b55ac4feb95d71197a8705358b57f3e1b78da513d6ebf417d156893edac65df4c136eec405b4e1c4a37e7487b9e8b3f56d5f1286bf1742d4cf3c5fc23b5c915ef78da81a19cdfc9a3811bf3de09327e2c710a0964a563bede5d11d93d7ea53335a469d1502b6c38ea0358391a3c36e5c4c53318d538798d0f111deefd8ff00ec6122d343cf10acc4772a2d0ac20c3e879e6394e31bf88d2e02d3d77539283163f9d657940b4f184eecf0ed8fdeae9672489f25f181b4de5e0eaae968578d550762e413d0802b1d49444d1032434df873af45ba2232eaf4cf1d2cfa23019c3e3840a443b0b342e29efb06b14bae72bcc4a2d2887171b96834d3c1aba91fb33471ef59c8b157d872b39aed99ea8b30ec9741d5a9bc8ed9e2b85f4da73f1e8e65c48015a2a8ee42ba2e84dcab3b7181d236e7ee5170e1e7a9bb1821f3f49d59e72fe84a36f73692fb755dc9a2d7bf3dbe2bd9d433c7edea4aa6632fbf4d57b20cc15b7e10076fcd9ad46294af16dd06c77db22b1917c189ae64b9e85b63ef4abbcdae64cabf76bf5757320d92dad5958ca3012a8fe77ecbae642aa373dac4547096aa8de84950c403c7b007b5c88eec4a16e3b8d9956cf347af533c04edf43ac5c3efec4af63ac5e34a7a9de2e16d9ff4758ac7eb140f77f8291e375dce7ffdc7377ffaa7e5bfff7a0b74f59fafcbeef47f6f2117fa89cfcb0d8b3f99cbea8e0efe3ab4282e9cdffeed712d9c16de8ead7dd2d3cd440cd0b8d1875d40c94d2a3ec0ac336673172297f0549b2a4dd4db541126ad2ffe74983415889f7fcd61252f54a7950d7ea13afd0bd5e95fa8ce17aaf385eaa4a97ca13afd0bd5f9b8f192d36645e8f7f79b5366a3a0898a50e53e39bbdf5c324214ee4bfacd59e72aa8a8a6cc2767adcb046db0de8ec14e162bde77dfe9feaafde61e8ab3cb59bed76f4e250e4e7fc8b6615f59111acba15eda2b377725fd26b9398d86fe6be6e67ede89413b7273c5f76fff5b9d18a4b498fbcd4f0cda919bfbbe1383be2d37572846755c137387c90eedf66ce2fa545c6603d7c7724eec2cee816df9ad4ccbbd9526cd8b7bb83e85821299c1bbb83e0229ab0175b8befa8f3bb83eea58fd13707dbdb9f181b41bb8bec1f88867707d46ff7bfaeefbb8bea9fdf626ae8f107c87e2fa86728bfae5b83edd426c0faecff72ff25a089f36707daa124aafa6bda26dfc55876fbe9aab5c6fddd15ce5868fee7e547395c69c577315df1bc47635e761cd55360c621eb42c8d688395a5118d8a59437e824d8527fc89662dbe2f011287dfc7d449c44aa37edf3ec9365fc5fb7cc0318f5f5a886c556a984bcf4a1bd80d6661dbd94a4eabc58d6360989c74dec1618ff3a98f2ff6913b9d0ab582819b60306dda165d7426fd5003e7e54c3858fb3209257b043766d4839eb04cb8e82c5c615b96eb4159521b21fdf39b21de4d22c65f89c4ce2c164133b5fe6578c2e8328f866d925526d819b5a41238a36c3ae3343f034b73fae3de617e59e757fb2036eb1d2db02dc7d72e8471464da4c002a808b914e247e1e7a6fec6ad5a79858c33c00cc6a9a4278981031c9bc2a7e162bc055ab343a38f81d6b66a3d5582ff89d3351fc4b1ed504313c60e7ee2f144bf4dbae8a9e38976a58bbebd81288434e1b136f597a48b9e3c9e68235d14b41af134a1c7a58b66acca7dda1234a0f54accb9bf0bb45ef5c7b0cfcd30ecb3e7a0f52a75bc035a9f7b1e1a07fa9db069c23740eb8f360d5ed0fa1dd07a551973fa16687d6fa49c0028b3df2441c41440eb99b81f5aaf12982f68fd41d07af43aee42eb99f618b4fe319d384179f3d04ee77b2ea585b68d46eddaa47e758bb839de68900c9bded6cfbdede5206f2302357db205e3cfcc7c0a3e8b73df2a1573cba4bc4d220fec2c31e31695062a22748869677935f54f725dc33725f4377ec49179018fd6be83372069064d5a7de6bc6c934eb263c1ad553a88063d94b0fd788bf36c6572cfdd85ebe18ed3ca6cf928b8f0e33a160cbe0030f16933b7df5c86f329165db0c4186e240ea0ab0677aedb4acaef386f53953120ccad1bed14b7b782613c79df915059df0cc06cf520bc1180897c42f8dcb34f18c491a390aaa50e265406f86deadd444c5e521e6ca2df4e46403429ebc44898f51871051573de40aa18b860692163e84219370e31e2229cc1fa9623d6b7ead81e405e67a5ea370af0d1cdf66aed178d7b90516c268f3ac9ed26e2377fd0846516cca649c3ec38c6e075d841acf1591b81b38257334918f993ae6b9e186b31d15d3c63f8cd75419fa1159d20b6478edc04cfd38f09325ee82eeca9d73e6552b1432485d291a41e9c8cd53b69b9295e0dd3326aa0067fa0487788d80b9359042665fb1a06addc4fd9301cec537f931dba51eb074856258191e8c6dd4d929437f70cbe9fdab366a9fcd84ba5e5b798e0aaabc26c41d548587383d4d46e54b827ccc0a1af3bf57381ca50ed0c0c183d56096e38a6e8dbdf88823f1dde1e0214e3fe4df023061efa61fcc8a0839aafc3792aedeee13c4cbe851f49a6ebe05e87f374b364e24776edfd58976c7a212cda0d1cc0ffb5080bb6575f080bf975a7df01616150bf0b619194abf27741583c923379212c24677e00c26288577737849f8ab0087dece1f44258289df5425874b4d3ef83b01886f13abde5f92de8c108a2cd8643dc86e023a9585c485a92b9ac659edc69dea8f4441dcbe256d16442321b6d87b251c496ed564476f2d12a4f84b76340d3b20ed9d51bfb088cdce7098acc98c6aecc68c938832c68c9783b38bcba110a6e4893e864178e49b994486308cd948cd1235975a6807563b41290fe6ad6a979675712c3cc61f1131b557a2d25bd96a4bb9e8d9c34d24cfd9061392525003116902d096d36291b394c62104500a18088b4a828a10b3836b1b787414267edd56cc43580a7059caed28b6211d211b77adf3f128ffa1675dab74ffbd6e9828da3d2f156e6077b74cc0f510359d440d1d1b34e059f503216433b297e18818613c2c960b10c51915419bc0821833fc3ee11a93a0b9a72b3632440628221912ceb70979e4c09a2a57fc5c6775185a47634be8b868df33ace78d34502f2abf1dd618defa8a1d4abf15dc777a9705e8def0e687c6745105e8deffc43f08b57e33b49faeac677439aa1ebd62bddf32aa8edf97d37ddd326ebaf99ee31723b7152a41f5f506b0cd1bd0a6a5fe91ec1cb5f98eec9c7c59adddfbba0f657f65f7da57b3adaef94ee29755f8f5fbf053f7b1470bb55f6bb895347fdb2332e8692de5763799abeaae858552dba5f5d74ac62d1bdc5f93acfcb7df1795e685edc2d3a5685beee5574fc3acfcbef30db5ee7796dba517fb3f3bc1ed289e3f0c34df717524b99eedf8ed4faf14727fcd6a6fb385dcec59bc603cc52b322f82f6796aaa0e5cb2cf5feef6296de2ce77e99a5fe6596beccd29f6b96fecbdbff030e89205d0a656e6473747265616d0a656e646f626a0a352030206f626a0a3c3c0a3e3e0a656e646f626a0a332030206f626a0a3c3c0a2f436f6e74656e7473205b203420302052205d0a2f43726f70426f78205b20302e3020302e30203631322e30203739322e30205d0a2f4d65646961426f78205b20302e3020302e30203631322e30203739322e30205d0a2f506172656e742032203020520a2f5265736f75726365732035203020520a2f526f7461746520300a2f54797065202f506167650a3e3e0a656e646f626a0a322030206f626a0a3c3c0a2f436f756e7420310a2f4b696473205b203320302052205d0a2f54797065202f50616765730a3e3e0a656e646f626a0a312030206f626a0a3c3c0a2f50616765732032203020520a2f54797065202f436174616c6f670a3e3e0a656e646f626a0a362030206f626a0a3c3c0a2f417574686f72202851313734323938290a2f4372656174696f6e446174652028443a32303232303931363231333331382b303227303027290a2f4d6f64446174652028443a32303232303931363231333331382b303227303027290a2f50726f647563657220284d6963726f736f66743a205072696e7420546f20504446290a2f5469746c65202864652d32303861373131323739656661313339616238646139373032663431363463642e706466290a3e3e0a656e646f626a0a787265660a3020370d0a3030303030303030303020363535333520660d0a30303030303132363339203030303030206e0d0a30303030303132353830203030303030206e0d0a30303030303132343139203030303030206e0d0a30303030303030303039203030303030206e0d0a30303030303132333938203030303030206e0d0a30303030303132363838203030303030206e0d0a747261696c65720a3c3c0a2f496e666f2036203020520a2f526f6f742031203020520a2f53697a6520370a3e3e0a7374617274787265660a31323838380a2525454f460a	1
fda6c9cb-62be-4a98-99c1-d9c5a2df4aab	2022-09-06 00:00:00+00	App Test Data Contract	4	ac1cf001-7fbc-1f2f-817f-bce058020001	\\xe3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855	\\x255044462d312e370a0a342030206f626a0a3c3c0a2f46696c746572202f466c6174654465636f64650a2f4c656e6774682031323331350a3e3e0a73747265616d0a789ced5dcd8eecb86edef753d43a801a922cc9f6130408904592451e608064105407483679fdd85512f951a4abca5dee3e7d66ea0273d18776d93225f1f723e5dfc7ec97ff9dfcbbf7f20fa7af8d736c7ffef1f1f63f6fa1fd4bfff1bffff9a61ff9f13685a2a867a4069f0b5ff036f9cfb7ff78fb97bbef1fd2fb342d7f071cc038f9f7b9781f230e00a8cb9bf2fb34cc7329cb057e86a4b71198efd8fad1e65bec41fdf9f6efff70faefe5259a91f4c7bffee35b38fdd3f2df7fbd0522fef3c298b1f8d3ffbdc579780f619ee77c4a65e211223dc5f7651cf39c9657fedbe5a33effbe212d8b6679d6349dd232a769e1420837de17a7e93d2c1feed342f7edfe368eb03d0eba340ce13daebc8ecb1bc7f7b8be7d5e57e7fe8f88eff9f211d6ba756978f7e932a771b8bcd0afe304729adecbe5bb56f2b0f07a5d01f1941786c47af7fc5eaecf8b177e5d679988cb7e9bdad4bb32bfa77479801b16be107d1cdee7958fd3c9c5caba9e3ebe0f445ec67af9c7b21223dffdf42c23cf4b9bf06596334dc030cd6dc2f7cc6699c7f7bcfc6a2c0b3f699d7c6a3697214e5bb3395d769b18c175b1aed340fc03daf2e77099f4d3e98f37a48fe93de70bdfcf823e0def79fd413ad1bb5c98fd552e6410b2405c1eedf2441b082f9dd72bf365d104f923971796554ee36b259d877979095ea22f3bcb0bc4067c338f1b064ac4e5d97fee98ec98c275ed2f93ed537bdaf15bd7b7955fae4cbb7c6ac8d78debd79d31d3865936db182e2b78e62dea867819dd42751104f4fa901ceb3ca67508be6aadca52871b9da9cbcf86a3f6628ca54ded2affea3c7d207d98c3fbb0fc39e527de775958178d92dee3ba2f17d19ba7b60a3f247d6ee261cfde075d30a4a13de153cba10dd65a0ebc8487360bf12aa21752b98aed75a9d43f98b4acee2a9491ca72959fc734dc1a4ca51be979fabdf85a7e19a8821d2a92d7c59087f6e75dc6fabdfb6cd03bcab161b76c85705584abe69af3653b85093ed32d9641d59abc3bdda2401bf17daed394c6a6755d08edcecb1312cd6ee43f8740b70f3c5dfc6e17e736b6cb4368f491384fdfe6c270bdd7e2da5e01b8d8807edd33c36988f9eb26c637bd149aade1df4baadf457b2036ca44fc2416a6c6b5dce419318417675bcc97155b85a123a99769ef4466ea44a4441c8c3c2d4d5e83e86cef7f9ef9432171b398497991fad3fc18f3fdc2fcf430ef87b65ac8e6a8145acf1753454cc2850d9525f407cb179e84dc1e3e111398ab9e054ef48d7f75f1d2ab1cce1b5d76b054024de5fc00ef3fafbcc334be97f1ba1d6652211f1bf4b0b814d5445ead87fab430557b6b5ca873332f96e1ed591843b362c1bafd0ab3a4eec1458435538bb81e97b53f568ba3cdd42236d9089dda8c0f739befd51d99da564f68a758e455569299d2961812c7b668f671cfe7c6f561c88f6dab8d5801d068e14ded7563d9f8e3b275c62889b0516645f1f49944e4b5ceb6817e95c397d2d80c197577ebfcc7e3fc6dca755cf84b4ef573fc0dacd19ee52f3dea33fc2d5ef1b7788bbfc57f8abf9fdfc0c0f51443933b1f829e4b1fbff8bc551f1693bd8abcb46ca82a8e1651b83868f5e5ab287cdaaaa7f72dde5c8d5eac6293dfb7388ed5094fabd7d2de17c6b1c51b5298afa6c01af80853227e84c812e8797e2c766bbe2cf56126bdbdaa86995dc8aa58c743f8b148cc95098b145b7cedea482df3ed431b47f2915dff55eac1bc103f6cfa3a8b4d462e2faa1ac67ee7219a352efed41a6c5c1f3dc1f42e0e5b8b17ac4e62bde57cc8fb6adc494c9778dff47cd891b727c52d8634b565b06ecf81e98583297179c845a92ef4c5bfa87eeb3a5d74d35075e6653b474fb1a821cd17b32d0cfb9c5b56bc5f19eb8823072468fb2dce6ab3f552be2edf357cc8c278f9a48b3b768d0e457217d62864dde5e70dfaeae0555f6ea5d6c7acd19066c48fe47cd587b7514dc37ba9f70ce96a80c4935b235b2b77c6d31a5b6d239cf255af0c354846b78fb9addad57469e3cb1c9759beb80d6af11ad9b5716199ebcbc4afbca02b6e2487155c4bd7221d019c923a124577b9868202e82557426319daea1679a5d521b3299f39a00ce6bacb14f6e589cfc4f0448f3468174fb7c048e1deba77c113b68864173eb1710762775a27e13a95cb3a2eb447d6bc4015206bbe20b6707a1a3ce61162dbb82992c85de829b32d0f91f8a7a36ee6f8e4b85b1628df18dfd3e3184a9376290e4dbf6c8fe3d9f7a59114532a305f484fa0179f7d5f0e64ef884cc3d6fb5221ef639d97d5c10afb3210d973462a909afea4a05ec4ee663e29b6ad172985744672c2f4ce30369190abe68a97d4518b1b90490c44994faa1ee070c927790a838f91c4779cd85e437a974faab9af23f3492bcf2b31b1265f66797120abb73fb0a1b76b3613a5a1869c1f0ef2ec9e4d744e98fd4d1d91a2a369125165d683e4e073f899d2472ce0c9995f033681423b94dde0f4c26a04148ac99616f0a154c5f501743369cde049997194140c8a458bd7d5b13e8102a2ebf2a80a2b641ad722ef62cd8697e6640071f5273d2fc2d4fe5cee68e1de30d3aa9b29928be1095e8ca97d25a9e3c401b87ee29eb4adafeb6161659333438e6c7be6522ea9a471b181178ba0aa9ebc583d6bc8775c947b49cdc2cc8bd5d19e5172b32f9fd2af6d70b9e5538794393b940bef8b44d1b5bcd86aebfcc5f162e656c16b538f18dc3051ca480cae1a7ed15facf62adcf3c2dcb0fc390e0b9539b778dd8dcaba7057c42ac791b3d9e1a9bcd32d19c1f67f6ac9c4f35ba6c4225257be54a791c4b04de57c47b36e96e7b3c52b2286636c8a6dcd8254fae2afb72dc9488514db9b563d70d946c34e9e96d4002d439cbf4e8bb2dce53812ff954916b33c45b1e16a62ac0ac5760be7801d272d06b2b44b7bfefa8421348937713495fe9c58626adac51d22d78c911a679bec203d9ad92fa0492be42ded9ba975b2eb265cbff12a7a0e8ad73a1d50746644d1c5a692f8464a77f0e380044c24aa580eb98f213a3baee8ee0416a72d2eec0cdce64433bf06c6abc8fd6d194d29d2c318fd5511dcaa6cb26fea382d360d45f4567af3ccd8423c3fafdc66d69a638d91ac4838a0271f9ad23bc0869ec9f618c6993db35292417ffe7d2590f25ebf8322e2401f2672becf6f65e010dd061d9e73c0f822270d27302e807ee8fbba79ad72f4caff35aa3b79a49f2ff4fa9015474321c83c53985dd07760e87cbea8aa69f9f2e6c685cf0a9a81f2358468615235b591c4c125a4f6996ff62991c4ea8b73ce931a959b14b88649cb6f33892170a00d221b07f40e26e16032787425d103959b87247a472fe7762a8d1228dffdec5c3a63329d319b16ed2abd1b79808080410d3a00411003e6d6056cd02685064437022b7aca6aca368f99886783665172cf82cbd3869e1d642522c927cd163206799573189a62ad06e982ae51548ed4d3a0184a43df23de3bf1c7b501d21a374897ef55547ec92d929833d85d0691b15a145ae7bb707705d8735eadc004068ea2c955490f15ab72bffc009b1f237006d5650a7cb0a1cf34fc4a411ed4cfd99c421a04ea91dcf629d27844c66ed92570380a389407f354f7ad54fa834231bd36c13d05c4a9fb21ed4ba00c45fd7064f041ef75d16070ce29660a334e34e2a9459bdb2490a89fda9764b07d69cd660ed4261618843fa62d2e687503110d7458689f4728bb48328288e4119fdfe8a7141fa3c703a54c92825f1019440db4983669c47aa0248d779bd40f39bcddc6af293879a00c762df994c9322df3511e70fd03f62b2a41a66df847a3f26859a21ab4fee73388c2db0fb05eb431a6d47f087f65b0e50efd9ad0a21f064d6381e81ec48502d1b709275c2bbdbea75cc23c0cb4a4ad6c10016907105422f1481c603339eaa490c29a74c9f8b6fd43d4b34574a4e1119d9e345b38bbcfa366e8330177056d800016251f385b9c0c6d66d044ea82a8678bc89183c4d34f297a180f0ea7be9062773417c59a14604ee5257110b0ca3d656f102750b400aa2a8e8f6bd287414e6ea6053bb5f8e479057cb4b234c2d72f3330bea74165ef5ad86306a3eccc7c5bd32c138b71daf78905fed34e7284f2c0e5faea175f7225915050c3949e87d15110260c94fe6060c7f23e0c5200bce0f9f78516411a268aabaeefcb140c9aca679cfa9c0910b886059e2b8c1bcbdd248587ed1edb768a4dc8b69c624dce87ab57514db348158dcb82aabb79a0d462c482494e22c6d2f0ce857388635bf113993229b730fc7c65f57cc9f6148285cc43cb7e14df322a3cc59c1b993c2436064fa64960bc41834a058e1365cac3cf53c329addf3e3478d25c5a9e7da45425ffc5df5628efb24618a870909f9f43cb7932f426fb867b4a0978f72c0867453212a806411603214c53067460ca2316f3d65d7ca537b00d47f5167aa4adb082540e03addae393e3e6fce1f6f89e1e87a76ab53444de4c5be3d8530e4b4f28545e7c7835ac4b6b9dd37516c1867689f3412c0e00ee44460b12197c700198f185b1b09c7529139f96dd7151662be06fcc0dc2341160d5654f6b66a43cfae5e113d58f4ec41d970abd9245040e44080e31f4e5f57528677901ca6a81296b156e15c4c842205facd636a933e0d53828c254ce40c2fb80c8a35bc3264c876252a616e5dedd5833a77d955381a70c70e3c76359a9eec993dd42d12216f816ed0a09a93275ac49de7809e390581564064272ea7583bc3ea2eab221b0a54ba2a5d5ddced7c00d09ef06fb5b46cc59ff3051998f455c9f30d21356c6d5d7217895015f0920471e9eb1636a87a9f130a4b941dd0f9fda008133aaec130978b2e5bdfa3681f759a7a80e1840bc03c17287d470b312720425a1917c8e0a04b910c9fd3089abc582e15bca0b58d4a66b96b541aece48a6519c0e54e5a190dc0c9c645e18cec09d3010aa3124da312112c21aa98190d6fb9651265915d8083cbe48893cf8b18b3aaff34370b84604185ee828280ad905f52ae6e5f43b4510c688b66028e86b8b94962dd16cdac850bb0f415f71e4cd5e7b7ab1713e79adfba9b52b6b510e219c03b70159b8d14a83c24ca35b075ac7b656c554dbfe0864b9279360ad1fadeaf463831e0381a4d7321ce0621b1c7fc81383e3062a046b0e5c40f1b1d0697a42484dc20f8c930b81ec5ca47a9421e202d7fdf02b57a3f2aa51008832638790e7bf8f9a4104169aebf751b94668ad31e205b8d76aa0c0653479f4a58323044588230f83c23c61551ab55c7fa038d02a67d92e3ba2b54eab12cb54f3b60ece7ae101ad7c9afa590348f4791f177a9d93e8699bacd48a538d9e76fcc03923d8e44730235206aa1b5ca2412f83abcc1840672febbe454bd8f9fcc2c1256e84620ffa889922a91a390af971a137d3139951f8b381195f365330b82407a7077d0433ac595ddf472ea158a014c0118b99a93c5107ad8cc665c90ceb85e72f7c1faf81908e64bef5dc8f0d597244bb31434bad22911a40cc848205b4f144252feb2aacca9b89874c3417efb2c52b1801f4756875141db56e5fa05ed43815a6e2eda81fa836bbd31acf43f4e90bb9b81b1efc21e93c8cc006217ea137b8b47e61abfbe8d8144c36059b4d077f212b5c465e1dac708db5f871e145d5acb06eb9e40d5678a03d70accd667ef0ca88892d0f3680b8a7141a4b01ec3b74969f1f5c6cec910673a05e2d683a065a9268667edde08c19f9c03183c5cd063c1ae74815b63c5c00d33f502907ba09268f0e1173d6defbd8107f5fa9dc234a442a9738428c5762f73ea21ffc3eeaa71807b4e458e2c781ea5b576a8b70b5d2cd886d4f639c8f94f891323a71a0d0e395f9340c5e89dc392b72ea638894c38d032dd5835622712ee04a14f4b6d722e1ad05d5fac0430647223cc6113927e8647d52bbdbc895ef823a1d29a3e0ab5b57bbd819cc0bbd2972d6c12bb5211ecc0f3c6470330f8212bcd2098ddc560ab62bfb3e0357f14556b1070daead22c939dec54cb73fc5a61e142ed062e0e30da216910dcc8eda406f489d0e750ab7d61c3b852b7ee5383fc8da3cebfbc80186cf3ee27dd692fbcaefdb5a89541918b188ff083faf0a84956fb02d2dfd758c1ed6dfd12d665aa047bccf5a171f1b5ae62bf969a9cb5d1d5e593ac6217d193a282ba4ed0cd849c2e8365286bac319e0f33545c2f53221a866714093f877a643e2939e09347c3b90b13a78b38fab07cdbb2b331e68b904cf65589fabd79915a6766d044239cec2fda6b9f32e171d406126172c709fc7094b7bb817e804759d2df33aebc6ad6e9625a59c96a697f2aba08d1234fb13d30bfd49b9c9047f2aa67bb9c57a94451b51d17909c8665830301803a359a0fb05d70105af4b7378595dd758e817e63235d0fedd43cd4ee2a54f9da728efc8bd3aae0323a60db0b78a2722b545e6c70e880c07f6f2cdd00076d0d0ee750c754f5d61e025294e4257de60d4ee883582642e0fe32a1d2e3e2bb41403febc71111a9c1995439c952d0891ceba281ace1641e2bec201d213cb6ea7be1e9fdbed3cf224b67b5f877d367ebe0e1b80ea75f102cc026a36743f62942a48d4ad54cec04924b200c8cc49584bf993fccde4041fc1dfb661247fa37f94bf3dbcfce30dfa36037fd364f0b74c067fd364f0b77845e4ca0dc9df386df0f78e9db2f0a8643a68e3c2db6a5f7d2c1706b1a809ad292f440631cb47c1856f3d23e7a1055508a8b98c9492319fc4a5d03c532d9b6ef0dd43562e058f755bd055687cdbff11a14d54504b835680ee038ef14dcfcd91b8b2b7f5838652a4d891846ee71b498927a8fd8dfab52c55b0d4a32f3f43121c0540164d84666540643363ec449c837ee9d1eb0f194081d46dc3881fe028d7da3a28592abdeed27d8ef1b59e4bf0a8953dedfa5c7a0a33c06ad94fab4ad5997b59124b2b93b5eadcbd0b5b7030aecee9d22a21de918ad5db4cc58e24897ea5b5bbd11d00c1b20eb60e9dd7a03bd24be895b272f97111cab4f9b80ea8cac2666d91beab79150334688f5347bb5698a9662ac0367e245bc5a28da8d5bcc858d0cec0a15d30ccc036aefc4bc6d743cb551a13fe55704c990c12c56faed9028e88ba320f38c8beea979fc80b02dfcdf0501a5bd00e1c92504ac67e85232974c64fd7b2a24d38eca1a4375be5abf41277d835855a142f6a88ba561fd7a183bfa257444cbab06aeea92094ea2bc04262b5a09194dc87aced04c62440ad2ef73c210c35573c9344adfb120bfd690f64569ff54564fd788e2c8c5aa4645dea9ac1ef21e537e3ae9e7b4d07c7a494a923e1872235f6eeb3811d0de84906f5455860ab8ee3104d35b087539db9333b0748b4ed5cb020ea7c7fb0c9423498e5be943b81df46cb69e02273aac0ec0f5f42f601d177ea12cca09814ef00763bb7fb8973939797cc7635b87d7af5ea402d47b40fe66e6c78ce8a9f1409d649d025b27046059fe442f69af08a43370bf415899bf3f4f3f918d678f511d6c2b5abcfb5fcdfe583e39a742f6b19ceb5951646b9164f602488487f81caad160ab80e636c36fd369dde7c7e74dc5c6229c73d8536a46e781325b6fa0bd4bc498e6fad28bc769ddca61be37eace6cb0377a96df4933d7f506c945e9268634b483fb4ac7af500a147d12d084d6a56e614d023cd834740615b452ee5008b45158cc3db85e0668b09457c219a6e7a2055860a20e28da47f92f16aacc1279d1afb6f419d80428fa94a79e81a0727e59efa26ec37a1cfa04a86f8c28e04a0e888686b0c8712b3fed5b59b22c16b1c25a5fc4fa1c4e0b343af8291348255c3ebcde86b4881ae42b3178c994f60f771e321f59da29f93308559718fea91b84802aedadc0f5398ee43eff3bacee250bd28ccee8ca8912ca3c321f7552b2febafbdf6ef4c3d7b0fb07f0dfbdcb07f55cc59ec55af3ae5fc3cfb37376bf786fd3b77942dfb973a14fd54fb973c7dde46947a0c4a78cba672ca773cb3f7f088fd4b5d996edabfc499dbf62f59bb7d9325b07fa749b10f88bebbfa6df62ff0e79ef94b1aa7d08c50e51cefb1becb4fa77b5413df63ccdf7e3a4958dd3724473ebd4906c9471fec20b9bc00b170f9a89f1c241f4304e9fc640e3bab2ac8335a67091aec616c89773ddb6c7c3025a795448f27956d02f555b4cee3be49527543ba951e692518b1f11ce8d411e462fbcc11d439679627b49687d2dfca0276d43d91e4dbf1cc46b687e9b02608e471ef40081f32c332840f33a452e96423e04856b3253a9b2723b90be739197ddb2734a5221c80a16220225fdc6453972f4e8a79ac39b0d364a08f8c180d0e3d47048dc55cfb486c8a25629f96c998946bd4e54d94ef74b642e3fbfcca545a53ffe06beb9d525bc9661fd6bff51fdbc954dd72cf0a049f11986152f1014579974864248578aa4dcda2d1db6d2a3c81990cc45dfdc108abbd307916a7737e82c93d3ec919115b30f145c75038b09acf300017820da2819c0e81c81994dbc28fc4b39c336d208f165c1b288ad35b9d5e47c8c6183b1537b4efec191650c2fe2b6c31b5d116154414fb1e47ed3bfb0b910fd40904ac20546a64e83089ac442679af7f8bad95316e60513109cada8d8303ed0b453f472317220ce9be4341979e33fcf734299212ce9d4b4f796fd6e9a177d4a451cbdf12b50b913a9b5c7c31f2860c6726a939c5c3120c2ac6d221ef69a44871afa67ed0320da3d409866ea8a1b2cafa0aae6af717840a19c3def32fd3d4dfb6795092cc74a1a0af2ffd10c4de496035881a8fd7065333cf2f935267cabb6c1e0b0c7eb0327378996633655c38ef5dbf144c46165242c6f16b8a767284c5c99f3263e03ff64332639401ac33b191e79e418216542ca88b90d291a0608a45653c228d97dd2e95485d3d169548073b7d4e25ea1cecd9223abd940dd2496225f8c67eb738bda584eb8afab9376b0cd442175b5791150fcccfdd8a1661423467c86634893cb0f39b88095a540f4e19cab5a25c20ab39b097012425e1ddeda3f2bac08206193c489356bc213cedb9e25fef038212e9ab4d6b3882c219081c612172d6266af98f8b8b6f249012836428fc09cb17404f7c2345d655c7616f3a86ccf7a483b8c2730258091e086035c26765a056de49c2c4215e1015f332604b92377e5eb8a53ae0636c2a423993cea5099a92b6ae43fa04a516924648094410ec08ccc0595939a6a9165862da9d81327078f8d634753499a0c05b93ef1f69a4cc65822218b318742c7bcbf2855942753f7ec6ab1ed1e17b7aeb071d2c33264a5093cee20a7016d30a46bb941926ec9110354dc4e755084e982e6caddf355d4635e7484bbea3c96584b74eeae7bc32c5db7911c3e17e7c9e9eb66da5e1942c13c40c677c4e5860080e8b7da28aa1159dd460075732aa406a30d1ad8c2ff4534793b35c603fcffde841f96cc6d0c6de50d2b557023db86b07d2d9f1cf875c0cdb2f18a7acd8c719b9dba73604c34c8f32043df77ec259ae768b5acc3a019b4aa154712e844d8527a0e43488d93c6dc2a6c249241b4a80697eda64a6c83ab99b875838e3000ee9bdd966a8024c4a65648642bc57241be5fc48cc04bf2580cbfa5818251806b1115cc17904bbff99b0820e226ce266655861c7969fb925eeaf8eb246fa5152121ae37a39767f495d940cfcf9dd282b0aeecf4459db07ffcc28ab374c0f34907f469475ec6def1d51564b8a3c1d6655526347985599d01879ed7127e2938de0ab196655a45f1b6655b2cf50f78787591f9487df1166c5986a0f13f9549875e88d153bccea6c1a1b9247c659533fcc67e3ac289b7e4c9c752a60073f1767b590517698f581c8ab08e4e18d0f445e9f0fb38ebd21a62bdcb05e4c84592b554654abc236895d4035f95b546f625f8ca3e13622a6a2e24f198577eddbbb61d68762a71b61d63b53f5b928eb0cbd35d2b5d16d0e4f2e708e747567d92ae41984d4bc3e284dce82117d13719a646c750b14bc81089ec852345b68709afe76be3fc8a8883eda7dd087e03a38b40f3e1d60b34aa01989032f635149df483639db38a46e0572bd07fe39eb8c51efd590ff84e80a54f423449fd96c9008bd0b35a4c4439c81ca4224d5bfbaf264428a36a643f11493527bdc60e818a3f614a79baa9d45e16a4aeac65b154930669a1dac01499322f525d04268187927434662a084a631aaa46d509126f4f961213066c8ac912494afca6a75e74af615fc0e8a4e55683398514ca37438e8c0a4f03a21853228ff1125962af6befeda323a9836d223d5a6972908746aa7a4ff2abd3c3bdd0516195d0664898501b331cd31b4e6440e4107b96f1ebeec92595aefec83a97b974044dd914aebcfb0d481e80d1a08d6fa3a90c97d5382938449b701002a9a557f8ff517a225e9480892eaceee4e16adb2c2583149e70dedd611903bdb652bf0c11d0704850d03d48a10a920e6e93b7178ed410fe0f0421f0d7206e2eef43d383c0619fffe383c0c827c0a87670481ebe8ba208f0a2b9b01a2c9fcad11405663314241a72fc0e1a9b8cf160e8f5d290810f17e8300918a1a9931a3a3717846d8c83aede907e1f0a211adf875383c05b07b1a8737a99fefc2e159c524c5ebcf1686c6a77078be9f9bddf1a16b21d32dbdb69e605bcf954598c2b25a7c9d91415c38cb0bc3b5b37e4e970bf028bcf0e30a99d63312eb11bd9780011ed6fdf980813c5b5f8174448cc52aa81d0ddf4ba411f47ab305aa4359990c5da43ab3ca0c663492fae8b5b5d5687872c2ae61d6007c8c8da23e30208c780fe63e6dfcc977acf0b2c65ac5a9cd94c8c3e10212d7b7c305da79fc30687622a14f3788b118d83e543b24b045ee9abc515e23a17727b58ebef24f39a850637fcf674d5edda8dc58684f07ab153a39b5319bfe6e3678a5cbad0dc718e18630e780d7613f4d85ad13a4dc04da50171b27031a8218ba94f4b8ddedfe60d8ea0b0021d168a67bafb43fe34cabf608ce6b3f1ff7ef082ad9d32ce9fe0f4ef7cd74ba119eeb9ae829974ff8ceed4706ad77bd795254130711850d16339211d94637b8f152f8b288b61c0c8d7e03d429656dd22c1434155191eb0831801860e178163a8c5aac67634d64a915da4abb0d8b456b4820039505e9d00cd488ed6ca36ab2eeff97b4af9344017be9ad265c0b7d0714b1ba0ce4abd146043794e1e8124b60a3006d4ff8623dd5e7bb60a512516ea58a541b1967b84aa70e00a771ca8833efad7c61cfa044224341ed302f37d818d58d06989d6c964f80d97ba52163a9786731c49b82adaf3fb783900a9b215c0bd0c719043fc74298c63b9c556ef4c6cf11ffaae41fbc5d8462b30607c377e283d833145076051b15e0d8a4c626c0ad8883e516394da422b8552125a59cbb8983b50268c28a32db051450cd1c054b1e7edec8d02a9e97bd45145e90434c4f1dc98794be58e96c348d3701100a962d3d54845bc7a469b9183f47381bdb40746cbe51b120344232ba2f25c314c0e8a8e88ca06aa99c11f316469d30e0acda08d5a8c46d163c64e3d6d807f9848317ac45168cee17f85730fcc37dfa6686dcfa0f44543e192fe725f8aa5bf77f6544e556bcfc1940e53375eb06a0d288973f03a87cd5adff7c40e533f1f2e700955f53b8fef700540638fef355dbd7cda47bd5f65d1ff0aaedeb35ef83b57d773256c3041110ea97b7c8eba15c5f9efa8c151f5add5f88ef65b81e5f0c8f5a2fd079dffd053a70fe9239aa58eaf5c2c85dfc92d1c5ef21b992eaa2bb0c34b7b3739ecb4b19e906a382aeeb3c4ed0bfb6c48c435200ae98d12dabefc50aa6d23f8e7689884b674e3728b315ad602b46642b27cb830dbd9b711d36b7a26b8344c49afa68e95ce0891e59396476253cbcdd6bc7d3eb64c2165c55dff0f1e66eb7d50886040f5295ebd3e030d7c0e8639f8c0fc21eb0ec5d7bdf3fd2f0b8e56c041d6172468fe52ef446540ee9aa045a62d3d43a30053d98d2ad55a78f1b12912303f7834095caf060620d0cd7de7034e40ad8216172b044e1cb72a9b497e5e2fd2fb45ca67e00bf95e52236a1fe63b55d2a90655e0fc4cba1990f1f6f70ea2f5e38cb0b8b81530fa338cb47e185652cfff0c3e036e57a56c665a89dd0d9fcd103f539245eec6cbd0e001b991839f3c9a8bfcdda7e92d2c51be91044b3712ca4f4d1f6ebcf95bb2f723ea31297d9860ad98034cb0282b763e84f4740b1d9d16884392cb233f0f982262ae91459d06e941e74b93d7f7d913cb1d4207679f2a98f04081a87899906a34fb0ec748157069dc53458372843955122f21f6a2dc904460608825e4b49afa53e47a7718a4833756201fd9794d04755922dad6436f41df92c548328f44f8120bd4545adc4c3c201ce4a2b615b6be194f0f7296004a89a6406ef61468b01f528c6f97b5d327328fd40517db2dbe1fba99379a602f020e6071ba5cc0f01142a6aa046cf17a166273b9c381991c7c9885022d028f4f3813feecfc814dadc08649a61553bfeaa12ee687f1a715f8c7c6b9378977d3efa76ac9342a66efe68273255e738ad0e8e41174c4975731b996a80fa6572fd1e3275eabdf9eb6ee034db31c8545d21b5894ced3b6e3a5d6fe51e46a6ee28642dfd001f2e64b590a94e972138b3d2b14f7988c160ee8636c46d68aa5912f940ee4bc821f37c18853d08a608bc094da575701f9a4a3854f6c68ac12b321a8236043082113a39d6396d432f650c0fa487a60e2af2637bddde774c3f75c806e60e372ed21aa783a66ad7cdae8852f010e9e9233455d986cf415305e2941b5732ad58d6fd3d70aa6a072055a08d18be0b4ebddd25e02e3875562116ab93e82e70ea50344da1506510f011706a568e04064414bed2dd05a71a7da2dc26385503d6d05ed0d8c74f81531560e9b4014e9dfac9b4c1a9a8047f0438759cde7356c5449fb25e7e797431285b7f5774f136b20e744c305cad5dd1c56cfcfcaf195d2cbda5bfe11e79b2fdbf3a2fca2edf0fe9791a26384dec8bb7a0c487ebd0d71e80776a6f0fbd8d76bfe3389de5a914f8fd8ee346bdcf43b86d9167125a7e565afe2fdb71bcf10c6b6098c616331b94967dec8c1a0b4153adc56560e4931dc70f03e05a39d5db005c67403a0fe8381ee69f123c78b2acf5e9e08159d67a7cf0604759ebaf0a1e7cbe0bd6e3c1835f55d7fa2dc183e4d58d3f287840a4afad6bdd113c78acae75337860d5b55ac1031615df1d3c40d2ddd8c1a385ad7f97d841f49af68db183870b5b77c50e14d4fb77881d7c5f61ab7d9ab28045cc6651ebc77261b83eadf4c84dbc209a90e0a3ac26248f1952783219163db95016e9305c00a00eafc94b60c0e5e94a1da70daa78ccb9212b3ee1ad997d73a7ee3e67575d38a364c3d9b559aa56e4f487ec38427525ce284bb1a9ceee8ab551efc3375806b7ae910df676b51192cab975deeef377b3573b4ec1feee5cb7dbb7c38d8f14209dcce31d4c9262e749562a911da5cc78e30813f15bb0ae545fba00529795b9a1cbbd869860d70a964f5ef71f34abbfdb1c892e9646475b9875a429c4b0d4ba463f5d810e1e7bdbe0ba91acd611b78b58cc1a986c3409428c3447b320a660e4f19d59a768d73836868c6c0f2b9c841147bbcc36632fead41a475860b88e578aa1bfcf5b44d6eaca27c87a2dcbca2a4605ccbdf7052003abae0a3d7b5d81950d575a84780d988233aac99cd1ae54fe3c19074d24ed42f232ebad50e544def42c4e88e130bd92fa13dbfec517d38d73bf698c8cc0092b1001bdad20fa588fca5b189d90a9fd9623c6f5229278a631f44085982a42619cb329d6b1e77adba8dd62b55ac4feb95d71197a8705358b57f3e1b78da513d6ebf417d156893edac65df4c136eec405b4e1c4a37e7487b9e8b3f56d5f1286bf1742d4cf3c5fc23b5c915ef78da81a19cdfc9a3811bf3de09327e2c710a0964a563bede5d11d93d7ea53335a469d1502b6c38ea0358391a3c36e5c4c53318d538798d0f111deefd8ff00ec6122d343cf10acc4772a2d0ac20c3e879e6394e31bf88d2e02d3d77539283163f9d657940b4f184eecf0ed8fdeae9672489f25f181b4de5e0eaae968578d550762e413d0802b1d49444d1032434df873af45ba2232eaf4cf1d2cfa23019c3e3840a443b0b342e29efb06b14bae72bcc4a2d2887171b96834d3c1aba91fb33471ef59c8b157d872b39aed99ea8b30ec9741d5a9bc8ed9e2b85f4da73f1e8e65c48015a2a8ee42ba2e84dcab3b7181d236e7ee5170e1e7a9bb1821f3f49d59e72fe84a36f73692fb755dc9a2d7bf3dbe2bd9d433c7edea4aa6632fbf4d57b20cc15b7e10076fcd9ad46294af16dd06c77db22b1917c189ae64b9e85b63ef4abbcdae64cabf76bf5757320d92dad5958ca3012a8fe77ecbae642aa373dac4547096aa8de84950c403c7b007b5c88eec4a16e3b8d9956cf347af533c04edf43ac5c3efec4af63ac5e34a7a9de2e16d9ff4758ac7eb140f77f8291e375dce7ffdc7377ffaa7e5bfff7a0b74f59fafcbeef47f6f2117fa89cfcb0d8b3f99cbea8e0efe3ab4282e9cdffeed712d9c16de8ead7dd2d3cd440cd0b8d1875d40c94d2a3ec0ac336673172297f0549b2a4dd4db541126ad2ffe74983415889f7fcd61252f54a7950d7ea13afd0bd5e95fa8ce17aaf385eaa4a97ca13afd0bd5f9b8f192d36645e8f7f79b5366a3a0898a50e53e39bbdf5c324214ee4bfacd59e72aa8a8a6cc2767adcb046db0de8ec14e162bde77dfe9feaafde61e8ab3cb59bed76f4e250e4e7fc8b6615f59111acba15eda2b377725fd26b9398d86fe6be6e67ede89413b7273c5f76fff5b9d18a4b498fbcd4f0cda919bfbbe1383be2d37572846755c137387c90eedf66ce2fa545c6603d7c7724eec2cee816df9ad4ccbbd9526cd8b7bb83e85821299c1bbb83e0229ab0175b8befa8f3bb83eea58fd13707dbdb9f181b41bb8bec1f88867707d46ff7bfaeefbb8bea9fdf626ae8f107c87e2fa86728bfae5b83edd426c0faecff72ff25a089f36707daa124aafa6bda26dfc55876fbe9aab5c6fddd15ce5868fee7e547395c69c577315df1bc47635e761cd55360c621eb42c8d688395a5118d8a59437e824d8527fc89662dbe2f011287dfc7d449c44aa37edf3ec9365fc5fb7cc0318f5f5a886c556a984bcf4a1bd80d6661dbd94a4eabc58d6360989c74dec1618ff3a98f2ff6913b9d0ab582819b60306dda165d7426fd5003e7e54c3858fb3209257b043766d4839eb04cb8e82c5c615b96eb4159521b21fdf39b21de4d22c65f89c4ce2c164133b5fe6578c2e8328f866d925526d819b5a41238a36c3ae3343f034b73fae3de617e59e757fb2036eb1d2db02dc7d72e8471464da4c002a808b914e247e1e7a6fec6ad5a79858c33c00cc6a9a4278981031c9bc2a7e162bc055ab343a38f81d6b66a3d5582ff89d3351fc4b1ed504313c60e7ee2f144bf4dbae8a9e38976a58bbebd81288434e1b136f597a48b9e3c9e68235d14b41af134a1c7a58b66acca7dda1234a0f54accb9bf0bb45ef5c7b0cfcd30ecb3e7a0f52a75bc035a9f7b1e1a07fa9db069c23740eb8f360d5ed0fa1dd07a551973fa16687d6fa49c0028b3df2441c41440eb99b81f5aaf12982f68fd41d07af43aee42eb99f618b4fe319d384179f3d04ee77b2ea585b68d46eddaa47e758bb839de68900c9bded6cfbdede5206f2302357db205e3cfcc7c0a3e8b73df2a1573cba4bc4d220fec2c31e31695062a22748869677935f54f725dc33725f4377ec49179018fd6be83372069064d5a7de6bc6c934eb263c1ad553a88063d94b0fd788bf36c6572cfdd85ebe18ed3ca6cf928b8f0e33a160cbe0030f16933b7df5c86f329165db0c4186e240ea0ab0677aedb4acaef386f53953120ccad1bed14b7b782613c79df915059df0cc06cf520bc1180897c42f8dcb34f18c491a390aaa50e265406f86deadd444c5e521e6ca2df4e46403429ebc44898f51871051573de40aa18b860692163e84219370e31e2229cc1fa9623d6b7ead81e405e67a5ea370af0d1cdf66aed178d7b90516c268f3ac9ed26e2377fd0846516cca649c3ec38c6e075d841acf1591b81b38257334918f993ae6b9e186b31d15d3c63f8cd75419fa1159d20b6478edc04cfd38f09325ee82eeca9d73e6552b1432485d291a41e9c8cd53b69b9295e0dd3326aa0067fa0487788d80b9359042665fb1a06addc4fd9301cec537f931dba51eb074856258191e8c6dd4d929437f70cbe9fdab366a9fcd84ba5e5b798e0aaabc26c41d548587383d4d46e54b827ccc0a1af3bf57381ca50ed0c0c183d56096e38a6e8dbdf88823f1dde1e0214e3fe4df023061efa61fcc8a0839aafc3792aedeee13c4cbe851f49a6ebe05e87f374b364e24776edfd58976c7a212cda0d1cc0ffb5080bb6575f080bf975a7df01616150bf0b619194abf27741583c923379212c24677e00c26288577737849f8ab0087dece1f44258289df5425874b4d3ef83b01886f13abde5f92de8c108a2cd8643dc86e023a9585c485a92b9ac659edc69dea8f4441dcbe256d16442321b6d87b251c496ed564476f2d12a4f84b76340d3b20ed9d51bfb088cdce7098acc98c6aecc68c938832c68c9783b38bcba110a6e4893e864178e49b994486308cd948cd1235975a6807563b41290fe6ad6a979675712c3cc61f1131b557a2d25bd96a4bb9e8d9c34d24cfd9061392525003116902d096d36291b394c62104500a18088b4a828a10b3836b1b787414267edd56cc43580a7059caed28b6211d211b77adf3f128ffa1675dab74ffbd6e9828da3d2f156e6077b74cc0f510359d440d1d1b34e059f503216433b297e18818613c2c960b10c51915419bc0821833fc3ee11a93a0b9a72b3632440628221912ceb70979e4c09a2a57fc5c6775185a47634be8b868df33ace78d34502f2abf1dd618defa8a1d4abf15dc777a9705e8def0e687c6745105e8deffc43f08b57e33b49faeac677439aa1ebd62bddf32aa8edf97d37ddd326ebaf99ee31723b7152a41f5f506b0cd1bd0a6a5fe91ec1cb5f98eec9c7c59adddfbba0f657f65f7da57b3adaef94ee29755f8f5fbf053f7b1470bb55f6bb895347fdb2332e8692de5763799abeaae858552dba5f5d74ac62d1bdc5f93acfcb7df1795e685edc2d3a5685beee5574fc3acfcbef30db5ee7796dba517fb3f3bc1ed289e3f0c34df717524b99eedf8ed4faf14727fcd6a6fb385dcec59bc603cc52b322f82f6796aaa0e5cb2cf5feef6296de2ce77e99a5fe6596beccd29f6b96fecbdbff030e89205d0a656e6473747265616d0a656e646f626a0a352030206f626a0a3c3c0a3e3e0a656e646f626a0a332030206f626a0a3c3c0a2f436f6e74656e7473205b203420302052205d0a2f43726f70426f78205b20302e3020302e30203631322e30203739322e30205d0a2f4d65646961426f78205b20302e3020302e30203631322e30203739322e30205d0a2f506172656e742032203020520a2f5265736f75726365732035203020520a2f526f7461746520300a2f54797065202f506167650a3e3e0a656e646f626a0a322030206f626a0a3c3c0a2f436f756e7420310a2f4b696473205b203320302052205d0a2f54797065202f50616765730a3e3e0a656e646f626a0a312030206f626a0a3c3c0a2f50616765732032203020520a2f54797065202f436174616c6f670a3e3e0a656e646f626a0a362030206f626a0a3c3c0a2f417574686f72202851313734323938290a2f4372656174696f6e446174652028443a32303232303931363231333331382b303227303027290a2f4d6f64446174652028443a32303232303931363231333331382b303227303027290a2f50726f647563657220284d6963726f736f66743a205072696e7420546f20504446290a2f5469746c65202864652d32303861373131323739656661313339616238646139373032663431363463642e706466290a3e3e0a656e646f626a0a787265660a3020370d0a3030303030303030303020363535333520660d0a30303030303132363339203030303030206e0d0a30303030303132353830203030303030206e0d0a30303030303132343139203030303030206e0d0a30303030303030303039203030303030206e0d0a30303030303132333938203030303030206e0d0a30303030303132363838203030303030206e0d0a747261696c65720a3c3c0a2f496e666f2036203020520a2f526f6f742031203020520a2f53697a6520370a3e3e0a7374617274787265660a31323838380a2525454f460a	1
fda6c9cb-62be-4a98-99c1-d9c5a2df4aac	2022-09-06 00:00:00+00	App Test Additional Data	5	ac1cf001-7fbc-1f2f-817f-bce058020001	\\xe3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855	\\x255044462d312e370a0a342030206f626a0a3c3c0a2f46696c746572202f466c6174654465636f64650a2f4c656e6774682031323331350a3e3e0a73747265616d0a789ced5dcd8eecb86edef753d43a801a922cc9f6130408904592451e608064105407483679fdd85512f951a4abca5dee3e7d66ea0273d18776d93225f1f723e5dfc7ec97ff9dfcbbf7f20fa7af8d736c7ffef1f1f63f6fa1fd4bfff1bffff9a61ff9f13685a2a867a4069f0b5ff036f9cfb7ff78fb97bbef1fd2fb342d7f071cc038f9f7b9781f230e00a8cb9bf2fb34cc7329cb057e86a4b71198efd8fad1e65bec41fdf9f6efff70faefe5259a91f4c7bffee35b38fdd3f2df7fbd0522fef3c298b1f8d3ffbdc579780f619ee77c4a65e211223dc5f7651cf39c9657fedbe5a33effbe212d8b6679d6349dd232a769e1420837de17a7e93d2c1feed342f7edfe368eb03d0eba340ce13daebc8ecb1bc7f7b8be7d5e57e7fe8f88eff9f211d6ba756978f7e932a771b8bcd0afe304729adecbe5bb56f2b0f07a5d01f1941786c47af7fc5eaecf8b177e5d679988cb7e9bdad4bb32bfa77479801b16be107d1cdee7958fd3c9c5caba9e3ebe0f445ec67af9c7b21223dffdf42c23cf4b9bf06596334dc030cd6dc2f7cc6699c7f7bcfc6a2c0b3f699d7c6a3697214e5bb3395d769b18c175b1aed340fc03daf2e77099f4d3e98f37a48fe93de70bdfcf823e0def79fd413ad1bb5c98fd552e6410b2405c1eedf2441b082f9dd72bf365d104f923971796554ee36b259d877979095ea22f3bcb0bc4067c338f1b064ac4e5d97fee98ec98c275ed2f93ed537bdaf15bd7b7955fae4cbb7c6ac8d78debd79d31d3865936db182e2b78e62dea867819dd42751104f4fa901ceb3ca67508be6aadca52871b9da9cbcf86a3f6628ca54ded2affea3c7d207d98c3fbb0fc39e527de775958178d92dee3ba2f17d19ba7b60a3f247d6ee261cfde075d30a4a13de153cba10dd65a0ebc8487360bf12aa21752b98aed75a9d43f98b4acee2a9491ca72959fc734dc1a4ca51be979fabdf85a7e19a8821d2a92d7c59087f6e75dc6fabdfb6cd03bcab161b76c85705584abe69af3653b85093ed32d9641d59abc3bdda2401bf17daed394c6a6755d08edcecb1312cd6ee43f8740b70f3c5dfc6e17e736b6cb4368f491384fdfe6c270bdd7e2da5e01b8d8807edd33c36988f9eb26c637bd149aade1df4baadf457b2036ca44fc2416a6c6b5dce419318417675bcc97155b85a123a99769ef4466ea44a4441c8c3c2d4d5e83e86cef7f9ef9432171b398497991fad3fc18f3fdc2fcf430ef87b65ac8e6a8145acf1753454cc2850d9525f407cb179e84dc1e3e111398ab9e054ef48d7f75f1d2ab1cce1b5d76b054024de5fc00ef3fafbcc334be97f1ba1d6652211f1bf4b0b814d5445ead87fab430557b6b5ca873332f96e1ed591843b362c1bafd0ab3a4eec1458435538bb81e97b53f568ba3cdd42236d9089dda8c0f739befd51d99da564f68a758e455569299d2961812c7b668f671cfe7c6f561c88f6dab8d5801d068e14ded7563d9f8e3b275c62889b0516645f1f49944e4b5ceb6817e95c397d2d80c197577ebfcc7e3fc6dca755cf84b4ef573fc0dacd19ee52f3dea33fc2d5ef1b7788bbfc57f8abf9fdfc0c0f51443933b1f829e4b1fbff8bc551f1693bd8abcb46ca82a8e1651b83868f5e5ab287cdaaaa7f72dde5c8d5eac6293dfb7388ed5094fabd7d2de17c6b1c51b5298afa6c01af80853227e84c812e8797e2c766bbe2cf56126bdbdaa86995dc8aa58c743f8b148cc95098b145b7cedea482df3ed431b47f2915dff55eac1bc103f6cfa3a8b4d462e2faa1ac67ee7219a352efed41a6c5c1f3dc1f42e0e5b8b17ac4e62bde57cc8fb6adc494c9778dff47cd891b727c52d8634b565b06ecf81e98583297179c845a92ef4c5bfa87eeb3a5d74d35075e6653b474fb1a821cd17b32d0cfb9c5b56bc5f19eb8823072468fb2dce6ab3f552be2edf357cc8c278f9a48b3b768d0e457217d62864dde5e70dfaeae0555f6ea5d6c7acd19066c48fe47cd587b7514dc37ba9f70ce96a80c4935b235b2b77c6d31a5b6d239cf255af0c354846b78fb9addad57469e3cb1c9759beb80d6af11ad9b5716199ebcbc4afbca02b6e2487155c4bd7221d019c923a124577b9868202e82557426319daea1679a5d521b3299f39a00ce6bacb14f6e589cfc4f0448f3468174fb7c048e1deba77c113b68864173eb1710762775a27e13a95cb3a2eb447d6bc4015206bbe20b6707a1a3ce61162dbb82992c85de829b32d0f91f8a7a36ee6f8e4b85b1628df18dfd3e3184a9376290e4dbf6c8fe3d9f7a59114532a305f484fa0179f7d5f0e64ef884cc3d6fb5221ef639d97d5c10afb3210d973462a909afea4a05ec4ee663e29b6ad172985744672c2f4ce30369190abe68a97d4518b1b90490c44994faa1ee070c927790a838f91c4779cd85e437a974faab9af23f3492bcf2b31b1265f66797120abb73fb0a1b76b3613a5a1869c1f0ef2ec9e4d744e98fd4d1d91a2a369125165d683e4e073f899d2472ce0c9995f033681423b94dde0f4c26a04148ac99616f0a154c5f501743369cde049997194140c8a458bd7d5b13e8102a2ebf2a80a2b641ad722ef62cd8697e6640071f5273d2fc2d4fe5cee68e1de30d3aa9b29928be1095e8ca97d25a9e3c401b87ee29eb4adafeb6161659333438e6c7be6522ea9a471b181178ba0aa9ebc583d6bc8775c947b49cdc2cc8bd5d19e5172b32f9fd2af6d70b9e5538794393b940bef8b44d1b5bcd86aebfcc5f162e656c16b538f18dc3051ca480cae1a7ed15facf62adcf3c2dcb0fc390e0b9539b778dd8dcaba7057c42ac791b3d9e1a9bcd32d19c1f67f6ac9c4f35ba6c4225257be54a791c4b04de57c47b36e96e7b3c52b2286636c8a6dcd8254fae2afb72dc9488514db9b563d70d946c34e9e96d4002d439cbf4e8bb2dce53812ff954916b33c45b1e16a62ac0ac5760be7801d272d06b2b44b7bfefa8421348937713495fe9c58626adac51d22d78c911a679bec203d9ad92fa0492be42ded9ba975b2eb265cbff12a7a0e8ad73a1d50746644d1c5a692f8464a77f0e380044c24aa580eb98f213a3baee8ee0416a72d2eec0cdce64433bf06c6abc8fd6d194d29d2c318fd5511dcaa6cb26fea382d360d45f4567af3ccd8423c3fafdc66d69a638d91ac4838a0271f9ad23bc0869ec9f618c6993db35292417ffe7d2590f25ebf8322e2401f2672becf6f65e010dd061d9e73c0f822270d27302e807ee8fbba79ad72f4caff35aa3b79a49f2ff4fa9015474321c83c53985dd07760e87cbea8aa69f9f2e6c685cf0a9a81f2358468615235b591c4c125a4f6996ff62991c4ea8b73ce931a959b14b88649cb6f33892170a00d221b07f40e26e16032787425d103959b87247a472fe7762a8d1228dffdec5c3a63329d319b16ed2abd1b79808080410d3a00411003e6d6056cd02685064437022b7aca6aca368f99886783665172cf82cbd3869e1d642522c927cd163206799573189a62ad06e982ae51548ed4d3a0184a43df23de3bf1c7b501d21a374897ef55547ec92d929833d85d0691b15a145ae7bb707705d8735eadc004068ea2c955490f15ab72bffc009b1f237006d5650a7cb0a1cf34fc4a411ed4cfd99c421a04ea91dcf629d27844c66ed92570380a389407f354f7ad54fa834231bd36c13d05c4a9fb21ed4ba00c45fd7064f041ef75d16070ce29660a334e34e2a9459bdb2490a89fda9764b07d69cd660ed4261618843fa62d2e687503110d7458689f4728bb48328288e4119fdfe8a7141fa3c703a54c92825f1019440db4983669c47aa0248d779bd40f39bcddc6af293879a00c762df994c9322df3511e70fd03f62b2a41a66df847a3f26859a21ab4fee73388c2db0fb05eb431a6d47f087f65b0e50efd9ad0a21f064d6381e81ec48502d1b709275c2bbdbea75cc23c0cb4a4ad6c10016907105422f1481c603339eaa490c29a74c9f8b6fd43d4b34574a4e1119d9e345b38bbcfa366e8330177056d800016251f385b9c0c6d66d044ea82a8678bc89183c4d34f297a180f0ea7be9062773417c59a14604ee5257110b0ca3d656f102750b400aa2a8e8f6bd287414e6ea6053bb5f8e479057cb4b234c2d72f3330bea74165ef5ad86306a3eccc7c5bd32c138b71daf78905fed34e7284f2c0e5faea175f7225915050c3949e87d15110260c94fe6060c7f23e0c5200bce0f9f78516411a268aabaeefcb140c9aca679cfa9c0910b886059e2b8c1bcbdd248587ed1edb768a4dc8b69c624dce87ab57514db348158dcb82aabb79a0d462c482494e22c6d2f0ce857388635bf113993229b730fc7c65f57cc9f6148285cc43cb7e14df322a3cc59c1b993c2436064fa64960bc41834a058e1365cac3cf53c329addf3e3478d25c5a9e7da45425ffc5df5628efb24618a870909f9f43cb7932f426fb867b4a0978f72c0867453212a806411603214c53067460ca2316f3d65d7ca537b00d47f5167aa4adb082540e03addae393e3e6fce1f6f89e1e87a76ab53444de4c5be3d8530e4b4f28545e7c7835ac4b6b9dd37516c1867689f3412c0e00ee44460b12197c700198f185b1b09c7529139f96dd7151662be06fcc0dc2341160d5654f6b66a43cfae5e113d58f4ec41d970abd9245040e44080e31f4e5f57528677901ca6a81296b156e15c4c842205facd636a933e0d53828c254ce40c2fb80c8a35bc3264c876252a616e5dedd5833a77d955381a70c70e3c76359a9eec993dd42d12216f816ed0a09a93275ac49de7809e390581564064272ea7583bc3ea2eab221b0a54ba2a5d5ddced7c00d09ef06fb5b46cc59ff3051998f455c9f30d21356c6d5d7217895015f0920471e9eb1636a87a9f130a4b941dd0f9fda008133aaec130978b2e5bdfa3681f759a7a80e1840bc03c17287d470b312720425a1917c8e0a04b910c9fd3089abc582e15bca0b58d4a66b96b541aece48a6519c0e54e5a190dc0c9c645e18cec09d3010aa3124da312112c21aa98190d6fb9651265915d8083cbe48893cf8b18b3aaff34370b84604185ee828280ad905f52ae6e5f43b4510c688b66028e86b8b94962dd16cdac850bb0f415f71e4cd5e7b7ab1713e79adfba9b52b6b510e219c03b70159b8d14a83c24ca35b075ac7b656c554dbfe0864b9279360ad1fadeaf463831e0381a4d7321ce0621b1c7fc81383e3062a046b0e5c40f1b1d0697a42484dc20f8c930b81ec5ca47a9421e202d7fdf02b57a3f2aa51008832638790e7bf8f9a4104169aebf751b94668ad31e205b8d76aa0c0653479f4a58323044588230f83c23c61551ab55c7fa038d02a67d92e3ba2b54eab12cb54f3b60ece7ae101ad7c9afa590348f4791f177a9d93e8699bacd48a538d9e76fcc03923d8e44730235206aa1b5ca2412f83abcc1840672febbe454bd8f9fcc2c1256e84620ffa889922a91a390af971a137d3139951f8b381195f365330b82407a7077d0433ac595ddf472ea158a014c0118b99a93c5107ad8cc665c90ceb85e72f7c1faf81908e64bef5dc8f0d597244bb31434bad22911a40cc848205b4f144252feb2aacca9b89874c3417efb2c52b1801f4756875141db56e5fa05ed43815a6e2eda81fa836bbd31acf43f4e90bb9b81b1efc21e93c8cc006217ea137b8b47e61abfbe8d8144c36059b4d077f212b5c465e1dac708db5f871e145d5acb06eb9e40d5678a03d70accd667ef0ca88892d0f3680b8a7141a4b01ec3b74969f1f5c6cec910673a05e2d683a065a9268667edde08c19f9c03183c5cd063c1ae74815b63c5c00d33f502907ba09268f0e1173d6defbd8107f5fa9dc234a442a9738428c5762f73ea21ffc3eeaa71807b4e458e2c781ea5b576a8b70b5d2cd886d4f639c8f94f891323a71a0d0e395f9340c5e89dc392b72ea638894c38d032dd5835622712ee04a14f4b6d722e1ad05d5fac0430647223cc6113927e8647d52bbdbc895ef823a1d29a3e0ab5b57bbd819cc0bbd2972d6c12bb5211ecc0f3c6470330f8212bcd2098ddc560ab62bfb3e0357f14556b1070daead22c939dec54cb73fc5a61e142ed062e0e30da216910dcc8eda406f489d0e750ab7d61c3b852b7ee5383fc8da3cebfbc80186cf3ee27dd692fbcaefdb5a89541918b188ff083faf0a84956fb02d2dfd758c1ed6dfd12d665aa047bccf5a171f1b5ae62bf969a9cb5d1d5e593ac6217d193a282ba4ed0cd849c2e8365286bac319e0f33545c2f53221a866714093f877a643e2939e09347c3b90b13a78b38fab07cdbb2b331e68b904cf65589fabd79915a6766d044239cec2fda6b9f32e171d406126172c709fc7094b7bb817e804759d2df33aebc6ad6e9625a59c96a697f2aba08d1234fb13d30bfd49b9c9047f2aa67bb9c57a94451b51d17909c8665830301803a359a0fb05d70105af4b7378595dd758e817e63235d0fedd43cd4ee2a54f9da728efc8bd3aae0323a60db0b78a2722b545e6c70e880c07f6f2cdd00076d0d0ee750c754f5d61e025294e4257de60d4ee883582642e0fe32a1d2e3e2bb41403febc71111a9c1995439c952d0891ceba281ace1641e2bec201d213cb6ea7be1e9fdbed3cf224b67b5f877d367ebe0e1b80ea75f102cc026a36743f62942a48d4ad54cec04924b200c8cc49584bf993fccde4041fc1dfb661247fa37f94bf3dbcfce30dfa36037fd364f0b74c067fd364f0b77845e4ca0dc9df386df0f78e9db2f0a8643a68e3c2db6a5f7d2c1706b1a809ad292f440631cb47c1856f3d23e7a1055508a8b98c9492319fc4a5d03c532d9b6ef0dd43562e058f755bd055687cdbff11a14d54504b835680ee038ef14dcfcd91b8b2b7f5838652a4d891846ee71b498927a8fd8dfab52c55b0d4a32f3f43121c0540164d84666540643363ec449c837ee9d1eb0f194081d46dc3881fe028d7da3a28592abdeed27d8ef1b59e4bf0a8953dedfa5c7a0a33c06ad94fab4ad5997b59124b2b93b5eadcbd0b5b7030aecee9d22a21de918ad5db4cc58e24897ea5b5bbd11d00c1b20eb60e9dd7a03bd24be895b272f97111cab4f9b80ea8cac2666d91beab79150334688f5347bb5698a9662ac0367e245bc5a28da8d5bcc858d0cec0a15d30ccc036aefc4bc6d743cb551a13fe55704c990c12c56faed9028e88ba320f38c8beea979fc80b02dfcdf0501a5bd00e1c92504ac67e85232974c64fd7b2a24d38eca1a4375be5abf41277d835855a142f6a88ba561fd7a183bfa257444cbab06aeea92094ea2bc04262b5a09194dc87aced04c62440ad2ef73c210c35573c9344adfb120bfd690f64569ff54564fd788e2c8c5aa4645dea9ac1ef21e537e3ae9e7b4d07c7a494a923e1872235f6eeb3811d0de84906f5455860ab8ee3104d35b087539db9333b0748b4ed5cb020ea7c7fb0c9423498e5be943b81df46cb69e02273aac0ec0f5f42f601d177ea12cca09814ef00763bb7fb8973939797cc7635b87d7af5ea402d47b40fe66e6c78ce8a9f1409d649d025b27046059fe442f69af08a43370bf415899bf3f4f3f918d678f511d6c2b5abcfb5fcdfe583e39a742f6b19ceb5951646b9164f602488487f81caad160ab80e636c36fd369dde7c7e74dc5c6229c73d8536a46e781325b6fa0bd4bc498e6fad28bc769ddca61be37eace6cb0377a96df4933d7f506c945e9268634b483fb4ac7af500a147d12d084d6a56e614d023cd834740615b452ee5008b45158cc3db85e0668b09457c219a6e7a2055860a20e28da47f92f16aacc1279d1afb6f419d80428fa94a79e81a0727e59efa26ec37a1cfa04a86f8c28e04a0e888686b0c8712b3fed5b59b22c16b1c25a5fc4fa1c4e0b343af8291348255c3ebcde86b4881ae42b3178c994f60f771e321f59da29f93308559718fea91b84802aedadc0f5398ee43eff3bacee250bd28ccee8ca8912ca3c321f7552b2febafbdf6ef4c3d7b0fb07f0dfbdcb07f55cc59ec55af3ae5fc3cfb37376bf786fd3b77942dfb973a14fd54fb973c7dde46947a0c4a78cba672ca773cb3f7f088fd4b5d996edabfc499dbf62f59bb7d9325b07fa749b10f88bebbfa6df62ff0e79ef94b1aa7d08c50e51cefb1becb4fa77b5413df63ccdf7e3a4958dd3724473ebd4906c9471fec20b9bc00b170f9a89f1c241f4304e9fc640e3bab2ac8335a67091aec616c89773ddb6c7c3025a795448f27956d02f555b4cee3be49527543ba951e692518b1f11ce8d411e462fbcc11d439679627b49687d2dfca0276d43d91e4dbf1cc46b687e9b02608e471ef40081f32c332840f33a452e96423e04856b3253a9b2723b90be739197ddb2734a5221c80a16220225fdc6453972f4e8a79ac39b0d364a08f8c180d0e3d47048dc55cfb486c8a25629f96c998946bd4e54d94ef74b642e3fbfcca545a53ffe06beb9d525bc9661fd6bff51fdbc954dd72cf0a049f11986152f1014579974864248578aa4dcda2d1db6d2a3c81990cc45dfdc108abbd307916a7737e82c93d3ec919115b30f145c75038b09acf300017820da2819c0e81c81994dbc28fc4b39c336d208f165c1b288ad35b9d5e47c8c6183b1537b4efec191650c2fe2b6c31b5d116154414fb1e47ed3bfb0b910fd40904ac20546a64e83089ac442679af7f8bad95316e60513109cada8d8303ed0b453f472317220ce9be4341979e33fcf734299212ce9d4b4f796fd6e9a177d4a451cbdf12b50b913a9b5c7c31f2860c6726a939c5c3120c2ac6d221ef69a44871afa67ed0320da3d409866ea8a1b2cafa0aae6af717840a19c3def32fd3d4dfb6795092cc74a1a0af2ffd10c4de496035881a8fd7065333cf2f935267cabb6c1e0b0c7eb0327378996633655c38ef5dbf144c46165242c6f16b8a767284c5c99f3263e03ff64332639401ac33b191e79e418216542ca88b90d291a0608a45653c228d97dd2e95485d3d169548073b7d4e25ea1cecd9223abd940dd2496225f8c67eb738bda584eb8afab9376b0cd442175b5791150fcccfdd8a1661423467c86634893cb0f39b88095a540f4e19cab5a25c20ab39b097012425e1ddeda3f2bac08206193c489356bc213cedb9e25fef038212e9ab4d6b3882c219081c612172d6266af98f8b8b6f249012836428fc09cb17404f7c2345d655c7616f3a86ccf7a483b8c2730258091e086035c26765a056de49c2c4215e1015f332604b92377e5eb8a53ae0636c2a423993cea5099a92b6ae43fa04a516924648094410ec08ccc0595939a6a9165862da9d81327078f8d634753499a0c05b93ef1f69a4cc65822218b318742c7bcbf2855942753f7ec6ab1ed1e17b7aeb071d2c33264a5093cee20a7016d30a46bb941926ec9110354dc4e755084e982e6caddf355d4635e7484bbea3c96584b74eeae7bc32c5db7911c3e17e7c9e9eb66da5e1942c13c40c677c4e5860080e8b7da28aa1159dd460075732aa406a30d1ad8c2ff4534793b35c603fcffde841f96cc6d0c6de50d2b557023db86b07d2d9f1cf875c0cdb2f18a7acd8c719b9dba73604c34c8f32043df77ec259ae768b5acc3a019b4aa154712e844d8527a0e43488d93c6dc2a6c249241b4a80697eda64a6c83ab99b875838e3000ee9bdd966a8024c4a65648642bc57241be5fc48cc04bf2580cbfa5818251806b1115cc17904bbff99b0820e226ce266655861c7969fb925eeaf8eb246fa5152121ae37a39767f495d940cfcf9dd282b0aeecf4459db07ffcc28ab374c0f34907f469475ec6def1d51564b8a3c1d6655526347985599d01879ed7127e2938de0ab196655a45f1b6655b2cf50f78787591f9487df1166c5986a0f13f9549875e88d153bccea6c1a1b9247c659533fcc67e3ac289b7e4c9c752a60073f1767b590517698f581c8ab08e4e18d0f445e9f0fb38ebd21a62bdcb05e4c84592b554654abc236895d4035f95b546f625f8ca3e13622a6a2e24f198577eddbbb61d68762a71b61d63b53f5b928eb0cbd35d2b5d16d0e4f2e708e747567d92ae41984d4bc3e284dce82117d13719a646c750b14bc81089ec852345b68709afe76be3fc8a8883eda7dd087e03a38b40f3e1d60b34aa01989032f635149df483639db38a46e0572bd07fe39eb8c51efd590ff84e80a54f423449fd96c9008bd0b35a4c4439c81ca4224d5bfbaf264428a36a643f11493527bdc60e818a3f614a79baa9d45e16a4aeac65b154930669a1dac01499322f525d04268187927434662a084a631aaa46d509126f4f961213066c8ac912494afca6a75e74af615fc0e8a4e55683398514ca37438e8c0a4f03a21853228ff1125962af6befeda323a9836d223d5a6972908746aa7a4ff2abd3c3bdd0516195d0664898501b331cd31b4e6440e4107b96f1ebeec92595aefec83a97b974044dd914aebcfb0d481e80d1a08d6fa3a90c97d5382938449b701002a9a557f8ff517a225e9480892eaceee4e16adb2c2583149e70dedd611903bdb652bf0c11d0704850d03d48a10a920e6e93b7178ed410fe0f0421f0d7206e2eef43d383c0619fffe383c0c827c0a87670481ebe8ba208f0a2b9b01a2c9fcad11405663314241a72fc0e1a9b8cf160e8f5d290810f17e8300918a1a9931a3a3717846d8c83aede907e1f0a211adf875383c05b07b1a8737a99fefc2e159c524c5ebcf1686c6a77078be9f9bddf1a16b21d32dbdb69e605bcf954598c2b25a7c9d91415c38cb0bc3b5b37e4e970bf028bcf0e30a99d63312eb11bd9780011ed6fdf980813c5b5f8174448cc52aa81d0ddf4ba411f47ab305aa4359990c5da43ab3ca0c663492fae8b5b5d5687872c2ae61d6007c8c8da23e30208c780fe63e6dfcc977acf0b2c65ac5a9cd94c8c3e10212d7b7c305da79fc30687622a14f3788b118d83e543b24b045ee9abc515e23a17727b58ebef24f39a850637fcf674d5edda8dc58684f07ab153a39b5319bfe6e3678a5cbad0dc718e18630e780d7613f4d85ad13a4dc04da50171b27031a8218ba94f4b8ddedfe60d8ea0b0021d168a67bafb43fe34cabf608ce6b3f1ff7ef082ad9d32ce9fe0f4ef7cd74ba119eeb9ae829974ff8ceed4706ad77bd795254130711850d16339211d94637b8f152f8b288b61c0c8d7e03d429656dd22c1434155191eb0831801860e178163a8c5aac67634d64a915da4abb0d8b456b4820039505e9d00cd488ed6ca36ab2eeff97b4af9344017be9ad265c0b7d0714b1ba0ce4abd146043794e1e8124b60a3006d4ff8623dd5e7bb60a512516ea58a541b1967b84aa70e00a771ca8833efad7c61cfa044224341ed302f37d818d58d06989d6c964f80d97ba52163a9786731c49b82adaf3fb783900a9b215c0bd0c719043fc74298c63b9c556ef4c6cf11ffaae41fbc5d8462b30607c377e283d833145076051b15e0d8a4c626c0ad8883e516394da422b8552125a59cbb8983b50268c28a32db051450cd1c054b1e7edec8d02a9e97bd45145e90434c4f1dc98794be58e96c348d3701100a962d3d54845bc7a469b9183f47381bdb40746cbe51b120344232ba2f25c314c0e8a8e88ca06aa99c11f316469d30e0acda08d5a8c46d163c64e3d6d807f9848317ac45168cee17f85730fcc37dfa6686dcfa0f44543e192fe725f8aa5bf77f6544e556bcfc1940e53375eb06a0d288973f03a87cd5adff7c40e533f1f2e700955f53b8fef700540638fef355dbd7cda47bd5f65d1ff0aaedeb35ef83b57d773256c3041110ea97b7c8eba15c5f9efa8c151f5add5f88ef65b81e5f0c8f5a2fd079dffd053a70fe9239aa58eaf5c2c85dfc92d1c5ef21b992eaa2bb0c34b7b3739ecb4b19e906a382aeeb3c4ed0bfb6c48c435200ae98d12dabefc50aa6d23f8e7689884b674e3728b315ad602b46642b27cb830dbd9b711d36b7a26b8344c49afa68e95ce0891e59396476253cbcdd6bc7d3eb64c2165c55dff0f1e66eb7d50886040f5295ebd3e030d7c0e8639f8c0fc21eb0ec5d7bdf3fd2f0b8e56c041d6172468fe52ef446540ee9aa045a62d3d43a30053d98d2ad55a78f1b12912303f7834095caf060620d0cd7de7034e40ad8216172b044e1cb72a9b497e5e2fd2fb45ca67e00bf95e52236a1fe63b55d2a90655e0fc4cba1990f1f6f70ea2f5e38cb0b8b81530fa338cb47e185652cfff0c3e036e57a56c665a89dd0d9fcd103f539245eec6cbd0e001b991839f3c9a8bfcdda7e92d2c51be91044b3712ca4f4d1f6ebcf95bb2f723ea31297d9860ad98034cb0282b763e84f4740b1d9d16884392cb233f0f982262ae91459d06e941e74b93d7f7d913cb1d4207679f2a98f04081a87899906a34fb0ec748157069dc53458372843955122f21f6a2dc904460608825e4b49afa53e47a7718a4833756201fd9794d04755922dad6436f41df92c548328f44f8120bd4545adc4c3c201ce4a2b615b6be194f0f7296004a89a6406ef61468b01f528c6f97b5d327328fd40517db2dbe1fba99379a602f020e6071ba5cc0f01142a6aa046cf17a166273b9c381991c7c9885022d028f4f3813feecfc814dadc08649a61553bfeaa12ee687f1a715f8c7c6b9378977d3efa76ac9342a66efe68273255e738ad0e8e41174c4975731b996a80fa6572fd1e3275eabdf9eb6ee034db31c8545d21b5894ced3b6e3a5d6fe51e46a6ee28642dfd001f2e64b590a94e972138b3d2b14f7988c160ee8636c46d68aa5912f940ee4bc821f37c18853d08a608bc094da575701f9a4a3854f6c68ac12b321a8236043082113a39d6396d432f650c0fa487a60e2af2637bddde774c3f75c806e60e372ed21aa783a66ad7cdae8852f010e9e9233455d986cf415305e2941b5732ad58d6fd3d70aa6a072055a08d18be0b4ebddd25e02e3875562116ab93e82e70ea50344da1506510f011706a568e04064414bed2dd05a71a7da2dc26385503d6d05ed0d8c74f81531560e9b4014e9dfac9b4c1a9a8047f0438759cde7356c5449fb25e7e797431285b7f5774f136b20e744c305cad5dd1c56cfcfcaf195d2cbda5bfe11e79b2fdbf3a2fca2edf0fe9791a26384dec8bb7a0c487ebd0d71e80776a6f0fbd8d76bfe3389de5a914f8fd8ee346bdcf43b86d9167125a7e565afe2fdb71bcf10c6b6098c616331b94967dec8c1a0b4153adc56560e4931dc70f03e05a39d5db005c67403a0fe8381ee69f123c78b2acf5e9e08159d67a7cf0604759ebaf0a1e7cbe0bd6e3c1835f55d7fa2dc183e4d58d3f287840a4afad6bdd113c78acae75337860d5b55ac1031615df1d3c40d2ddd8c1a385ad7f97d841f49af68db183870b5b77c50e14d4fb77881d7c5f61ab7d9ab28045cc6651ebc77261b83eadf4c84dbc209a90e0a3ac26248f1952783219163db95016e9305c00a00eafc94b60c0e5e94a1da70daa78ccb9212b3ee1ad997d73a7ee3e67575d38a364c3d9b559aa56e4f487ec38427525ce284bb1a9ceee8ab551efc3375806b7ae910df676b51192cab975deeef377b3573b4ec1feee5cb7dbb7c38d8f14209dcce31d4c9262e749562a911da5cc78e30813f15bb0ae545fba00529795b9a1cbbd869860d70a964f5ef71f34abbfdb1c892e9646475b9875a429c4b0d4ba463f5d810e1e7bdbe0ba91acd611b78b58cc1a986c3409428c3447b320a660e4f19d59a768d73836868c6c0f2b9c841147bbcc36632fead41a475860b88e578aa1bfcf5b44d6eaca27c87a2dcbca2a4605ccbdf7052003abae0a3d7b5d81950d575a84780d988233aac99cd1ae54fe3c19074d24ed42f232ebad50e544def42c4e88e130bd92fa13dbfec517d38d73bf698c8cc0092b1001bdad20fa588fca5b189d90a9fd9623c6f5229278a631f44085982a42619cb329d6b1e77adba8dd62b55ac4feb95d71197a8705358b57f3e1b78da513d6ebf417d156893edac65df4c136eec405b4e1c4a37e7487b9e8b3f56d5f1286bf1742d4cf3c5fc23b5c915ef78da81a19cdfc9a3811bf3de09327e2c710a0964a563bede5d11d93d7ea53335a469d1502b6c38ea0358391a3c36e5c4c53318d538798d0f111deefd8ff00ec6122d343cf10acc4772a2d0ac20c3e879e6394e31bf88d2e02d3d77539283163f9d657940b4f184eecf0ed8fdeae9672489f25f181b4de5e0eaae968578d550762e413d0802b1d49444d1032434df873af45ba2232eaf4cf1d2cfa23019c3e3840a443b0b342e29efb06b14bae72bcc4a2d2887171b96834d3c1aba91fb33471ef59c8b157d872b39aed99ea8b30ec9741d5a9bc8ed9e2b85f4da73f1e8e65c48015a2a8ee42ba2e84dcab3b7181d236e7ee5170e1e7a9bb1821f3f49d59e72fe84a36f73692fb755dc9a2d7bf3dbe2bd9d433c7edea4aa6632fbf4d57b20cc15b7e10076fcd9ad46294af16dd06c77db22b1917c189ae64b9e85b63ef4abbcdae64cabf76bf5757320d92dad5958ca3012a8fe77ecbae642aa373dac4547096aa8de84950c403c7b007b5c88eec4a16e3b8d9956cf347af533c04edf43ac5c3efec4af63ac5e34a7a9de2e16d9ff4758ac7eb140f77f8291e375dce7ffdc7377ffaa7e5bfff7a0b74f59fafcbeef47f6f2117fa89cfcb0d8b3f99cbea8e0efe3ab4282e9cdffeed712d9c16de8ead7dd2d3cd440cd0b8d1875d40c94d2a3ec0ac336673172297f0549b2a4dd4db541126ad2ffe74983415889f7fcd61252f54a7950d7ea13afd0bd5e95fa8ce17aaf385eaa4a97ca13afd0bd5f9b8f192d36645e8f7f79b5366a3a0898a50e53e39bbdf5c324214ee4bfacd59e72aa8a8a6cc2767adcb046db0de8ec14e162bde77dfe9feaafde61e8ab3cb59bed76f4e250e4e7fc8b6615f59111acba15eda2b377725fd26b9398d86fe6be6e67ede89413b7273c5f76fff5b9d18a4b498fbcd4f0cda919bfbbe1383be2d37572846755c137387c90eedf66ce2fa545c6603d7c7724eec2cee816df9ad4ccbbd9526cd8b7bb83e85821299c1bbb83e0229ab0175b8befa8f3bb83eea58fd13707dbdb9f181b41bb8bec1f88867707d46ff7bfaeefbb8bea9fdf626ae8f107c87e2fa86728bfae5b83edd426c0faecff72ff25a089f36707daa124aafa6bda26dfc55876fbe9aab5c6fddd15ce5868fee7e547395c69c577315df1bc47635e761cd55360c621eb42c8d688395a5118d8a59437e824d8527fc89662dbe2f011287dfc7d449c44aa37edf3ec9365fc5fb7cc0318f5f5a886c556a984bcf4a1bd80d6661dbd94a4eabc58d6360989c74dec1618ff3a98f2ff6913b9d0ab582819b60306dda165d7426fd5003e7e54c3858fb3209257b043766d4839eb04cb8e82c5c615b96eb4159521b21fdf39b21de4d22c65f89c4ce2c164133b5fe6578c2e8328f866d925526d819b5a41238a36c3ae3343f034b73fae3de617e59e757fb2036eb1d2db02dc7d72e8471464da4c002a808b914e247e1e7a6fec6ad5a79858c33c00cc6a9a4278981031c9bc2a7e162bc055ab343a38f81d6b66a3d5582ff89d3351fc4b1ed504313c60e7ee2f144bf4dbae8a9e38976a58bbebd81288434e1b136f597a48b9e3c9e68235d14b41af134a1c7a58b66acca7dda1234a0f54accb9bf0bb45ef5c7b0cfcd30ecb3e7a0f52a75bc035a9f7b1e1a07fa9db069c23740eb8f360d5ed0fa1dd07a551973fa16687d6fa49c0028b3df2441c41440eb99b81f5aaf12982f68fd41d07af43aee42eb99f618b4fe319d384179f3d04ee77b2ea585b68d46eddaa47e758bb839de68900c9bded6cfbdede5206f2302357db205e3cfcc7c0a3e8b73df2a1573cba4bc4d220fec2c31e31695062a22748869677935f54f725dc33725f4377ec49179018fd6be83372069064d5a7de6bc6c934eb263c1ad553a88063d94b0fd788bf36c6572cfdd85ebe18ed3ca6cf928b8f0e33a160cbe0030f16933b7df5c86f329165db0c4186e240ea0ab0677aedb4acaef386f53953120ccad1bed14b7b782613c79df915059df0cc06cf520bc1180897c42f8dcb34f18c491a390aaa50e265406f86deadd444c5e521e6ca2df4e46403429ebc44898f51871051573de40aa18b860692163e84219370e31e2229cc1fa9623d6b7ead81e405e67a5ea370af0d1cdf66aed178d7b90516c268f3ac9ed26e2377fd0846516cca649c3ec38c6e075d841acf1591b81b38257334918f993ae6b9e186b31d15d3c63f8cd75419fa1159d20b6478edc04cfd38f09325ee82eeca9d73e6552b1432485d291a41e9c8cd53b69b9295e0dd3326aa0067fa0487788d80b9359042665fb1a06addc4fd9301cec537f931dba51eb074856258191e8c6dd4d929437f70cbe9fdab366a9fcd84ba5e5b798e0aaabc26c41d548587383d4d46e54b827ccc0a1af3bf57381ca50ed0c0c183d56096e38a6e8dbdf88823f1dde1e0214e3fe4df023061efa61fcc8a0839aafc3792aedeee13c4cbe851f49a6ebe05e87f374b364e24776edfd58976c7a212cda0d1cc0ffb5080bb6575f080bf975a7df01616150bf0b619194abf27741583c923379212c24677e00c26288577737849f8ab0087dece1f44258289df5425874b4d3ef83b01886f13abde5f92de8c108a2cd8643dc86e023a9585c485a92b9ac659edc69dea8f4441dcbe256d16442321b6d87b251c496ed564476f2d12a4f84b76340d3b20ed9d51bfb088cdce7098acc98c6aecc68c938832c68c9783b38bcba110a6e4893e864178e49b994486308cd948cd1235975a6807563b41290fe6ad6a979675712c3cc61f1131b557a2d25bd96a4bb9e8d9c34d24cfd9061392525003116902d096d36291b394c62104500a18088b4a828a10b3836b1b787414267edd56cc43580a7059caed28b6211d211b77adf3f128ffa1675dab74ffbd6e9828da3d2f156e6077b74cc0f510359d440d1d1b34e059f503216433b297e18818613c2c960b10c51915419bc0821833fc3ee11a93a0b9a72b3632440628221912ceb70979e4c09a2a57fc5c6775185a47634be8b868df33ace78d34502f2abf1dd618defa8a1d4abf15dc777a9705e8def0e687c6745105e8deffc43f08b57e33b49faeac677439aa1ebd62bddf32aa8edf97d37ddd326ebaf99ee31723b7152a41f5f506b0cd1bd0a6a5fe91ec1cb5f98eec9c7c59adddfbba0f657f65f7da57b3adaef94ee29755f8f5fbf053f7b1470bb55f6bb895347fdb2332e8692de5763799abeaae858552dba5f5d74ac62d1bdc5f93acfcb7df1795e685edc2d3a5685beee5574fc3acfcbef30db5ee7796dba517fb3f3bc1ed289e3f0c34df717524b99eedf8ed4faf14727fcd6a6fb385dcec59bc603cc52b322f82f6796aaa0e5cb2cf5feef6296de2ce77e99a5fe6596beccd29f6b96fecbdbff030e89205d0a656e6473747265616d0a656e646f626a0a352030206f626a0a3c3c0a3e3e0a656e646f626a0a332030206f626a0a3c3c0a2f436f6e74656e7473205b203420302052205d0a2f43726f70426f78205b20302e3020302e30203631322e30203739322e30205d0a2f4d65646961426f78205b20302e3020302e30203631322e30203739322e30205d0a2f506172656e742032203020520a2f5265736f75726365732035203020520a2f526f7461746520300a2f54797065202f506167650a3e3e0a656e646f626a0a322030206f626a0a3c3c0a2f436f756e7420310a2f4b696473205b203320302052205d0a2f54797065202f50616765730a3e3e0a656e646f626a0a312030206f626a0a3c3c0a2f50616765732032203020520a2f54797065202f436174616c6f670a3e3e0a656e646f626a0a362030206f626a0a3c3c0a2f417574686f72202851313734323938290a2f4372656174696f6e446174652028443a32303232303931363231333331382b303227303027290a2f4d6f64446174652028443a32303232303931363231333331382b303227303027290a2f50726f647563657220284d6963726f736f66743a205072696e7420546f20504446290a2f5469746c65202864652d32303861373131323739656661313339616238646139373032663431363463642e706466290a3e3e0a656e646f626a0a787265660a3020370d0a3030303030303030303020363535333520660d0a30303030303132363339203030303030206e0d0a30303030303132353830203030303030206e0d0a30303030303132343139203030303030206e0d0a30303030303030303039203030303030206e0d0a30303030303132333938203030303030206e0d0a30303030303132363838203030303030206e0d0a747261696c65720a3c3c0a2f496e666f2036203020520a2f526f6f742031203020520a2f53697a6520370a3e3e0a7374617274787265660a31323838380a2525454f460a	1
\.


--
-- Data for Name: consents; Type: TABLE DATA; Schema: portal; Owner: portal
--

COPY portal.consents (id, date_created, comment, consent_status_id, target, agreement_id, company_id, document_id, company_user_id) FROM stdin;
ac1cf001-7fbc-1f2f-817f-bce0575a0100	2022-03-24 18:01:33.394+00	\N	1	\N	aa0a0000-7fbc-1f2f-817f-bce0502c1010	0dcd8209-85e2-4073-b130-ac094fb47106	\N	ac1cf001-7fbc-1f2f-817f-bce0575a0011
ac1cf001-7fbc-1f2f-817f-bce0575a0101	2022-03-24 18:01:33.394+00	\N	1	\N	aa0a0000-7fbc-1f2f-817f-bce0502c1011	0dcd8209-85e2-4073-b130-ac094fb47106	\N	ac1cf001-7fbc-1f2f-817f-bce0575a0011
ac1cf001-7fbc-1f2f-817f-bce0575a0102	2022-03-24 18:01:33.394+00	\N	1	\N	aa0a0000-7fbc-1f2f-817f-bce0502c1012	0dcd8209-85e2-4073-b130-ac094fb47106	\N	ac1cf001-7fbc-1f2f-817f-bce0575a0011
ac1cf001-7fbc-1f2f-817f-bce0575a0103	2022-03-24 18:01:33.394+00	\N	1	\N	aa0a0000-7fbc-1f2f-817f-bce0502c1010	2dc4249f-b5ca-4d42-bef1-7a7a950a4f87	\N	ac1cf001-7fbc-1f2f-817f-bce058020001
ac1cf001-7fbc-1f2f-817f-bce0575a0104	2022-03-24 18:01:33.394+00	\N	1	\N	aa0a0000-7fbc-1f2f-817f-bce0502c1010	220330ac-170d-4e22-8d72-9467ed042149	\N	ac1cf001-7fbc-1f2f-817f-bce058020002
ac1cf001-7fbc-1f2f-817f-bce0575a0105	2022-03-24 18:01:33.394+00	\N	1	\N	aa0a0000-7fbc-1f2f-817f-bce0502c1010	bdac6865-2a8d-4bfd-9373-9dfce8190895	\N	ac1cf001-7fbc-1f2f-817f-bce058020003
ac1cf001-7fbc-1f2f-817f-bce0575a0106	2022-03-24 18:01:33.394+00	\N	1	\N	aa0a0000-7fbc-1f2f-817f-bce0502c1010	41fd2ab8-71cd-4546-9bef-a388d91b2542	\N	ac1cf001-7fbc-1f2f-817f-bce058020004
\.


--
-- Data for Name: consent_assigned_offer_subscriptions; Type: TABLE DATA; Schema: portal; Owner: portal
--

COPY portal.consent_assigned_offer_subscriptions (offer_subscription_id, consent_id) FROM stdin;
\.


--
-- Data for Name: service_provider_company_details; Type: TABLE DATA; Schema: portal; Owner: portal
--

COPY portal.service_provider_company_details (id, date_created, auto_setup_url, company_id) FROM stdin;
\.



--
-- Data for Name: iam_identity_providers; Type: TABLE DATA; Schema: portal; Owner: portal
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
-- Data for Name: iam_users; Type: TABLE DATA; Schema: portal; Owner: portal
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
-- Data for Name: invitations; Type: TABLE DATA; Schema: portal; Owner: portal
--

COPY portal.invitations (id, date_created, invitation_status_id, company_application_id, company_user_id) FROM stdin;
bd0d0302-3ec8-4bfe-99db-b89bdb6c4b94	2022-03-24 18:01:33.408+00	1	4f0146c6-32aa-4bb1-b844-df7e8babdcb6	ac1cf001-7fbc-1f2f-817f-bce0575a0011
d54db875-774c-479f-9f14-375f2cb8b257	2022-03-24 18:01:33.439+00	3	6b2d1263-c073-4a48-bfaf-704dc154ca9a	ac1cf001-7fbc-1f2f-817f-bce058020001
d54db875-774c-479f-9f14-375f2cb8b258	2022-03-24 18:01:33.439+00	3	6b2d1263-c073-4a48-bfaf-704dc154ca9a	ac1cf001-7fbc-1f2f-817f-bce058020000
d54db875-774c-479f-9f14-375f2cb8b260	2022-03-24 18:01:33.439+00	1	6b2d1263-c073-4a48-bfaf-704dc154ca9c	ac1cf001-7fbc-1f2f-817f-bce058020002
d54db875-774c-479f-9f14-375f2cb8b261	2022-03-24 18:01:33.439+00	1	6b2d1263-c073-4a48-bfaf-704dc154ca9d	ac1cf001-7fbc-1f2f-817f-bce058020003
d54db875-774c-479f-9f14-375f2cb8b262	2022-03-24 18:01:33.439+00	1	6b2d1263-c073-4a48-bfaf-704dc154ca9e	ac1cf001-7fbc-1f2f-817f-bce058020004
d54db875-774c-479f-9f14-375f2cb8b263	2022-03-24 18:01:33.439+00	3	6b2d1263-c073-4a48-bfaf-704dc154ca9a	ac1cf001-7fbc-1f2f-817f-bce058019990
d54db875-774c-479f-9f14-375f2cb8b264	2022-03-24 18:01:33.439+00	3	6b2d1263-c073-4a48-bfaf-704dc154ca9a	ac1cf001-7fbc-1f2f-817f-bce058019991
d54db875-774c-479f-9f14-375f2cb8b265	2022-03-24 18:01:33.439+00	3	6b2d1263-c073-4a48-bfaf-704dc154ca9a	ac1cf001-7fbc-1f2f-817f-bce058019992
d54db875-774c-479f-9f14-375f2cb8b266	2022-03-24 18:01:33.439+00	3	6b2d1263-c073-4a48-bfaf-704dc154ca9a	ac1cf001-7fbc-1f2f-817f-bce058019993
\.


--
-- Data for Name: notifications; Type: TABLE DATA; Schema: portal; Owner: portal
--

COPY portal.notifications (id, receiver_user_id, date_created, content, notification_type_id, is_read, due_date, creator_user_id) FROM stdin;
b753cd7f-24c7-44a7-a88e-08ed00c31600	ac1cf001-7fbc-1f2f-817f-bce058020001	2022-08-10 18:01:33.57+00	\N	3	f	2022-09-10 18:01:33.57+00	ac1cf001-7fbc-1f2f-817f-bce058020001
b753cd7f-24c7-44a7-a88e-08ed00c31601	ac1cf001-7fbc-1f2f-817f-bce058020001	2022-08-10 18:01:33.57+00	\N	4	f	2022-09-10 18:01:33.57+00	ac1cf001-7fbc-1f2f-817f-bce058020001
b753cd7f-24c7-44a7-a88e-08ed00c31602	ac1cf001-7fbc-1f2f-817f-bce058020001	2022-08-10 18:01:33.57+00	\N	5	f	2022-09-10 18:01:33.57+00	ac1cf001-7fbc-1f2f-817f-bce058020001
b753cd7f-24c7-44a7-a88e-08ed00c31603	ac1cf001-7fbc-1f2f-817f-bce058020001	2022-08-10 18:01:33.57+00	\N	6	f	2022-09-10 18:01:33.57+00	ac1cf001-7fbc-1f2f-817f-bce058020001
b753cd7f-24c7-44a7-a88e-08ed00c31604	ac1cf001-7fbc-1f2f-817f-bce058020001	2022-08-10 18:01:33.57+00	\N	7	f	2022-09-10 18:01:33.57+00	ac1cf001-7fbc-1f2f-817f-bce058020001
\.


--
-- Data for Name: offer_assigned_documents; Type: TABLE DATA; Schema: portal; Owner: portal
--

COPY portal.offer_assigned_documents (offer_id, document_id) FROM stdin;
ac1cf001-7fbc-1f2f-817f-bce0572c0007	fda6c9cb-62be-4a98-99c1-d9c5a2df4aaa
ac1cf001-7fbc-1f2f-817f-bce0572c0007	fda6c9cb-62be-4a98-99c1-d9c5a2df4aab
ac1cf001-7fbc-1f2f-817f-bce0572c0007	fda6c9cb-62be-4a98-99c1-d9c5a2df4aac
\.


--
-- Data for Name: offer_licenses; Type: TABLE DATA; Schema: portal; Owner: portal
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
-- Data for Name: offer_assigned_licenses; Type: TABLE DATA; Schema: portal; Owner: portal
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
-- Data for Name: offer_descriptions; Type: TABLE DATA; Schema: portal; Owner: portal
--

COPY portal.offer_descriptions (offer_id, language_short_name, description_long, description_short) FROM stdin;
ac1cf001-7fbc-1f2f-817f-bce0572c0007	en	Seamless part traceability through the n.tier supply chain\n\nknowledge you get detailed information about the components of your direct suppliers as well as your direct customers. This lets your answer questions such as:\n\n\n\nWhat's the exact lead time between the produciton of a subcomponent an your own components?\nTo wehre in the world are my components distributed and where are my suppliers located?\nWhat's the exact composition of my component on a unique ID level?\n\n\nBecause all of that is important information. PartChain keeps a storng one-up, one-down visibilty rule. You and the other parties in the network always see - only their suppliers customers data well as own ata. Your competitors won't be able to get any sensitive information about your production data.	CX App Part Chain Details
ac1cf001-7fbc-1f2f-817f-bce0573f0009	en	The Dismantler Cockpit provides decision support for Vehicle Purchaser and Dismantling lead. At a dismantling company, these are responsible for the procurement of end-of-life vehicles and the decisions on reuse, remanufacture or recycling of the whole vehicle, or of parts and components. The Dismantler Cockpit support these decisions by fetching data about a specific vehicle from the Catena-X-network and presenting the most relevant information about the potential of the vehicle and its components: The structure of the vehicle and the parts it contains are presented by visualizing the "Digital Twins" available from the OEM and the suppliers of the components (e.g. gearbox, high voltage battery). KPIs such as the material composition of the vehicle further serve to analyze the commercial potential in a circular value chain.	Dismantler buy decision and 3R strategy decision support
ac1cf001-7fbc-1f2f-817f-bce05744000b	en	Cross-industry trading platform for buying and selling secondary components and materials, opening new opportunities for collaborating across the value chain and closing the loop on component and material level.	platform for buying and selling secondary components and materials
ac1cf001-7fbc-1f2f-817f-bce05748000d	en	Description\n\nCreate an Intelligent Enterprise with Advanced Logistic collabration and Insights. SAP Logistics Business Network, material traceability options connect partners for inter-company collaboration and transparency. It supports a comprehensive set capabilities, allowing to manage freight more efficiently, benefit form situational awareness through track and trace, and create a trust chain for up- and downstream product genealogy.	SAP App Material Traceability Details
ac1cf001-7fbc-1f2f-817f-bce0574c000f	en	The Component Performance Monitor is a point-and-click analysis tooling that enables OEMs and Tier-1 suppliers to better manage quality risk and significantly reduce the costs incurred from faulty parts by leveraging near-live connected vehicle data, empowering quality experts to: Identify failure patterns and root-cause quality issues proactively; Monitor the effectiveness of remediation measures in the fleet using connected vehicle data and proactively request faulty parts from the OEM in a data-driven way for further root-cause analysis. ...all in a single collaborative interface that supercharges the supplier to OEM feedback cycle, leading to faster proactive issue resolution, a reduction in claims, and better customer experiences. Leading automotive suppliers are collaborating with their OEM counterparts using the Component Performance Monitor today powered by a shared data fabric using Palantir’s Foundry technology. Find out more how these suppliers and OEMs pioneer the future of quality by uncovering new opportunities to generate value through data by reading the CPM Whitepaper. More information including the Whitepaper and Demo Video can be found on the CPM Landing Page: https://www.palantir.com/explore/cpm/	Component Performance Monitor Quality App
ac1cf001-7fbc-1f2f-817f-bce0574c000f	de	Automotive suppliers must constantly monitor product performance and resolve quality issues quickly to ensure they do not face costly claims. For quality analysts and engineers this involves a long, manual process of analyzing claims and failed parts that lacks vital information - including live vehicle data(such as Diagnostic Trouble Codes). Identifying root-cause issues is complex, issue resolution is slow, and costs quickly escalate. Component Performance Monitor (CPM) enables suppliers to better manage quality risk and significantly reduce the costs incurred from faulty parts by leveraging near-live vehicle data, empowering quality experts to:\n\nIdentify failure patterns and root- cause quality issues in real time\nMonitor the effectiveness of remediation measures in the fleet using live vehicle data\nand proactively request faulty parts for further analysis.\n\n...all in a single collaborative interface that supercharges the supplier to OEM feedback cycle, leading to faster proactive issue resolution, a reduction in claims, and better customer experiences.	BMW App Component Performance Monitor Details
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
-- Data for Name: offer_detail_images; Type: TABLE DATA; Schema: portal; Owner: portal
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
-- Data for Name: offer_tags; Type: TABLE DATA; Schema: portal; Owner: portal
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
-- Data for Name: user_role_descriptions; Type: TABLE DATA; Schema: portal; Owner: portal
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

