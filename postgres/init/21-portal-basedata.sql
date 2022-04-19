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

COPY portal.company_application_status (application_status_id, label) FROM stdin;
1   CREATED
2   ADD_COMPANY_DATA
3	INVITE_USER
4	SELECT_COMPANY_ROLE
5	UPLOAD_DOCUMENTS
6	VERIFY
7	SUBMITTED
8	CONFIRMED
9	DECLINED
\.

COPY portal.identity_provider_categories (identity_provider_category_id, label) FROM stdin;
1	KEYCLOAK_SHARED
2	KEYCLOAK_OIDC
3	KEYCLOAK_SAML
\.

COPY portal.company_status (company_status_id, label) FROM stdin;
1	PENDING
2	ACTIVE
3	REJECTED
4	INACTIVE
\.

COPY portal.invitation_status (invitation_status_id, label) FROM stdin;
1	CREATED
2	PENDING
3	ACCEPTED
4	DECLINED
\.

COPY portal.company_roles (id, company_role, date_created, name_de, name_en) FROM stdin;
1	ACTIVE_PARTICIPANT	2022-03-24 18:01:33.288	Netzwerkteilnehmer	Participant
2	APP_PROVIDER	2022-03-24 18:01:33.295	Software Anbieter	Application Provider
\.

COPY portal.languages (language_short_name, long_name_de, long_name_en) FROM stdin;
de	deutsch	german
en	englisch	english
\.

COPY portal.countries (country_name_en, alpha_2_code, alpha_3_code, country_name_de) FROM stdin;
Germany	DE	DEU	Deutschland
United Kingdom of Great Britain and Northern Ireland (the)	GB	GBR	United Kingdom of Great Britain and Northern Ireland (the)
Afghanistan	AF	AFG	Afghanistan
Albania	AL	ALB	Albania
Algeria	DZ	DZA	Algeria
American Samoa	AS	ASM	American Samoa
Andorra	AD	AND	Andorra
Angola	AO	AGO	Angola
Anguilla	AI	AIA	Anguilla
Antarctica	AQ	ATA	Antarctica
Antigua and Barbuda	AG	ATG	Antigua and Barbuda
Argentina	AR	ARG	Argentina
Armenia	AM	ARM	Armenia
Aruba	AW	ABW	Aruba
Australia	AU	AUS	Australia
Austria	AT	AUT	Austria
Azerbaijan	AZ	AZE	Azerbaijan
Bahamas (the)	BS	BHS	Bahamas
Bahrain	BH	BHR	Bahrain
Bangladesh	BD	BGD	Bangladesh
Barbados	BB	BRB	Barbados
Belarus	BY	BLR	Belarus
Belgium	BE	BEL	Belgium
Belize	BZ	BLZ	Belize
Benin	BJ	BEN	Benin
Bermuda	BM	BMU	Bermuda
Åland Islands	AX	ALA	Åland Islands
Bhutan	BT	BTN	Bhutan
Bolivia (Plurinational State of)	BO	BOL	Bolivien
Bonaire, Sint Eustatius and Saba	BQ	BES	Bonaire, Sint Eustatius and Saba
Bosnia and Herzegovina	BA	BIH	Bosnien and Herzegovenien
Botswana	BW	BWA	Botswana
Bouvet Island	BV	BVT	Bouvet Island
Brazil	BR	BRA	Brasilien
British Indian Ocean Territory (the)	IO	IOT	British Indian Ocean Territory
Brunei Darussalam	BN	BRN	Brunei Darussalam
Bulgaria	BG	BGR	Bulgarien
Burkina Faso	BF	BFA	Burkina Faso
Burundi	BI	BDI	Burundi
Cabo Verde	CV	CPV	Cabo Verde
Cambodia	KH	KHM	Cambodia
Cameroon	CM	CMR	Cameroon
Canada	CA	CAN	Kanada
Cayman Islands (the)	KY	CYM	Cayman Islands (the)
Central African Republic (the)	CF	CAF	Central African Republic (the)
Chad	TD	TCD	Chad
Chile	CL	CHL	Chile
China	CN	CHN	China
Christmas Island	CX	CXR	Weihnachtsinseln
Cocos (Keeling) Islands (the)	CC	CCK	Cocos (Keeling) Islands (the)
Colombia	CO	COL	Kolumbien
Comoros (the)	KM	COM	Comoros
Congo (the Democratic Republic of the)	CD	COD	Kongo
Cook Islands (the)	CK	COK	Cook Islands
Costa Rica	CR	CRI	Costa Rica
Croatia	HR	HRV	Kroatien
Cuba	CU	CUB	Kuba
Curaçao	CW	CUW	Curaçao
Cyprus	CY	CYP	Zypern
Czechia	CZ	CZE	Tschechien
Côte d'Ivoire	CI	CIV	Côte d'Ivoire
Denmark	DK	DNK	Dänemark
Djibouti	DJ	DJI	Djibouti
Dominica	DM	DMA	Dominica
Dominican Republic (the)	DO	DOM	Dominikanische Republik
Ecuador	EC	ECU	Ecuador
Egypt	EG	EGY	Ägypten
El Salvador	SV	SLV	El Salvador
Equatorial Guinea	GQ	GNQ	Equatorial Guinea
Eritrea	ER	ERI	Eritrea
Estonia	EE	EST	Estonia
Eswatini	SZ	SWZ	Eswatini
Ethiopia	ET	ETH	Ethiopia
Falkland Islands (the) [Malvinas]	FK	FLK	Falkland Islands (the) [Malvinas]
Faroe Islands (the)	FO	FRO	Faroe Islands (the)
Fiji	FJ	FJI	Fiji
Finland	FI	FIN	Finland
France	FR	FRA	Frankreich
French Guiana	GF	GUF	French Guiana
French Polynesia	PF	PYF	French Polynesia
French Southern Territories (the)	TF	ATF	French Southern Territories (the)
Gabon	GA	GAB	Gabon
Gambia (the)	GM	GMB	Gambia (the)
Georgia	GE	GEO	Georgia
Ghana	GH	GHA	Ghana
Gibraltar	GI	GIB	Gibraltar
Greece	GR	GRC	Greece
Greenland	GL	GRL	Greenland
Grenada	GD	GRD	Grenada
Guadeloupe	GP	GLP	Guadeloupe
Guam	GU	GUM	Guam
Guatemala	GT	GTM	Guatemala
Guernsey	GG	GGY	Guernsey
Guinea	GN	GIN	Guinea
Guinea-Bissau	GW	GNB	Guinea-Bissau
Guyana	GY	GUY	Guyana
Haiti	HT	HTI	Haiti
Heard Island and McDonald Islands	HM	HMD	Heard Island and McDonald Islands
Holy See (the)	VA	VAT	Holy See (the)
Honduras	HN	HND	Honduras
Hong Kong	HK	HKG	Hong Kong
Hungary	HU	HUN	Hungary
Iceland	IS	ISL	Iceland
India	IN	IND	India
Indonesia	ID	IDN	Indonesia
Iran (Islamic Republic of)	IR	IRN	Iran (Islamic Republic of)
Iraq	IQ	IRQ	Iraq
Ireland	IE	IRL	Ireland
Isle of Man	IM	IMN	Isle of Man
Israel	IL	ISR	Israel
Italy	IT	ITA	Italy
Jamaica	JM	JAM	Jamaica
Japan	JP	JPN	Japan
Jersey	JE	JEY	Jersey
Jordan	JO	JOR	Jordan
Kazakhstan	KZ	KAZ	Kazakhstan
Kenya	KE	KEN	Kenya
Kiribati	KI	KIR	Kiribati
Korea (the Democratic People's Republic of)	KP	PRK	Korea (the Democratic People's Republic of)
Korea (the Republic of)	KR	KOR	Korea (the Republic of)
Kuwait	KW	KWT	Kuwait
Kyrgyzstan	KG	KGZ	Kyrgyzstan
Lao People's Democratic Republic (the)	LA	LAO	Lao People's Democratic Republic (the)
Latvia	LV	LVA	Latvia
Lebanon	LB	LBN	Lebanon
Lesotho	LS	LSO	Lesotho
Liberia	LR	LBR	Liberia
Libya	LY	LBY	Libya
Liechtenstein	LI	LIE	Liechtenstein
Lithuania	LT	LTU	Lithuania
Luxembourg	LU	LUX	Luxembourg
Macao	MO	MAC	Macao
Madagascar	MG	MDG	Madagascar
Malawi	MW	MWI	Malawi
Malaysia	MY	MYS	Malaysia
Maldives	MV	MDV	Maldives
Mali	ML	MLI	Mali
Malta	MT	MLT	Malta
Marshall Islands (the)	MH	MHL	Marshall Islands (the)
Martinique	MQ	MTQ	Martinique
Mauritania	MR	MRT	Mauritania
Mauritius	MU	MUS	Mauritius
Mayotte	YT	MYT	Mayotte
Mexico	MX	MEX	Mexico
Micronesia (Federated States of)	FM	FSM	Micronesia (Federated States of)
Moldova (the Republic of)	MD	MDA	Moldova (the Republic of)
Monaco	MC	MCO	Monaco
Mongolia	MN	MNG	Mongolia
Montenegro	ME	MNE	Montenegro
Montserrat	MS	MSR	Montserrat
Morocco	MA	MAR	Morocco
Mozambique	MZ	MOZ	Mozambique
Myanmar	MM	MMR	Myanmar
Namibia	NA	NAM	Namibia
Nauru	NR	NRU	Nauru
Nepal	NP	NPL	Nepal
Netherlands (the)	NL	NLD	Netherlands (the)
New Caledonia	NC	NCL	New Caledonia
New Zealand	NZ	NZL	New Zealand
Nicaragua	NI	NIC	Nicaragua
Niger (the)	NE	NER	Niger (the)
Nigeria	NG	NGA	Nigeria
Niue	NU	NIU	Niue
Norfolk Island	NF	NFK	Norfolk Island
North Macedonia	MK	MKD	North Macedonia
Northern Mariana Islands (the)	MP	MNP	Northern Mariana Islands (the)
Norway	NO	NOR	Norway
Oman	OM	OMN	Oman
Pakistan	PK	PAK	Pakistan
Palau	PW	PLW	Palau
Palestine, State of	PS	PSE	Palestine, State of
Panama	PA	PAN	Panama
Papua New Guinea	PG	PNG	Papua New Guinea
Paraguay	PY	PRY	Paraguay
Peru	PE	PER	Peru
Philippines (the)	PH	PHL	Philippines (the)
Pitcairn	PN	PCN	Pitcairn
Poland	PL	POL	Poland
Portugal	PT	PRT	Portugal
Puerto Rico	PR	PRI	Puerto Rico
Qatar	QA	QAT	Qatar
Romania	RO	ROU	Romania
Russian Federation (the)	RU	RUS	Russian Federation (the)
Rwanda	RW	RWA	Rwanda
Réunion	RE	REU	Réunion
Saint Barthélemy	BL	BLM	Saint Barthélemy
Saint Helena, Ascension and Tristan da Cunha	SH	SHN	Saint Helena, Ascension and Tristan da Cunha
Saint Kitts and Nevis	KN	KNA	Saint Kitts and Nevis
Saint Lucia	LC	LCA	Saint Lucia
Saint Martin (French part)	MF	MAF	Saint Martin (French part)
Saint Pierre and Miquelon	PM	SPM	Saint Pierre and Miquelon
Saint Vincent and the Grenadines	VC	VCT	Saint Vincent and the Grenadines
Samoa	WS	WSM	Samoa
San Marino	SM	SMR	San Marino
Sao Tome and Principe	ST	STP	Sao Tome and Principe
Saudi Arabia	SA	SAU	Saudi Arabia
Senegal	SN	SEN	Senegal
Serbia	RS	SRB	Serbia
Seychelles	SC	SYC	Seychelles
Sierra Leone	SL	SLE	Sierra Leone
Singapore	SG	SGP	Singapore
Sint Maarten (Dutch part)	SX	SXM	Sint Maarten (Dutch part)
Slovakia	SK	SVK	Slovakia
Slovenia	SI	SVN	Slovenia
Solomon Islands	SB	SLB	Solomon Islands
Somalia	SO	SOM	Somalia
South Africa	ZA	ZAF	South Africa
South Georgia and the South Sandwich Islands	GS	SGS	South Georgia and the South Sandwich Islands
South Sudan	SS	SSD	South Sudan
Spain	ES	ESP	Spain
Sri Lanka	LK	LKA	Sri Lanka
Sudan (the)	SD	SDN	Sudan (the)
Suriname	SR	SUR	Suriname
Svalbard and Jan Mayen	SJ	SJM	Svalbard and Jan Mayen
Sweden	SE	SWE	Sweden
Switzerland	CH	CHE	Switzerland
Syrian Arab Republic (the)	SY	SYR	Syrian Arab Republic (the)
Taiwan (Province of China)	TW	TWN	Taiwan (Province of China)
Tajikistan	TJ	TJK	Tajikistan
Tanzania, the United Republic of	TZ	TZA	Tanzania, the United Republic of
Thailand	TH	THA	Thailand
Timor-Leste	TL	TLS	Timor-Leste
Togo	TG	TGO	Togo
Tokelau	TK	TKL	Tokelau
Tonga	TO	TON	Tonga
Trinidad and Tobago	TT	TTO	Trinidad and Tobago
Tunisia	TN	TUN	Tunisia
Turkey	TR	TUR	Turkey
Turkmenistan	TM	TKM	Turkmenistan
Turks and Caicos Islands (the)	TC	TCA	Turks and Caicos Islands (the)
Tuvalu	TV	TUV	Tuvalu
Uganda	UG	UGA	Uganda
Ukraine	UA	UKR	Ukraine
United Arab Emirates (the)	AE	ARE	United Arab Emirates (the)
United States Minor Outlying Islands (the)	UM	UMI	United States Minor Outlying Islands (the)
United States of America (the)	US	USA	United States of America (the)
Uruguay	UY	URY	Uruguay
Uzbekistan	UZ	UZB	Uzbekistan
Vanuatu	VU	VUT	Vanuatu
Venezuela (Bolivarian Republic of)	VE	VEN	Venezuela (Bolivarian Republic of)
Viet Nam	VN	VNM	Viet Nam
Virgin Islands (British)	VG	VGB	Virgin Islands (British)
Virgin Islands (U.S.)	VI	VIR	Virgin Islands (U.S.)
Wallis and Futuna	WF	WLF	Wallis and Futuna
Western Sahara*	EH	ESH	Western Sahara*
Yemen	YE	YEM	Yemen
Zambia	ZM	ZMB	Zambia
\.

COPY portal.use_cases (id, name, shortname) FROM stdin;
1aacde78-35ec-4df3-ba1e-f988cddcbbd8	Circular Economy	CE
41e4a4c0-aae4-41c0-97c9-ebafde410de4	Demand and Capacity Management	DCM
c065a349-f649-47f8-94d5-1a504a855419	Quality Management	QM
6909ccc7-37c8-4088-99ab-790f20702460	Business Partner Management	BPDM
06b243a4-ba51-4bf3-bc40-5d79a2231b86	Traceability	T
\.
