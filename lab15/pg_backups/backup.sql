--
-- PostgreSQL database dump
--

\restrict fgkTYJaj4kbZgdybHnF7VIfrwVbo0S0pMgK2pnp9Hokuy5S44zK3bLyL4RzulPn

-- Dumped from database version 16.10 (Ubuntu 16.10-0ubuntu0.24.04.1)
-- Dumped by pg_dump version 16.10 (Ubuntu 16.10-0ubuntu0.24.04.1)

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
-- Name: accounts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.accounts (
    account_id integer NOT NULL,
    owner_name text NOT NULL,
    balance numeric(12,2) NOT NULL,
    CONSTRAINT accounts_balance_check CHECK ((balance >= (0)::numeric))
);


ALTER TABLE public.accounts OWNER TO postgres;

--
-- Name: accounts_tx; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.accounts_tx (
    account_id integer NOT NULL,
    owner_name text NOT NULL,
    balance numeric(12,2) NOT NULL,
    CONSTRAINT accounts_tx_balance_check CHECK ((balance >= (0)::numeric))
);


ALTER TABLE public.accounts_tx OWNER TO postgres;

--
-- Name: audit_log; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.audit_log (
    audit_id bigint NOT NULL,
    action text NOT NULL,
    ts timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.audit_log OWNER TO postgres;

--
-- Name: audit_log_audit_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.audit_log_audit_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.audit_log_audit_id_seq OWNER TO postgres;

--
-- Name: audit_log_audit_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.audit_log_audit_id_seq OWNED BY public.audit_log.audit_id;


--
-- Name: audit_log_tx; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.audit_log_tx (
    audit_id bigint NOT NULL,
    action text NOT NULL,
    ts timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.audit_log_tx OWNER TO postgres;

--
-- Name: audit_log_tx_audit_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.audit_log_tx_audit_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.audit_log_tx_audit_id_seq OWNER TO postgres;

--
-- Name: audit_log_tx_audit_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.audit_log_tx_audit_id_seq OWNED BY public.audit_log_tx.audit_id;


--
-- Name: blog_posts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.blog_posts (
    post_id integer NOT NULL,
    title character varying(200) NOT NULL,
    content text,
    author character varying(100),
    published_date timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.blog_posts OWNER TO postgres;

--
-- Name: blog_posts_post_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.blog_posts_post_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.blog_posts_post_id_seq OWNER TO postgres;

--
-- Name: blog_posts_post_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.blog_posts_post_id_seq OWNED BY public.blog_posts.post_id;


--
-- Name: book_authors; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.book_authors (
    book_id integer NOT NULL,
    author_id integer NOT NULL
);


ALTER TABLE public.book_authors OWNER TO postgres;

--
-- Name: comments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.comments (
    comment_id integer NOT NULL,
    post_id integer NOT NULL,
    commenter_name character varying(100),
    comment_text text NOT NULL,
    comment_date timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.comments OWNER TO postgres;

--
-- Name: comments_comment_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.comments_comment_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.comments_comment_id_seq OWNER TO postgres;

--
-- Name: comments_comment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.comments_comment_id_seq OWNED BY public.comments.comment_id;


--
-- Name: course_enrollments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.course_enrollments (
    student_id integer NOT NULL,
    course_id integer NOT NULL,
    semester character varying(20) NOT NULL,
    enrollment_date date DEFAULT CURRENT_DATE,
    grade character(2)
);


ALTER TABLE public.course_enrollments OWNER TO postgres;

--
-- Name: customer_feedback; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.customer_feedback (
    feedback_id integer NOT NULL,
    customer_name character varying(100),
    feedback text,
    created_at date DEFAULT CURRENT_DATE
);


ALTER TABLE public.customer_feedback OWNER TO postgres;

--
-- Name: customer_feedback_feedback_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.customer_feedback_feedback_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.customer_feedback_feedback_id_seq OWNER TO postgres;

--
-- Name: customer_feedback_feedback_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.customer_feedback_feedback_id_seq OWNED BY public.customer_feedback.feedback_id;


--
-- Name: customers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.customers (
    customer_id integer NOT NULL,
    name character varying(100) NOT NULL,
    email character varying(100) NOT NULL,
    phone character varying(20),
    created_at timestamp without time zone DEFAULT now()
);


ALTER TABLE public.customers OWNER TO postgres;

--
-- Name: customers_customer_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.customers_customer_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.customers_customer_id_seq OWNER TO postgres;

--
-- Name: customers_customer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.customers_customer_id_seq OWNED BY public.customers.customer_id;


--
-- Name: customers_tx; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.customers_tx (
    customer_id integer NOT NULL,
    name text NOT NULL,
    email text
);


ALTER TABLE public.customers_tx OWNER TO postgres;

--
-- Name: customers_tx_customer_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.customers_tx_customer_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.customers_tx_customer_id_seq OWNER TO postgres;

--
-- Name: customers_tx_customer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.customers_tx_customer_id_seq OWNED BY public.customers_tx.customer_id;


--
-- Name: departments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.departments (
    department_id integer NOT NULL,
    department_name character varying(100),
    department_head character varying(100)
);


ALTER TABLE public.departments OWNER TO postgres;

--
-- Name: employees; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.employees (
    employee_id integer NOT NULL,
    first_name character varying(50) NOT NULL,
    last_name character varying(50) NOT NULL,
    email character varying(100),
    department character varying(50),
    salary numeric(10,2),
    region_id integer
);


ALTER TABLE public.employees OWNER TO postgres;

--
-- Name: employees_employee_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.employees_employee_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.employees_employee_id_seq OWNER TO postgres;

--
-- Name: employees_employee_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.employees_employee_id_seq OWNED BY public.employees.employee_id;


--
-- Name: enrollments_bad; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.enrollments_bad (
    student_id integer NOT NULL,
    course_id integer NOT NULL,
    course_name character varying(100),
    grade character(2)
);


ALTER TABLE public.enrollments_bad OWNER TO postgres;

--
-- Name: inventory; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.inventory (
    product_id integer NOT NULL,
    stock integer NOT NULL,
    CONSTRAINT inventory_stock_check CHECK ((stock >= 0))
);


ALTER TABLE public.inventory OWNER TO postgres;

--
-- Name: inventory_tx; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.inventory_tx (
    product_id integer NOT NULL,
    stock integer NOT NULL,
    CONSTRAINT inventory_tx_stock_check CHECK ((stock >= 0))
);


ALTER TABLE public.inventory_tx OWNER TO postgres;

--
-- Name: loans; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.loans (
    loan_id integer NOT NULL,
    member_id integer NOT NULL,
    book_id integer NOT NULL,
    loan_date date DEFAULT CURRENT_DATE,
    due_date date NOT NULL,
    return_date date,
    late_fee numeric(10,2) DEFAULT 0.00
);


ALTER TABLE public.loans OWNER TO postgres;

--
-- Name: loans_loan_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.loans_loan_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.loans_loan_id_seq OWNER TO postgres;

--
-- Name: loans_loan_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.loans_loan_id_seq OWNED BY public.loans.loan_id;


--
-- Name: logs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.logs (
    log_id bigint NOT NULL,
    message text NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.logs OWNER TO postgres;

--
-- Name: logs_log_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.logs_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.logs_log_id_seq OWNER TO postgres;

--
-- Name: logs_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.logs_log_id_seq OWNED BY public.logs.log_id;


--
-- Name: logs_tx; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.logs_tx (
    log_id bigint NOT NULL,
    message text NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.logs_tx OWNER TO postgres;

--
-- Name: logs_tx_log_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.logs_tx_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.logs_tx_log_id_seq OWNER TO postgres;

--
-- Name: logs_tx_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.logs_tx_log_id_seq OWNED BY public.logs_tx.log_id;


--
-- Name: members; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.members (
    member_id integer NOT NULL,
    first_name character varying(50) NOT NULL,
    last_name character varying(50) NOT NULL,
    email character varying(100) NOT NULL,
    phone character varying(15),
    membership_date date DEFAULT CURRENT_DATE
);


ALTER TABLE public.members OWNER TO postgres;

--
-- Name: members_member_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.members_member_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.members_member_id_seq OWNER TO postgres;

--
-- Name: members_member_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.members_member_id_seq OWNED BY public.members.member_id;


--
-- Name: order_items; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.order_items (
    order_item_id integer NOT NULL,
    order_id integer NOT NULL,
    product_id integer NOT NULL,
    quantity integer NOT NULL,
    CONSTRAINT order_items_quantity_check CHECK ((quantity > 0))
);


ALTER TABLE public.order_items OWNER TO postgres;

--
-- Name: order_items_order_item_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.order_items_order_item_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.order_items_order_item_id_seq OWNER TO postgres;

--
-- Name: order_items_order_item_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.order_items_order_item_id_seq OWNED BY public.order_items.order_item_id;


--
-- Name: orders; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.orders (
    order_id integer NOT NULL,
    customer_id integer,
    order_date date DEFAULT CURRENT_DATE,
    total numeric(10,2)
);


ALTER TABLE public.orders OWNER TO postgres;

--
-- Name: orders_order_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.orders_order_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.orders_order_id_seq OWNER TO postgres;

--
-- Name: orders_order_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.orders_order_id_seq OWNED BY public.orders.order_id;


--
-- Name: orders_tx; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.orders_tx (
    order_id integer NOT NULL,
    customer_id integer NOT NULL,
    total numeric(10,2) DEFAULT 0 NOT NULL
);


ALTER TABLE public.orders_tx OWNER TO postgres;

--
-- Name: orders_tx_order_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.orders_tx_order_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.orders_tx_order_id_seq OWNER TO postgres;

--
-- Name: orders_tx_order_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.orders_tx_order_id_seq OWNED BY public.orders_tx.order_id;


--
-- Name: pivoted_sales; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pivoted_sales (
    product_name character varying(100) NOT NULL,
    year_2022 numeric(12,2),
    year_2023 numeric(12,2),
    year_2024 numeric(12,2)
);


ALTER TABLE public.pivoted_sales OWNER TO postgres;

--
-- Name: products; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.products (
    product_id integer NOT NULL,
    name character varying(100) NOT NULL,
    price numeric(10,2) NOT NULL,
    stock integer DEFAULT 0
);


ALTER TABLE public.products OWNER TO postgres;

--
-- Name: products_product_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.products_product_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.products_product_id_seq OWNER TO postgres;

--
-- Name: products_product_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.products_product_id_seq OWNED BY public.products.product_id;


--
-- Name: products_tx; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.products_tx (
    product_id integer NOT NULL,
    name text NOT NULL,
    price numeric(10,2) NOT NULL,
    CONSTRAINT products_tx_price_check CHECK ((price >= (0)::numeric))
);


ALTER TABLE public.products_tx OWNER TO postgres;

--
-- Name: sales; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sales (
    product_name character varying(100) NOT NULL,
    year integer NOT NULL,
    sales_amount numeric(12,2) NOT NULL,
    CONSTRAINT sales_year_check CHECK (((year >= 2020) AND (year <= 2030)))
);


ALTER TABLE public.sales OWNER TO postgres;

--
-- Name: sales_data; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sales_data (
    sale_id integer NOT NULL,
    product_name character varying(100),
    year integer,
    sales_amount numeric(12,2),
    region character varying(50)
);


ALTER TABLE public.sales_data OWNER TO postgres;

--
-- Name: sales_data_sale_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.sales_data_sale_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.sales_data_sale_id_seq OWNER TO postgres;

--
-- Name: sales_data_sale_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.sales_data_sale_id_seq OWNED BY public.sales_data.sale_id;


--
-- Name: staging_customers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.staging_customers (
    customer_id integer,
    name character varying(100),
    email character varying(100),
    phone character varying(20)
);


ALTER TABLE public.staging_customers OWNER TO postgres;

--
-- Name: student_enrollments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.student_enrollments (
    enrollment_id integer NOT NULL,
    student_id integer NOT NULL,
    course_id integer NOT NULL,
    enrollment_date date DEFAULT CURRENT_DATE,
    grade character(2)
);


ALTER TABLE public.student_enrollments OWNER TO postgres;

--
-- Name: student_enrollments_enrollment_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.student_enrollments_enrollment_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.student_enrollments_enrollment_id_seq OWNER TO postgres;

--
-- Name: student_enrollments_enrollment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.student_enrollments_enrollment_id_seq OWNED BY public.student_enrollments.enrollment_id;


--
-- Name: student_phones; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.student_phones (
    student_id integer NOT NULL,
    phone_number character varying(15) NOT NULL,
    phone_type character varying(20)
);


ALTER TABLE public.student_phones OWNER TO postgres;

--
-- Name: students_bad; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.students_bad (
    student_id integer NOT NULL,
    name character varying(100),
    department_id integer,
    department_name character varying(100)
);


ALTER TABLE public.students_bad OWNER TO postgres;

--
-- Name: university_students; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.university_students (
    student_id integer NOT NULL,
    first_name text NOT NULL,
    last_name character varying(50) NOT NULL,
    email_adress character varying(100) NOT NULL,
    date_of_birh date
);


ALTER TABLE public.university_students OWNER TO postgres;

--
-- Name: students_student_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.students_student_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.students_student_id_seq OWNER TO postgres;

--
-- Name: students_student_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.students_student_id_seq OWNED BY public.university_students.student_id;


--
-- Name: target_customers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.target_customers (
    customer_id integer NOT NULL,
    name character varying(100),
    email character varying(100),
    phone character varying(20)
);


ALTER TABLE public.target_customers OWNER TO postgres;

--
-- Name: transactions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.transactions (
    transaction_id bigint NOT NULL,
    amount numeric(15,2),
    transaction_date timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.transactions OWNER TO postgres;

--
-- Name: transactions_transaction_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.transactions_transaction_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.transactions_transaction_id_seq OWNER TO postgres;

--
-- Name: transactions_transaction_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.transactions_transaction_id_seq OWNED BY public.transactions.transaction_id;


--
-- Name: user_preferences; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_preferences (
    user_id integer NOT NULL,
    theme text DEFAULT 'light'::text NOT NULL
);


ALTER TABLE public.user_preferences OWNER TO postgres;

--
-- Name: user_preferences_tx; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_preferences_tx (
    user_id integer NOT NULL,
    theme text DEFAULT 'light'::text NOT NULL
);


ALTER TABLE public.user_preferences_tx OWNER TO postgres;

--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    name text NOT NULL,
    email text
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Name: users_tx; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users_tx (
    user_id integer NOT NULL,
    name text NOT NULL,
    email text
);


ALTER TABLE public.users_tx OWNER TO postgres;

--
-- Name: users_tx_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_tx_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.users_tx_user_id_seq OWNER TO postgres;

--
-- Name: users_tx_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_tx_user_id_seq OWNED BY public.users_tx.user_id;


--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.users_user_id_seq OWNER TO postgres;

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;


--
-- Name: warehouse_1; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.warehouse_1 (
    product_id integer NOT NULL,
    product_name character varying(100),
    quantity integer
);


ALTER TABLE public.warehouse_1 OWNER TO postgres;

--
-- Name: warehouse_2; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.warehouse_2 (
    product_id integer NOT NULL,
    product_name character varying(100),
    quantity integer
);


ALTER TABLE public.warehouse_2 OWNER TO postgres;

--
-- Name: audit_log audit_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.audit_log ALTER COLUMN audit_id SET DEFAULT nextval('public.audit_log_audit_id_seq'::regclass);


--
-- Name: audit_log_tx audit_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.audit_log_tx ALTER COLUMN audit_id SET DEFAULT nextval('public.audit_log_tx_audit_id_seq'::regclass);


--
-- Name: blog_posts post_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.blog_posts ALTER COLUMN post_id SET DEFAULT nextval('public.blog_posts_post_id_seq'::regclass);


--
-- Name: comments comment_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comments ALTER COLUMN comment_id SET DEFAULT nextval('public.comments_comment_id_seq'::regclass);


--
-- Name: customer_feedback feedback_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer_feedback ALTER COLUMN feedback_id SET DEFAULT nextval('public.customer_feedback_feedback_id_seq'::regclass);


--
-- Name: customers customer_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customers ALTER COLUMN customer_id SET DEFAULT nextval('public.customers_customer_id_seq'::regclass);


--
-- Name: customers_tx customer_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customers_tx ALTER COLUMN customer_id SET DEFAULT nextval('public.customers_tx_customer_id_seq'::regclass);


--
-- Name: employees employee_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees ALTER COLUMN employee_id SET DEFAULT nextval('public.employees_employee_id_seq'::regclass);


--
-- Name: loans loan_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.loans ALTER COLUMN loan_id SET DEFAULT nextval('public.loans_loan_id_seq'::regclass);


--
-- Name: logs log_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.logs ALTER COLUMN log_id SET DEFAULT nextval('public.logs_log_id_seq'::regclass);


--
-- Name: logs_tx log_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.logs_tx ALTER COLUMN log_id SET DEFAULT nextval('public.logs_tx_log_id_seq'::regclass);


--
-- Name: members member_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.members ALTER COLUMN member_id SET DEFAULT nextval('public.members_member_id_seq'::regclass);


--
-- Name: order_items order_item_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_items ALTER COLUMN order_item_id SET DEFAULT nextval('public.order_items_order_item_id_seq'::regclass);


--
-- Name: orders order_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders ALTER COLUMN order_id SET DEFAULT nextval('public.orders_order_id_seq'::regclass);


--
-- Name: orders_tx order_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders_tx ALTER COLUMN order_id SET DEFAULT nextval('public.orders_tx_order_id_seq'::regclass);


--
-- Name: products product_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products ALTER COLUMN product_id SET DEFAULT nextval('public.products_product_id_seq'::regclass);


--
-- Name: sales_data sale_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sales_data ALTER COLUMN sale_id SET DEFAULT nextval('public.sales_data_sale_id_seq'::regclass);


--
-- Name: student_enrollments enrollment_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.student_enrollments ALTER COLUMN enrollment_id SET DEFAULT nextval('public.student_enrollments_enrollment_id_seq'::regclass);


--
-- Name: transactions transaction_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transactions ALTER COLUMN transaction_id SET DEFAULT nextval('public.transactions_transaction_id_seq'::regclass);


--
-- Name: university_students student_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.university_students ALTER COLUMN student_id SET DEFAULT nextval('public.students_student_id_seq'::regclass);


--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Name: users_tx user_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_tx ALTER COLUMN user_id SET DEFAULT nextval('public.users_tx_user_id_seq'::regclass);


--
-- Data for Name: accounts; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.accounts (account_id, owner_name, balance) FROM stdin;
1	Alice	945.00
2	Bob	1155.00
\.


--
-- Data for Name: accounts_tx; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.accounts_tx (account_id, owner_name, balance) FROM stdin;
1	Alice	1500.00
2	Bob	500.00
\.


--
-- Data for Name: audit_log; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.audit_log (audit_id, action, ts) FROM stdin;
\.


--
-- Data for Name: audit_log_tx; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.audit_log_tx (audit_id, action, ts) FROM stdin;
\.


--
-- Data for Name: blog_posts; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.blog_posts (post_id, title, content, author, published_date) FROM stdin;
\.


--
-- Data for Name: book_authors; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.book_authors (book_id, author_id) FROM stdin;
\.


--
-- Data for Name: comments; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.comments (comment_id, post_id, commenter_name, comment_text, comment_date) FROM stdin;
\.


--
-- Data for Name: course_enrollments; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.course_enrollments (student_id, course_id, semester, enrollment_date, grade) FROM stdin;
1	101	2024-Spring	2025-09-01	A 
1	102	2024-Spring	2025-09-01	B+
2	101	2024-Spring	2025-09-01	A-
1	101	2024-Fall	2025-09-01	A+
\.


--
-- Data for Name: customer_feedback; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.customer_feedback (feedback_id, customer_name, feedback, created_at) FROM stdin;
1	Alice	Love the laptop, fast and reliable!	2025-10-06
2	Bob	Good keyboard, but "too loud" for my office	2025-10-06
3	Charlie	Mouse works well, price is fair.	2025-10-06
\.


--
-- Data for Name: customers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.customers (customer_id, name, email, phone, created_at) FROM stdin;
1	Alice Johnson	alice@example.com	+1555000001	2025-10-06 17:29:15.262247
2	Bob Smith	bob@example.com	+1555000002	2025-10-06 17:29:15.262247
3	Charlie Brown	charlie@example.com	+1555000003	2025-10-06 17:29:15.262247
\.


--
-- Data for Name: customers_tx; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.customers_tx (customer_id, name, email) FROM stdin;
\.


--
-- Data for Name: departments; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.departments (department_id, department_name, department_head) FROM stdin;
\.


--
-- Data for Name: employees; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.employees (employee_id, first_name, last_name, email, department, salary, region_id) FROM stdin;
1	Alice	Ivanova	alice@company.com	IT	75000.00	1
2	Bob	Kim	bob@company.com	HR	64000.00	2
3	Clara	Lee	clara@company.com	Finance	85000.00	1
4	Dan	Uulu	dan@company.com	IT	72000.00	2
\.


--
-- Data for Name: enrollments_bad; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.enrollments_bad (student_id, course_id, course_name, grade) FROM stdin;
\.


--
-- Data for Name: inventory; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.inventory (product_id, stock) FROM stdin;
101	10
102	50
\.


--
-- Data for Name: inventory_tx; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.inventory_tx (product_id, stock) FROM stdin;
101	10
102	50
\.


--
-- Data for Name: loans; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.loans (loan_id, member_id, book_id, loan_date, due_date, return_date, late_fee) FROM stdin;
\.


--
-- Data for Name: logs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.logs (log_id, message, created_at) FROM stdin;
1	Starting process	2025-10-06 17:21:07.82253+05
2	Process completed	2025-10-06 17:21:07.82253+05
\.


--
-- Data for Name: logs_tx; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.logs_tx (log_id, message, created_at) FROM stdin;
\.


--
-- Data for Name: members; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.members (member_id, first_name, last_name, email, phone, membership_date) FROM stdin;
\.


--
-- Data for Name: order_items; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.order_items (order_item_id, order_id, product_id, quantity) FROM stdin;
\.


--
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.orders (order_id, customer_id, order_date, total) FROM stdin;
1	1	2024-01-12	250.00
2	1	2024-02-05	500.00
3	2	2024-03-03	120.00
\.


--
-- Data for Name: orders_tx; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.orders_tx (order_id, customer_id, total) FROM stdin;
\.


--
-- Data for Name: pivoted_sales; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.pivoted_sales (product_name, year_2022, year_2023, year_2024) FROM stdin;
Mouse	12000.00	15000.00	18000.00
Keyboard	22000.00	25000.00	28000.00
Laptop	150000.00	175000.00	210000.00
\.


--
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.products (product_id, name, price, stock) FROM stdin;
1	Laptop	999.99	20
2	Mouse	25.99	100
3	Keyboard	59.49	60
4	Monitor	230.00	30
\.


--
-- Data for Name: products_tx; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.products_tx (product_id, name, price) FROM stdin;
101	Laptop	999.99
102	Mouse	25.99
\.


--
-- Data for Name: sales; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sales (product_name, year, sales_amount) FROM stdin;
Laptop	2022	150000.00
Laptop	2023	175000.00
Laptop	2024	210000.00
Mouse	2022	12000.00
Mouse	2023	15000.00
Mouse	2024	18000.00
Keyboard	2022	22000.00
Keyboard	2023	25000.00
Keyboard	2024	28000.00
\.


--
-- Data for Name: sales_data; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sales_data (sale_id, product_name, year, sales_amount, region) FROM stdin;
1	Laptop	2022	150000.00	East
2	Laptop	2023	175000.00	West
3	Mouse	2023	15000.00	East
4	Keyboard	2022	22000.00	North
\.


--
-- Data for Name: staging_customers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.staging_customers (customer_id, name, email, phone) FROM stdin;
\.


--
-- Data for Name: student_enrollments; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.student_enrollments (enrollment_id, student_id, course_id, enrollment_date, grade) FROM stdin;
1	1	1	2025-10-06	A 
2	1	2	2025-10-06	B+
3	2	1	2025-10-06	A-
4	2	3	2025-10-06	B 
5	3	2	2025-10-06	A 
6	3	3	2025-10-06	A-
\.


--
-- Data for Name: student_phones; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.student_phones (student_id, phone_number, phone_type) FROM stdin;
\.


--
-- Data for Name: students_bad; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.students_bad (student_id, name, department_id, department_name) FROM stdin;
\.


--
-- Data for Name: target_customers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.target_customers (customer_id, name, email, phone) FROM stdin;
\.


--
-- Data for Name: transactions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.transactions (transaction_id, amount, transaction_date) FROM stdin;
\.


--
-- Data for Name: university_students; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.university_students (student_id, first_name, last_name, email_adress, date_of_birh) FROM stdin;
\.


--
-- Data for Name: user_preferences; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_preferences (user_id, theme) FROM stdin;
\.


--
-- Data for Name: user_preferences_tx; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_preferences_tx (user_id, theme) FROM stdin;
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (user_id, name, email) FROM stdin;
1	John Doe	john@example.com
\.


--
-- Data for Name: users_tx; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users_tx (user_id, name, email) FROM stdin;
\.


--
-- Data for Name: warehouse_1; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.warehouse_1 (product_id, product_name, quantity) FROM stdin;
1	Laptop	5
2	Mouse	0
3	Keyboard	7
4	Monitor	0
\.


--
-- Data for Name: warehouse_2; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.warehouse_2 (product_id, product_name, quantity) FROM stdin;
2	Mouse	0
3	Keyboard	3
4	Monitor	0
5	Dock	2
\.


--
-- Name: audit_log_audit_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.audit_log_audit_id_seq', 1, false);


--
-- Name: audit_log_tx_audit_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.audit_log_tx_audit_id_seq', 1, false);


--
-- Name: blog_posts_post_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.blog_posts_post_id_seq', 1, false);


--
-- Name: comments_comment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.comments_comment_id_seq', 1, false);


--
-- Name: customer_feedback_feedback_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.customer_feedback_feedback_id_seq', 3, true);


--
-- Name: customers_customer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.customers_customer_id_seq', 3, true);


--
-- Name: customers_tx_customer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.customers_tx_customer_id_seq', 1, false);


--
-- Name: employees_employee_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.employees_employee_id_seq', 4, true);


--
-- Name: loans_loan_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.loans_loan_id_seq', 1, false);


--
-- Name: logs_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.logs_log_id_seq', 2, true);


--
-- Name: logs_tx_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.logs_tx_log_id_seq', 1, false);


--
-- Name: members_member_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.members_member_id_seq', 1, false);


--
-- Name: order_items_order_item_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.order_items_order_item_id_seq', 1, true);


--
-- Name: orders_order_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.orders_order_id_seq', 3, true);


--
-- Name: orders_tx_order_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.orders_tx_order_id_seq', 1, false);


--
-- Name: products_product_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.products_product_id_seq', 4, true);


--
-- Name: sales_data_sale_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.sales_data_sale_id_seq', 4, true);


--
-- Name: student_enrollments_enrollment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.student_enrollments_enrollment_id_seq', 6, true);


--
-- Name: students_student_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.students_student_id_seq', 1, false);


--
-- Name: transactions_transaction_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.transactions_transaction_id_seq', 1, false);


--
-- Name: users_tx_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_tx_user_id_seq', 1, false);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_user_id_seq', 1, true);


--
-- Name: accounts accounts_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts
    ADD CONSTRAINT accounts_pkey PRIMARY KEY (account_id);


--
-- Name: accounts_tx accounts_tx_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts_tx
    ADD CONSTRAINT accounts_tx_pkey PRIMARY KEY (account_id);


--
-- Name: audit_log audit_log_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.audit_log
    ADD CONSTRAINT audit_log_pkey PRIMARY KEY (audit_id);


--
-- Name: audit_log_tx audit_log_tx_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.audit_log_tx
    ADD CONSTRAINT audit_log_tx_pkey PRIMARY KEY (audit_id);


--
-- Name: blog_posts blog_posts_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.blog_posts
    ADD CONSTRAINT blog_posts_pkey PRIMARY KEY (post_id);


--
-- Name: book_authors book_authors_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.book_authors
    ADD CONSTRAINT book_authors_pkey PRIMARY KEY (book_id, author_id);


--
-- Name: comments comments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_pkey PRIMARY KEY (comment_id);


--
-- Name: course_enrollments course_enrollments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.course_enrollments
    ADD CONSTRAINT course_enrollments_pkey PRIMARY KEY (student_id, course_id, semester);


--
-- Name: customer_feedback customer_feedback_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer_feedback
    ADD CONSTRAINT customer_feedback_pkey PRIMARY KEY (feedback_id);


--
-- Name: customers customers_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customers
    ADD CONSTRAINT customers_email_key UNIQUE (email);


--
-- Name: customers customers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customers
    ADD CONSTRAINT customers_pkey PRIMARY KEY (customer_id);


--
-- Name: customers_tx customers_tx_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customers_tx
    ADD CONSTRAINT customers_tx_email_key UNIQUE (email);


--
-- Name: customers_tx customers_tx_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customers_tx
    ADD CONSTRAINT customers_tx_pkey PRIMARY KEY (customer_id);


--
-- Name: departments departments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.departments
    ADD CONSTRAINT departments_pkey PRIMARY KEY (department_id);


--
-- Name: employees employees_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT employees_email_key UNIQUE (email);


--
-- Name: employees employees_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT employees_pkey PRIMARY KEY (employee_id);


--
-- Name: enrollments_bad enrollments_bad_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.enrollments_bad
    ADD CONSTRAINT enrollments_bad_pkey PRIMARY KEY (student_id, course_id);


--
-- Name: inventory inventory_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inventory
    ADD CONSTRAINT inventory_pkey PRIMARY KEY (product_id);


--
-- Name: inventory_tx inventory_tx_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inventory_tx
    ADD CONSTRAINT inventory_tx_pkey PRIMARY KEY (product_id);


--
-- Name: loans loans_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.loans
    ADD CONSTRAINT loans_pkey PRIMARY KEY (loan_id);


--
-- Name: logs logs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.logs
    ADD CONSTRAINT logs_pkey PRIMARY KEY (log_id);


--
-- Name: logs_tx logs_tx_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.logs_tx
    ADD CONSTRAINT logs_tx_pkey PRIMARY KEY (log_id);


--
-- Name: members members_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.members
    ADD CONSTRAINT members_email_key UNIQUE (email);


--
-- Name: members members_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.members
    ADD CONSTRAINT members_pkey PRIMARY KEY (member_id);


--
-- Name: order_items order_items_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_items
    ADD CONSTRAINT order_items_pkey PRIMARY KEY (order_item_id);


--
-- Name: orders orders_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (order_id);


--
-- Name: orders_tx orders_tx_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders_tx
    ADD CONSTRAINT orders_tx_pkey PRIMARY KEY (order_id);


--
-- Name: pivoted_sales pivoted_sales_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pivoted_sales
    ADD CONSTRAINT pivoted_sales_pkey PRIMARY KEY (product_name);


--
-- Name: products products_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (product_id);


--
-- Name: products_tx products_tx_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products_tx
    ADD CONSTRAINT products_tx_pkey PRIMARY KEY (product_id);


--
-- Name: sales_data sales_data_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sales_data
    ADD CONSTRAINT sales_data_pkey PRIMARY KEY (sale_id);


--
-- Name: student_enrollments student_enrollments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.student_enrollments
    ADD CONSTRAINT student_enrollments_pkey PRIMARY KEY (enrollment_id);


--
-- Name: student_enrollments student_enrollments_student_id_course_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.student_enrollments
    ADD CONSTRAINT student_enrollments_student_id_course_id_key UNIQUE (student_id, course_id);


--
-- Name: student_phones student_phones_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.student_phones
    ADD CONSTRAINT student_phones_pkey PRIMARY KEY (student_id, phone_number);


--
-- Name: students_bad students_bad_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.students_bad
    ADD CONSTRAINT students_bad_pkey PRIMARY KEY (student_id);


--
-- Name: university_students students_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.university_students
    ADD CONSTRAINT students_email_key UNIQUE (email_adress);


--
-- Name: university_students students_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.university_students
    ADD CONSTRAINT students_pkey PRIMARY KEY (student_id);


--
-- Name: target_customers target_customers_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.target_customers
    ADD CONSTRAINT target_customers_email_key UNIQUE (email);


--
-- Name: target_customers target_customers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.target_customers
    ADD CONSTRAINT target_customers_pkey PRIMARY KEY (customer_id);


--
-- Name: transactions transactions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transactions
    ADD CONSTRAINT transactions_pkey PRIMARY KEY (transaction_id);


--
-- Name: university_students unique_student_email; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.university_students
    ADD CONSTRAINT unique_student_email UNIQUE (email_adress);


--
-- Name: user_preferences user_preferences_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_preferences
    ADD CONSTRAINT user_preferences_pkey PRIMARY KEY (user_id);


--
-- Name: user_preferences_tx user_preferences_tx_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_preferences_tx
    ADD CONSTRAINT user_preferences_tx_pkey PRIMARY KEY (user_id);


--
-- Name: users users_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- Name: users_tx users_tx_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_tx
    ADD CONSTRAINT users_tx_email_key UNIQUE (email);


--
-- Name: users_tx users_tx_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_tx
    ADD CONSTRAINT users_tx_pkey PRIMARY KEY (user_id);


--
-- Name: warehouse_1 warehouse_1_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.warehouse_1
    ADD CONSTRAINT warehouse_1_pkey PRIMARY KEY (product_id);


--
-- Name: warehouse_2 warehouse_2_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.warehouse_2
    ADD CONSTRAINT warehouse_2_pkey PRIMARY KEY (product_id);


--
-- Name: comments comments_post_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_post_id_fkey FOREIGN KEY (post_id) REFERENCES public.blog_posts(post_id) ON DELETE CASCADE;


--
-- Name: inventory_tx inventory_tx_product_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inventory_tx
    ADD CONSTRAINT inventory_tx_product_id_fkey FOREIGN KEY (product_id) REFERENCES public.products_tx(product_id);


--
-- Name: loans loans_member_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.loans
    ADD CONSTRAINT loans_member_id_fkey FOREIGN KEY (member_id) REFERENCES public.members(member_id);


--
-- Name: orders orders_customer_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_customer_id_fkey FOREIGN KEY (customer_id) REFERENCES public.customers(customer_id);


--
-- Name: orders_tx orders_tx_customer_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders_tx
    ADD CONSTRAINT orders_tx_customer_id_fkey FOREIGN KEY (customer_id) REFERENCES public.customers_tx(customer_id);


--
-- Name: user_preferences_tx user_preferences_tx_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_preferences_tx
    ADD CONSTRAINT user_preferences_tx_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users_tx(user_id);


--
-- Name: user_preferences user_preferences_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_preferences
    ADD CONSTRAINT user_preferences_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id);


--
-- PostgreSQL database dump complete
--

\unrestrict fgkTYJaj4kbZgdybHnF7VIfrwVbo0S0pMgK2pnp9Hokuy5S44zK3bLyL4RzulPn

