--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.9
-- Dumped by pg_dump version 9.6.9

-- Started on 2018-06-25 04:41:35

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

DROP DATABASE menu_app;
--
-- TOC entry 2245 (class 1262 OID 16387)
-- Name: menu_app; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE menu_app WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C' LC_CTYPE = 'C';


ALTER DATABASE menu_app OWNER TO postgres;

\connect menu_app

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 1 (class 3079 OID 12387)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2248 (class 0 OID 0)
-- Dependencies: 1
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


--
-- TOC entry 588 (class 1247 OID 16424)
-- Name: dish_enum_type; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.dish_enum_type AS ENUM (
    'appetizer',
    'soup',
    'salad',
    'mc',
    'dessert',
    'breakfast',
    'breakfask_sp',
    'breakfast_sp',
    'pasta',
    'teatime'
);


ALTER TYPE public.dish_enum_type OWNER TO postgres;

--
-- TOC entry 529 (class 1247 OID 16414)
-- Name: meal_enum_type; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.meal_enum_type AS ENUM (
    'breakfast',
    'lunch',
    'teatime',
    'dinner',
    'dinner_sp'
);


ALTER TYPE public.meal_enum_type OWNER TO postgres;

--
-- TOC entry 497 (class 1247 OID 16407)
-- Name: restaurant_enum_type; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.restaurant_enum_type AS ENUM (
    'traditional',
    'anytime',
    'special',
    'italian',
    'steak'
);


ALTER TYPE public.restaurant_enum_type OWNER TO postgres;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 199 (class 1259 OID 16475)
-- Name: dish; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.dish (
    id integer NOT NULL,
    name character varying(255),
    description text,
    picture character varying(255),
    category public.dish_enum_type,
    id_meal smallint DEFAULT 9,
    recomended_wine smallint,
    id_day smallint DEFAULT 1
);


ALTER TABLE public.dish OWNER TO postgres;

--
-- TOC entry 192 (class 1259 OID 16444)
-- Name: meal; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.meal (
    id integer NOT NULL,
    id_restaurant smallint NOT NULL,
    name public.meal_enum_type,
    time_open time without time zone,
    time_close time without time zone
);


ALTER TABLE public.meal OWNER TO postgres;

--
-- TOC entry 187 (class 1259 OID 16388)
-- Name: restaurant_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.restaurant_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.restaurant_id_seq OWNER TO postgres;

--
-- TOC entry 190 (class 1259 OID 16435)
-- Name: restaurant; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.restaurant (
    id smallint DEFAULT nextval('public.restaurant_id_seq'::regclass) NOT NULL,
    name character varying(32) NOT NULL,
    location character varying(32),
    description text,
    picture character varying(255),
    restaurant_type public.restaurant_enum_type,
    price numeric(5,2)
);


ALTER TABLE public.restaurant OWNER TO postgres;

--
-- TOC entry 204 (class 1259 OID 16665)
-- Name: breakfast_view; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.breakfast_view AS
 SELECT dish.name,
    dish.description,
    dish.picture,
    restaurant.name AS restaurant_name,
    meal.time_open,
    meal.time_close
   FROM ((public.dish
     LEFT JOIN public.meal ON ((dish.id_meal = meal.id)))
     LEFT JOIN public.restaurant ON ((meal.id_restaurant = restaurant.id)));


ALTER TABLE public.breakfast_view OWNER TO postgres;

--
-- TOC entry 189 (class 1259 OID 16392)
-- Name: cocktail; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cocktail (
    id integer NOT NULL,
    name character varying(32),
    description text,
    price numeric(7,2) DEFAULT 5.99,
    picture character varying(255),
    id_day smallint
);


ALTER TABLE public.cocktail OWNER TO postgres;

--
-- TOC entry 188 (class 1259 OID 16390)
-- Name: cocktail_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.cocktail_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cocktail_id_seq OWNER TO postgres;

--
-- TOC entry 2249 (class 0 OID 0)
-- Dependencies: 188
-- Name: cocktail_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.cocktail_id_seq OWNED BY public.cocktail.id;


--
-- TOC entry 193 (class 1259 OID 16448)
-- Name: cruise; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cruise (
    id_code character varying(32) NOT NULL,
    name character varying(64),
    description text
);


ALTER TABLE public.cruise OWNER TO postgres;

--
-- TOC entry 195 (class 1259 OID 16456)
-- Name: day; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.day (
    id integer NOT NULL,
    name character varying(64),
    description text,
    id_cruise character varying(32),
    cocktail_of_the_day smallint
);


ALTER TABLE public.day OWNER TO postgres;

--
-- TOC entry 194 (class 1259 OID 16454)
-- Name: day_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.day_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.day_id_seq OWNER TO postgres;

--
-- TOC entry 2250 (class 0 OID 0)
-- Dependencies: 194
-- Name: day_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.day_id_seq OWNED BY public.day.id;


--
-- TOC entry 203 (class 1259 OID 16656)
-- Name: dinner_restaurant_view; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.dinner_restaurant_view AS
 SELECT restaurant.name,
    restaurant.restaurant_type,
    restaurant.location,
    restaurant.price,
    meal.time_open,
    meal.time_close
   FROM (public.restaurant
     LEFT JOIN public.meal ON (((meal.id_restaurant = restaurant.id) AND (meal.name = 'dinner'::public.meal_enum_type))));


ALTER TABLE public.dinner_restaurant_view OWNER TO postgres;

--
-- TOC entry 197 (class 1259 OID 16465)
-- Name: wine; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.wine (
    id integer NOT NULL,
    name character varying(64),
    description text,
    price_for_glass numeric(5,2) DEFAULT 5.95,
    price_for_bottle numeric(6,2) DEFAULT 29.95,
    picture character varying(255)
);


ALTER TABLE public.wine OWNER TO postgres;

--
-- TOC entry 201 (class 1259 OID 16611)
-- Name: dinner_view; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.dinner_view AS
 SELECT dish.id,
    dish.category,
    dish.name,
    dish.description,
    dish.picture AS dish_picture,
    wine.name AS wine_name,
    wine.description AS wine_description,
    wine.price_for_glass,
    wine.price_for_bottle,
    wine.picture AS wine_picture
   FROM (((public.dish
     LEFT JOIN public.wine ON ((dish.recomended_wine = wine.id)))
     LEFT JOIN public.meal ON ((dish.id_meal = meal.id)))
     LEFT JOIN public.restaurant ON ((meal.id_restaurant = restaurant.id)))
  WHERE (((dish.id_day = 0) OR (dish.id_day = 1)) AND (meal.name = 'dinner'::public.meal_enum_type) AND (restaurant.restaurant_type = 'traditional'::public.restaurant_enum_type))
  ORDER BY dish.id;


ALTER TABLE public.dinner_view OWNER TO postgres;

--
-- TOC entry 198 (class 1259 OID 16473)
-- Name: dish_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.dish_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dish_id_seq OWNER TO postgres;

--
-- TOC entry 2251 (class 0 OID 0)
-- Dependencies: 198
-- Name: dish_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.dish_id_seq OWNED BY public.dish.id;


--
-- TOC entry 202 (class 1259 OID 16643)
-- Name: dish_view; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.dish_view AS
 SELECT dish.id,
    dish.id_day,
    dish.category,
    dish.name,
    dish.description,
    dish.picture,
    wine.id AS wine_id,
    wine.name AS wine_name,
    restaurant.name AS restaurant_name,
    meal.name AS meal_name,
    restaurant.restaurant_type
   FROM (((public.dish
     LEFT JOIN public.wine ON ((dish.recomended_wine = wine.id)))
     LEFT JOIN public.meal ON ((dish.id_meal = meal.id)))
     LEFT JOIN public.restaurant ON ((meal.id_restaurant = restaurant.id)));


ALTER TABLE public.dish_view OWNER TO postgres;

--
-- TOC entry 200 (class 1259 OID 16603)
-- Name: lunch_view; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.lunch_view AS
 SELECT dish.id,
    dish.category,
    dish.name,
    dish.description,
    dish.picture AS dish_picture,
    restaurant.id AS restaurant_id,
    restaurant.name AS restaurant_name,
    meal.name AS meal_name,
    meal.time_open,
    meal.time_close,
    wine.name AS wine_name,
    wine.description AS wine_description,
    wine.price_for_glass,
    wine.price_for_bottle,
    wine.picture AS wine_picture
   FROM (((public.dish
     LEFT JOIN public.wine ON ((dish.recomended_wine = wine.id)))
     LEFT JOIN public.meal ON ((dish.id_meal = meal.id)))
     LEFT JOIN public.restaurant ON ((meal.id_restaurant = restaurant.id)))
  WHERE (((dish.id_day = 0) OR (dish.id_day = 1)) AND (meal.name = 'lunch'::public.meal_enum_type));


ALTER TABLE public.lunch_view OWNER TO postgres;

--
-- TOC entry 191 (class 1259 OID 16442)
-- Name: meal_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.meal_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.meal_id_seq OWNER TO postgres;

--
-- TOC entry 2252 (class 0 OID 0)
-- Dependencies: 191
-- Name: meal_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.meal_id_seq OWNED BY public.meal.id;


--
-- TOC entry 196 (class 1259 OID 16463)
-- Name: vine_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.vine_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.vine_id_seq OWNER TO postgres;

--
-- TOC entry 2253 (class 0 OID 0)
-- Dependencies: 196
-- Name: vine_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.vine_id_seq OWNED BY public.wine.id;


--
-- TOC entry 2072 (class 2604 OID 16395)
-- Name: cocktail id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cocktail ALTER COLUMN id SET DEFAULT nextval('public.cocktail_id_seq'::regclass);


--
-- TOC entry 2076 (class 2604 OID 16459)
-- Name: day id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.day ALTER COLUMN id SET DEFAULT nextval('public.day_id_seq'::regclass);


--
-- TOC entry 2080 (class 2604 OID 16478)
-- Name: dish id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dish ALTER COLUMN id SET DEFAULT nextval('public.dish_id_seq'::regclass);


--
-- TOC entry 2075 (class 2604 OID 16447)
-- Name: meal id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.meal ALTER COLUMN id SET DEFAULT nextval('public.meal_id_seq'::regclass);


--
-- TOC entry 2077 (class 2604 OID 16468)
-- Name: wine id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wine ALTER COLUMN id SET DEFAULT nextval('public.vine_id_seq'::regclass);


--
-- TOC entry 2229 (class 0 OID 16392)
-- Dependencies: 189
-- Data for Name: cocktail; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.cocktail (id, name, description, price, picture, id_day) VALUES (1, 'Long Island Iced Tea', 'The Long Island Iced Tea is a popular mixed drink that, despite its name, contains no tea. It is one of those mixed drinks that tastes good going down but can quickly sneak up on you. It''s best to take it easy with this one. The LIIT''s ingredient list is long, but the recipe is very easy to remember: five white distilled spirits (vodka, gin, tequila, light rum, triple sec), a shot of sour mix, topped with cola and served over ice', 6.95, 'lit.jpg', 1);
INSERT INTO public.cocktail (id, name, description, price, picture, id_day) VALUES (2, 'Margarita', 'A margarita is a cocktail consisting of tequila, orange liqueur, and lime juice often served with salt on the rim of the glass. The drink is served shaken with ice (on the rocks), blended with ice (frozen margarita), or without ice (straight)', 4.95, 'margarita.jpg', 1);


--
-- TOC entry 2254 (class 0 OID 0)
-- Dependencies: 188
-- Name: cocktail_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cocktail_id_seq', 1, false);


--
-- TOC entry 2233 (class 0 OID 16448)
-- Dependencies: 193
-- Data for Name: cruise; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.cruise (id_code, name, description) VALUES ('ship1_cruise_t1', 'test cruise', NULL);


--
-- TOC entry 2235 (class 0 OID 16456)
-- Dependencies: 195
-- Data for Name: day; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.day (id, name, description, id_cruise, cocktail_of_the_day) VALUES (1, 'first sea day', 'sea day for testing purpuses', 'ship1_cruise_t1', 1);
INSERT INTO public.day (id, name, description, id_cruise, cocktail_of_the_day) VALUES (0, 'always', 'for always available purpose', 'ship1_cruise_t1', NULL);


--
-- TOC entry 2255 (class 0 OID 0)
-- Dependencies: 194
-- Name: day_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.day_id_seq', 1, false);


--
-- TOC entry 2239 (class 0 OID 16475)
-- Dependencies: 199
-- Data for Name: dish; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.dish (id, name, description, picture, category, id_meal, recomended_wine, id_day) VALUES (4, 'Cereals', 'Hot: oatmeal with cream or milk. Cold: Cornflakes, Granola, All Bran, Grape Nuts, Frosted Flakes, Raisin Bran and Mueslix', NULL, 'breakfast', 2, NULL, 0);
INSERT INTO public.dish (id, name, description, picture, category, id_meal, recomended_wine, id_day) VALUES (29, 'Escargots Bourguignon', 'snails glazed with shallots, parsley and garlic butter', 'd2.jpg', 'appetizer', 4, 4, 1);
INSERT INTO public.dish (id, name, description, picture, category, id_meal, recomended_wine, id_day) VALUES (3, 'Compotes', 'stewed prunes, cinnamon-flawored fresh apple wedges', NULL, 'breakfast', 2, NULL, 0);
INSERT INTO public.dish (id, name, description, picture, category, id_meal, recomended_wine, id_day) VALUES (17, 'Belgian Endive Salad', 'Belgian Endive, Boston Lettuce & Tomato', 'l4.jpg', 'salad', 3, NULL, 1);
INSERT INTO public.dish (id, name, description, picture, category, id_meal, recomended_wine, id_day) VALUES (27, 'Cassata alla Siciliana', 'Ice Cream Trilogy with Candied Fruits', 'l14.jpg', 'dessert', 3, NULL, 1);
INSERT INTO public.dish (id, name, description, picture, category, id_meal, recomended_wine, id_day) VALUES (18, 'Pan-Fried Filet of Rockfish', 'Pan-Fried Filet of Rockfish Vichyssoise served over creamy potato and leek ragout, truffle oil', 'l5.jpg', 'mc', 3, 4, 1);
INSERT INTO public.dish (id, name, description, picture, category, id_meal, recomended_wine, id_day) VALUES (5, 'Yogurt', 'plain of fruit flavored', NULL, 'breakfast', 2, NULL, 0);
INSERT INTO public.dish (id, name, description, picture, category, id_meal, recomended_wine, id_day) VALUES (40, 'Broiled Lobster Tail and King Prawns', 'with Lemon Butter Fondue paired with a side of grilled asparagus and rice pilaf', 'd13.jpg', 'mc', 4, 4, 1);
INSERT INTO public.dish (id, name, description, picture, category, id_meal, recomended_wine, id_day) VALUES (38, 'Red Wine and Shiitake Braised Beef Short Ribs', 'served with a side of root vegetables, baby onions and horseradish mash', 'd11.jpg', 'mc', 4, 5, 1);
INSERT INTO public.dish (id, name, description, picture, category, id_meal, recomended_wine, id_day) VALUES (37, 'Roasted Tom Turkey with "All The Trimmings"', 'giblet gravy, cranberry relish, apple & raisin stuffing, corn bread and sweet potato', 'd10.jpg', 'mc', 4, 3, 1);
INSERT INTO public.dish (id, name, description, picture, category, id_meal, recomended_wine, id_day) VALUES (33, 'Potato Gnocchi', 'Pumpkin and Golden Potato Gnocchi White Truffle Cream', 'd6.jpg', 'pasta', 4, 3, 1);
INSERT INTO public.dish (id, name, description, picture, category, id_meal, recomended_wine, id_day) VALUES (31, 'Marinated Vegetable Antipasto with Basil Oil', 'grilled eggplant, zucchini, bell peppers and tomatoes', 'd4.jpg', 'appetizer', 4, NULL, 1);
INSERT INTO public.dish (id, name, description, picture, category, id_meal, recomended_wine, id_day) VALUES (32, 'Mesclun Greens Salad', 'Mesclun Greens, Daikon Juliennes and Baby Tomatoes', 'd5.jpg', 'salad', 4, NULL, 1);
INSERT INTO public.dish (id, name, description, picture, category, id_meal, recomended_wine, id_day) VALUES (35, 'Chilled Creamed Coconut Soup', 'sweet, cool and smooth, garnished with lychees', 'd8.jpg', 'soup', 4, NULL, 1);
INSERT INTO public.dish (id, name, description, picture, category, id_meal, recomended_wine, id_day) VALUES (60, 'Crema al Cafe', 'Coffee crème brulee', 's15.jpg', 'dessert', 8, 1, 1);
INSERT INTO public.dish (id, name, description, picture, category, id_meal, recomended_wine, id_day) VALUES (51, 'Insalata Mista Capricciosa Profumata con Aceto Balsamico', 'Tender Baby Field Greens with Pecorino Cheese, Chef''s Vinaigrette', 's6.jpg', 'salad', 8, NULL, 1);
INSERT INTO public.dish (id, name, description, picture, category, id_meal, recomended_wine, id_day) VALUES (49, 'Sformato di Carciofi Gratinati al Castelrosso', 'Twice Baked Artichoke Soufflé with Castelrosso Cheese Sauce', 's4.jpg', 'appetizer', 8, 6, 0);
INSERT INTO public.dish (id, name, description, picture, category, id_meal, recomended_wine, id_day) VALUES (52, 'Zuppa di Pomodoro con Frutti di Mare', 'Tomato Soup, Grilled Shellfish with Baguette Croutons', 's7.jpg', 'soup', 8, NULL, 0);
INSERT INTO public.dish (id, name, description, picture, category, id_meal, recomended_wine, id_day) VALUES (55, 'Tris d''Aragosta', 'Lobster Three Ways - Lobster Tail, Lobster Risotto and Lobster Bisque Sauce', 's10.jpg', 'mc', 8, 4, 1);
INSERT INTO public.dish (id, name, description, picture, category, id_meal, recomended_wine, id_day) VALUES (54, 'Linguine alle Vongole con Pomodori Pachino', 'Linguine Pasta in a Red Clam Sauce with Cherry Tomatoes and Fresh Herbs', 's9.jpg', 'pasta', 8, 4, 1);
INSERT INTO public.dish (id, name, description, picture, category, id_meal, recomended_wine, id_day) VALUES (36, 'Cock-a-Leekie Soup', 'warming chicken broth with rice, leeks and scallions', 'd9.jpg', 'soup', 4, NULL, 1);
INSERT INTO public.dish (id, name, description, picture, category, id_meal, recomended_wine, id_day) VALUES (72, 'S''Mores Stack Graham Cracker', 'Seven Layer S''Mores Stack Graham Cracker, Marshmallow Milk Chocolate', 'c12.jpg', 'dessert', 9, 1, 1);
INSERT INTO public.dish (id, name, description, picture, category, id_meal, recomended_wine, id_day) VALUES (56, 'Spiedini di Pollo con Polenta e Asiago in Salsa al Marsala', 'Chicken Skewers with Soft Sage Polenta, Asiago, and Marsala Wine Sauce', 's11.jpg', 'mc', 8, 3, 1);
INSERT INTO public.dish (id, name, description, picture, category, id_meal, recomended_wine, id_day) VALUES (12, 'Mother''s Favorite Compote', 'Kagota figs, yellow peaches and batlett pears mashed and garnished with strawberry', 'sp2.jpg', 'breakfast', 2, NULL, 1);
INSERT INTO public.dish (id, name, description, picture, category, id_meal, recomended_wine, id_day) VALUES (8, 'Grill ang Griddle', 'Fluffy buttermilk pancakes with syrup, rasher of bacon, ham steak, link sausage or hash brown potatoes', 'br3.jpg', 'breakfast', 2, NULL, 0);
INSERT INTO public.dish (id, name, description, picture, category, id_meal, recomended_wine, id_day) VALUES (19, 'Eggplant Fritters with Fried Basmati Rice', 'juicy mango cheek and spicy tomato sauce', 'l6.jpg', 'mc', 3, 3, 1);
INSERT INTO public.dish (id, name, description, picture, category, id_meal, recomended_wine, id_day) VALUES (50, 'Sapori d''Italia', 'Prosciutto on Rosemary Flat bread, Marinated Green & Black Olives & Grissini Focaccia Sticks', 's5.jpg', 'appetizer', 8, 6, 1);
INSERT INTO public.dish (id, name, description, picture, category, id_meal, recomended_wine, id_day) VALUES (45, 'Crespelle Cipriani', 'Venetian Crepes with Apple Compote gratinated venetian style crepes with apple compote filling, vanilla custard', 'd18.jpg', 'dessert', 4, 6, 1);
INSERT INTO public.dish (id, name, description, picture, category, id_meal, recomended_wine, id_day) VALUES (44, 'Hazelnut Semifreddo', 'praline crunch and caramel drizzle', 'd17.jpg', 'dessert', 4, 4, 1);
INSERT INTO public.dish (id, name, description, picture, category, id_meal, recomended_wine, id_day) VALUES (42, 'Sugar-Free Strawberry Napoleon', 'peppered mascarpone cream', 'd15.jpg', 'dessert', 4, 4, 1);
INSERT INTO public.dish (id, name, description, picture, category, id_meal, recomended_wine, id_day) VALUES (46, 'Anatra alle Fave con Pancetta di Colonnata e Mostarda di Cremona', 'Duck with Fava Beans, Pancetta and Mostarda di Cremona', 's1.jpg', 'appetizer', 8, 5, 0);
INSERT INTO public.dish (id, name, description, picture, category, id_meal, recomended_wine, id_day) VALUES (41, 'Grilled Vegetables ', 'with Chives and Hearts of Romaine', 'd14.jpg', 'mc', 4, 3, 0);
INSERT INTO public.dish (id, name, description, picture, category, id_meal, recomended_wine, id_day) VALUES (28, 'Shrimp Cocktail with Horseradish Spiked Cocktail Sauce', 'an American classic with horseradish spiked cocktail sauce', 'd1.jpg', 'appetizer', 4, 3, 1);
INSERT INTO public.dish (id, name, description, picture, category, id_meal, recomended_wine, id_day) VALUES (26, 'Banana Cream Pie with Bavarian Cream', 'chocolate-vanilla swirl', 'l13.jpg', 'dessert', 3, 5, 1);
INSERT INTO public.dish (id, name, description, picture, category, id_meal, recomended_wine, id_day) VALUES (24, 'Ravioli di Vitello in Salsa di Funghi Porcini', 'veal ravioli in creamy porcini mushroom sauce', 'l11.jpg', 'pasta', 3, 5, 1);
INSERT INTO public.dish (id, name, description, picture, category, id_meal, recomended_wine, id_day) VALUES (25, 'Sugar-Free Mango Cheesecake', 'Sugar-Free Mango Cheesecake,  Mango Salsa', 'l12.jpg', 'dessert', 3, NULL, 0);
INSERT INTO public.dish (id, name, description, picture, category, id_meal, recomended_wine, id_day) VALUES (22, 'Grilled New York Cut Strip Steak with Green Peppercorn Sauce', 'thyme-roasted asparagus, charred tomato, zucchini and Lyonnaise potatoes', 'l9.jpg', 'mc', 3, 2, 1);
INSERT INTO public.dish (id, name, description, picture, category, id_meal, recomended_wine, id_day) VALUES (21, 'Pan-Seared Corn-Fed Chicken with Thyme Jus', 'lightly seasoned boneless breast, vegetables of the day and roast potatoes', 'l8.jpg', 'mc', 3, 4, 1);
INSERT INTO public.dish (id, name, description, picture, category, id_meal, recomended_wine, id_day) VALUES (20, 'Mariner-Style Black Mussels in White Wine Sauce', 'with home-style garlic bread and French fries', 'l7.jpg', 'mc', 3, 4, 1);
INSERT INTO public.dish (id, name, description, picture, category, id_meal, recomended_wine, id_day) VALUES (2, 'Fresh Friuts', 'half greapfruit, orange segments, papaya or melon in season, sliced banana', 'br1.jpg', 'breakfast', 2, NULL, 0);
INSERT INTO public.dish (id, name, description, picture, category, id_meal, recomended_wine, id_day) VALUES (6, 'From the sea', 'Smoked salmon, toasted bagel and cream cheese', 'br4.jpg', 'breakfast', 2, NULL, 0);
INSERT INTO public.dish (id, name, description, picture, category, id_meal, recomended_wine, id_day) VALUES (7, 'Egg dishes', 'fried eggs, poached aggs on toast, soft boiled eggs, scramble eggs. Omelettes: plain, mushroom or ham and cheese', 'br2.jpg', 'breakfast', 2, NULL, 0);
INSERT INTO public.dish (id, name, description, picture, category, id_meal, recomended_wine, id_day) VALUES (47, 'Burrata alla Panna con Carpaccio di Pomodori', 'Hand-Formed Cow''s Milk Cheese with Creamy Lava Center on Tomato Carpaccio, Balsamic Syrup', 's2.jpg', 'appetizer', 8, 4, 1);
INSERT INTO public.dish (id, name, description, picture, category, id_meal, recomended_wine, id_day) VALUES (39, 'Fileto di Mahi Mahi alla Griglia', 'grilled mahi mahi filet with herb butter, garlic-sautéed swiss chard and caponata of bell pepper, onion & eggplant, saffron-infused potatoes', 'd12.jpg', 'mc', 4, 3, 1);
INSERT INTO public.dish (id, name, description, picture, category, id_meal, recomended_wine, id_day) VALUES (62, 'Carpaccio of Pine-Nut Coated Lamb Loin', 'Lamb Loin, Gooseberry Chutney, Minted Pear Spaghettini', 'c2.jpg', 'appetizer', 9, 3, 0);
INSERT INTO public.dish (id, name, description, picture, category, id_meal, recomended_wine, id_day) VALUES (69, 'Porterhouse', '22 oz - The Best Filet Grilled on the Bone', 'c9.jpg', 'mc', 9, 2, 0);
INSERT INTO public.dish (id, name, description, picture, category, id_meal, recomended_wine, id_day) VALUES (61, 'Mediterranean Style Spiny Lobster Cake', 'Tarragon foam, cured olives, grilled asparagus', 'c1.jpg', 'appetizer', 9, 3, 0);
INSERT INTO public.dish (id, name, description, picture, category, id_meal, recomended_wine, id_day) VALUES (70, 'New York Strip', 'Traditional Thick Cut Sirloin - 12 oz', 'c10.jpg', 'mc', 9, 2, 0);
INSERT INTO public.dish (id, name, description, picture, category, id_meal, recomended_wine, id_day) VALUES (74, 'Rib Eye', 'Rich with Heavy Marbling - 14 oz', 'c14.jpg', 'mc', 9, 2, 0);
INSERT INTO public.dish (id, name, description, picture, category, id_meal, recomended_wine, id_day) VALUES (9, 'From our bakery', 'Soft and crusty rolls, croissant, danish pastries, english muffins, friut and grain muffins, six-grain bread', NULL, 'breakfast', 2, NULL, 0);
INSERT INTO public.dish (id, name, description, picture, category, id_meal, recomended_wine, id_day) VALUES (15, 'Classic Caesar Salad', 'crisp romaine lettuce, caesar dressing, parmesan cheese and herb croutons; anchovies upon request', 'l2.jpg', 'salad', 3, 3, 0);
INSERT INTO public.dish (id, name, description, picture, category, id_meal, recomended_wine, id_day) VALUES (34, 'Fettuccine Alfredo in Crisp Parmesan Basket', 'an all-time Princess favorite rich, comforting and entirely satisfying', 'd7.jpg', 'pasta', 4, 3, 0);
INSERT INTO public.dish (id, name, description, picture, category, id_meal, recomended_wine, id_day) VALUES (10, 'Beverages', 'Regular and herbal tea, regular and decaffeinated american coffee, hot chocolate, milk and skim milk', NULL, 'breakfast', 2, NULL, 0);
INSERT INTO public.dish (id, name, description, picture, category, id_meal, recomended_wine, id_day) VALUES (11, 'Eggs Benedict', 'Two poached eggs and canadian bacon on toasted english muffins topped with hollandaise sause', 'sp1.jpg', 'breakfast', 2, NULL, 1);
INSERT INTO public.dish (id, name, description, picture, category, id_meal, recomended_wine, id_day) VALUES (1, 'Chilled juice', 'Orange, Apple, Prune, Tomato, Pineapple', NULL, 'breakfast', 2, NULL, 0);
INSERT INTO public.dish (id, name, description, picture, category, id_meal, recomended_wine, id_day) VALUES (16, 'Roasted Tomato Cream Soup', 'brioche croutons and basil pesto swirl', 'l3.jpg', 'soup', 3, NULL, 1);
INSERT INTO public.dish (id, name, description, picture, category, id_meal, recomended_wine, id_day) VALUES (30, 'Seasonal Field Greens', 'with Shredded Carrots and Cherry Tomatoes', 'd3.jpg', 'salad', 4, NULL, 0);
INSERT INTO public.dish (id, name, description, picture, category, id_meal, recomended_wine, id_day) VALUES (14, 'Thai Lettuce Wraps with Cucumber & Beansprouts', 'grilled spring onions and silky tofu in rice paper, roasted chili & rice wine vinaigrette', 'l1.jpg', 'appetizer', 3, NULL, 1);
INSERT INTO public.dish (id, name, description, picture, category, id_meal, recomended_wine, id_day) VALUES (73, 'Dutch Chocolate Fudge', 'Molten Dutch Chocolate Fudge Obsession, Double Chocolate Ice Cream', 'c13.jpg', 'dessert', 9, 1, 1);
INSERT INTO public.dish (id, name, description, picture, category, id_meal, recomended_wine, id_day) VALUES (59, 'Semi-Freddo', 'al Cioccolato  Bianco Soffice e Limoncello', 's14.jpg', 'dessert', 8, 6, 0);
INSERT INTO public.dish (id, name, description, picture, category, id_meal, recomended_wine, id_day) VALUES (71, 'Wisconsin Veal Chop', 'Madeira-Glazed Wisconsin Veal Chop - Fine Herbs', 'c11.jpg', 'mc', 9, 2, 1);
INSERT INTO public.dish (id, name, description, picture, category, id_meal, recomended_wine, id_day) VALUES (68, 'Chilean Sea Bass and Brioche Breaded King Prawns', 'Leeks and Mushroom Ragout, Champagne Mousseline', 'c8.jpg', 'mc', 9, 4, 1);
INSERT INTO public.dish (id, name, description, picture, category, id_meal, recomended_wine, id_day) VALUES (67, 'Maine Lobster Tails', '4 oz. Maine Lobster Tails, Broiled with Pepper Butter or Split & Grilled with Garlic', 'c7.jpg', 'mc', 9, 4, 1);
INSERT INTO public.dish (id, name, description, picture, category, id_meal, recomended_wine, id_day) VALUES (65, 'Marinated Goats Cheese and Heirloom Tomato Salad', 'Baby Spinach, Yellow Beets, Opal Basil Vinaigrette', 'c5.jpg', 'salad', 9, 4, 1);
INSERT INTO public.dish (id, name, description, picture, category, id_meal, recomended_wine, id_day) VALUES (63, 'Black Tiger Prawn and Papaya Salpicon', 'Tiger Shrimps and Papaya Salpicon, Mustard Seed Aioli, Anna Potato Salad', 'c3.jpg', 'appetizer', 9, 3, 1);
INSERT INTO public.dish (id, name, description, picture, category, id_meal, recomended_wine, id_day) VALUES (58, 'Bistecca Toscana', '10 oz Strip Steak with Rosemary, Garlic and a Touch of our own Extra-Virgin Olive Oil', 's13.jpg', 'mc', 8, 2, 1);
INSERT INTO public.dish (id, name, description, picture, category, id_meal, recomended_wine, id_day) VALUES (57, 'Branzino in Crosta di Salae', 'Baked sea Bass in Herbed Salt Crust, Grilled Asparagus and Parsley Potatoes', 's12.jpg', 'mc', 8, 4, 1);
INSERT INTO public.dish (id, name, description, picture, category, id_meal, recomended_wine, id_day) VALUES (48, 'Calamari Fritti', 'Crisp Fried Baby Squid in a Cone, Lemon Garlic Dip', 's3.jpg', 'appetizer', 8, 6, 1);
INSERT INTO public.dish (id, name, description, picture, category, id_meal, recomended_wine, id_day) VALUES (64, 'Black and Blue Onion Soup', 'Fresh Thyme, Jack Daniels, Roquefort Crust', 'c4.jpg', 'soup', 9, NULL, 1);
INSERT INTO public.dish (id, name, description, picture, category, id_meal, recomended_wine, id_day) VALUES (66, 'The Grill Salad', 'Grape-Balsamic Dressing Mesclun Greens, Roasted Bell Peppers, Hass Avocado', 'c6.jpg', 'salad', 9, NULL, 1);
INSERT INTO public.dish (id, name, description, picture, category, id_meal, recomended_wine, id_day) VALUES (53, 'Farfalle alla Sorrentina', 'Bow Tie Pasta with Fresh Tomato Sauce, Savory Meatballs, Sweet Basil and Mozzarella Cheese', 's8.jpg', 'pasta', 8, 3, 1);
INSERT INTO public.dish (id, name, description, picture, category, id_meal, recomended_wine, id_day) VALUES (23, 'Mac n Cheese with Bay Shrimp and Baby Scallops', 'elbow macaroni baked with lobster bisque and cheese sauce topped with crisp bacon bits', 'l10.jpg', 'pasta', 3, 3, 0);
INSERT INTO public.dish (id, name, description, picture, category, id_meal, recomended_wine, id_day) VALUES (43, 'Traditional Pumpkin Pie', 'with whipped cream', 'd16.jpg', 'dessert', 4, NULL, 1);


--
-- TOC entry 2256 (class 0 OID 0)
-- Dependencies: 198
-- Name: dish_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.dish_id_seq', 1, true);


--
-- TOC entry 2232 (class 0 OID 16444)
-- Dependencies: 192
-- Data for Name: meal; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.meal (id, id_restaurant, name, time_open, time_close) VALUES (1, 1, 'dinner', '17:30:00', '22:00:00');
INSERT INTO public.meal (id, id_restaurant, name, time_open, time_close) VALUES (2, 2, 'breakfast', '07:00:00', '09:00:00');
INSERT INTO public.meal (id, id_restaurant, name, time_open, time_close) VALUES (3, 2, 'lunch', '12:00:00', '13:30:00');
INSERT INTO public.meal (id, id_restaurant, name, time_open, time_close) VALUES (4, 2, 'dinner', '17:30:00', '22:00:00');
INSERT INTO public.meal (id, id_restaurant, name, time_open, time_close) VALUES (7, 3, 'dinner', '20:00:00', NULL);
INSERT INTO public.meal (id, id_restaurant, name, time_open, time_close) VALUES (6, 3, 'dinner', '17:45:00', NULL);
INSERT INTO public.meal (id, id_restaurant, name, time_open, time_close) VALUES (8, 4, 'dinner', '18:00:00', '23:00:00');
INSERT INTO public.meal (id, id_restaurant, name, time_open, time_close) VALUES (9, 5, 'dinner', '18:00:00', '23:00:00');


--
-- TOC entry 2257 (class 0 OID 0)
-- Dependencies: 191
-- Name: meal_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.meal_id_seq', 1, true);


--
-- TOC entry 2230 (class 0 OID 16435)
-- Dependencies: 190
-- Data for Name: restaurant; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.restaurant (id, name, location, description, picture, restaurant_type, price) VALUES (1, 'Bernini', 'DK 6 Midship', 'Anytime dining offers flexibility, with the same freedom as land-based nights out. Show up in the designated dining room whenever you feel like it, between 5:30 p.m. and 10 p.m., to free yourself from the "hurry up and get dressed for dinner" rush that all too often comes after a long and active day in port.', 'bernini.jpg', 'traditional', NULL);
INSERT INTO public.restaurant (id, name, location, description, picture, restaurant_type, price) VALUES (2, 'Donatello', 'DK 5 Midship', 'The Donatello Dining Room on the Golden Princess is one of three main dining rooms and is open for breakfast, lunch, afternoon tea and dining.', 'donatello.jpg', 'traditional', NULL);
INSERT INTO public.restaurant (id, name, location, description, picture, restaurant_type, price) VALUES (3, 'Canaletto', 'DK 5 Aft', 'Harkening back to the Golden Era of sea travel, our Traditional Dining option allows you to dine at the same time each day and enjoy the same tablemates and waitstaff throughout your voyage. Choose from either early or late seating.', 'canaletto.jpg', 'traditional', NULL);
INSERT INTO public.restaurant (id, name, location, description, picture, restaurant_type, price) VALUES (4, 'Sabatini''s', 'DK 7 Aft', 'Our Italian specialty restaurant has been voted one of the “Best Cruise Ship Specialty Restaurants” at sea by USA TODAY. Savor Sabatini’s authentic offerings featuring signature pastas, Italian wines and an irresistible selection of delectable desserts, all celebrating our Italian culinary heritage.', 'sabatinis.jpg', 'italian', 20.00);
INSERT INTO public.restaurant (id, name, location, description, picture, restaurant_type, price) VALUES (5, 'Crown Grill', 'DK 7 Fw', 'With a rich wood décor and a theater-style kitchen, it’s no wonder Crown Grill was named among the “Best Cruise Ship Steakhouses” by USA TODAY. Featuring premium aged beef and fresh seafood items, this specialty restaurant offers an intimate dining experience in a classically elegant setting and an open kitchen where chefs prepare and cook to order top-quality cuts of beef, chops and seafood.', 'crowngrill.jpg', 'steak', 25.00);


--
-- TOC entry 2258 (class 0 OID 0)
-- Dependencies: 187
-- Name: restaurant_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.restaurant_id_seq', 39, true);


--
-- TOC entry 2259 (class 0 OID 0)
-- Dependencies: 196
-- Name: vine_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.vine_id_seq', 2, true);


--
-- TOC entry 2237 (class 0 OID 16465)
-- Dependencies: 197
-- Data for Name: wine; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.wine (id, name, description, price_for_glass, price_for_bottle, picture) VALUES (2, 'Cabernet Sauvignon Sylvester', 'Sylvester is a winery that starts to produce wine in California in 1969 in an area called Paso Robles Valley. Is owned by a family that originally came from Austria and start growing grapes after the Second World War. And was so successful and grew so rapidly that soon had to bye some grapes from other Californian district.
This wine have an intense ruby color, it has unusual aromas of ripe fruit (cherry), harmoniously combined with fresh oak wood. In the taste is soft and round with smooth and round tannins and has a very elegant warm and velvety finish. Live in your palate a long and pleasant aftertaste.
Great value considering price and qualities.
', 5.95, 29.95, 'cabs.jpg');
INSERT INTO public.wine (id, name, description, price_for_glass, price_for_bottle, picture) VALUES (4, 'Pinot Grigio Danzante', 'Danzante Pinot Grigio is a light, crisp and dry white wine whose citrus flavours are versatile in food pairings. In Italy, this wine is a classic as an aperitif, enjoyed with nuts and crostini. It is recommended with fish, seafood and creamy chowders and marries perfectly with chicken, turkey and light cheese courses such as mozzarella.', 6.95, 32.95, 'pgd.jpg');
INSERT INTO public.wine (id, name, description, price_for_glass, price_for_bottle, picture) VALUES (5, 'Merlot Round Hill California', 'A soft drinkable Merlot with smokey, ripe blueberry and raspberry notes. Notice the hints of currant, dark cherries, juicy ripe raspberries and soft tannins. Mouthwatering and succulent, soft vanilla spice and red fruit aromas follow through on a medium bodied palate with smooth, rounded mouth feel that finishes with delicious raspberry and currant flavors', 5.95, 29.95, 'merlotrh.jpg');
INSERT INTO public.wine (id, name, description, price_for_glass, price_for_bottle, picture) VALUES (1, 'Champagne Veuve Clicquot', 'CHAMPAGNE is sparkling wine that comes only from CHAMPAGNE region Northern part of France about 90 miles north of Paris and covers around 85 000 acres of vineyards. Wine of France. ''Only one quality, the finest''. This is the motto of the House of Veuve Clicquot Ponsardin, founded in 1772. This cuvée bears the famous ''Clicquot Yellow'' label, a symbol of excellence. By Appointment to H.M. Queen Elizabeth II Purveyors of Champagne Veuve Clicquot Ponsardin Reims France. Paring CHAMPAGNE WITH FOOD it will go very well with anything from the Appetizer to Dessert.
However Chocolate, Strawberries and Caviar and classic matches for champagne.
', NULL, 69.95, 'vc.png');
INSERT INTO public.wine (id, name, description, price_for_glass, price_for_bottle, picture) VALUES (3, 'Chardonnay Kendall-Jackson Vintner''s Reserve ', 'This exceptionally high quality wine is bursting with tropical flavors such as mango and pineapple. Delightful aromas and flavors of peach, Gala apple, lemon, lime and pear are layered with butterscotch and subtle toasty oak. Fat and sensual, yet dry and balanced with a long, lightly-creamy finish
', 6.95, 32.00, 'chardkj.jpg');
INSERT INTO public.wine (id, name, description, price_for_glass, price_for_bottle, picture) VALUES (6, 'Sparkling wine Asti Spumante Martini & Rossi', 'Asti Spumante is a medium sweet sparkling wine produced in the northern part of Italy, in Piemonte with a variety of grape call Moscato.  
There are four method of putting sparkle in the wine, traditional, tank, transfer and injection. 
Asti spumante is made by a unique version of a tank method using only one fermentation by adding yeast and sugar to a dry wine and stopped at about 8% alcohol leaving naturally sweet wine. Is a wine that is served very cold so you can enjoy his rich fruity flavor and sweetness that are to be appreciated any time during the day or with any meal and especially with desserts.', NULL, 32.95, 'asti.jpg');


--
-- TOC entry 2084 (class 2606 OID 16486)
-- Name: cocktail pk_cocktail; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cocktail
    ADD CONSTRAINT pk_cocktail PRIMARY KEY (id);


--
-- TOC entry 2091 (class 2606 OID 16488)
-- Name: cruise pk_cruise; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cruise
    ADD CONSTRAINT pk_cruise PRIMARY KEY (id_code);


--
-- TOC entry 2093 (class 2606 OID 16484)
-- Name: day pk_day; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.day
    ADD CONSTRAINT pk_day PRIMARY KEY (id);


--
-- TOC entry 2098 (class 2606 OID 16490)
-- Name: dish pk_dish; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dish
    ADD CONSTRAINT pk_dish PRIMARY KEY (id);


--
-- TOC entry 2089 (class 2606 OID 16492)
-- Name: meal pk_meal; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.meal
    ADD CONSTRAINT pk_meal PRIMARY KEY (id);


--
-- TOC entry 2086 (class 2606 OID 16494)
-- Name: restaurant pk_restaurant; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.restaurant
    ADD CONSTRAINT pk_restaurant PRIMARY KEY (id);


--
-- TOC entry 2095 (class 2606 OID 16496)
-- Name: wine pk_vine; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wine
    ADD CONSTRAINT pk_vine PRIMARY KEY (id);


--
-- TOC entry 2096 (class 1259 OID 16564)
-- Name: dish_name_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX dish_name_index ON public.dish USING btree (name);


--
-- TOC entry 2087 (class 1259 OID 16563)
-- Name: meal_name_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX meal_name_index ON public.meal USING btree (name);


--
-- TOC entry 2101 (class 2606 OID 16497)
-- Name: day fk_cruise_day; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.day
    ADD CONSTRAINT fk_cruise_day FOREIGN KEY (id_cruise) REFERENCES public.cruise(id_code) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2099 (class 2606 OID 16507)
-- Name: cocktail fk_day_cocktail; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cocktail
    ADD CONSTRAINT fk_day_cocktail FOREIGN KEY (id_day) REFERENCES public.day(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2103 (class 2606 OID 16518)
-- Name: dish fk_day_dish; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dish
    ADD CONSTRAINT fk_day_dish FOREIGN KEY (id_day) REFERENCES public.day(id);


--
-- TOC entry 2102 (class 2606 OID 16512)
-- Name: dish fk_meal_dish; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dish
    ADD CONSTRAINT fk_meal_dish FOREIGN KEY (id_meal) REFERENCES public.meal(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2100 (class 2606 OID 16531)
-- Name: meal fk_reataurant_meal; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.meal
    ADD CONSTRAINT fk_reataurant_meal FOREIGN KEY (id_restaurant) REFERENCES public.restaurant(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2104 (class 2606 OID 16523)
-- Name: dish fk_wine_dish; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dish
    ADD CONSTRAINT fk_wine_dish FOREIGN KEY (recomended_wine) REFERENCES public.wine(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2247 (class 0 OID 0)
-- Dependencies: 7
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: postgres
--

GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2018-06-25 04:41:37

--
-- PostgreSQL database dump complete
--

