--
-- PostgreSQL database dump
--

\restrict kOGlDOLT0rjTFk9xPHq9QPErJHdJn8XutRHjIvVqAG9yw34Xbv7EMMe5IxlnPJm

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
-- Data for Name: products_tx; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.products_tx (product_id, name, price) FROM stdin;
101	Laptop	999.99
102	Mouse	25.99
\.


--
-- Data for Name: inventory_tx; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.inventory_tx (product_id, stock) FROM stdin;
101	10
102	50
\.


--
-- Data for Name: members; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.members (member_id, first_name, last_name, email, phone, membership_date) FROM stdin;
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
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (user_id, name, email) FROM stdin;
1	John Doe	john@example.com
\.


--
-- Data for Name: user_preferences; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_preferences (user_id, theme) FROM stdin;
\.


--
-- Data for Name: users_tx; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users_tx (user_id, name, email) FROM stdin;
\.


--
-- Data for Name: user_preferences_tx; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_preferences_tx (user_id, theme) FROM stdin;
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
-- PostgreSQL database dump complete
--

\unrestrict kOGlDOLT0rjTFk9xPHq9QPErJHdJn8XutRHjIvVqAG9yw34Xbv7EMMe5IxlnPJm

