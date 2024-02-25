--
-- PostgreSQL database dump
--

-- Dumped from database version 16.1 (Debian 16.1-1.pgdg120+1)
-- Dumped by pg_dump version 16.1 (Debian 16.1-1.pgdg120+1)

-- Started on 2024-01-28 15:22:17 UTC

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
-- TOC entry 218 (class 1259 OID 16415)
-- Name: homes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.homes (
    url text,
    address text,
    city text,
    price double precision,
    agency text,
    date_added date,
    id integer NOT NULL
);


ALTER TABLE public.homes OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 16420)
-- Name: homes_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.homes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.homes_id_seq OWNER TO postgres;

--
-- TOC entry 3379 (class 0 OID 0)
-- Dependencies: 219
-- Name: homes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.homes_id_seq OWNED BY public.homes.id;


--
-- TOC entry 215 (class 1259 OID 16389)
-- Name: meta; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.meta (
    donation_link text,
    scraper_halted boolean NOT NULL,
    devmode_enabled boolean,
    donation_link_updated date,
    workdir text,
    id text
);


ALTER TABLE public.meta OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 16396)
-- Name: subscribers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.subscribers (
    user_level integer DEFAULT 1 NOT NULL,
    subscription_expiry date,
    filter_min_price double precision DEFAULT 500 NOT NULL,
    filter_max_price double precision DEFAULT 2000 NOT NULL,
    filter_cities text[] DEFAULT '{}'::text[] NOT NULL,
    telegram_enabled boolean NOT NULL,
    telegram_id text NOT NULL
);


ALTER TABLE public.subscribers OWNER TO postgres;

--
-- TOC entry 3219 (class 2604 OID 16421)
-- Name: homes id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.homes ALTER COLUMN id SET DEFAULT nextval('public.homes_id_seq'::regclass);


--
-- TOC entry 3372 (class 0 OID 16415)
-- Dependencies: 218
-- Data for Name: homes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.homes (url, address, city, price, agency, date_added, id) FROM stdin;
https://funda.nl/huur/weert/appartement-43462967-sint-rumoldusstraat-1-g/	Sint Rumoldusstraat 1 g	Weert	650	funda	2024-01-28	1
https://funda.nl/huur/soest/huis-43462969-burg-grothestraat-23/	Burg Grothestraat 23	Soest	2250	funda	2024-01-28	2
https://funda.nl/huur/amsterdam/appartement-43462631-molukkenstraat-557/	Molukkenstraat 557	Amsterdam	1850	funda	2024-01-28	3
https://funda.nl/huur/utrecht/appartement-43462966-ella-fitzgeraldplein-44/	Ella Fitzgeraldplein 44	Utrecht	1825	funda	2024-01-28	4
https://funda.nl/huur/den-haag/appartement-43462965-van-galenstraat-30/	Van Galenstraat 30	Den Haag	1795	funda	2024-01-28	5
https://funda.nl/huur/amsterdam/appartement-43462810-fazantenweg-65/	Fazantenweg 65	Amsterdam	1795	funda	2024-01-28	6
https://funda.nl/huur/hilversum/appartement-43460545-bussumerstraat-4-a/	Bussumerstraat 4 A	Hilversum	1695	funda	2024-01-28	7
https://funda.nl/huur/arnhem/appartement-43462804-wichard-van-pontlaan-110/	Wichard van Pontlaan 110	Arnhem	684	funda	2024-01-28	8
https://funda.nl/huur/amsterdam/appartement-43462848-galastraat-109/	Galastraat 109	Amsterdam	2450	funda	2024-01-28	9
https://funda.nl/huur/amsterdam/appartement-43460318-rosy-wertheimstraat-39/	Rosy Wertheimstraat 39	Amsterdam	3100	funda	2024-01-28	10
https://funda.nl/huur/ridderkerk/appartement-43462895-drierivierenlaan-379/	Drierivierenlaan 379	Ridderkerk	1895	funda	2024-01-28	11
https://funda.nl/huur/emmen/huis-43462887-hesselterbrink-582/	Hesselterbrink 582	Emmen	1250	funda	2024-01-28	12
https://funda.nl/huur/kampen/appartement-43462870-buiten-nieuwstraat-122/	Buiten Nieuwstraat 122	Kampen	1100	funda	2024-01-28	13
https://funda.nl/huur/hilversum/huis-43462861-rembrandtlaan-10/	Rembrandtlaan 10	Hilversum	2995	funda	2024-01-28	14
https://funda.nl/huur/almere/appartement-43460096-makelaarstraat-4-h/	Makelaarstraat 4 H	Almere	1495	funda	2024-01-28	15
https://funda.nl/huur/almere/appartement-43460097-makelaarstraat-12-g/	Makelaarstraat 12 G	Almere	1395	funda	2024-01-28	16
https://funda.nl/huur/amsterdam/appartement-43462763-minervaplein-7-5v/	Minervaplein 7 5V	Amsterdam	3000	funda	2024-01-28	17
https://funda.nl/huur/amstelveen/huis-43462730-schutsluis-24/	Schutsluis 24	Amstelveen	1950	funda	2024-01-28	18
https://funda.nl/huur/den-haag/appartement-43462462-blois-van-treslongstraat-81/	Blois van Treslongstraat 81	Den Haag	3950	funda	2024-01-28	19
https://funda.nl/huur/den-haag/appartement-43461359-thomsonplein-22-a/	Thomsonplein 22 a	Den Haag	3450	funda	2024-01-28	20
https://funda.nl/huur/almere/appartement-43461334-nederlandstraat-47/	Nederlandstraat 47	Almere	1298	funda	2024-01-28	21
https://funda.nl/huur/gieten/huis-43461294-hoevenkamp-8/	Hoevenkamp 8	Gieten	1500	funda	2024-01-28	22
https://funda.nl/huur/diemen/huis-43461899-vlasdonk-28/	Vlasdonk 28	Diemen	2000	funda	2024-01-28	23
https://funda.nl/huur/landgraaf/huis-43461377-op-de-winkel-11/	Op de Winkel 11	Landgraaf	950	funda	2024-01-28	24
https://funda.nl/huur/kollum/appartement-43461221-voorstraat-77-a1/	Voorstraat 77 a1	Kollum	795	funda	2024-01-28	25
https://funda.nl/huur/oldenzaal/appartement-43461847-nagelstraat-46/	Nagelstraat 46	Oldenzaal	975	funda	2024-01-28	26
https://funda.nl/huur/leiden/appartement-43460124-eijmerspoelstraat-84/	Eijmerspoelstraat 84	Leiden	1495	funda	2024-01-28	27
https://funda.nl/huur/voorburg/appartement-43461114-koningin-wilhelminalaan-133/	Koningin Wilhelminalaan 133 .	Voorburg	1700	funda	2024-01-28	28
https://funda.nl/huur/amsterdam/appartement-43461099-spuistraat-201-b/	Spuistraat 201 B	Amsterdam	2275	funda	2024-01-28	29
https://funda.nl/huur/den-haag/appartement-43461980-oude-haagweg-299-b/	Oude Haagweg 299 B	Den Haag	1700	funda	2024-01-28	30
https://funda.nl/huur/roermond/appartement-43462647-brugstraat-23/	Brugstraat 23	Roermond	1300	funda	2024-01-28	31
https://funda.nl/huur/den-haag/appartement-43461875-laan-van-meerdervoort-86-b/	Laan van Meerdervoort 86 B	Den Haag	1995	funda	2024-01-28	32
https://funda.nl/huur/groningen/appartement-43461295-paterswoldseweg-530/	Paterswoldseweg 530	Groningen	1100	funda	2024-01-28	33
https://funda.nl/huur/rotterdam/appartement-43462705-putsebocht-189-a/	Putsebocht 189 A	Rotterdam	1750	funda	2024-01-28	34
https://funda.nl/huur/meppel/appartement-43461187-woldstraat-32-a/	Woldstraat 32 a	Meppel	950	funda	2024-01-28	35
https://funda.nl/huur/valkenswaard/appartement-43461235-peperstraat-14-b/	Peperstraat 14 B	Valkenswaard	850	funda	2024-01-28	36
https://funda.nl/huur/amsterdam/parkeergelegenheid-43461937-kuipersstraat-193-pp/	Kuipersstraat 193 PP	Amsterdam	200	funda	2024-01-28	37
https://funda.nl/huur/bussum/object-43461760-huizerweg-45/	Huizerweg 45	Bussum	400	funda	2024-01-28	38
https://funda.nl/huur/woerden/appartement-43459524-rijnstraat-105-a/	Rijnstraat 105 A	Woerden	1575	funda	2024-01-28	39
https://funda.nl/huur/rotterdam/appartement-43462701-hoevestraat-35/	Hoevestraat 35	Rotterdam	1700	funda	2024-01-28	40
https://funda.nl/huur/amstelveen/appartement-43462770-buitenplein-67/	Buitenplein 67	Amstelveen	1495	funda	2024-01-28	41
https://funda.nl/huur/den-haag/appartement-43462775-westduinweg-230-h/	Westduinweg 230 H	Den Haag	1250	funda	2024-01-28	42
https://funda.nl/huur/den-haag/appartement-43462769-van-stolkweg-14-6/	Van Stolkweg 14 6	Den Haag	3250	funda	2024-01-28	43
https://funda.nl/huur/leeuwarden/appartement-43462659-noordersingel-4-j/	Noordersingel 4 J	Leeuwarden	1100	funda	2024-01-28	44
https://funda.nl/huur/hengelo-ov/appartement-43462765-beursstraat-2-a/	Beursstraat 2 A	Hengelo	1000	funda	2024-01-28	45
https://funda.nl/huur/amsterdam/appartement-43462767-anjeliersstraat-145-bv/	Anjeliersstraat 145 bv	Amsterdam	3250	funda	2024-01-28	46
https://funda.nl/huur/amsterdam/appartement-43462641-johan-van-der-keukenstraat-87-h/	Johan van der Keukenstraat 87 h	Amsterdam	1500	funda	2024-01-28	47
https://funda.nl/huur/amsterdam/appartement-43462633-dever-24/	Dever 24	Amsterdam	2000	funda	2024-01-28	48
https://funda.nl/huur/weert/appartement-43462613-maasstraat-6-c/	Maasstraat 6 c	Weert	900	funda	2024-01-28	49
https://funda.nl/huur/hilversum/appartement-43462620-leeuwenstraat-40-b/	Leeuwenstraat 40 B	Hilversum	1000	funda	2024-01-28	50
https://funda.nl/huur/lith/huis-43462527-ringkade-7/	Ringkade 7	Lith	1650	funda	2024-01-28	51
https://funda.nl/huur/abcoude/huis-43462678-kerkstraat-86/	Kerkstraat 86	Abcoude	2775	funda	2024-01-28	52
https://funda.nl/huur/den-haag/appartement-43462544-anna-van-buerenplein-239/	Anna van Buerenplein 239	Den Haag	3650	funda	2024-01-28	53
https://funda.nl/huur/heemstede/appartement-43462535-binnenweg-155-c/	Binnenweg 155 C	Heemstede	525	funda	2024-01-28	54
https://funda.nl/huur/rotterdam/appartement-43462553-s-gravendijkwal-108-c/	's-Gravendijkwal 108 C	Rotterdam	2495	funda	2024-01-28	55
https://funda.nl/huur/amsterdam/appartement-43462536-molukkenstraat-72-b/	Molukkenstraat 72-B	Amsterdam	1750	funda	2024-01-28	56
https://funda.nl/huur/leiden/appartement-43462666-hoge-rijndijk-94-g/	Hoge Rijndijk 94 G	Leiden	1550	funda	2024-01-28	57
https://funda.nl/huur/hillegom/parkeergelegenheid-43462551-weeresteinstraat-128-nabij/	Weeresteinstraat 128 Nabij	Hillegom	500	funda	2024-01-28	58
https://funda.nl/huur/groningen/appartement-43462502-fongersplaats-50/	Fongersplaats 50	Groningen	1500	funda	2024-01-28	59
https://funda.nl/huur/leiden/appartement-43462505-ketelboetersteeg-11/	Ketelboetersteeg 11	Leiden	1275	funda	2024-01-28	60
https://funda.nl/huur/diemen/appartement-43462519-julianaplantsoen-214/	Julianaplantsoen 214	Diemen	1750	funda	2024-01-28	61
https://funda.nl/huur/rotterdam/appartement-43462584-wijnhaven-69-u/	Wijnhaven 69 U	Rotterdam	2095	funda	2024-01-28	62
https://funda.nl/huur/amsterdam/appartement-43462442-staalmeesterslaan-101/	Staalmeesterslaan 101	Amsterdam	1875	funda	2024-01-28	63
https://funda.nl/huur/maastricht/huis-43462441-ramershaag-93/	Ramershaag 93	Maastricht	1195	funda	2024-01-28	64
https://funda.nl/huur/hoofddorp/appartement-43462707-mies-van-der-rohestraat-71/	Mies van der Rohestraat 71	Hoofddorp	2500	funda	2024-01-28	65
https://funda.nl/huur/groningen/appartement-43462492-friesestraatweg-141-36/	Friesestraatweg 141 36	Groningen	1075	funda	2024-01-28	66
https://funda.nl/huur/voorburg/appartement-43462487-queridostraat-29/	Queridostraat 29	Voorburg	1250	funda	2024-01-28	67
https://funda.nl/huur/amsterdam/appartement-43461237-bolestein-162/	Bolestein 162	Amsterdam	2350	funda	2024-01-28	68
https://funda.nl/huur/amsterdam/huis-43461154-fanny-blankers-koenlaan-12/	Fanny Blankers-Koenlaan 12	Amsterdam	1550	funda	2024-01-28	69
https://funda.nl/huur/amsterdam/appartement-43461280-grasweg-21-a/	Grasweg 21 A	Amsterdam	2250	funda	2024-01-28	70
https://funda.nl/huur/almere/huis-43461136-owen-richardsonstraat-11/	Owen Richardsonstraat 11	Almere	2250	funda	2024-01-28	71
https://funda.nl/huur/amsterdam/appartement-43461122-pontsteiger-139-pp/	Pontsteiger 139+pp	Amsterdam	6500	funda	2024-01-28	72
https://funda.nl/huur/amsterdam/appartement-43461102-borgerstraat-210-i/	Borgerstraat 210 I	Amsterdam	1700	funda	2024-01-28	73
https://funda.nl/huur/amsterdam/appartement-43461146-senecastraat-37/	Senecastraat 37	Amsterdam	1330	funda	2024-01-28	74
https://funda.nl/huur/de-meern/appartement-43461138-aart-van-der-leeuwlaan-43/	Aart van der Leeuwlaan 43	De Meern	1700	funda	2024-01-28	75
https://funda.nl/huur/amstelveen/huis-43469682-bouwmeester-5/	Bouwmeester 5	Amstelveen	2800	funda	2024-01-28	76
https://funda.nl/huur/baambrugge/huis-43468983-prinses-margrietstraat-20/	Prinses Margrietstraat 20	Baambrugge	2250	funda	2024-01-28	77
https://funda.nl/huur/amsterdam/appartement-43461104-nicolaas-maesstraat-113-h/	Nicolaas Maesstraat 113 H	Amsterdam	6000	funda	2024-01-28	78
https://funda.nl/huur/delft/huis-43461186-luxemburghof-48/	Luxemburghof 48	Delft	2600	funda	2024-01-28	79
https://funda.nl/huur/bolsward/huis-43461090-nieuwmarkt-39/	Nieuwmarkt 39	Bolsward	670	funda	2024-01-28	80
https://funda.nl/huur/den-haag/appartement-43462766-laan-van-meerdervoort-200-b/	Laan van Meerdervoort 200 B	Den Haag	1500	funda	2024-01-28	81
https://funda.nl/huur/utrecht/appartement-43461954-korianderstraat-130/	Korianderstraat 130	Utrecht	1800	funda	2024-01-28	82
https://funda.nl/huur/gouda/appartement-43461930-regentesseplantsoen-37/	Regentesseplantsoen 37	Gouda	1425	funda	2024-01-28	83
https://funda.nl/huur/weesp/appartement-43461925-amstellandlaan-84-x/	Amstellandlaan 84 X	Weesp	1680	funda	2024-01-28	84
https://funda.nl/huur/amsterdam/appartement-43461992-egelantiersstraat-141-c/	Egelantiersstraat 141 C	Amsterdam	5850	funda	2024-01-28	85
https://funda.nl/huur/pijnacker/appartement-43461905-westlaan-12-a/	Westlaan 12 a	Pijnacker	1490	funda	2024-01-28	86
https://funda.nl/huur/doetinchem/appartement-43461475-terborgseweg-49/	Terborgseweg 49	Doetinchem	925	funda	2024-01-28	87
https://funda.nl/huur/den-haag/appartement-43455175-anna-van-buerenplein-103/	Anna van Buerenplein 103	Den Haag	2695	funda	2024-01-28	88
https://funda.nl/huur/de-zilk/parkeergelegenheid-43462583-zilkerduinweg-202-nabij/	Zilkerduinweg 202 Nabij	De Zilk	325	funda	2024-01-28	89
https://funda.nl/huur/den-haag/appartement-43454738-lubeckstraat-146/	Lübeckstraat 146	Den Haag	1800	funda	2024-01-28	90
https://funda.nl/huur/haarlem/appartement-43460862-spaarnwouderstraat-144/	Spaarnwouderstraat 144	Haarlem	2700	funda	2024-01-28	91
https://funda.nl/huur/terneuzen/huis-43461265-nieuwediepstraat-84/	Nieuwediepstraat 84	Terneuzen	925	funda	2024-01-28	92
https://funda.nl/huur/arnhem/appartement-43461881-velperbuitensingel-12-3/	Velperbuitensingel 12 3	Arnhem	1350	funda	2024-01-28	93
https://funda.nl/huur/amstelveen/huis-43461748-aletta-jacobslaan-22/	Aletta Jacobslaan 22	Amstelveen	2500	funda	2024-01-28	94
https://funda.nl/huur/zaandam/appartement-43461755-spaansgroenstraat-30/	Spaansgroenstraat 30	Zaandam	1750	funda	2024-01-28	95
https://funda.nl/huur/hoofddorp/appartement-43461369-bridgemankade-38/	Bridgemankade 38	Hoofddorp	2700	funda	2024-01-28	96
https://funda.nl/huur/gorinchem/appartement-43461744-gasthuisgang-8-a/	Gasthuisgang 8 a	Gorinchem	1225	funda	2024-01-28	97
https://funda.nl/huur/amsterdam/appartement-43461737-haarlemmermeerstraat-50-2/	Haarlemmermeerstraat 50 2	Amsterdam	1750	funda	2024-01-28	98
https://funda.nl/huur/zoetermeer/huis-43461700-amstelstroom-99/	Amstelstroom 99	Zoetermeer	2350	funda	2024-01-28	99
https://funda.nl/huur/breda/huis-43461709-vlimmerenstraat-4/	Vlimmerenstraat 4	Breda	1250	funda	2024-01-28	100
https://funda.nl/huur/rotterdam/appartement-43461703-jufferstraat-322/	Jufferstraat 322	Rotterdam	2150	funda	2024-01-28	101
https://funda.nl/huur/rotterdam/appartement-43461771-meyenhage-177/	Meyenhage 177	Rotterdam	1295	funda	2024-01-28	102
https://funda.nl/huur/badhoevedorp/appartement-43461787-ranonkelstraat-6/	Ranonkelstraat 6	Badhoevedorp	1850	funda	2024-01-28	103
https://funda.nl/huur/ter-aar/huis-43461150-langeraarseweg-67/	Langeraarseweg 67	Ter Aar	1095	funda	2024-01-28	104
https://funda.nl/huur/dodewaard/huis-43461135-mauritslaan-8/	Mauritslaan 8	Dodewaard	1350	funda	2024-01-28	105
https://funda.nl/huur/den-haag/appartement-43461279-arnhemsestraat-13/	Arnhemsestraat 13	Den Haag	2200	funda	2024-01-28	106
https://funda.nl/huur/leiden/appartement-43461583-beestenmarkt-12-a/	Beestenmarkt 12 A	Leiden	685	funda	2024-01-28	107
https://funda.nl/huur/bedum/appartement-43461560-molenweg-5/	Molenweg 5	Bedum	995	funda	2024-01-28	108
https://funda.nl/huur/amsterdam/appartement-43461414-boomstraat-22/	Boomstraat 22	Amsterdam	1775	funda	2024-01-28	109
https://funda.nl/huur/den-helder/appartement-43461053-hortensiastraat-23/	Hortensiastraat 23	Den Helder	995	funda	2024-01-28	110
https://funda.nl/huur/rotterdam/appartement-43461490-koningsveldestraat-11-c/	Koningsveldestraat 11 C	Rotterdam	1795	funda	2024-01-28	111
https://funda.nl/huur/maastricht/appartement-43461488-de-cassij-1-c-03/	De Cassij 1C-03	Maastricht	1662	funda	2024-01-28	112
https://funda.nl/huur/amsterdam/appartement-43467436-witte-de-withstraat-125-3/	Witte de Withstraat 125 3	Amsterdam	3750	funda	2024-01-28	113
https://funda.nl/huur/amstelveen/huis-43460394-rembrandtweg-456/	Rembrandtweg 456	Amstelveen	3200	funda	2024-01-28	114
https://funda.nl/huur/utrecht/appartement-43460361-arthur-van-schendelstraat-729/	Arthur van Schendelstraat 729	Utrecht	2200	funda	2024-01-28	115
https://funda.nl/huur/emmeloord/appartement-43460371-smedingplein-97/	Smedingplein 97	Emmeloord	1290	funda	2024-01-28	116
https://funda.nl/huur/haarlem/appartement-43460242-victor-van-vrieslandstraat-46/	Victor van Vrieslandstraat 46	Haarlem	1225	funda	2024-01-28	117
https://funda.nl/huur/zwijndrecht/appartement-43461751-plantageweg-19/	Plantageweg 19	Zwijndrecht	1475	funda	2024-01-28	118
https://funda.nl/huur/breda/appartement-43461754-menno-van-coehoornstraat-2-a4/	Menno van Coehoornstraat 2 A4	Breda	1750	funda	2024-01-28	119
https://funda.nl/huur/rotterdam/huis-43460267-spoorweghaven-202/	Spoorweghaven 202	Rotterdam	2950	funda	2024-01-28	120
https://funda.nl/huur/rotterdam/appartement-43460273-heemraadssingel-108-a02/	Heemraadssingel 108 A02	Rotterdam	2250	funda	2024-01-28	121
https://funda.nl/huur/amersfoort/appartement-43460272-pothstraat-61-d/	Pothstraat 61 D	Amersfoort	1200	funda	2024-01-28	122
https://funda.nl/huur/arnhem/appartement-43460282-gele-rijders-plein-11-10/	Gele Rijders Plein 11-10	Arnhem	995	funda	2024-01-28	123
https://funda.nl/huur/heesch/huis-43461719-de-boekweit-19/	De Boekweit 19	Heesch	1950	funda	2024-01-28	124
https://funda.nl/huur/amsterdam/appartement-43460130-bos-en-lommerweg-273-1/	Bos en Lommerweg 273 1	Amsterdam	2250	funda	2024-01-28	125
https://funda.nl/huur/den-haag/appartement-43460137-bentinckstraat-126/	Bentinckstraat 126	Den Haag	1950	funda	2024-01-28	126
https://funda.nl/huur/meppel/huis-43460134-boeg-12/	Boeg 12	Meppel	1200	funda	2024-01-28	127
https://funda.nl/huur/rotterdam/appartement-43460128-willem-van-hillegaersbergstraat-45-c/	Willem van Hillegaersbergstraat 45 C	Rotterdam	1350	funda	2024-01-28	128
https://funda.nl/huur/den-bosch/appartement-43461704-ijsselsingel-68/	IJsselsingel 68	Den Bosch	1295	funda	2024-01-28	129
https://funda.nl/huur/den-haag/appartement-43460101-athenesingel-41/	Athenesingel 41	Den Haag	2050	funda	2024-01-28	130
https://funda.nl/huur/rotterdam/appartement-43469473-lange-hilleweg-4-b/	Lange Hilleweg 4 B	Rotterdam	1400	funda	2024-01-28	131
https://funda.nl/huur/rotterdam/appartement-43460748-noordmolenstraat-56-a1/	Noordmolenstraat 56 A1	Rotterdam	1450	funda	2024-01-28	132
https://funda.nl/huur/rotterdam/appartement-43460803-s-gravendijkwal-116-f/	's-Gravendijkwal 116 F	Rotterdam	1500	funda	2024-01-28	133
https://funda.nl/huur/eindhoven/appartement-43460160-meerring-137/	Meerring 137	Eindhoven	2250	funda	2024-01-28	134
https://funda.nl/huur/den-haag/appartement-43461615-cornelis-de-wittlaan-27-a/	Cornelis de Wittlaan 27 A	Den Haag	1875	funda	2024-01-28	135
https://funda.nl/huur/reeuwijk/huis-43461591-moerweide-42/	Moerweide 42	Reeuwijk	2450	funda	2024-01-28	136
https://funda.nl/huur/amsterdam/appartement-43461566-oosterdokskade-115/	Oosterdokskade 115	Amsterdam	8500	funda	2024-01-28	137
https://funda.nl/huur/amsterdam/appartement-43461442-kromme-waal-29-e/	Kromme Waal 29 E	Amsterdam	5500	funda	2024-01-28	138
https://funda.nl/huur/amsterdam/appartement-43461421-pieter-cornelisz-hooftstraat-130-i/	Pieter Cornelisz. Hooftstraat 130 I	Amsterdam	3600	funda	2024-01-28	139
https://funda.nl/huur/leiden/appartement-43461420-bachstraat-438/	Bachstraat 438	Leiden	1650	funda	2024-01-28	140
https://funda.nl/huur/amsterdam/appartement-43461431-kromme-waal-29-d/	Kromme Waal 29 D	Amsterdam	4500	funda	2024-01-28	141
https://funda.nl/huur/almere/appartement-43460354-zeeduinweg-416/	Zeeduinweg 416	Almere	2500	funda	2024-01-28	142
https://funda.nl/huur/de-lutte/huis-43460398-denekamperstraat-3/	Denekamperstraat 3	de Lutte	2500	funda	2024-01-28	143
https://funda.nl/huur/den-helder/appartement-43460359-marsdiepstraat-227/	Marsdiepstraat 227	Den Helder	879	funda	2024-01-28	144
https://funda.nl/huur/den-helder/appartement-43460312-marsdiepstraat-115/	Marsdiepstraat 115	Den Helder	849	funda	2024-01-28	145
https://funda.nl/huur/schijndel/huis-43460204-molendijk-zuid-34-a/	Molendijk-Zuid 34 A	Schijndel	1600	funda	2024-01-28	146
https://funda.nl/huur/dongen/huis-43468889-binnenhoven-4/	Binnenhoven 4	Dongen	1250	funda	2024-01-28	147
https://funda.nl/huur/nuenen/appartement-43460048-parkstraat-33-a/	Parkstraat 33 a	Nuenen	1250	funda	2024-01-28	148
https://funda.nl/huur/rotterdam/huis-43460823-bloklandstraat-114/	Bloklandstraat 114	Rotterdam	1723	funda	2024-01-28	149
https://funda.nl/huur/den-haag/appartement-43460024-javastraat-48-d/	Javastraat 48 D	Den Haag	3650	funda	2024-01-28	150
https://funda.nl/huur/oisterwijk/appartement-43460016-prinses-amaliahof-3/	Prinses Amaliahof 3	Oisterwijk	1210	funda	2024-01-28	151
https://funda.nl/huur/amsterdam/appartement-43460958-gasthuismolensteeg-1-b/	Gasthuismolensteeg 1 b	Amsterdam	2200	funda	2024-01-28	152
https://funda.nl/huur/den-haag/appartement-43469763-pahudstraat-38/	Pahudstraat 38	Den Haag	1975	funda	2024-01-28	153
https://funda.nl/huur/amsterdam/appartement-43469462-leidsegracht-16-e/	Leidsegracht 16 E	Amsterdam	3000	funda	2024-01-28	154
https://funda.nl/huur/zwolle/appartement-43469088-assendorperstraat-53/	Assendorperstraat 53	Zwolle	1450	funda	2024-01-28	155
https://funda.nl/huur/den-haag/appartement-43460741-smidswater-16/	Smidswater 16	Den Haag	1950	funda	2024-01-28	156
https://funda.nl/huur/amsterdam/appartement-43460877-keizersgracht-133-b/	Keizersgracht 133-B	Amsterdam	3800	funda	2024-01-28	157
https://funda.nl/huur/oirschot/huis-43460460-bestseweg-16/	Bestseweg 16	Oirschot	2250	funda	2024-01-28	158
https://funda.nl/huur/weert/huis-43460594-irenelaan-24/	Irenelaan 24	Weert	1190	funda	2024-01-28	159
https://funda.nl/huur/amsterdam/appartement-43460720-tintorettostraat-10-ii/	Tintorettostraat 10-II	Amsterdam	6000	funda	2024-01-28	160
https://funda.nl/huur/oss/appartement-43460695-heuvel-22-d8/	Heuvel 22 D8	Oss	630	funda	2024-01-28	161
https://funda.nl/huur/amsterdam/appartement-43460534-cornelis-trooststraat-15-3/	Cornelis Trooststraat 15 3	Amsterdam	3500	funda	2024-01-28	162
https://funda.nl/huur/heemskerk/appartement-43460440-rijksstraatweg-25-b/	Rijksstraatweg 25 B	Heemskerk	1750	funda	2024-01-28	163
https://funda.nl/huur/zaltbommel/huis-43469918-heer-balderikstraat-79/	Heer Balderikstraat 79	Zaltbommel	1250	funda	2024-01-28	164
https://funda.nl/huur/delft/appartement-43460642-brabantse-turfmarkt-89-a/	Brabantse Turfmarkt 89 A	Delft	995	funda	2024-01-28	165
https://funda.nl/huur/zaltbommel/appartement-43460692-waterstraat-11-b/	Waterstraat 11 b	Zaltbommel	1150	funda	2024-01-28	166
https://funda.nl/huur/loenen-aan-de-vecht/appartement-43469246-oud-over-60/	Oud Over 60	Loenen aan de Vecht	1050	funda	2024-01-28	167
https://funda.nl/huur/den-haag/appartement-43469271-van-boetzelaerlaan-96-b/	Van Boetzelaerlaan 96 B.	Den Haag	1750	funda	2024-01-28	168
https://funda.nl/huur/amstelveen/appartement-43460925-burgemeester-rijnderslaan-480/	Burgemeester Rijnderslaan 480	Amstelveen	4000	funda	2024-01-28	169
https://funda.nl/huur/zutphen/appartement-43460913-noorderhavenstraat-201/	Noorderhavenstraat 201	Zutphen	1950	funda	2024-01-28	170
https://funda.nl/huur/vlissingen/appartement-43460916-paul-krugerstraat-163/	Paul Krugerstraat 163	Vlissingen	933	funda	2024-01-28	171
https://funda.nl/huur/amstelveen/appartement-43460996-stadstuinen-51/	Stadstuinen 51	Amstelveen	3250	funda	2024-01-28	172
https://funda.nl/huur/amsterdam/appartement-43460980-koninginneweg-178-2/	Koninginneweg 178 2	Amsterdam	5000	funda	2024-01-28	173
https://funda.nl/huur/eindhoven/appartement-43460851-treurenburgstraat-293/	Treurenburgstraat 293	Eindhoven	1375	funda	2024-01-28	174
https://funda.nl/huur/schiedam/appartement-43460857-griegplein-176/	Griegplein 176	Schiedam	900	funda	2024-01-28	175
https://funda.nl/huur/amsterdam/appartement-43460859-liendenhof-130/	Liendenhof 130	Amsterdam	1225	funda	2024-01-28	176
https://funda.nl/huur/schiedam/appartement-43460853-griegplein-148/	Griegplein 148	Schiedam	652	funda	2024-01-28	177
https://funda.nl/huur/amstelveen/appartement-43460809-biesbosch-713/	Biesbosch 713	Amstelveen	1002	funda	2024-01-28	178
https://funda.nl/huur/amstelveen/appartement-43460896-biesbosch-291/	Biesbosch 291	Amstelveen	1437	funda	2024-01-28	179
https://funda.nl/huur/rotterdam/appartement-43460886-jonker-fransstraat-189/	Jonker Fransstraat 189	Rotterdam	1395	funda	2024-01-28	180
https://funda.nl/huur/sleen/object-43460806-bannerschultestraat-14-loods/	Bannerschultestraat 14 loods	Sleen	350	funda	2024-01-28	181
https://funda.nl/huur/amsterdam/appartement-43460887-pieter-cornelisz-hooftstraat-148/	Pieter Cornelisz. Hooftstraat 148	Amsterdam	1925	funda	2024-01-28	182
https://funda.nl/huur/heiloo/appartement-43460747-stationsplein-7/	Stationsplein 7	Heiloo	1105	funda	2024-01-28	183
https://funda.nl/huur/amsterdam/appartement-43460759-fokke-simonszstraat-41/	Fokke Simonszstraat 41	Amsterdam	2600	funda	2024-01-28	184
https://funda.nl/huur/groningen/appartement-43460727-oosterhamrikkade-25-e/	Oosterhamrikkade 25 E	Groningen	835	funda	2024-01-28	185
https://funda.nl/huur/lelystad/appartement-43460717-sont-28/	Sont 28	Lelystad	1550	funda	2024-01-28	186
https://funda.nl/huur/amsterdam/appartement-43460712-hellingstraat-266/	Hellingstraat 266	Amsterdam	2000	funda	2024-01-28	187
https://funda.nl/huur/amsterdam/appartement-43460704-rooseveltlaan-27-iv/	Rooseveltlaan 27 IV	Amsterdam	2825	funda	2024-01-28	188
https://funda.nl/huur/tilburg/huis-43460627-lindenstraat-22/	Lindenstraat 22	Tilburg	1450	funda	2024-01-28	189
https://funda.nl/huur/alkmaar/appartement-43460764-tuinderspad-104/	Tuinderspad 104	Alkmaar	1500	funda	2024-01-28	190
https://funda.nl/huur/apeldoorn/appartement-43460625-mercuriuslaan-35-406/	Mercuriuslaan 35 406	Apeldoorn	639	funda	2024-01-28	191
https://funda.nl/huur/apeldoorn/appartement-43460617-mercuriuslaan-35-313/	Mercuriuslaan 35 313	Apeldoorn	532	funda	2024-01-28	192
https://funda.nl/huur/sliedrecht/appartement-43460620-geulstraat-35/	Geulstraat 35	Sliedrecht	608	funda	2024-01-28	193
https://funda.nl/huur/hilversum/appartement-43460652-jacob-van-campenlaan-47/	Jacob van Campenlaan 47	Hilversum	1250	funda	2024-01-28	194
https://funda.nl/huur/rotterdam/appartement-43460767-willem-van-hillegaersbergstraat-45-b/	Willem van Hillegaersbergstraat 45 B	Rotterdam	1350	funda	2024-01-28	195
https://funda.nl/huur/leeuwarden/appartement-43460683-wortelhaven-98/	Wortelhaven 98	Leeuwarden	995	funda	2024-01-28	196
https://funda.nl/huur/vaals/huis-43460694-maastrichterlaan-166/	Maastrichterlaan 166	Vaals	650	funda	2024-01-28	197
https://funda.nl/huur/apeldoorn/appartement-43460613-mercuriuslaan-35-207/	Mercuriuslaan 35 207	Apeldoorn	539	funda	2024-01-28	198
https://funda.nl/huur/apeldoorn/appartement-43460604-mercuriuslaan-35-202/	Mercuriuslaan 35 202	Apeldoorn	639	funda	2024-01-28	199
https://funda.nl/huur/apeldoorn/appartement-43460684-sluisoordlaan-197/	Sluisoordlaan 197	Apeldoorn	879	funda	2024-01-28	200
https://funda.nl/huur/apeldoorn/appartement-43460672-sluisoordlaan-221/	Sluisoordlaan 221	Apeldoorn	879	funda	2024-01-28	201
https://funda.nl/huur/breda/appartement-43460540-nieuwe-ginnekenstraat-10-e/	Nieuwe Ginnekenstraat 10 E	Breda	1425	funda	2024-01-28	202
https://funda.nl/huur/amsterdam/appartement-43460668-valeriusstraat-133-hs/	Valeriusstraat 133 HS	Amsterdam	5000	funda	2024-01-28	203
https://funda.nl/huur/apeldoorn/appartement-43460671-sluisoordlaan-189/	Sluisoordlaan 189	Apeldoorn	879	funda	2024-01-28	204
https://funda.nl/huur/waalre/appartement-43460670-de-bus-16/	De Bus 16	Waalre	1850	funda	2024-01-28	205
https://funda.nl/huur/apeldoorn/appartement-43460675-sluisoordlaan-141/	Sluisoordlaan 141	Apeldoorn	879	funda	2024-01-28	206
https://funda.nl/huur/rotterdam/appartement-43460533-curieplaats-109/	Curieplaats 109	Rotterdam	1275	funda	2024-01-28	207
https://funda.nl/huur/tilburg/huis-43460522-sint-pieterspark-127/	Sint Pieterspark 127	Tilburg	1450	funda	2024-01-28	208
https://funda.nl/huur/ede/huis-43460514-wandscheerstraat-35/	Wandscheerstraat 35	Ede	1225	funda	2024-01-28	209
https://funda.nl/huur/haarlem/appartement-43460405-bijdorplaan-24/	Bijdorplaan 24	Haarlem	1500	funda	2024-01-28	210
https://funda.nl/huur/den-haag/parkeergelegenheid-43460425-van-stolkweg-27/	Van Stolkweg 27	Den Haag	645	funda	2024-01-28	211
https://funda.nl/huur/den-haag/appartement-43460993-leidsestraatweg-15-514/	Leidsestraatweg 15 514	Den Haag	2150	funda	2024-01-28	212
https://funda.nl/huur/amstelveen/huis-43460468-graaf-aelbrechtlaan-78/	Graaf Aelbrechtlaan 78	Amstelveen	3000	funda	2024-01-28	213
https://funda.nl/huur/amsterdam/appartement-43460487-valeriusstraat-300-ii/	Valeriusstraat 300 II	Amsterdam	2150	funda	2024-01-28	214
https://funda.nl/huur/barendrecht/huis-43460478-schapenburg-14/	Schapenburg 14	Barendrecht	1190	funda	2024-01-28	215
https://funda.nl/huur/haarlem/appartement-43469323-spaarne-59/	Spaarne 59	Haarlem	1700	funda	2024-01-28	216
https://funda.nl/huur/amsterdam/appartement-43460858-bolestein-140/	Bolestein 140	Amsterdam	1650	funda	2024-01-28	217
https://funda.nl/huur/haarlem/appartement-43460838-wagenweg-88/	Wagenweg 88	Haarlem	2500	funda	2024-01-28	218
https://funda.nl/huur/amsterdam/appartement-43469370-scheldeplein-6-2/	Scheldeplein 6-2	Amsterdam	1800	funda	2024-01-28	219
https://funda.nl/huur/velsen-noord/appartement-43469398-stratingplantsoen-23-b/	Stratingplantsoen 23 B	Velsen-Noord	1495	funda	2024-01-28	220
https://funda.nl/huur/koudekerk-aan-den-rijn/appartement-43469385-hoogewaard-50/	Hoogewaard 50	Koudekerk aan den Rijn	1650	funda	2024-01-28	221
https://funda.nl/huur/den-haag/appartement-43469602-schrabber-73/	Schrabber 73	Den Haag	1550	funda	2024-01-28	222
https://funda.nl/huur/den-haag/appartement-42348130-gedempte-gracht-355/	Gedempte Gracht 355	Den Haag	1465	funda	2024-01-28	223
https://funda.nl/huur/amsterdam/appartement-43469364-tweede-weteringdwarsstraat-69-a-2/	Tweede Weteringdwarsstraat 69A-2	Amsterdam	2550	funda	2024-01-28	224
https://funda.nl/huur/amsterdam/appartement-43460753-herengracht-346-d/	Herengracht 346 D	Amsterdam	4750	funda	2024-01-28	225
https://funda.nl/huur/capelle-aan-den-ijssel/huis-43469915-p-c-boutenssingel-12/	P C Boutenssingel 12	Capelle aan den IJssel	2495	funda	2024-01-28	226
https://funda.nl/huur/landgraaf/appartement-43469228-kremerslaan-21/	Kremerslaan 21	Landgraaf	834	funda	2024-01-28	227
https://funda.nl/huur/amsterdam/appartement-43469277-rinus-michelslaan-201/	Rinus Michelslaan 201	Amsterdam	2200	funda	2024-01-28	228
https://funda.nl/huur/hapert/huis-43469283-dennenoord-6/	Dennenoord 6	Hapert	1500	funda	2024-01-28	229
https://funda.nl/huur/amsterdam/appartement-43460771-achillesstraat-130-1/	Achillesstraat 130 1	Amsterdam	2000	funda	2024-01-28	230
https://funda.nl/huur/rotterdam/appartement-43469142-van-beethovensingel-21/	Van Beethovensingel 21	Rotterdam	2000	funda	2024-01-28	231
https://funda.nl/huur/amsterdam/appartement-43469260-govert-flinckstraat-152-3/	Govert Flinckstraat 152 3	Amsterdam	2000	funda	2024-01-28	232
https://funda.nl/huur/amersfoort/appartement-43469152-lange-beekstraat-10-k/	Lange Beekstraat 10 K	Amersfoort	825	funda	2024-01-28	233
https://funda.nl/huur/leiden/appartement-43469261-langebrug-8-b/	Langebrug 8 B	Leiden	865	funda	2024-01-28	234
https://funda.nl/huur/etten-leur/appartement-43460421-kruisberg-131/	Kruisberg 131	Etten-Leur	1250	funda	2024-01-28	235
https://funda.nl/huur/naarden/huis-43469015-dirk-tersteeglaan-40/	Dirk Tersteeglaan 40	Naarden	2895	funda	2024-01-28	236
https://funda.nl/huur/groningen/appartement-43469002-jc-kapteynlaan-45/	J.C. Kapteynlaan 45	Groningen	1400	funda	2024-01-28	237
https://funda.nl/huur/voorhout/huis-43469003-lavendelweg-30/	Lavendelweg 30	Voorhout	1087	funda	2024-01-28	238
https://funda.nl/huur/amsterdam/appartement-43469075-boomstraat-17/	Boomstraat 17	Amsterdam	2250	funda	2024-01-28	239
https://funda.nl/huur/den-haag/appartement-43469917-burgemeester-patijnlaan-80/	Burgemeester Patijnlaan 80	Den Haag	1850	funda	2024-01-28	240
https://funda.nl/huur/amsterdam/appartement-43469929-eerste-helmersstraat-100-c/	Eerste Helmersstraat 100 C	Amsterdam	2750	funda	2024-01-28	241
https://funda.nl/huur/voorburg/appartement-43469905-koningin-wilhelminalaan-541/	Koningin Wilhelminalaan 541	Voorburg	2250	funda	2024-01-28	242
https://funda.nl/huur/amsterdam/appartement-43468866-linnaeusparkweg-117-1/	Linnaeusparkweg 117 1	Amsterdam	1950	funda	2024-01-28	243
https://funda.nl/huur/tienray/huis-43469847-kloosterstraat-10-g/	Kloosterstraat 10 G	Tienray	1175	funda	2024-01-28	244
https://funda.nl/huur/tegelen/huis-43469856-sint-martinusstraat-2-b/	Sint Martinusstraat 2 B	Tegelen	1230	funda	2024-01-28	245
https://funda.nl/huur/hoofddorp/appartement-43469127-mies-van-der-rohestraat-21/	Mies van der Rohestraat 21	Hoofddorp	2350	funda	2024-01-28	246
https://funda.nl/huur/nijmegen/appartement-43469890-priemstraat-9-d/	Priemstraat 9 D	Nijmegen	1100	funda	2024-01-28	247
https://funda.nl/huur/den-haag/appartement-43469034-bezuidenhoutseweg-395/	Bezuidenhoutseweg 395	Den Haag	1710	funda	2024-01-28	248
https://funda.nl/huur/rotterdam/appartement-43469264-jan-pettersonstraat-232/	Jan Pettersonstraat 232	Rotterdam	2325	funda	2024-01-28	249
https://funda.nl/huur/amsterdam/huis-43469163-pieter-cornelisz-hooftstraat-147/	Pieter Cornelisz. Hooftstraat 147	Amsterdam	6500	funda	2024-01-28	250
https://funda.nl/huur/amsterdam/appartement-42323680-vluchtladderstraat-88/	Vluchtladderstraat 88	Amsterdam	1171	funda	2024-01-28	251
https://funda.nl/huur/best/appartement-43469038-paardenhei-19/	Paardenhei 19	Best	1250	funda	2024-01-28	252
https://funda.nl/huur/apeldoorn/huis-43469037-de-hovenlaan-173/	De Hovenlaan 173	Apeldoorn	1495	funda	2024-01-28	253
https://funda.nl/huur/ijmuiden/appartement-42326822-radarstraat-145-h/	Radarstraat 145 H	IJmuiden	975	funda	2024-01-28	254
https://funda.nl/huur/amsterdam/huis-43469780-durgerdammerdijk-127/	Durgerdammerdijk 127	Amsterdam	3250	funda	2024-01-28	255
https://funda.nl/huur/haarlem/huis-43469751-tesselschadestraat-49/	Tesselschadestraat 49	Haarlem	1995	funda	2024-01-28	256
https://funda.nl/huur/leiderdorp/appartement-43469722-rietschans-69/	Rietschans 69	Leiderdorp	2600	funda	2024-01-28	257
https://funda.nl/huur/den-haag/huis-43469806-prinsegracht-80/	Prinsegracht 80	Den Haag	1795	funda	2024-01-28	258
https://funda.nl/huur/amsterdam/appartement-43469874-weesperzijde-99-c/	Weesperzijde 99 C	Amsterdam	2950	funda	2024-01-28	259
https://funda.nl/huur/rijen/appartement-43468750-stationsstraat-21-e/	Stationsstraat 21 E	Rijen	924	funda	2024-01-28	260
https://funda.nl/huur/gameren/appartement-43469483-ridderhof-21/	Ridderhof 21	Gameren	1022	funda	2024-01-28	261
https://funda.nl/huur/leerdam/appartement-43469419-eiland-42/	Eiland 42	Leerdam	608	funda	2024-01-28	262
https://funda.nl/huur/almere/huis-43468333-danslaan-34/	Danslaan 34	Almere	2150	funda	2024-01-28	263
https://funda.nl/huur/zaltbommel/appartement-43469422-johan-de-wittstraat-6/	Johan de Wittstraat 6	Zaltbommel	708	funda	2024-01-28	264
https://funda.nl/huur/diemen/appartement-43468200-johan-coussetstraat-7/	Johan Coussetstraat 7	Diemen	1750	funda	2024-01-28	265
https://funda.nl/huur/amsterdam/appartement-43468251-beethovenstraat-213/	Beethovenstraat 213	Amsterdam	3500	funda	2024-01-28	266
https://funda.nl/koop/hoofddorp/appartement-43469660-bridgemankade-18/	Bridgemankade 18	Hoofddorp	3200	funda	2024-01-28	267
https://funda.nl/huur/amsterdam/huis-43468715-schubertstraat-20/	Schubertstraat 20	Amsterdam	7500	funda	2024-01-28	268
https://funda.nl/huur/alkmaar/appartement-43468321-molenbuurt-26/	Molenbuurt 26	Alkmaar	1850	funda	2024-01-28	269
https://funda.nl/huur/naarden/huis-43468583-piersonlaan-42/	Piersonlaan 42	Naarden	2800	funda	2024-01-28	270
https://funda.nl/huur/den-haag/appartement-43469651-landrestraat-809/	Landréstraat 809	Den Haag	1300	funda	2024-01-28	271
https://funda.nl/huur/enschede/appartement-43469625-jan-van-goyenstraat-2-7/	Jan van Goyenstraat 2 7	Enschede	1105	funda	2024-01-28	272
https://funda.nl/huur/laren-nh/appartement-43468189-torenlaan-5/	Torenlaan 5	Laren	3000	funda	2024-01-28	273
https://funda.nl/huur/amsterdam/appartement-43468184-carolina-macgillavrylaan-552/	Carolina MacGillavrylaan 552	Amsterdam	2200	funda	2024-01-28	274
https://funda.nl/huur/amsterdam/appartement-43469524-vossiusstraat-29-2/	Vossiusstraat 29-2	Amsterdam	3500	funda	2024-01-28	275
https://funda.nl/huur/amsterdam/appartement-43468959-geldersekade-98-2/	Geldersekade 98 2	Amsterdam	1650	funda	2024-01-28	276
https://funda.nl/huur/voorschoten/appartement-43468899-johannes-vermeerplantsoen-44/	Johannes Vermeerplantsoen 44	Voorschoten	1695	funda	2024-01-28	277
https://funda.nl/huur/amsterdam/appartement-43468139-looiersgracht-32-ii/	Looiersgracht 32 II	Amsterdam	3250	funda	2024-01-28	278
https://funda.nl/huur/oegstgeest/appartement-43468957-de-kempenaerstraat-13-a/	de Kempenaerstraat 13 A	Oegstgeest	1350	funda	2024-01-28	279
https://funda.nl/huur/stompetoren/appartement-43469613-schermerplein-27/	Schermerplein 27	Stompetoren	1395	funda	2024-01-28	280
https://funda.nl/huur/lochem/appartement-43466534-de-gloep-59/	De Gloep 59	Lochem	883	funda	2024-01-28	281
https://funda.nl/huur/hengelo-ov/huis-43468735-frezerij-50/	Frezerij 50	Hengelo	1325	funda	2024-01-28	282
https://funda.nl/huur/heerenveen/appartement-43468816-heideburen-7-k2/	Heideburen 7 K2	Heerenveen	400	funda	2024-01-28	283
https://funda.nl/huur/capelle-aan-den-ijssel/appartement-43469711-rivium-1e-straat-69-g/	Rivium 1e straat 69 G	Capelle aan den IJssel	1080	funda	2024-01-28	284
https://funda.nl/huur/capelle-aan-den-ijssel/appartement-43469719-rivium-1e-straat-69-b/	Rivium 1e straat 69 B	Capelle aan den IJssel	1035	funda	2024-01-28	285
https://funda.nl/huur/den-haag/huis-43469718-prinsegracht-138/	Prinsegracht 138	Den Haag	2950	funda	2024-01-28	286
https://funda.nl/huur/zandvoort/appartement-43469732-de-favaugeplein-55-h/	de Favaugeplein 55 H	Zandvoort	1990	funda	2024-01-28	287
https://funda.nl/huur/amsterdam/appartement-43469715-michelangelostraat-105/	Michelangelostraat 105	Amsterdam	4500	funda	2024-01-28	288
https://funda.nl/huur/hoorn-nh/huis-43469784-turfhaven-18/	Turfhaven 18	Hoorn	2700	funda	2024-01-28	289
https://funda.nl/huur/utrecht/huis-43459606-molierelaan-72/	Molièrelaan 72	Utrecht	2500	funda	2024-01-28	290
https://funda.nl/huur/utrecht/appartement-43469765-vleutenseweg-420-12/	Vleutenseweg 420 12	Utrecht	1840	funda	2024-01-28	291
https://funda.nl/huur/dordrecht/appartement-43469773-oranjelaan-244/	Oranjelaan 244	Dordrecht	1075	funda	2024-01-28	292
https://funda.nl/huur/amsterdam/appartement-43469645-laurierstraat-5-a/	Laurierstraat 5 A	Amsterdam	1900	funda	2024-01-28	293
https://funda.nl/huur/amsterdam/appartement-43469646-eemsstraat-4-3/	Eemsstraat 4 3	Amsterdam	2500	funda	2024-01-28	294
https://funda.nl/huur/wageningen/appartement-43469550-generaal-foulkesweg-26-a/	Generaal Foulkesweg 26 A	Wageningen	1475	funda	2024-01-28	295
https://funda.nl/huur/amsterdam/appartement-43469517-eef-kamerbeekstraat-680/	Eef Kamerbeekstraat 680	Amsterdam	1610	funda	2024-01-28	296
https://funda.nl/huur/assen/appartement-43469522-fuutmesschen-45/	Fuutmesschen 45	Assen	1175	funda	2024-01-28	297
https://funda.nl/huur/amsterdam/appartement-43469507-wibautstraat-182-e-pp/	Wibautstraat 182E + PP	Amsterdam	2650	funda	2024-01-28	298
https://funda.nl/huur/almere/huis-43469586-eeuwenweg-135/	Eeuwenweg 135	Almere	1094	funda	2024-01-28	299
https://funda.nl/huur/deventer/appartement-43469452-verlengde-kazernestraat-141/	Verlengde Kazernestraat 141	Deventer	610	funda	2024-01-28	300
https://funda.nl/huur/amsterdam/appartement-43469447-antillenstraat-21-hs/	Antillenstraat 21 HS	Amsterdam	1750	funda	2024-01-28	301
https://funda.nl/huur/leersum/huis-43469415-middelweg-73-a/	Middelweg 73 A	Leersum	1300	funda	2024-01-28	302
https://funda.nl/huur/amsterdam/appartement-43469411-tjerk-hiddes-de-vriesstraat-11-3/	Tjerk Hiddes de Vriesstraat 11 3	Amsterdam	2700	funda	2024-01-28	303
https://funda.nl/huur/amsterdam/appartement-43469426-osdorpplein-962/	Osdorpplein 962	Amsterdam	2325	funda	2024-01-28	304
https://funda.nl/huur/wassenaar/huis-43469491-hoflaan-5/	Hoflaan 5	Wassenaar	3250	funda	2024-01-28	305
https://funda.nl/huur/hilversum/huis-43469467-neuweg-280/	Neuweg 280	Hilversum	2650	funda	2024-01-28	306
https://funda.nl/koop/hoogezand/huis-43469464-hoofdstraat-218/	Hoofdstraat 218	Hoogezand	1095	funda	2024-01-28	307
https://funda.nl/huur/nuenen/appartement-43469460-jan-bisschopsgaarde-42/	Jan Bisschopsgaarde 42	Nuenen	1295	funda	2024-01-28	308
https://funda.nl/huur/almere/appartement-43468357-kapitein-de-langestraat-31/	Kapitein de Langestraat 31	Almere	979	funda	2024-01-28	309
https://funda.nl/huur/deventer/appartement-43468331-korte-bisschopstraat-14-a/	Korte Bisschopstraat 14 A	Deventer	1425	funda	2024-01-28	310
https://funda.nl/huur/amstelveen/huis-43468314-jan-teulingslaan-14/	Jan Teulingslaan 14	Amstelveen	1679	funda	2024-01-28	311
https://funda.nl/huur/den-haag/appartement-43468304-snelliusstraat-17/	Snelliusstraat 17	Den Haag	2000	funda	2024-01-28	312
https://funda.nl/huur/utrecht/appartement-43468391-vredenburgplein-38/	Vredenburgplein 38	Utrecht	1650	funda	2024-01-28	313
https://funda.nl/huur/amsterdam/appartement-43468393-herengracht-50-c/	Herengracht 50 c	Amsterdam	3800	funda	2024-01-28	314
https://funda.nl/huur/rotterdam/appartement-43468389-de-lairesselaan-63/	De Lairesselaan 63	Rotterdam	1595	funda	2024-01-28	315
https://funda.nl/huur/zoetermeer/huis-43468252-ahornzoom-11/	Ahornzoom 11	Zoetermeer	1215	funda	2024-01-28	316
https://funda.nl/huur/utrecht/huis-43468374-filipijnen-167/	Filipijnen 167	Utrecht	2100	funda	2024-01-28	317
https://funda.nl/huur/amstelveen/appartement-43468377-meander-789/	Meander 789	Amstelveen	4200	funda	2024-01-28	318
https://funda.nl/huur/venlo/appartement-43468366-noord-buitensingel-17/	Noord Buitensingel 17	Venlo	1250	funda	2024-01-28	319
https://funda.nl/huur/den-haag/appartement-43468239-gedempte-gracht-355/	Gedempte Gracht 355	Den Haag	1465	funda	2024-01-28	320
https://funda.nl/huur/utrecht/appartement-43468211-faustdreef-105/	Faustdreef 105	Utrecht	1725	funda	2024-01-28	321
https://funda.nl/huur/rotterdam/appartement-43468206-willem-van-boelrestraat-193/	Willem van Boelrestraat 193	Rotterdam	1350	funda	2024-01-28	322
https://funda.nl/huur/assen/appartement-43468204-fuutmesschen-35/	Fuutmesschen 35	Assen	1031	funda	2024-01-28	323
https://funda.nl/huur/harderwijk/huis-43468207-aagje-dekenlaan-7/	Aagje Dekenlaan 7	Harderwijk	1375	funda	2024-01-28	324
https://funda.nl/huur/eindhoven/appartement-43468266-vincent-van-den-heuvellaan-153/	Vincent van den Heuvellaan 153	Eindhoven	1700	funda	2024-01-28	325
https://funda.nl/huur/wapenveld/appartement-43468283-de-vree-17/	de Vree 17	Wapenveld	715	funda	2024-01-28	326
https://funda.nl/huur/wapenveld/appartement-43468282-de-vree-11/	de Vree 11	Wapenveld	689	funda	2024-01-28	327
https://funda.nl/huur/aalsmeer/huis-43468263-pieter-van-lisselaan-25/	Pieter van Lisselaan 25	Aalsmeer	2995	funda	2024-01-28	328
https://funda.nl/huur/amsterdam/appartement-43469461-valkhof-41/	Valkhof 41	Amsterdam	2350	funda	2024-01-28	329
https://funda.nl/huur/arnhem/appartement-43468316-wielakkerstraat-10-a/	Wielakkerstraat 10 a	Arnhem	1495	funda	2024-01-28	330
https://funda.nl/huur/almere/huis-43468132-marco-poloroute-77/	Marco Poloroute 77	Almere	2350	funda	2024-01-28	331
https://funda.nl/huur/utrecht/appartement-43468136-homeruslaan-47-a/	Homeruslaan 47 A	Utrecht	1595	funda	2024-01-28	332
https://funda.nl/huur/amstelveen/appartement-43468120-mr-g-groen-van-prinstererlaan-33/	Mr. G. Groen van Prinstererlaan 33	Amstelveen	2500	funda	2024-01-28	333
https://funda.nl/huur/zeist/appartement-43468135-bethanieplein-4/	Bethaniëplein 4	Zeist	1395	funda	2024-01-28	334
https://funda.nl/huur/amsterdam/appartement-43468138-stadhouderskade-108-b/	Stadhouderskade 108 B	Amsterdam	2200	funda	2024-01-28	335
https://funda.nl/huur/almere/appartement-43468119-fellinilaan-78/	Fellinilaan 78	Almere	2150	funda	2024-01-28	336
https://funda.nl/huur/nieuw-vennep/huis-43468111-catharijnepoort-34/	Catharijnepoort 34	Nieuw-Vennep	1295	funda	2024-01-28	337
https://funda.nl/huur/amsterdam/appartement-43468117-levantkade-219/	Levantkade 219	Amsterdam	2150	funda	2024-01-28	338
https://funda.nl/huur/amsterdam/appartement-43468197-reaumurstraat-33-hs/	Réaumurstraat 33 hs	Amsterdam	2250	funda	2024-01-28	339
https://funda.nl/huur/waalwijk/appartement-43468059-burgemeester-moonenlaan-5-07/	Burgemeester Moonenlaan 5 07	Waalwijk	1870	funda	2024-01-28	340
https://funda.nl/huur/amsterdam/appartement-43468177-kalverstraat-218-a/	Kalverstraat 218 A	Amsterdam	2100	funda	2024-01-28	341
https://funda.nl/huur/den-haag/appartement-43468186-weissenbruchstraat-388/	Weissenbruchstraat 388	Den Haag	2250	funda	2024-01-28	342
https://funda.nl/huur/amstelveen/appartement-43468168-oostelijk-halfrond-145/	Oostelijk Halfrond 145	Amstelveen	1900	funda	2024-01-28	343
https://funda.nl/huur/nieuwegein/appartement-43468180-merweplein-9-25/	Merweplein 9 25	Nieuwegein	1110	funda	2024-01-28	344
https://funda.nl/huur/moergestel/huis-43468173-torenpad-5/	Torenpad 5	Moergestel	1200	funda	2024-01-28	345
https://funda.nl/huur/schiedam/appartement-43468039-prinsenhoek-3/	Prinsenhoek 3	Schiedam	1450	funda	2024-01-28	346
https://funda.nl/huur/rotterdam/appartement-43468034-gedempte-zalmhaven-214/	Gedempte Zalmhaven 214	Rotterdam	1875	funda	2024-01-28	347
https://funda.nl/huur/heerlen/appartement-43468029-van-der-maesenstraat-1-c/	Van der Maesenstraat 1 C	Heerlen	890	funda	2024-01-28	348
https://funda.nl/huur/roosendaal/huis-43468886-ommegangstraat-16/	Ommegangstraat 16	Roosendaal	1800	funda	2024-01-28	349
https://funda.nl/huur/den-haag/appartement-43468318-pletterijstraat-38/	Pletterijstraat 38	Den Haag	2750	funda	2024-01-28	350
https://funda.nl/huur/den-haag/appartement-43468370-stalpertstraat-24/	Stalpertstraat 24	Den Haag	1500	funda	2024-01-28	351
https://funda.nl/huur/leiden/huis-43468068-zwanenzijde-9/	Zwanenzijde 9	Leiden	2500	funda	2024-01-28	352
https://funda.nl/huur/amsterdam/appartement-43468077-amstel-18-iii/	Amstel 18 III	Amsterdam	2500	funda	2024-01-28	353
https://funda.nl/huur/echt/appartement-43468955-peijerstraat-55-d/	Peijerstraat 55 D	Echt	870	funda	2024-01-28	354
https://funda.nl/huur/tilburg/huis-43468240-lanciersstraat-47/	Lanciersstraat 47	Tilburg	1700	funda	2024-01-28	355
https://funda.nl/huur/bilthoven/huis-43465245-overboslaan-40/	Overboslaan 40	Bilthoven	2995	funda	2024-01-28	356
https://funda.nl/huur/amstelveen/appartement-43468918-rembrandtweg-363/	Rembrandtweg 363	Amstelveen	2200	funda	2024-01-28	357
https://funda.nl/huur/purmerend/appartement-43468910-rocamadour-94/	Rocamadour 94	Purmerend	1455	funda	2024-01-28	358
https://funda.nl/huur/amsterdam/appartement-42329340-eosstraat-424/	Eosstraat 424	Amsterdam	1419	funda	2024-01-28	359
https://funda.nl/huur/alphen-aan-den-rijn/appartement-43453077-valeriusplein-146/	Valeriusplein 146	Alphen aan den Rijn	1275	funda	2024-01-28	360
https://funda.nl/huur/rijswijk-zh/appartement-43453932-thomas-jeffersonlaan-615/	Thomas Jeffersonlaan 615	Rijswijk	750	funda	2024-01-28	361
https://funda.nl/huur/den-haag/appartement-43468994-2e-sweelinckstraat-82-a/	2e Sweelinckstraat 82 A	Den Haag	1850	funda	2024-01-28	362
https://funda.nl/huur/amsterdam/appartement-43468998-welnastraat-410-b/	Welnastraat 410 B	Amsterdam	2950	funda	2024-01-28	363
https://funda.nl/huur/den-haag/appartement-43468213-aert-van-der-goesstraat-23-d/	Aert van der Goesstraat 23 D	Den Haag	1565	funda	2024-01-28	364
https://funda.nl/huur/alphen-aan-den-rijn/appartement-43468842-koekebakkersteeg-1-a/	Koekebakkersteeg 1 A	Alphen aan den Rijn	1500	funda	2024-01-28	365
https://funda.nl/huur/rotterdam/huis-43468844-hartenruststraat-10/	Hartenruststraat 10	Rotterdam	2895	funda	2024-01-28	366
https://funda.nl/huur/almere/huis-43468819-nat-king-colestraat-14/	Nat King Colestraat 14	Almere	1890	funda	2024-01-28	367
https://funda.nl/huur/den-haag/appartement-43468820-muzenplein-129/	Muzenplein 129	Den Haag	1725	funda	2024-01-28	368
https://funda.nl/huur/heerenveen/appartement-43468815-heideburen-7-k4/	Heideburen 7 K4	Heerenveen	400	funda	2024-01-28	369
https://funda.nl/huur/amsterdam/appartement-43468728-veembroederhof-200/	Veembroederhof 200	Amsterdam	2250	funda	2024-01-28	370
https://funda.nl/huur/rotterdam/appartement-43468733-buizenwerf-157/	Buizenwerf 157	Rotterdam	2500	funda	2024-01-28	371
https://funda.nl/huur/amstelveen/appartement-43467946-spurgeonlaan-2/	Spurgeonlaan 2	Amstelveen	2100	funda	2024-01-28	372
https://funda.nl/huur/amsterdam/appartement-43468174-wethouder-frankeweg-32-1/	Wethouder Frankeweg 32 1	Amsterdam	1775	funda	2024-01-28	373
https://funda.nl/huur/amsterdam/appartement-43468960-hogeweg-92-2/	Hogeweg 92 2	Amsterdam	2250	funda	2024-01-28	374
https://funda.nl/huur/amsterdam/appartement-43468040-keizersgracht-649-f/	Keizersgracht 649 F	Amsterdam	2350	funda	2024-01-28	375
https://funda.nl/huur/zwolle/appartement-43468780-achter-de-hoven-92/	Achter de Hoven 92	Zwolle	777	funda	2024-01-28	376
https://funda.nl/huur/groningen/appartement-43468858-jan-goeverneurstraat-20/	Jan Goeverneurstraat 20	Groningen	880	funda	2024-01-28	377
https://funda.nl/huur/den-haag/appartement-43467956-president-kennedylaan-112-g/	President Kennedylaan 112 G	Den Haag	1665	funda	2024-01-28	378
https://funda.nl/huur/moordrecht/appartement-43468876-touwbaan-20/	Touwbaan 20	Moordrecht	1175	funda	2024-01-28	379
https://funda.nl/huur/ede/huis-43468752-ermerzand-29/	Ermerzand 29	Ede	1075	funda	2024-01-28	380
https://funda.nl/huur/weesp/appartement-43468740-amstellandlaan-86-b/	Amstellandlaan 86 B	Weesp	1475	funda	2024-01-28	381
https://funda.nl/huur/beverwijk/appartement-43468810-wijckermolen-62/	Wijckermolen 62	Beverwijk	1450	funda	2024-01-28	382
https://funda.nl/huur/den-haag/appartement-42348132-clioplein-19/	Clioplein 19	Den Haag	1515	funda	2024-01-28	383
https://funda.nl/huur/wagenberg/huis-43467262-postduifstraat-3/	Postduifstraat 3	Wagenberg	1985	funda	2024-01-28	384
https://funda.nl/huur/groningen/appartement-43454159-friesestraatweg-22-10/	Friesestraatweg 22-10	Groningen	1110	funda	2024-01-28	385
https://funda.nl/huur/groningen/appartement-43454142-friesestraatweg-22-44/	Friesestraatweg 22-44	Groningen	875	funda	2024-01-28	386
https://funda.nl/huur/amsterdam/appartement-43468645-maasstraat-61-6/	Maasstraat 61 6	Amsterdam	2750	funda	2024-01-28	387
https://funda.nl/huur/amsterdam/appartement-42326221-senecastraat-51/	Senecastraat 51	Amsterdam	1125	funda	2024-01-28	388
https://funda.nl/huur/utrecht/appartement-43466019-schonberglaan-191/	Schönberglaan 191	Utrecht	1645	funda	2024-01-28	389
https://funda.nl/huur/amsterdam/appartement-43468769-niasstraat-12-c/	Niasstraat 12 C	Amsterdam	1750	funda	2024-01-28	390
https://funda.nl/huur/amsterdam/appartement-43468648-parnassusweg-144/	Parnassusweg 144	Amsterdam	1800	funda	2024-01-28	391
https://funda.nl/huur/zaandam/appartement-43468632-zilverpadsteeg-25/	Zilverpadsteeg 25	Zaandam	1500	funda	2024-01-28	392
https://funda.nl/huur/amsterdam/appartement-43467606-bolestein-162/	Bolestein 162	Amsterdam	2350	funda	2024-01-28	393
https://funda.nl/huur/rotterdam/appartement-43467986-oudedijk-137/	Oudedijk 137	Rotterdam	1495	funda	2024-01-28	394
https://funda.nl/huur/assen/huis-43467548-schubertlaan-1/	Schubertlaan 1	Assen	1200	funda	2024-01-28	395
https://funda.nl/huur/veenendaal/huis-43467350-diepeveenheem-2/	Diepeveenheem 2	Veenendaal	1900	funda	2024-01-28	396
https://funda.nl/huur/amsterdam/appartement-43468430-roerstraat-91-f/	Roerstraat 91 F	Amsterdam	2450	funda	2024-01-28	397
https://funda.nl/huur/garderen/appartement-43467330-versteghehof-14/	Versteghehof 14	Garderen	2369	funda	2024-01-28	398
https://funda.nl/huur/groningen/appartement-43465390-siersteenlaan-363-d/	Siersteenlaan 363 D	Groningen	1025	funda	2024-01-28	399
https://funda.nl/huur/amsterdam/appartement-43467324-prins-hendriklaan-31-c/	Prins Hendriklaan 31 C	Amsterdam	6500	funda	2024-01-28	400
https://funda.nl/huur/amsterdam/appartement-43467932-nieuwe-egelantiersstraat-2-b/	Nieuwe Egelantiersstraat 2 B	Amsterdam	2150	funda	2024-01-28	401
https://funda.nl/huur/amsterdam/appartement-43468440-nassaukade-20-ii/	Nassaukade 20 II	Amsterdam	1950	funda	2024-01-28	402
https://funda.nl/huur/amstelveen/appartement-43467093-maarten-lutherweg-90/	Maarten Lutherweg 90	Amstelveen	1950	funda	2024-01-28	403
https://funda.nl/huur/soest/appartement-43467622-veenbesstraat-112/	Veenbesstraat 112	Soest	1450	funda	2024-01-28	404
https://funda.nl/huur/harderwijk/appartement-43468522-luttekepoortstraat-13/	Luttekepoortstraat 13	Harderwijk	1100	funda	2024-01-28	405
https://funda.nl/huur/haarlem/appartement-43468516-berckheydestraat-33-c/	Berckheydestraat 33 C	Haarlem	1195	funda	2024-01-28	406
https://funda.nl/huur/haarlem/appartement-43467074-rijksstraatweg-161/	Rijksstraatweg 161	Haarlem	1350	funda	2024-01-28	407
https://funda.nl/huur/beek-li/huis-43455480-geverikerstraat-41/	Geverikerstraat 41	Beek	1000	funda	2024-01-28	408
https://funda.nl/huur/heerenveen/appartement-43467543-gedempte-molenwijk-10-n/	Gedempte Molenwijk 10 N	Heerenveen	900	funda	2024-01-28	409
https://funda.nl/huur/alkmaar/huis-43468628-de-friese-poort-15/	De Friese Poort 15	Alkmaar	1900	funda	2024-01-28	410
https://funda.nl/huur/heerenveen/appartement-43467713-heideburen-7-k3/	Heideburen 7 K3	Heerenveen	400	funda	2024-01-28	411
https://funda.nl/huur/wilnis/huis-43468601-klompenmaker-63/	Klompenmaker 63	Wilnis	1600	funda	2024-01-28	412
https://funda.nl/huur/kerk-avezaath-gem-buren/huis-43468606-swifterbantstraat-12/	Swifterbantstraat 12	Kerk-Avezaath (Gem. Buren)	965	funda	2024-01-28	413
https://funda.nl/huur/haarlem/huis-43468696-teslastraat-56/	Teslastraat 56	Haarlem	2995	funda	2024-01-28	414
https://funda.nl/huur/echt/huis-43468684-bloemenhof-31/	Bloemenhof 31	Echt	1350	funda	2024-01-28	415
https://funda.nl/huur/bergen-op-zoom/appartement-43468672-noordzijde-haven-40-a/	Noordzijde Haven 40 a	Bergen op Zoom	1450	funda	2024-01-28	416
https://funda.nl/huur/amsterdam/appartement-43468673-cornelis-van-rijplantsoen-56/	Cornelis van Rijplantsoen 56	Amsterdam	2150	funda	2024-01-28	417
https://funda.nl/huur/helmond/huis-43468508-zeeuwendonk-5/	Zeeuwendonk 5	Helmond	2195	funda	2024-01-28	418
https://funda.nl/huur/amsterdam/appartement-43468535-singel-410-ii/	Singel 410 II	Amsterdam	1900	funda	2024-01-28	419
https://funda.nl/huur/amsterdam/appartement-43468519-esmoreitstraat-51-hs/	Esmoreitstraat 51 hs	Amsterdam	1600	funda	2024-01-28	420
https://funda.nl/huur/deventer/appartement-43468590-verlengde-kazernestraat-131/	Verlengde Kazernestraat 131	Deventer	734	funda	2024-01-28	421
https://funda.nl/huur/almere/appartement-43468599-kapitein-de-langestraat-21/	Kapitein de Langestraat 21	Almere	973	funda	2024-01-28	422
https://funda.nl/huur/purmerend/appartement-43468587-stekeldijk-35/	Stekeldijk 35	Purmerend	1130	funda	2024-01-28	423
https://funda.nl/huur/veldhoven/huis-43468441-kromstraat-63/	Kromstraat 63	Veldhoven	2500	funda	2024-01-28	424
https://funda.nl/huur/amsterdam/appartement-43468438-strackestraat-147/	Strackéstraat 147	Amsterdam	1950	funda	2024-01-28	425
https://funda.nl/huur/ouderkerk-aan-de-amstel/appartement-43467329-sluisplein-50/	Sluisplein 50	Ouderkerk aan de Amstel	2100	funda	2024-01-28	426
https://funda.nl/huur/rotterdam/appartement-43467321-nolensstraat-20-b1/	Nolensstraat 20 B1	Rotterdam	1450	funda	2024-01-28	427
https://funda.nl/huur/amsterdam/appartement-43467320-van-spilbergenstraat-118-iii/	Van Spilbergenstraat 118 III	Amsterdam	2100	funda	2024-01-28	428
https://funda.nl/huur/winschoten/appartement-43467307-vissersdijk-2-a6/	Vissersdijk 2 A6	Winschoten	300	funda	2024-01-28	429
https://funda.nl/huur/winschoten/appartement-43467306-vissersdijk-2-a7/	Vissersdijk 2 A7	Winschoten	300	funda	2024-01-28	430
https://funda.nl/huur/rotterdam/appartement-43467389-nolensstraat-24-b2/	Nolensstraat 24 B2	Rotterdam	1500	funda	2024-01-28	431
https://funda.nl/huur/papendrecht/huis-43467250-wilgenhof-137/	Wilgenhof 137	Papendrecht	2295	funda	2024-01-28	432
https://funda.nl/huur/amsterdam/appartement-43467362-nicolaas-anslijnstraat-151/	Nicolaas Anslijnstraat 151	Amsterdam	2000	funda	2024-01-28	433
https://funda.nl/huur/amsterdam/appartement-43467368-jacob-catskade-37-b/	Jacob Catskade 37 B	Amsterdam	1975	funda	2024-01-28	434
https://funda.nl/huur/leiden/huis-43467366-granaatplein-6/	Granaatplein 6	Leiden	1500	funda	2024-01-28	435
https://funda.nl/huur/rotterdam/appartement-43467360-graaf-balderikstraat-87/	Graaf Balderikstraat 87	Rotterdam	1350	funda	2024-01-28	436
https://funda.nl/huur/tiel/appartement-43467256-markt-7-a/	Markt 7 a	Tiel	1200	funda	2024-01-28	437
https://funda.nl/huur/cruquius/huis-43467248-oude-kruisweg-208/	Oude Kruisweg 208	Cruquius	5250	funda	2024-01-28	438
https://funda.nl/huur/beverwijk/appartement-43467255-zeestraat-68/	Zeestraat 68	Beverwijk	1495	funda	2024-01-28	439
https://funda.nl/huur/rotterdam/appartement-43467228-buffelstraat-112-a/	Buffelstraat 112 a	Rotterdam	500	funda	2024-01-28	440
https://funda.nl/huur/barendrecht/huis-43467292-vlierwede-1/	Vlierwede 1	Barendrecht	1450	funda	2024-01-28	441
https://funda.nl/huur/gorinchem/appartement-43467203-koningin-emmastraat-102/	Koningin Emmastraat 102	Gorinchem	1475	funda	2024-01-28	442
https://funda.nl/huur/amsterdam/appartement-43467285-sprinklerstraat-81/	Sprinklerstraat 81	Amsterdam	2500	funda	2024-01-28	443
https://funda.nl/huur/hoofddorp/huis-43467265-betsy-perkstraat-58/	Betsy Perkstraat 58	Hoofddorp	1800	funda	2024-01-28	444
https://funda.nl/huur/den-haag/appartement-43467911-de-gaarde-38/	De Gaarde 38	Den Haag	1200	funda	2024-01-28	445
https://funda.nl/huur/voorburg/appartement-43467965-westeinde-23/	Westeinde 23	Voorburg	1350	funda	2024-01-28	446
https://funda.nl/huur/wassenaar/huis-43467112-clematislaan-35/	Clematislaan 35	Wassenaar	3200	funda	2024-01-28	447
https://funda.nl/huur/den-haag/appartement-43467119-noordeinde-89-a/	Noordeinde 89 A	Den Haag	1650	funda	2024-01-28	448
https://funda.nl/huur/utrecht/appartement-43467185-nieuwegracht-12-a/	Nieuwegracht 12 A	Utrecht	1575	funda	2024-01-28	449
https://funda.nl/huur/katwijk-zh/appartement-43467162-parnassia-73/	Parnassia 73	Katwijk	1500	funda	2024-01-28	450
https://funda.nl/huur/rotterdam/appartement-43467051-mathenesserlaan-337-c/	Mathenesserlaan 337 c	Rotterdam	2375	funda	2024-01-28	451
https://funda.nl/huur/arnhem/appartement-43467169-velperweg-47-1107/	Velperweg 47 1107	Arnhem	1850	funda	2024-01-28	452
https://funda.nl/huur/tilburg/appartement-43467002-koestraat-67-18/	Koestraat 67 18	Tilburg	995	funda	2024-01-28	453
https://funda.nl/huur/gouda/huis-43467013-piersonweg-8/	Piersonweg 8	Gouda	1595	funda	2024-01-28	454
https://funda.nl/huur/delfzijl/huis-43468420-oslofjord-65/	Oslofjord 65	Delfzijl	879	funda	2024-01-28	455
https://funda.nl/huur/amsterdam/appartement-43467070-osdorpplein-917/	Osdorpplein 917	Amsterdam	1825	funda	2024-01-28	456
https://funda.nl/huur/almere/appartement-43467077-stadhuisplein-63/	Stadhuisplein 63	Almere	1350	funda	2024-01-28	457
https://funda.nl/huur/den-haag/appartement-43451580-van-kijfhoeklaan-57/	Van Kijfhoeklaan 57	Den Haag	2495	funda	2024-01-28	458
https://funda.nl/huur/amsterdam/appartement-42397853-eef-kamerbeekstraat-688/	Eef Kamerbeekstraat 688	Amsterdam	1705	funda	2024-01-28	459
https://funda.nl/huur/amsterdam/appartement-42332039-eef-kamerbeekstraat-642/	Eef Kamerbeekstraat 642	Amsterdam	1427	funda	2024-01-28	460
https://funda.nl/huur/den-haag/appartement-43467062-scheveningseweg-355/	Scheveningseweg 355	Den Haag	2495	funda	2024-01-28	461
https://funda.nl/huur/amsterdam/huis-43467940-achterlaan-23/	Achterlaan 23	Amsterdam	2850	funda	2024-01-28	462
https://funda.nl/huur/den-haag/appartement-43467935-speerpunt-11/	Speerpunt 11	Den Haag	1455	funda	2024-01-28	463
https://funda.nl/huur/edam/huis-43467947-baandervesting-5/	Baandervesting 5	Edam	2850	funda	2024-01-28	464
https://funda.nl/huur/wassenaar/huis-43467929-papeweg-11/	Papeweg 11	Wassenaar	2750	funda	2024-01-28	465
https://funda.nl/huur/den-haag/appartement-43467910-theresiastraat-241/	Theresiastraat 241	Den Haag	2950	funda	2024-01-28	466
https://funda.nl/huur/amsterdam/appartement-43467901-paradijsplein-90/	Paradijsplein 90	Amsterdam	2250	funda	2024-01-28	467
https://funda.nl/huur/amsterdam/appartement-43467997-admiraal-de-ruijterweg-260-2/	Admiraal De Ruijterweg 260 2	Amsterdam	2200	funda	2024-01-28	468
https://funda.nl/huur/den-haag/appartement-43467903-dr-lelykade-281/	Dr. Lelykade 281 .	Den Haag	2275	funda	2024-01-28	469
https://funda.nl/huur/utrecht/huis-43467995-peter-schathof-35/	Peter Schathof 35	Utrecht	2995	funda	2024-01-28	470
https://funda.nl/huur/purmerend/appartement-43467979-kolkstraat-7-g/	Kolkstraat 7 G	Purmerend	1525	funda	2024-01-28	471
https://funda.nl/huur/venlo/appartement-43467858-deken-van-oppensingel-157/	Deken van Oppensingel 157	Venlo	797	funda	2024-01-28	472
https://funda.nl/huur/amsterdam/appartement-43467854-albert-neuhuysstraat-22-iii/	Albert Neuhuysstraat 22 III	Amsterdam	1650	funda	2024-01-28	473
https://funda.nl/huur/amsterdam/appartement-43467258-eemsstraat-7-1/	Eemsstraat 7 1	Amsterdam	2550	funda	2024-01-28	474
https://funda.nl/huur/amsterdam/appartement-43467239-gerard-douplein-19-b/	Gerard Douplein 19 B	Amsterdam	2200	funda	2024-01-28	475
https://funda.nl/huur/sassenheim/huis-43467934-elbalaan-14/	Elbalaan 14	Sassenheim	2750	funda	2024-01-28	476
https://funda.nl/huur/amsterdam/appartement-43467836-nieuwe-passeerdersstraat-120/	Nieuwe Passeerdersstraat 120	Amsterdam	1305	funda	2024-01-28	477
https://funda.nl/huur/amsterdam/appartement-43467821-admiralengracht-40-hs/	Admiralengracht 40 hs	Amsterdam	2950	funda	2024-01-28	478
https://funda.nl/huur/den-haag/appartement-43467215-buitentuinen-2-2/	Buitentuinen 2 2	Den Haag	500	funda	2024-01-28	479
https://funda.nl/huur/amsterdam/appartement-43467241-eerste-van-swindenstraat-84-a/	Eerste Van Swindenstraat 84 a	Amsterdam	1500	funda	2024-01-28	480
https://funda.nl/huur/amsterdam/appartement-43466152-de-klencke-101-a/	De Klencke 101 A	Amsterdam	3300	funda	2024-01-28	481
https://funda.nl/huur/amsterdam/appartement-43467724-van-spilbergenstraat-134-3/	Van Spilbergenstraat 134 3	Amsterdam	2100	funda	2024-01-28	482
https://funda.nl/huur/castricum/appartement-43467143-dorpsstraat-81-g/	Dorpsstraat 81 G	Castricum	1375	funda	2024-01-28	483
https://funda.nl/huur/haarle-gem-tubbergen/huis-43467781-snoeymansweg-24/	Snoeymansweg 24	Haarle (Gem. Tubbergen)	1250	funda	2024-01-28	484
https://funda.nl/huur/amsterdam/appartement-43467718-van-spilbergenstraat-150-i/	Van Spilbergenstraat 150 I	Amsterdam	1995	funda	2024-01-28	485
https://funda.nl/huur/diemen/appartement-43467714-roggekamp-41-1/	Roggekamp 41 1	Diemen	1900	funda	2024-01-28	486
https://funda.nl/huur/amsterdam/appartement-43467651-ringdijk-28-c/	Ringdijk 28 C	Amsterdam	1800	funda	2024-01-28	487
https://funda.nl/huur/veldhoven/huis-43467774-das-2-a/	Das 2 A	Veldhoven	1950	funda	2024-01-28	488
https://funda.nl/huur/maastricht/appartement-43467659-sphinxlunet-171-c/	Sphinxlunet 171 C	Maastricht	1595	funda	2024-01-28	489
https://funda.nl/huur/amsterdam/appartement-43467552-fred-roeskestraat-88-8a/	Fred. Roeskestraat 88 8A	Amsterdam	2700	funda	2024-01-28	490
https://funda.nl/huur/noordwijk-zh/huis-43467608-kruidhof-34/	Kruidhof 34	Noordwijk	1795	funda	2024-01-28	491
https://funda.nl/huur/valkenburg-li/appartement-43467607-cremerstraat-4-b/	Cremerstraat 4 b	Valkenburg	675	funda	2024-01-28	492
https://funda.nl/huur/rotterdam/appartement-43467673-mathenesserdijk-236-a/	Mathenesserdijk 236 A	Rotterdam	1250	funda	2024-01-28	493
https://funda.nl/huur/amsterdam/appartement-43467540-tweede-leliedwarsstraat-7-h/	Tweede Leliedwarsstraat 7 H	Amsterdam	3000	funda	2024-01-28	494
https://funda.nl/huur/utrecht/huis-43467544-goedestraat-86/	Goedestraat 86	Utrecht	1895	funda	2024-01-28	495
https://funda.nl/huur/utrecht/appartement-43467811-wilde-rucolavliet-49/	Wilde rucolavliet 49	Utrecht	1300	funda	2024-01-28	496
https://funda.nl/huur/heerhugowaard/appartement-43467510-tamarixplantsoen-99/	Tamarixplantsoen 99	Heerhugowaard	725	funda	2024-01-28	497
https://funda.nl/huur/amsterdam/appartement-43467524-koningin-wilhelminaplein-720/	Koningin Wilhelminaplein 720	Amsterdam	1955	funda	2024-01-28	498
https://funda.nl/huur/berkel-en-rodenrijs/appartement-43467878-christiaan-eijkmanstraat-60/	Christiaan Eijkmanstraat 60	Berkel en Rodenrijs	2400	funda	2024-01-28	499
https://funda.nl/huur/assen/appartement-43467748-sluisstraat-5/	Sluisstraat 5	Assen	600	funda	2024-01-28	500
https://funda.nl/huur/almelo/huis-43467609-posthuislaan-36/	Posthuislaan 36	Almelo	975	funda	2024-01-28	501
https://funda.nl/huur/amsterdam/appartement-43467790-schubertstraat-2-a/	Schubertstraat 2 A	Amsterdam	2500	funda	2024-01-28	502
https://funda.nl/huur/nieuwolda/huis-43467771-hoofdstraat-10/	Hoofdstraat 10	Nieuwolda	950	funda	2024-01-28	503
https://funda.nl/huur/koudekerke/huis-42323346-weststraat-45/	Weststraat 45	Koudekerke	1225	funda	2024-01-28	504
https://funda.nl/huur/amsterdam/appartement-43467682-loodskotterhof-115/	Loodskotterhof 115	Amsterdam	1995	funda	2024-01-28	505
https://funda.nl/huur/almere/appartement-42348492-boomgaardweg-47/	Boomgaardweg 47	Almere	1550	funda	2024-01-28	506
https://funda.nl/huur/amerongen/huis-43467512-burgemeester-van-den-boschstraat-110/	Burgemeester van den Boschstraat 110	Amerongen	2200	funda	2024-01-28	507
https://funda.nl/huur/amsterdam/appartement-43454198-van-bossestraat-85-3/	Van Bossestraat 85 3	Amsterdam	2795	funda	2024-01-28	508
https://funda.nl/huur/emmen/appartement-43466227-mantingerbrink-160/	Mantingerbrink 160	Emmen	1025	funda	2024-01-28	509
https://funda.nl/huur/sint-anthonis/appartement-43467459-molenstraat-4-f/	Molenstraat 4 F	Sint Anthonis	1200	funda	2024-01-28	510
https://funda.nl/huur/rotterdam/appartement-43467448-s-gravendijkwal-140-b/	's-Gravendijkwal 140 B	Rotterdam	1250	funda	2024-01-28	511
https://funda.nl/huur/amsterdam/appartement-43466342-herengracht-148-e/	Herengracht 148 E	Amsterdam	3825	funda	2024-01-28	512
https://funda.nl/huur/groningen/appartement-43466294-schuitendiep-33/	Schuitendiep 33	Groningen	1025	funda	2024-01-28	513
https://funda.nl/huur/amsterdam/appartement-43466261-roerstraat-131/	Roerstraat 131	Amsterdam	2500	funda	2024-01-28	514
https://funda.nl/huur/amsterdam/appartement-43467437-solitudolaan-244/	Solitudolaan 244	Amsterdam	5950	funda	2024-01-28	515
https://funda.nl/huur/scheemda/appartement-43466392-esborgstraat-7/	Esbörgstraat 7	Scheemda	873	funda	2024-01-28	516
https://funda.nl/huur/voorschoten/huis-43466374-cor-van-osnabruggelaan-78/	Cor van Osnabruggelaan 78	Voorschoten	3750	funda	2024-01-28	517
https://funda.nl/koop/gouda/huis-43466172-van-henegouwenstraat-16/	van Henegouwenstraat 16	Gouda	1675	funda	2024-01-28	518
https://funda.nl/huur/noordwijk-zh/appartement-43466847-writsaert-103/	Writsaert 103	Noordwijk	1850	funda	2024-01-28	519
https://funda.nl/huur/zwijndrecht/appartement-43466595-ringdijk-424/	Ringdijk 424	Zwijndrecht	1500	funda	2024-01-28	520
https://funda.nl/huur/rotterdam/appartement-43466064-willem-van-hillegaersbergstraat-127-b/	Willem van Hillegaersbergstraat 127 B	Rotterdam	1345	funda	2024-01-28	521
https://funda.nl/huur/harderwijk/appartement-43466764-donkerstraat-1-a/	Donkerstraat 1 a	Harderwijk	1025	funda	2024-01-28	522
https://funda.nl/huur/amsterdam/appartement-43466496-william-barlowlaan-125/	William Barlowlaan 125	Amsterdam	2600	funda	2024-01-28	523
https://funda.nl/huur/amsterdam/appartement-43466488-cornelis-vermuydenstraat-11/	Cornelis Vermuydenstraat 11	Amsterdam	2850	funda	2024-01-28	524
https://funda.nl/huur/geleen/huis-43466906-oranjelaan-203/	Oranjelaan 203	Geleen	995	funda	2024-01-28	525
https://funda.nl/huur/rotterdam/huis-43466822-flying-dutchmanstraat-18/	Flying Dutchmanstraat 18	Rotterdam	1875	funda	2024-01-28	526
https://funda.nl/huur/hellevoetsluis/appartement-43467415-muiderslotpad-68/	Muiderslotpad 68	Hellevoetsluis	1850	funda	2024-01-28	527
https://funda.nl/huur/amsterdam/appartement-43466386-nieuwe-looiersstraat-33-ii/	Nieuwe Looiersstraat 33 II	Amsterdam	2450	funda	2024-01-28	528
https://funda.nl/huur/amsterdam/appartement-43466385-herengracht-171-a/	Herengracht 171 A	Amsterdam	2650	funda	2024-01-28	529
https://funda.nl/huur/haarlem/appartement-43467472-jacobstraat-57/	Jacobstraat 57	Haarlem	2400	funda	2024-01-28	530
https://funda.nl/huur/veenendaal/appartement-43466455-spanjaardsgoed-120/	Spanjaardsgoed 120	Veenendaal	1310	funda	2024-01-28	531
https://funda.nl/huur/veenendaal/appartement-43466454-spanjaardsgoed-134/	Spanjaardsgoed 134	Veenendaal	1348	funda	2024-01-28	532
https://funda.nl/huur/veenendaal/appartement-43466453-spanjaardsgoed-118/	Spanjaardsgoed 118	Veenendaal	1310	funda	2024-01-28	533
https://funda.nl/huur/veenendaal/appartement-43466441-spanjaardsgoed-124/	Spanjaardsgoed 124	Veenendaal	1310	funda	2024-01-28	534
https://funda.nl/huur/veenendaal/appartement-43466440-spanjaardsgoed-156/	Spanjaardsgoed 156	Veenendaal	1324	funda	2024-01-28	535
https://funda.nl/huur/veenendaal/appartement-43466446-spanjaardsgoed-148/	Spanjaardsgoed 148	Veenendaal	1324	funda	2024-01-28	536
https://funda.nl/huur/veenendaal/appartement-43466445-spanjaardsgoed-164/	Spanjaardsgoed 164	Veenendaal	1324	funda	2024-01-28	537
https://funda.nl/huur/veenendaal/appartement-43466444-spanjaardsgoed-150/	Spanjaardsgoed 150	Veenendaal	1324	funda	2024-01-28	538
https://funda.nl/huur/veenendaal/appartement-43466430-spanjaardsgoed-116/	Spanjaardsgoed 116	Veenendaal	1305	funda	2024-01-28	539
https://funda.nl/huur/veenendaal/appartement-43466439-spanjaardsgoed-132/	Spanjaardsgoed 132	Veenendaal	1310	funda	2024-01-28	540
https://funda.nl/huur/veenendaal/appartement-43466437-spanjaardsgoed-140/	Spanjaardsgoed 140	Veenendaal	1305	funda	2024-01-28	541
https://funda.nl/huur/veenendaal/appartement-43466424-spanjaardsgoed-144/	Spanjaardsgoed 144	Veenendaal	1324	funda	2024-01-28	542
https://funda.nl/huur/veenendaal/appartement-43466411-spanjaardsgoed-142/	Spanjaardsgoed 142	Veenendaal	1324	funda	2024-01-28	543
https://funda.nl/huur/veenendaal/appartement-43466410-spanjaardsgoed-158/	Spanjaardsgoed 158	Veenendaal	1314	funda	2024-01-28	544
https://funda.nl/huur/wassenaar/parkeergelegenheid-43465391-dahliahof-12-i/	Dahliahof 12 i	Wassenaar	200	funda	2024-01-28	545
https://funda.nl/huur/bussum/huis-43466228-sint-janslaan-51/	Sint Janslaan 51	Bussum	2000	funda	2024-01-28	546
https://funda.nl/huur/utrecht/appartement-43466870-busken-huetstraat-42/	Busken Huetstraat 42	Utrecht	1295	funda	2024-01-28	547
https://funda.nl/huur/hengelo-ov/huis-43466867-frezerij-90/	Frezerij 90	Hengelo	1500	funda	2024-01-28	548
https://funda.nl/huur/hilversum/appartement-43466225-groest-11-a/	Groest 11 A	Hilversum	1360	funda	2024-01-28	549
https://funda.nl/huur/amstelveen/huis-43467426-zilverschoonlaan-80/	Zilverschoonlaan 80	Amstelveen	2950	funda	2024-01-28	550
https://funda.nl/huur/amsterdam/appartement-43467488-weissenbruchstraat-33-h/	Weissenbruchstraat 33 H	Amsterdam	2750	funda	2024-01-28	551
https://funda.nl/huur/amsterdam/appartement-43466318-weissenbruchstraat-29-h/	Weissenbruchstraat 29 H	Amsterdam	2750	funda	2024-01-28	552
https://funda.nl/huur/alkmaar/appartement-43467491-heul-54/	Heul 54	Alkmaar	1288	funda	2024-01-28	553
https://funda.nl/huur/haarlem/huis-43467470-reitzstraat-37/	Reitzstraat 37	Haarlem	1845	funda	2024-01-28	554
https://funda.nl/huur/delft/appartement-43467486-lepelaarstraat-132/	Lepelaarstraat 132	Delft	1700	funda	2024-01-28	555
https://funda.nl/huur/amsterdam/appartement-43467478-egelantiersgracht-45/	Egelantiersgracht 45	Amsterdam	2850	funda	2024-01-28	556
https://funda.nl/huur/amsterdam/appartement-43467477-korte-prinsengracht-13-c/	Korte Prinsengracht 13 C	Amsterdam	2850	funda	2024-01-28	557
https://funda.nl/huur/ingber/huis-43466331-de-hut-8/	De Hut 8	Ingber	1395	funda	2024-01-28	558
https://funda.nl/huur/amstelveen/huis-43466354-de-vlaschaard-3/	De Vlaschaard 3	Amstelveen	2250	funda	2024-01-28	559
https://funda.nl/huur/leidschendam/appartement-43466352-prins-frederiklaan-323/	Prins Frederiklaan 323	Leidschendam	1675	funda	2024-01-28	560
https://funda.nl/huur/bergambacht/object-43466330-molenlaan-9/	Molenlaan 9	Bergambacht	450	funda	2024-01-28	561
https://funda.nl/huur/amsterdam/appartement-43466358-tweede-weteringdwarsstraat-2-hs/	Tweede Weteringdwarsstraat 2 HS	Amsterdam	2250	funda	2024-01-28	562
https://funda.nl/huur/amsterdam/appartement-43466302-oosterpark-83-ii/	Oosterpark 83 II	Amsterdam	3000	funda	2024-01-28	563
https://funda.nl/huur/amsterdam/appartement-43467422-backershagen-93/	Backershagen 93	Amsterdam	3100	funda	2024-01-28	564
https://funda.nl/huur/amsterdam/appartement-43466251-loenermark-491-pp/	Loenermark 491 PP	Amsterdam	2000	funda	2024-01-28	565
https://funda.nl/huur/den-dungen/huis-43466221-grinsel-81/	Grinsel 81	Den Dungen	1750	funda	2024-01-28	566
https://funda.nl/huur/rotterdam/appartement-43466245-kruiskade-119-h/	Kruiskade 119 H	Rotterdam	1950	funda	2024-01-28	567
https://funda.nl/huur/amsterdam/appartement-43466267-wijenburg-94/	Wijenburg 94	Amsterdam	2150	funda	2024-01-28	568
https://funda.nl/huur/venlo/appartement-43466156-krekelveldstraat-8-2/	Krekelveldstraat 8 2	Venlo	355	funda	2024-01-28	569
https://funda.nl/huur/den-haag/appartement-43467418-sumatrastraat-206/	Sumatrastraat 206	Den Haag	2100	funda	2024-01-28	570
https://funda.nl/huur/amsterdam/appartement-43466119-dintelstraat-124-ii/	Dintelstraat 124 II	Amsterdam	3000	funda	2024-01-28	571
https://funda.nl/huur/terneuzen/huis-43466182-tramstraat-28/	Tramstraat 28	Terneuzen	990	funda	2024-01-28	572
https://funda.nl/huur/amsterdam/appartement-43467498-van-hallstraat-707/	Van Hallstraat 707	Amsterdam	4000	funda	2024-01-28	573
https://funda.nl/huur/rotterdam/appartement-43466044-chabotlaan-199/	Chabotlaan 199	Rotterdam	1495	funda	2024-01-28	574
https://funda.nl/huur/rotterdam/appartement-43466028-van-der-hoevenplein-146/	Van der Hoevenplein 146	Rotterdam	995	funda	2024-01-28	575
https://funda.nl/huur/amstelveen/appartement-43466061-burgemeester-rijnderslaan-190/	Burgemeester Rijnderslaan 190	Amstelveen	1696	funda	2024-01-28	576
https://funda.nl/huur/nieuwerkerk-aan-den-ijssel/huis-43466066-parallelweg-zuid-55/	Parallelweg-Zuid 55	Nieuwerkerk aan den IJssel	2995	funda	2024-01-28	577
https://funda.nl/huur/alkmaar/appartement-43466944-heul-36/	Heul 36	Alkmaar	1067	funda	2024-01-28	578
https://funda.nl/huur/haarlem/appartement-43456149-ruychaverstraat-3-m/	Ruychaverstraat 3 M	Haarlem	1110	funda	2024-01-28	579
https://funda.nl/huur/haarlem/appartement-43454343-frankestraat-41-rd/	Frankestraat 41 rd	Haarlem	2085	funda	2024-01-28	580
https://funda.nl/huur/poeldijk/appartement-43466997-dr-weitjenslaan-14-b/	Dr Weitjenslaan 14 b	Poeldijk	1300	funda	2024-01-28	581
https://funda.nl/huur/almere/appartement-43466976-verlengde-duinvalleiweg-201/	Verlengde Duinvalleiweg 201	Almere	1380	funda	2024-01-28	582
https://funda.nl/huur/rotterdam/appartement-43466984-leopoldstraat-17-c/	Leopoldstraat 17 C	Rotterdam	1450	funda	2024-01-28	583
https://funda.nl/huur/amsterdam/appartement-43466854-churchill-laan-201-hs/	Churchill-laan 201 HS	Amsterdam	2400	funda	2024-01-28	584
https://funda.nl/huur/groningen/appartement-43466173-de-brink-160/	De Brink 160	Groningen	1200	funda	2024-01-28	585
https://funda.nl/huur/amsterdam/appartement-43466290-praterlaan-162-a/	Praterlaan 162 A	Amsterdam	2350	funda	2024-01-28	586
https://funda.nl/huur/den-helder/appartement-43466378-cornelis-ditostraat-50/	Cornelis Ditostraat 50	Den Helder	525	funda	2024-01-28	587
https://funda.nl/huur/amsterdam/appartement-43466162-gerard-doustraat-161/	Gerard Doustraat 161	Amsterdam	2150	funda	2024-01-28	588
https://funda.nl/huur/soest/appartement-43466815-soesterbergsestraat-49-a/	Soesterbergsestraat 49 A*	Soest	1500	funda	2024-01-28	589
https://funda.nl/huur/amsterdam/appartement-43466827-singel-196-l/	Singel 196 L	Amsterdam	2950	funda	2024-01-28	590
https://funda.nl/huur/amsterdam/appartement-43466810-commelinstraat-300/	Commelinstraat 300	Amsterdam	1675	funda	2024-01-28	591
https://funda.nl/huur/rotterdam/appartement-43466897-kemperweg-178/	Kemperweg 178	Rotterdam	1400	funda	2024-01-28	592
https://funda.nl/huur/amsterdam/appartement-43466883-rapenburg-48-a/	Rapenburg 48 A	Amsterdam	3000	funda	2024-01-28	593
https://funda.nl/huur/amsterdam/appartement-43466892-emmy-andriessestraat-554/	Emmy Andriessestraat 554	Amsterdam	2137	funda	2024-01-28	594
https://funda.nl/huur/laren-nh/huis-43466751-zevenend-67-a/	Zevenend 67 a	Laren	3750	funda	2024-01-28	595
https://funda.nl/huur/zaandam/appartement-43466747-vurehout-337/	Vurehout 337	Zaandam	2000	funda	2024-01-28	596
https://funda.nl/huur/amsterdam/appartement-43466754-herengracht-437-b/	Herengracht 437 B	Amsterdam	3350	funda	2024-01-28	597
https://funda.nl/huur/rijswijk-zh/appartement-43466104-van-vredenburchweg-671/	van Vredenburchweg 671	Rijswijk	1075	funda	2024-01-28	598
https://funda.nl/huur/amsterdam/appartement-43466710-ceintuurbaan-95-i/	Ceintuurbaan 95 I	Amsterdam	1950	funda	2024-01-28	599
https://funda.nl/huur/amsterdam/appartement-43466716-achillesstraat-64-3/	Achillesstraat 64 3	Amsterdam	2495	funda	2024-01-28	600
https://funda.nl/huur/zwolle/appartement-43466057-koningin-wilhelminastraat-26-a/	Koningin Wilhelminastraat 26 A	Zwolle	2250	funda	2024-01-28	601
https://funda.nl/huur/den-haag/appartement-43466612-theresiastraat-241/	Theresiastraat 241	Den Haag	2950	funda	2024-01-28	602
https://funda.nl/huur/schiedam/appartement-43466638-lange-haven-38/	Lange Haven 38	Schiedam	1821	funda	2024-01-28	603
https://funda.nl/huur/rotterdam/appartement-43466690-oostmaaslaan-164/	Oostmaaslaan 164	Rotterdam	2500	funda	2024-01-28	604
https://funda.nl/huur/haarlem/huis-43466694-aelbertsbergstraat-22/	Aelbertsbergstraat 22	Haarlem	2950	funda	2024-01-28	605
https://funda.nl/huur/amsterdam/appartement-43466693-leidsestraat-108-b/	Leidsestraat 108 B	Amsterdam	1650	funda	2024-01-28	606
https://funda.nl/huur/den-haag/appartement-43466553-theresiastraat-241/	Theresiastraat 241	Den Haag	2950	funda	2024-01-28	607
https://funda.nl/huur/den-haag/appartement-43466663-johannes-camphuijsstraat-270/	Johannes Camphuijsstraat 270	Den Haag	2295	funda	2024-01-28	608
https://funda.nl/huur/kessel/huis-43466956-donk-20/	Donk 20	Kessel	1250	funda	2024-01-28	609
https://funda.nl/huur/amsterdam/appartement-43454491-vondelstraat-11-h2/	Vondelstraat 11 H2	Amsterdam	2400	funda	2024-01-28	610
https://funda.nl/huur/hilversum/huis-43466539-ten-boomstraat-8/	Ten Boomstraat 8	Hilversum	2750	funda	2024-01-28	611
https://funda.nl/huur/bladel/appartement-43466537-marktstaete-59/	Marktstaete 59	Bladel	1970	funda	2024-01-28	612
https://funda.nl/huur/amsterdam/appartement-43466900-amstelveenseweg-615-d/	Amstelveenseweg 615 D	Amsterdam	2750	funda	2024-01-28	613
https://funda.nl/huur/rotterdam/appartement-43466568-oostmaasstraat-29-a/	Oostmaasstraat 29 A	Rotterdam	2450	funda	2024-01-28	614
https://funda.nl/huur/wassenaar/appartement-43466985-havenkade-35/	Havenkade 35	Wassenaar	3350	funda	2024-01-28	615
https://funda.nl/huur/rotterdam/appartement-43466433-kruisplein-616/	Kruisplein 616	Rotterdam	3000	funda	2024-01-28	616
https://funda.nl/huur/amsterdam/appartement-43466415-jan-vrijmanstraat-377/	Jan Vrijmanstraat 377	Amsterdam	3088	funda	2024-01-28	617
https://funda.nl/huur/utrecht/huis-43466458-athenestraat-42/	Athenestraat 42	Utrecht	3495	funda	2024-01-28	618
https://funda.nl/huur/veenendaal/appartement-43466442-spanjaardsgoed-154/	Spanjaardsgoed 154	Veenendaal	1324	funda	2024-01-28	619
https://funda.nl/huur/veenendaal/appartement-43466449-spanjaardsgoed-122/	Spanjaardsgoed 122	Veenendaal	1310	funda	2024-01-28	620
https://funda.nl/huur/veenendaal/appartement-43466448-spanjaardsgoed-114/	Spanjaardsgoed 114	Veenendaal	1333	funda	2024-01-28	621
https://funda.nl/huur/veenendaal/appartement-43466447-spanjaardsgoed-128/	Spanjaardsgoed 128	Veenendaal	1310	funda	2024-01-28	622
https://funda.nl/huur/veenendaal/appartement-43466443-spanjaardsgoed-136/	Spanjaardsgoed 136	Veenendaal	1348	funda	2024-01-28	623
https://funda.nl/huur/veenendaal/appartement-43466432-spanjaardsgoed-112/	Spanjaardsgoed 112	Veenendaal	1357	funda	2024-01-28	624
https://funda.nl/huur/veenendaal/appartement-43466431-spanjaardsgoed-138/	Spanjaardsgoed 138	Veenendaal	1305	funda	2024-01-28	625
https://funda.nl/huur/veenendaal/appartement-43466436-spanjaardsgoed-152/	Spanjaardsgoed 152	Veenendaal	1324	funda	2024-01-28	626
https://funda.nl/huur/veenendaal/appartement-43466412-spanjaardsgoed-110/	Spanjaardsgoed 110	Veenendaal	1305	funda	2024-01-28	627
https://funda.nl/huur/veenendaal/appartement-43466419-spanjaardsgoed-108/	Spanjaardsgoed 108	Veenendaal	1381	funda	2024-01-28	628
https://funda.nl/huur/veenendaal/appartement-43466418-spanjaardsgoed-126/	Spanjaardsgoed 126	Veenendaal	1310	funda	2024-01-28	629
https://funda.nl/huur/amsterdam/appartement-43466459-elzenhagensingel-273-c/	Elzenhagensingel 273 C	Amsterdam	1745	funda	2024-01-28	630
https://funda.nl/huur/veenendaal/appartement-43466438-spanjaardsgoed-146/	Spanjaardsgoed 146	Veenendaal	1324	funda	2024-01-28	631
https://funda.nl/huur/amsterdam/appartement-43466401-groenburgwal-28-2/	Groenburgwal 28 2	Amsterdam	1900	funda	2024-01-28	632
https://funda.nl/huur/utrecht/appartement-42340723-lauwerecht-235-bg/	Lauwerecht 235 BG	Utrecht	1000	funda	2024-01-28	633
https://funda.nl/huur/amsterdam/appartement-43466482-nieuwezijds-voorburgwal-20-c/	Nieuwezijds Voorburgwal 20 C	Amsterdam	2150	funda	2024-01-28	634
https://funda.nl/huur/amsterdam/appartement-43466403-renooiplein-19/	Renooiplein 19	Amsterdam	1850	funda	2024-01-28	635
https://funda.nl/huur/den-haag/appartement-43466409-prinsegracht-77-q/	Prinsegracht 77 Q	Den Haag	1850	funda	2024-01-28	636
https://funda.nl/huur/utrecht/appartement-43466494-henriette-roland-holststraat-66/	Henriëtte Roland Holststraat 66	Utrecht	1695	funda	2024-01-28	637
https://funda.nl/huur/rotterdam/appartement-43466792-dordtselaan-21-d/	Dordtselaan 21 D	Rotterdam	900	funda	2024-01-28	638
https://funda.nl/huur/leeuwarden/appartement-43466479-bagijnestraat-56/	Bagijnestraat 56	Leeuwarden	1300	funda	2024-01-28	639
https://funda.nl/huur/laren-nh/appartement-43453463-kopjeskampen-2/	Kopjeskampen 2	Laren	1850	funda	2024-01-28	640
https://funda.nl/huur/rotterdam/appartement-43466818-willem-van-hillegaersbergstraat-127-c/	Willem van Hillegaersbergstraat 127 C	Rotterdam	1600	funda	2024-01-28	641
https://funda.nl/huur/schiedam/appartement-43466529-bachplein-486/	Bachplein 486	Schiedam	1275	funda	2024-01-28	642
https://funda.nl/huur/hoofddorp/appartement-43466585-mies-van-der-rohestraat-87/	Mies van der Rohestraat 87	Hoofddorp	2300	funda	2024-01-28	643
https://funda.nl/huur/amsterdam/appartement-43465325-lanseloetstraat-38-iii/	Lanseloetstraat 38 III	Amsterdam	2900	funda	2024-01-28	644
https://funda.nl/huur/wassenaar/appartement-43465301-johan-de-wittstraat-109/	Johan de Wittstraat 109	Wassenaar	2750	funda	2024-01-28	645
https://funda.nl/huur/den-haag/appartement-43465860-wagenstraat-155-b/	Wagenstraat 155 B	Den Haag	1200	funda	2024-01-28	646
https://funda.nl/huur/den-haag/appartement-43451468-uddelstraat-114/	Uddelstraat 114	Den Haag	1330	funda	2024-01-28	647
https://funda.nl/huur/putte/huis-42333478-antwerpsestraat-33/	Antwerpsestraat 33	Putte	2500	funda	2024-01-28	648
https://funda.nl/huur/zeist/huis-43458222-de-brink-22/	De Brink 22	Zeist	1950	funda	2024-01-28	649
https://funda.nl/huur/rotterdam/appartement-43454251-mathenesserweg-69-c02/	Mathenesserweg 69 C02	Rotterdam	1895	funda	2024-01-28	650
https://funda.nl/huur/diemen/appartement-43466481-theo-van-doesburghof-96/	Theo van Doesburghof 96	Diemen	1900	funda	2024-01-28	651
https://funda.nl/huur/rotterdam/appartement-43466561-lodewijk-pincoffsweg-273/	Lodewijk Pincoffsweg 273	Rotterdam	1475	funda	2024-01-28	652
https://funda.nl/huur/arnhem/appartement-43466400-pastoorstraat-11-1/	Pastoorstraat 11 1	Arnhem	1200	funda	2024-01-28	653
https://funda.nl/huur/amsterdam/appartement-43465248-vechtstraat-184-iii/	Vechtstraat 184 III	Amsterdam	2150	funda	2024-01-28	654
https://funda.nl/huur/den-haag/appartement-43465062-prinsessegracht-27-d/	Prinsessegracht 27 D	Den Haag	3950	funda	2024-01-28	655
https://funda.nl/huur/emmen/appartement-43466460-wilhelminastraat-49-y/	Wilhelminastraat 49 y	Emmen	825	funda	2024-01-28	656
https://funda.nl/huur/amsterdam/appartement-43450224-saenredamstraat-59-chs/	Saenredamstraat 59 CHS	Amsterdam	2950	funda	2024-01-28	657
https://funda.nl/huur/vaassen/huis-43465130-dorpsstraat-51/	Dorpsstraat 51	Vaassen	1350	funda	2024-01-28	658
https://funda.nl/huur/leeuwarden/appartement-43465069-bagijnestraat-56-c/	Bagijnestraat 56 c	Leeuwarden	1290	funda	2024-01-28	659
https://funda.nl/huur/helden/huis-43465340-baarloseweg-15/	Baarloseweg 15	Helden	1200	funda	2024-01-28	660
https://funda.nl/huur/amsterdam/appartement-43459550-zuidelijke-wandelweg-67/	Zuidelijke Wandelweg 67	Amsterdam	2450	funda	2024-01-28	661
https://funda.nl/huur/den-haag/appartement-43465397-2e-schuytstraat-195-e/	2e Schuytstraat 195 E	Den Haag	2000	funda	2024-01-28	662
https://funda.nl/huur/utrecht/appartement-43465394-louis-armstronglaan-740/	Louis Armstronglaan 740	Utrecht	1680	funda	2024-01-28	663
https://funda.nl/huur/leiden/appartement-43465387-tesselschadestraat-25-a/	Tesselschadestraat 25 A	Leiden	2450	funda	2024-01-28	664
https://funda.nl/huur/velp-ge/appartement-43465372-nieuw-schoonoord-259/	Nieuw-Schoonoord 259	Velp	960	funda	2024-01-28	665
https://funda.nl/huur/noord-scharwoude/huis-43465361-industriestraat-85/	Industriestraat 85	Noord-Scharwoude	1950	funda	2024-01-28	666
https://funda.nl/huur/hoorn-nh/huis-43465360-breitnerhof-148/	Breitnerhof 148	Hoorn	1850	funda	2024-01-28	667
https://funda.nl/huur/lemele/huis-43465368-lemelerweg-76/	Lemelerweg 76	Lemele	1250	funda	2024-01-28	668
https://funda.nl/huur/leeuwarden/appartement-43465230-wortelhaven-79-b-1e-et/	Wortelhaven 79 B 1e et	Leeuwarden	695	funda	2024-01-28	669
https://funda.nl/huur/rotterdam/appartement-43454919-rochussenstraat-119-f/	Rochussenstraat 119 F	Rotterdam	1195	funda	2024-01-28	670
https://funda.nl/huur/rotterdam/appartement-43454991-rochussenstraat-119-y/	Rochussenstraat 119 Y	Rotterdam	1330	funda	2024-01-28	671
https://funda.nl/huur/rotterdam/appartement-43454990-rochussenstraat-119-n/	Rochussenstraat 119 N	Rotterdam	802	funda	2024-01-28	672
https://funda.nl/huur/eindhoven/appartement-43465224-strijpsestraat-82/	Strijpsestraat 82	Eindhoven	1250	funda	2024-01-28	673
https://funda.nl/huur/amsterdam/appartement-43465254-paramaribostraat-29-hs/	Paramaribostraat 29 hs	Amsterdam	2475	funda	2024-01-28	674
https://funda.nl/huur/amsterdam/appartement-43452925-bilderdijkkade-50/	Bilderdijkkade 50	Amsterdam	8500	funda	2024-01-28	675
https://funda.nl/huur/purmerend/appartement-43465253-oude-sluis-38/	Oude Sluis 38	Purmerend	1370	funda	2024-01-28	676
https://funda.nl/huur/zuidoostbeemster/appartement-43465242-zuiderweg-184/	Zuiderweg 184	Zuidoostbeemster	1145	funda	2024-01-28	677
https://funda.nl/huur/wijdewormer/huis-43465232-neck-17/	Neck 17	Wijdewormer	1850	funda	2024-01-28	678
https://funda.nl/huur/purmerend/appartement-43465231-dubbele-buurt-20-a/	Dubbele buurt 20 A	Purmerend	1175	funda	2024-01-28	679
https://funda.nl/huur/amersfoort/appartement-43465220-hollandsestraat-19/	Hollandsestraat 19	Amersfoort	1430	funda	2024-01-28	680
https://funda.nl/huur/amsterdam/appartement-43465291-herengracht-114-ha/	Herengracht 114 HA	Amsterdam	5000	funda	2024-01-28	681
https://funda.nl/huur/groningen/appartement-43465941-steenhouwerskade-119/	Steenhouwerskade 119	Groningen	1115	funda	2024-01-28	682
https://funda.nl/huur/groningen/appartement-43465285-van-oldenbarneveltlaan-13-b/	Van Oldenbarneveltlaan 13 b	Groningen	1325	funda	2024-01-28	683
https://funda.nl/huur/den-haag/appartement-43465134-van-der-aastraat-90-i/	Van der Aastraat 90 I.	Den Haag	3500	funda	2024-01-28	684
https://funda.nl/huur/emmen/huis-43465120-holtingerbrink-25/	Holtingerbrink 25	Emmen	1250	funda	2024-01-28	685
https://funda.nl/huur/hoofddorp/appartement-43465144-mies-van-der-rohestraat-137/	Mies van der Rohestraat 137	Hoofddorp	2300	funda	2024-01-28	686
https://funda.nl/huur/amsterdam/appartement-43465122-struisgrasstraat-1-b/	Struisgrasstraat 1 B	Amsterdam	1825	funda	2024-01-28	687
https://funda.nl/huur/amsterdam/appartement-43465123-zacharias-jansestraat-38-1/	Zacharias Jansestraat 38 1	Amsterdam	1600	funda	2024-01-28	688
https://funda.nl/huur/amsterdam/appartement-43465195-oostenburgervoorstraat-75-b/	Oostenburgervoorstraat 75 B	Amsterdam	1850	funda	2024-01-28	689
https://funda.nl/huur/emmen/appartement-43454219-wilhelminastraat-94-c/	Wilhelminastraat 94 C	Emmen	950	funda	2024-01-28	690
https://funda.nl/huur/muiden/huis-43465193-ijsvogel-4/	IJsvogel 4	Muiden	2750	funda	2024-01-28	691
https://funda.nl/huur/muiden/huis-43465181-kruitmolen-29/	Kruitmolen 29	Muiden	2500	funda	2024-01-28	692
https://funda.nl/huur/groningen/appartement-43465189-soendastraat-60/	Soendastraat 60	Groningen	1135	funda	2024-01-28	693
https://funda.nl/huur/lent/huis-43465173-weverstraat-2/	Weverstraat 2	Lent	1495	funda	2024-01-28	694
https://funda.nl/huur/mijdrecht/huis-43465621-verfmolen-22/	Verfmolen 22	Mijdrecht	2250	funda	2024-01-28	695
https://funda.nl/huur/maastricht/appartement-43454806-president-rooseveltlaan-124-c01/	President Rooseveltlaan 124 C01	Maastricht	1350	funda	2024-01-28	696
https://funda.nl/huur/amsterdam/appartement-43454248-geschutswerf-63/	Geschutswerf 63	Amsterdam	3750	funda	2024-01-28	697
https://funda.nl/huur/halfweg/huis-43454854-schoolstraat-26/	Schoolstraat 26	Halfweg	2500	funda	2024-01-28	698
https://funda.nl/huur/erica/huis-43454549-tuinderslaan-33/	Tuinderslaan 33	Erica	1500	funda	2024-01-28	699
https://funda.nl/huur/den-haag/appartement-43465969-theresiastraat-310-a/	Theresiastraat 310 A	Den Haag	1450	funda	2024-01-28	700
https://funda.nl/huur/halfweg/appartement-43465641-binnenhof-1/	Binnenhof 1	Halfweg	1200	funda	2024-01-28	701
https://funda.nl/huur/amsterdam/appartement-43454183-pieter-de-hoochstraat-74-2/	Pieter de Hoochstraat 74 2	Amsterdam	3000	funda	2024-01-28	702
https://funda.nl/huur/den-haag/appartement-43465546-anna-van-buerenplein-175/	Anna van Buerenplein 175	Den Haag	1875	funda	2024-01-28	703
https://funda.nl/huur/amsterdam/appartement-43454669-streefkerkstraat-24/	Streefkerkstraat 24	Amsterdam	1850	funda	2024-01-28	704
https://funda.nl/huur/amerongen/appartement-43454172-overstraat-67/	Overstraat 67	Amerongen	1225	funda	2024-01-28	705
https://funda.nl/huur/laren-nh/huis-43454036-van-wulfenlaan-6-a/	Van Wulfenlaan 6 a	Laren	1100	funda	2024-01-28	706
https://funda.nl/huur/den-haag/appartement-43465869-lange-voorhout-45-c/	Lange Voorhout 45 C.	Den Haag	1500	funda	2024-01-28	707
https://funda.nl/huur/haarlem/appartement-43454837-anthony-fokkerlaan-53-ii/	Anthony Fokkerlaan 53 II	Haarlem	1450	funda	2024-01-28	708
https://funda.nl/huur/amsterdam/appartement-43465187-jan-bernardusstraat-2-4/	Jan Bernardusstraat 2 4	Amsterdam	2750	funda	2024-01-28	709
https://funda.nl/huur/haarlem/appartement-43465017-spaarnwouderstraat-98/	Spaarnwouderstraat 98	Haarlem	1700	funda	2024-01-28	710
https://funda.nl/huur/den-haag/appartement-43453831-cederstraat-25/	Cederstraat 25	Den Haag	2500	funda	2024-01-28	711
https://funda.nl/huur/amsterdam/appartement-43465091-paramariboplein-24/	Paramariboplein 24	Amsterdam	2000	funda	2024-01-28	712
https://funda.nl/huur/deventer/appartement-43465086-verlengde-kazernestraat-19/	Verlengde Kazernestraat 19	Deventer	595	funda	2024-01-28	713
https://funda.nl/huur/amsterdam/appartement-43465952-courbetstraat-7-3-4/	Courbetstraat 7 3/4	Amsterdam	3250	funda	2024-01-28	714
https://funda.nl/huur/den-haag/appartement-43465063-van-der-aastraat-90/	Van der Aastraat 90	Den Haag	3500	funda	2024-01-28	715
https://funda.nl/huur/zandvoort/appartement-43465976-de-ruyterstraat-8/	de Ruyterstraat 8	Zandvoort	1850	funda	2024-01-28	716
https://funda.nl/huur/dordrecht/appartement-43465938-spuiboulevard-260-b/	Spuiboulevard 260 b	Dordrecht	2350	funda	2024-01-28	717
https://funda.nl/huur/badhoevedorp/parkeergelegenheid-43465961-meidoornweg-152-b-1/	Meidoornweg 152B-1	Badhoevedorp	225	funda	2024-01-28	718
https://funda.nl/huur/badhoevedorp/parkeergelegenheid-43465967-einsteinlaan-37/	Einsteinlaan 37	Badhoevedorp	225	funda	2024-01-28	719
https://funda.nl/huur/callantsoog/appartement-43465960-dorpsweg-1-v/	Dorpsweg 1 V	Callantsoog	895	funda	2024-01-28	720
https://funda.nl/huur/alphen-aan-den-rijn/appartement-43465841-aalhorst-196/	Aalhorst 196	Alphen aan den Rijn	1250	funda	2024-01-28	721
https://funda.nl/huur/heemstede/huis-43465856-alberdingk-thijmlaan-26/	Alberdingk Thijmlaan 26	Heemstede	3250	funda	2024-01-28	722
https://funda.nl/huur/leeuwarden/appartement-43465853-wirdumerdijk-25-b/	Wirdumerdijk 25 B	Leeuwarden	925	funda	2024-01-28	723
https://funda.nl/huur/schiedam/appartement-43465747-broersvest-4-b/	Broersvest 4 B	Schiedam	1350	funda	2024-01-28	724
https://funda.nl/huur/bennekom/appartement-43465720-oost-breukelderweg-84/	Oost-Breukelderweg 84	Bennekom	1200	funda	2024-01-28	725
https://funda.nl/huur/rotterdam/appartement-43465719-baan-52-m/	Baan 52 M	Rotterdam	3950	funda	2024-01-28	726
https://funda.nl/huur/den-haag/appartement-43465639-korte-houtstraat-10-d/	Korte Houtstraat 10 D	Den Haag	2500	funda	2024-01-28	727
https://funda.nl/huur/den-haag/appartement-43465653-nobelstraat-1-d/	Nobelstraat 1 D	Den Haag	2000	funda	2024-01-28	728
https://funda.nl/huur/den-haag/appartement-43465644-ridderspoorweg-48/	Ridderspoorweg 48	Den Haag	1300	funda	2024-01-28	729
https://funda.nl/huur/rotterdam/appartement-43465650-boompjes-664/	Boompjes 664	Rotterdam	1995	funda	2024-01-28	730
https://funda.nl/huur/utrecht/appartement-43465766-linnaeusstraat-32-b/	Linnaeusstraat 32 b	Utrecht	1749	funda	2024-01-28	731
https://funda.nl/huur/rotterdam/appartement-43465769-nico-koomanskade-206/	Nico Koomanskade 206	Rotterdam	2500	funda	2024-01-28	732
https://funda.nl/huur/hoensbroek/huis-43465608-mgr-feronlaan-116/	Mgr. Feronlaan 116	Hoensbroek	925	funda	2024-01-28	733
https://funda.nl/huur/den-haag/appartement-43465634-bankastraat-56/	Bankastraat 56	Den Haag	2400	funda	2024-01-28	734
https://funda.nl/huur/den-haag/appartement-43465687-hasseltsestraat-22/	Hasseltsestraat 22	Den Haag	1995	funda	2024-01-28	735
https://funda.nl/huur/sneek/appartement-43465688-boegspriet-26/	Boegspriet 26	Sneek	1100	funda	2024-01-28	736
https://funda.nl/huur/den-haag/appartement-43465672-vrederustlaan-437/	Vrederustlaan 437	Den Haag	1355	funda	2024-01-28	737
https://funda.nl/huur/emmen/huis-43465408-danackers-13/	Danackers 13	Emmen	925	funda	2024-01-28	738
https://funda.nl/huur/den-haag/appartement-43465563-kepplerstraat-324/	Kepplerstraat 324	Den Haag	1650	funda	2024-01-28	739
https://funda.nl/huur/groningen/huis-43465410-de-kaai-154/	De Kaai 154	Groningen	2400	funda	2024-01-28	740
https://funda.nl/huur/rotterdam/appartement-43465498-2e-jerichostraat-20/	2e Jerichostraat 20	Rotterdam	1695	funda	2024-01-28	741
https://funda.nl/huur/tilburg/huis-43465472-liesveldstraat-7/	Liesveldstraat 7	Tilburg	1155	funda	2024-01-28	742
https://funda.nl/huur/tilburg/appartement-43465484-koningsplein-20/	Koningsplein 20	Tilburg	752	funda	2024-01-28	743
https://funda.nl/huur/doorn/appartement-43462979-dorpsstraat-29-j/	Dorpsstraat 29 j	Doorn	815	funda	2024-01-28	744
\.


--
-- TOC entry 3369 (class 0 OID 16389)
-- Dependencies: 215
-- Data for Name: meta; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.meta (donation_link, scraper_halted, devmode_enabled, donation_link_updated, workdir, id) FROM stdin;
\N	f	t	\N	/scraper	default
\.


--
-- TOC entry 3370 (class 0 OID 16396)
-- Dependencies: 216
-- Data for Name: subscribers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.subscribers (user_level, subscription_expiry, filter_min_price, filter_max_price, filter_cities, telegram_enabled, telegram_id) FROM stdin;
9	2099-01-01	500	2000	{utrecht}	t	000000000
\.


--
-- TOC entry 3380 (class 0 OID 0)
-- Dependencies: 219
-- Name: homes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.homes_id_seq', 744, true);


--
-- TOC entry 3225 (class 2606 OID 16428)
-- Name: homes homes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.homes
    ADD CONSTRAINT homes_pkey PRIMARY KEY (id);


--
-- TOC entry 3221 (class 2606 OID 16406)
-- Name: subscribers subscribers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.subscribers
    ADD CONSTRAINT subscribers_pkey PRIMARY KEY (telegram_id);


-- Completed on 2024-01-28 15:22:17 UTC

--
-- PostgreSQL database dump complete
--

