--1) Creating tables

CREATE TABLE IF NOT EXISTS public.users
(
    user_id integer NOT NULL DEFAULT 'nextval('users_user_id_seq'::regclass)',
    username character varying(100) COLLATE pg_catalog."default" NOT NULL,
    email character varying(200) COLLATE pg_catalog."default" NOT NULL,
    creation_date timestamp without time zone DEFAULT 'now()',
    is_active boolean,
    CONSTRAINT users_pkey PRIMARY KEY (user_id),
    CONSTRAINT users_email_key UNIQUE (email),
    CONSTRAINT users_username_key UNIQUE (username)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.users
    OWNER to postgres;

CREATE TABLE IF NOT EXISTS public.categories
(
    category_id integer NOT NULL DEFAULT 'nextval('categories_category_id_seq'::regclass)',
    name character varying(100) COLLATE pg_catalog."default" NOT NULL,
    creation_date timestamp without time zone DEFAULT 'now()',
    CONSTRAINT categories_pkey PRIMARY KEY (category_id),
    CONSTRAINT categories_name_key UNIQUE (name)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.categories
    OWNER to postgres;

CREATE TABLE IF NOT EXISTS posts(
	post_id SERIAL PRIMARY KEY NOT NULL,
	user_id INT NOT NULL,
	category_id INT NOT NULL,
	title VARCHAR(50) NOT NULL,
	content VARCHAR(300) NOT NULL,
	view_count INT DEFAULT 0,
	creation_date TIMESTAMP WITHOUT TIME ZONE DEFAULT NOW(),
	is_published BOOLEAN,
	CONSTRAINT fk_user_id FOREIGN KEY (user_id) REFERENCES users(user_id),
	CONSTRAINT fk_category_id FOREIGN KEY (category_id) REFERENCES categories(category_id)
);

CREATE TABLE IF NOT EXISTS comments(
	comment_id SERIAL PRIMARY KEY,
	post_id INT NOT NULL,
	user_id INT,
	comment VARCHAR(300) NOT NULL,
	creation_date TIMESTAMP WITHOUT TIME ZONE DEFAULT NOW(),
	is_confirmed BOOLEAN,
	CONSTRAINT fk_post_id FOREIGN KEY (post_id) REFERENCES posts(post_id),
	CONSTRAINT fk_user_id FOREIGN KEY (user_id) REFERENCES users(user_id)
);

--2) Inserting data

--user insert querylerini postgre aniden kapandigi icin kurtaramadim.

insert into categories (name) values ('Travel');
insert into categories (name) values ('Food');
insert into categories (name) values ('Movies');

insert into posts (user_id, category_id, title, content, creation_date, is_published) values (9, 2, 'curabitur', 'Phasellus in felis. Donec semper sapien a libero.', '2021-07-27', true);
insert into posts (user_id, category_id, title, content, creation_date, is_published) values (8, 3, 'nascetur ridiculus', 'Sed accumsan felis. Ut at dolor quis odio consequat varius. Integer ac leo.', '2021-01-29', true);
insert into posts (user_id, category_id, title, content, creation_date, is_published) values (9, 2, 'interdum eu tincidunt', 'Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl.', '2023-01-28', true);
insert into posts (user_id, category_id, title, content, creation_date, is_published) values (7, 3, 'a ipsum integer', 'Integer non velit. Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue.', '2023-03-20', false);
insert into posts (user_id, category_id, title, content, creation_date, is_published) values (10, 3, 'sed augue aliquam', 'In hac habitasse platea dictumst.', '2021-07-16', false);
insert into posts (user_id, category_id, title, content, creation_date, is_published) values (7, 2, 'ultrices posuere', 'Mauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis.', '2021-12-29', true);
insert into posts (user_id, category_id, title, content, creation_date, is_published) values (9, 1, 'nulla ultrices aliquet', 'Donec vitae nisi. Nam ultrices, libero non mattis pulvinar, nulla pede ullamcorper augue, a suscipit nulla elit ac nulla. Sed vel enim sit amet nunc viverra dapibus.', '2022-11-27', true);
insert into posts (user_id, category_id, title, content, creation_date, is_published) values (10, 2, 'hac', 'Duis consequat dui nec nisi volutpat eleifend. Donec ut dolor. Morbi vel lectus in quam fringilla rhoncus.', '2022-07-25', false);
insert into posts (user_id, category_id, title, content, creation_date, is_published) values (9, 1, 'feugiat non pretium', 'Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue.', '2022-05-15', false);
insert into posts (user_id, category_id, title, content, creation_date, is_published) values (7, 2, 'eleifend donec', 'Nam dui. Proin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis.', '2022-04-27', false);
insert into posts (user_id, category_id, title, content, creation_date, is_published) values (9, 1, 'integer', 'Pellentesque at nulla. Suspendisse potenti. Cras in purus eu magna vulputate luctus.', '2021-06-18', false);
insert into posts (user_id, category_id, title, content, creation_date, is_published) values (9, 2, 'ut odio', 'Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo.', '2021-05-28', false);
insert into posts (user_id, category_id, title, content, creation_date, is_published) values (9, 1, 'nec', 'Suspendisse potenti. In eleifend quam a odio.', '2020-10-18', true);
insert into posts (user_id, category_id, title, content, creation_date, is_published) values (7, 2, 'neque libero convallis', 'In sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus.', '2021-05-26', false);
insert into posts (user_id, category_id, title, content, creation_date, is_published) values (7, 1, 'sem mauris', 'Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh.', '2021-04-18', true);
insert into posts (user_id, category_id, title, content, creation_date, is_published) values (9, 1, 'vehicula', 'Duis aliquam convallis nunc.', '2021-08-10', true);
insert into posts (user_id, category_id, title, content, creation_date, is_published) values (10, 1, 'pede', 'Proin leo odio, porttitor id, consequat in, consequat ut, nulla.', '2023-06-03', true);
insert into posts (user_id, category_id, title, content, creation_date, is_published) values (9, 3, 'quam a', 'Donec quis orci eget orci vehicula condimentum.', '2021-06-12', true);
insert into posts (user_id, category_id, title, content, creation_date, is_published) values (7, 3, 'erat', 'Quisque arcu libero, rutrum ac, lobortis vel, dapibus at, diam. Nam tristique tortor eu pede.', '2020-07-06', true);
insert into posts (user_id, category_id, title, content, creation_date, is_published) values (9, 2, 'nulla dapibus', 'Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque. Quisque porta volutpat erat.', '2020-10-15', false);
insert into posts (user_id, category_id, title, content, creation_date, is_published) values (6, 1, 'morbi', 'Suspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst.', '2022-05-13', false);
insert into posts (user_id, category_id, title, content, creation_date, is_published) values (9, 3, 'quam', 'Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus. Suspendisse potenti.', '2021-03-26', false);
insert into posts (user_id, category_id, title, content, creation_date, is_published) values (6, 3, 'maecenas', 'Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem. Integer tincidunt ante vel ipsum.', '2021-04-04', true);
insert into posts (user_id, category_id, title, content, creation_date, is_published) values (6, 1, 'aliquet pulvinar', 'Nulla mollis molestie lorem. Quisque ut erat.', '2022-08-19', false);
insert into posts (user_id, category_id, title, content, creation_date, is_published) values (6, 3, 'vitae', 'Cras non velit nec nisi vulputate nonummy.', '2023-01-13', false);
insert into posts (user_id, category_id, title, content, creation_date, is_published) values (6, 3, 'quam', 'Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl. Nunc rhoncus dui vel sem.', '2023-06-07', false);
insert into posts (user_id, category_id, title, content, creation_date, is_published) values (8, 2, 'velit donec diam', 'Vivamus vestibulum sagittis sapien.', '2023-04-25', true);
insert into posts (user_id, category_id, title, content, creation_date, is_published) values (8, 1, 'nisi at', 'In blandit ultrices enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Proin interdum mauris non ligula pellentesque ultrices.', '2022-03-18', false);
insert into posts (user_id, category_id, title, content, creation_date, is_published) values (6, 2, 'lorem id', 'Nulla tempus. Vivamus in felis eu sapien cursus vestibulum.', '2021-09-09', false);
insert into posts (user_id, category_id, title, content, creation_date, is_published) values (8, 2, 'bibendum', 'Vivamus vel nulla eget eros elementum pellentesque. Quisque porta volutpat erat.', '2022-01-04', false);
insert into posts (user_id, category_id, title, content, creation_date, is_published) values (6, 3, 'neque vestibulum', 'Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est.', '2022-06-17', false);
insert into posts (user_id, category_id, title, content, creation_date, is_published) values (9, 1, 'risus praesent', 'Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh. Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est.', '2022-09-12', false);
insert into posts (user_id, category_id, title, content, creation_date, is_published) values (8, 1, 'pellentesque at', 'Morbi a ipsum. Integer a nibh. In quis justo.', '2020-12-08', false);
insert into posts (user_id, category_id, title, content, creation_date, is_published) values (10, 2, 'mus etiam', 'Aenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh.', '2020-07-03', false);
insert into posts (user_id, category_id, title, content, creation_date, is_published) values (6, 2, 'mi nulla', 'Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est. Phasellus sit amet erat.', '2021-08-11', true);
insert into posts (user_id, category_id, title, content, creation_date, is_published) values (10, 3, 'vel accumsan tellus', 'Vivamus vel nulla eget eros elementum pellentesque. Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla.', '2021-03-17', true);
insert into posts (user_id, category_id, title, content, creation_date, is_published) values (6, 1, 'pellentesque ultrices', 'Integer ac neque. Duis bibendum.', '2020-07-01', false);
insert into posts (user_id, category_id, title, content, creation_date, is_published) values (7, 1, 'luctus', 'In sagittis dui vel nisl.', '2022-03-29', false);
insert into posts (user_id, category_id, title, content, creation_date, is_published) values (8, 2, 'id ornare', 'Curabitur at ipsum ac tellus semper interdum. Mauris ullamcorper purus sit amet nulla.', '2020-12-14', true);
insert into posts (user_id, category_id, title, content, creation_date, is_published) values (6, 3, 'ligula suspendisse', 'Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem. Fusce consequat.', '2021-05-26', false);
insert into posts (user_id, category_id, title, content, creation_date, is_published) values (8, 2, 'ut', 'Proin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis. Ut at dolor quis odio consequat varius.', '2021-04-27', true);
insert into posts (user_id, category_id, title, content, creation_date, is_published) values (10, 3, 'nibh ligula', 'Pellentesque ultrices mattis odio.', '2021-05-13', false);
insert into posts (user_id, category_id, title, content, creation_date, is_published) values (10, 2, 'nulla sed', 'Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue.', '2020-07-31', false);
insert into posts (user_id, category_id, title, content, creation_date, is_published) values (6, 1, 'proin interdum', 'Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.', '2020-07-06', true);
insert into posts (user_id, category_id, title, content, creation_date, is_published) values (8, 3, 'luctus', 'Duis aliquam convallis nunc. Proin at turpis a pede posuere nonummy.', '2023-01-16', false);
insert into posts (user_id, category_id, title, content, creation_date, is_published) values (6, 2, 'tempus', 'Nunc purus. Phasellus in felis. Donec semper sapien a libero.', '2021-02-06', false);
insert into posts (user_id, category_id, title, content, creation_date, is_published) values (7, 2, 'augue', 'Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem. Integer tincidunt ante vel ipsum.', '2021-07-10', true);
insert into posts (user_id, category_id, title, content, creation_date, is_published) values (7, 2, 'quam sollicitudin vitae', 'Proin risus. Praesent lectus. Vestibulum quam sapien, varius ut, blandit non, interdum in, ante.', '2021-02-08', false);
insert into posts (user_id, category_id, title, content, creation_date, is_published) values (6, 3, 'nulla facilisi cras', 'In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem. Duis aliquam convallis nunc. Proin at turpis a pede posuere nonummy.', '2022-02-23', true);
insert into posts (user_id, category_id, title, content, creation_date, is_published) values (8, 1, 'duis', 'Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti.', '2023-05-19', false);
insert into posts (user_id, category_id, title, content, creation_date, is_published) values (9, 2, 'auctor', 'Pellentesque ultrices mattis odio.', '2022-04-08', false);

insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (41, 7, 'Sed ante.', '2022-07-23', false);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (11, 6, 'Cras in purus eu magna vulputate luctus. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus vestibulum sagittis sapien.', '2022-07-12', true);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (2, 10, 'Proin risus. Praesent lectus. Vestibulum quam sapien, varius ut, blandit non, interdum in, ante.', '2020-07-09', true);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (9, 9, 'Morbi non quam nec dui luctus rutrum. Nulla tellus. In sagittis dui vel nisl.', '2022-09-17', false);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (33, 10, 'Praesent blandit lacinia erat.', '2021-12-26', false);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (27, 8, 'Mauris lacinia sapien quis libero. Nullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum.', '2020-09-04', false);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (48, 6, 'Morbi quis tortor id nulla ultrices aliquet.', '2022-02-26', true);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (24, 6, 'Maecenas ut massa quis augue luctus tincidunt. Nulla mollis molestie lorem.', '2020-07-26', false);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (51, 9, 'Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat.', '2022-08-26', false);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (47, 10, 'Nulla mollis molestie lorem.', '2020-10-14', false);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (48, 10, 'Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti. Nullam porttitor lacus at turpis.', '2023-05-06', true);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (6, 9, 'Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis. Fusce posuere felis sed lacus.', '2021-01-23', true);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (40, 6, 'Suspendisse potenti. Nullam porttitor lacus at turpis.', '2022-11-22', true);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (42, 9, 'Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros. Vestibulum ac est lacinia nisi venenatis tristique.', '2022-12-17', true);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (24, 8, 'Nullam porttitor lacus at turpis.', '2021-06-29', true);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (30, null, 'Aliquam non mauris. Morbi non lectus. Aliquam sit amet diam in magna bibendum imperdiet.', '2021-11-26', true);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (44, 8, 'Praesent blandit lacinia erat.', '2022-08-04', false);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (10, 6, 'Aliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros. Suspendisse accumsan tortor quis turpis.', '2023-04-21', false);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (23, 6, 'Nam tristique tortor eu pede.', '2022-04-27', false);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (12, 9, 'Suspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst.', '2021-02-16', false);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (30, 7, 'Etiam justo. Etiam pretium iaculis justo. In hac habitasse platea dictumst.', '2020-08-15', false);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (38, 10, 'In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem.', '2023-03-20', true);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (46, 10, 'Donec ut dolor. Morbi vel lectus in quam fringilla rhoncus. Mauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis.', '2021-10-15', false);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (27, 7, 'Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque.', '2023-04-25', true);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (42, 8, 'Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl. Aenean lectus. Pellentesque eget nunc.', '2020-11-21', false);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (50, 9, 'Vivamus tortor.', '2022-11-11', false);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (17, 9, 'Quisque porta volutpat erat.', '2023-04-06', false);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (39, 6, 'Proin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis. Ut at dolor quis odio consequat varius.', '2023-03-19', false);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (41, 10, 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Proin risus.', '2021-11-19', false);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (33, null, 'Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est.', '2021-01-11', false);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (43, 10, 'Duis ac nibh.', '2021-02-25', false);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (37, 6, 'Aenean sit amet justo. Morbi ut odio.', '2023-01-18', false);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (24, 9, 'Integer ac leo. Pellentesque ultrices mattis odio.', '2021-11-21', true);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (26, 10, 'Maecenas ut massa quis augue luctus tincidunt. Nulla mollis molestie lorem. Quisque ut erat.', '2022-11-10', false);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (14, 8, 'Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum.', '2022-11-22', false);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (36, 8, 'Donec semper sapien a libero.', '2023-04-04', true);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (29, 9, 'Nulla ut erat id mauris vulputate elementum. Nullam varius. Nulla facilisi.', '2023-04-18', true);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (6, 9, 'In hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus.', '2022-12-23', true);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (26, 10, 'Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat. Praesent blandit.', '2023-04-29', true);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (39, 10, 'Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem. Integer tincidunt ante vel ipsum.', '2022-10-06', false);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (41, 6, 'Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. Nulla justo. Aliquam quis turpis eget elit sodales scelerisque.', '2020-08-12', false);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (14, 7, 'Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede. Morbi porttitor lorem id ligula. Suspendisse ornare consequat lectus.', '2022-09-25', true);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (34, 9, 'Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam.', '2022-05-19', true);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (4, 8, 'Maecenas rhoncus aliquam lacus.', '2020-09-07', true);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (7, 10, 'Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue.', '2023-02-24', false);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (7, 6, 'In hac habitasse platea dictumst.', '2023-05-09', true);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (16, 9, 'Etiam justo.', '2021-02-09', false);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (18, 6, 'Sed ante. Vivamus tortor. Duis mattis egestas metus.', '2021-06-01', true);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (17, 6, 'In hac habitasse platea dictumst.', '2022-08-04', true);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (32, 7, 'Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc.', '2021-01-23', true);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (28, 8, 'Quisque id justo sit amet sapien dignissim vestibulum.', '2022-03-15', false);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (18, 7, 'Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est.', '2023-02-27', true);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (13, 6, 'In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.', '2022-07-11', false);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (51, 6, 'In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem. Duis aliquam convallis nunc. Proin at turpis a pede posuere nonummy.', '2021-02-09', true);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (44, 9, 'Suspendisse accumsan tortor quis turpis. Sed ante.', '2023-05-04', false);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (24, 7, 'Phasellus sit amet erat. Nulla tempus. Vivamus in felis eu sapien cursus vestibulum.', '2023-02-13', true);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (13, 7, 'Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede. Morbi porttitor lorem id ligula.', '2021-12-31', true);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (37, 7, 'Etiam faucibus cursus urna.', '2022-12-14', false);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (23, 6, 'Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros.', '2022-07-23', false);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (4, 6, 'Integer ac neque.', '2020-06-25', false);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (23, 10, 'Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue.', '2020-11-06', true);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (10, 7, 'In sagittis dui vel nisl.', '2022-05-19', false);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (35, 6, 'Suspendisse potenti. Cras in purus eu magna vulputate luctus. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.', '2022-10-30', false);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (19, 6, 'Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus.', '2020-11-17', true);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (43, 6, 'Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh.', '2020-08-11', true);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (2, 6, 'Cras mi pede, malesuada in, imperdiet et, commodo vulputate, justo.', '2023-04-09', false);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (48, 9, 'Vivamus vestibulum sagittis sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Etiam vel augue.', '2021-06-03', true);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (27, 9, 'Maecenas rhoncus aliquam lacus.', '2022-12-22', false);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (30, 10, 'Donec semper sapien a libero. Nam dui. Proin leo odio, porttitor id, consequat in, consequat ut, nulla.', '2021-06-20', false);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (17, 7, 'Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui.', '2022-08-15', false);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (27, 8, 'Aenean fermentum.', '2022-05-08', false);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (40, 9, 'Aliquam sit amet diam in magna bibendum imperdiet.', '2023-02-23', true);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (18, 7, 'Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede. Morbi porttitor lorem id ligula. Suspendisse ornare consequat lectus.', '2020-12-13', false);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (23, 10, 'Fusce consequat. Nulla nisl.', '2021-10-03', false);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (38, 10, 'Proin leo odio, porttitor id, consequat in, consequat ut, nulla.', '2021-06-03', true);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (7, 7, 'Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem.', '2022-05-25', false);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (43, 8, 'Nullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum. Integer a nibh.', '2021-01-23', false);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (28, 7, 'In quis justo.', '2022-03-20', false);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (8, 9, 'In hac habitasse platea dictumst.', '2022-05-23', true);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (5, 9, 'Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est. Phasellus sit amet erat.', '2022-08-17', false);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (29, null, 'In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem.', '2021-11-26', true);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (32, null, 'In congue.', '2021-01-20', true);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (47, 10, 'Aliquam erat volutpat.', '2020-06-23', true);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (7, 6, 'Duis consequat dui nec nisi volutpat eleifend.', '2021-12-20', false);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (45, 7, 'Praesent blandit. Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede.', '2021-12-26', false);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (42, 6, 'Morbi non lectus. Aliquam sit amet diam in magna bibendum imperdiet.', '2023-05-23', false);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (15, 9, 'Integer a nibh. In quis justo. Maecenas rhoncus aliquam lacus.', '2021-10-16', true);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (24, 9, 'Morbi vel lectus in quam fringilla rhoncus.', '2022-01-02', false);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (26, 6, 'Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue.', '2022-05-12', true);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (44, 8, 'Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet. Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo.', '2023-04-04', true);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (3, 6, 'Nam dui. Proin leo odio, porttitor id, consequat in, consequat ut, nulla.', '2021-04-10', false);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (18, 7, 'Nam dui.', '2022-11-23', true);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (42, 10, 'Curabitur gravida nisi at nibh. In hac habitasse platea dictumst.', '2022-06-03', false);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (20, 6, 'Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus. Suspendisse potenti.', '2021-12-24', true);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (11, null, 'Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque.', '2021-05-15', false);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (13, 10, 'Maecenas ut massa quis augue luctus tincidunt. Nulla mollis molestie lorem. Quisque ut erat.', '2020-08-10', false);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (3, 6, 'Morbi non quam nec dui luctus rutrum. Nulla tellus. In sagittis dui vel nisl.', '2021-12-07', true);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (5, 6, 'Nulla tempus. Vivamus in felis eu sapien cursus vestibulum.', '2023-05-18', false);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (4, 8, 'Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat. In congue.', '2021-10-13', false);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (8, 7, 'In hac habitasse platea dictumst.', '2021-04-06', false);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (5, 9, 'Aliquam non mauris. Morbi non lectus.', '2022-01-06', true);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (13, 9, 'Mauris sit amet eros. Suspendisse accumsan tortor quis turpis. Sed ante.', '2022-08-17', true);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (22, 9, 'In sagittis dui vel nisl. Duis ac nibh.', '2021-11-07', false);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (48, 8, 'Vivamus tortor. Duis mattis egestas metus.', '2020-10-29', true);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (27, 6, 'Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh. Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est.', '2020-11-04', true);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (29, 9, 'In hac habitasse platea dictumst. Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante.', '2021-03-22', true);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (51, 10, 'Nulla tempus.', '2020-12-17', false);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (40, 6, 'Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus. Duis at velit eu est congue elementum.', '2022-06-07', true);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (17, 10, 'Vivamus vestibulum sagittis sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.', '2021-01-06', true);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (38, 10, 'Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. Nulla justo. Aliquam quis turpis eget elit sodales scelerisque.', '2020-09-02', false);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (41, 6, 'Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Etiam vel augue. Vestibulum rutrum rutrum neque.', '2022-12-31', false);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (8, 8, 'Integer ac leo. Pellentesque ultrices mattis odio.', '2020-11-23', true);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (24, 6, 'Proin interdum mauris non ligula pellentesque ultrices.', '2021-04-08', false);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (28, 7, 'Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl. Nunc rhoncus dui vel sem.', '2021-09-13', false);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (41, 9, 'Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros. Vestibulum ac est lacinia nisi venenatis tristique.', '2020-11-14', true);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (21, 10, 'Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci. Mauris lacinia sapien quis libero. Nullam sit amet turpis elementum ligula vehicula consequat.', '2022-09-08', false);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (48, 9, 'Phasellus sit amet erat. Nulla tempus.', '2021-09-26', true);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (50, 6, 'Etiam vel augue.', '2022-06-25', true);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (13, 8, 'Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue.', '2021-01-23', false);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (22, 10, 'Proin at turpis a pede posuere nonummy. Integer non velit.', '2021-03-25', false);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (29, 10, 'Donec dapibus.', '2020-11-06', false);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (7, 9, 'Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis. Fusce posuere felis sed lacus. Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl.', '2022-02-21', false);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (31, 7, 'Curabitur at ipsum ac tellus semper interdum.', '2021-11-26', false);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (19, 9, 'Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. Nulla justo.', '2022-08-09', false);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (2, 8, 'Nunc rhoncus dui vel sem.', '2022-06-19', false);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (29, 10, 'Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus vestibulum sagittis sapien.', '2023-01-09', false);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (41, 7, 'Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus. Suspendisse potenti. In eleifend quam a odio.', '2021-04-24', true);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (24, 8, 'Nulla facilisi.', '2020-09-30', false);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (28, 10, 'Mauris sit amet eros. Suspendisse accumsan tortor quis turpis.', '2020-12-09', true);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (24, null, 'Mauris sit amet eros.', '2021-08-03', false);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (19, 8, 'Morbi vel lectus in quam fringilla rhoncus.', '2020-07-13', false);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (4, 10, 'Proin at turpis a pede posuere nonummy. Integer non velit.', '2020-11-29', false);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (48, 7, 'Vivamus in felis eu sapien cursus vestibulum. Proin eu mi. Nulla ac enim.', '2021-01-20', false);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (10, 9, 'Phasellus in felis. Donec semper sapien a libero. Nam dui.', '2020-07-07', true);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (31, 8, 'Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem. Fusce consequat.', '2023-02-07', false);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (30, 10, 'Phasellus in felis. Donec semper sapien a libero. Nam dui.', '2021-08-24', false);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (16, 9, 'In hac habitasse platea dictumst.', '2021-03-12', false);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (4, 9, 'Phasellus in felis.', '2022-05-04', true);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (50, 7, 'Praesent id massa id nisl venenatis lacinia. Aenean sit amet justo. Morbi ut odio.', '2023-03-01', false);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (50, 10, 'Aliquam non mauris.', '2022-07-30', false);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (5, null, 'Morbi non lectus. Aliquam sit amet diam in magna bibendum imperdiet. Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis.', '2022-07-28', false);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (4, 6, 'Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci. Nullam molestie nibh in lectus.', '2022-05-07', false);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (4, 8, 'Maecenas ut massa quis augue luctus tincidunt.', '2021-08-01', false);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (25, 10, 'Aenean lectus. Pellentesque eget nunc.', '2021-04-23', true);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (46, 10, 'Phasellus in felis. Donec semper sapien a libero.', '2021-01-23', false);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (25, 7, 'Etiam pretium iaculis justo. In hac habitasse platea dictumst.', '2021-02-22', true);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (25, 8, 'Morbi quis tortor id nulla ultrices aliquet.', '2022-03-12', false);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (47, 9, 'Cras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit.', '2021-04-25', false);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (46, 8, 'Nullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum. Integer a nibh.', '2020-09-04', true);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (34, 6, 'Aenean sit amet justo. Morbi ut odio. Cras mi pede, malesuada in, imperdiet et, commodo vulputate, justo.', '2022-08-18', true);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (49, 8, 'Etiam faucibus cursus urna.', '2023-02-26', true);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (49, 8, 'In hac habitasse platea dictumst.', '2022-06-25', true);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (19, 10, 'Donec semper sapien a libero. Nam dui. Proin leo odio, porttitor id, consequat in, consequat ut, nulla.', '2021-05-07', true);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (5, 7, 'Etiam vel augue. Vestibulum rutrum rutrum neque.', '2022-06-09', false);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (39, 7, 'Nulla nisl. Nunc nisl.', '2022-02-15', true);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (27, 10, 'Nullam varius. Nulla facilisi.', '2022-05-14', true);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (16, 9, 'Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi.', '2020-08-29', false);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (11, 9, 'Praesent id massa id nisl venenatis lacinia. Aenean sit amet justo.', '2023-05-16', true);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (47, 10, 'Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh. Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est.', '2021-06-22', false);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (19, 9, 'Morbi ut odio.', '2022-06-12', true);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (32, 9, 'Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede.', '2021-06-29', false);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (16, 6, 'Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis. Fusce posuere felis sed lacus.', '2023-05-26', false);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (37, 8, 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Proin risus. Praesent lectus.', '2020-09-09', false);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (11, 7, 'Nullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum.', '2022-07-09', true);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (13, 9, 'Etiam vel augue. Vestibulum rutrum rutrum neque.', '2020-07-17', true);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (21, 10, 'Vivamus in felis eu sapien cursus vestibulum.', '2022-03-15', false);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (41, 6, 'Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros.', '2021-02-24', false);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (14, 9, 'Curabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.', '2020-11-07', false);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (41, 7, 'Donec posuere metus vitae ipsum.', '2021-07-14', true);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (50, 9, 'Mauris lacinia sapien quis libero. Nullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum.', '2023-03-05', true);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (43, 9, 'Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus vestibulum sagittis sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.', '2023-02-06', true);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (39, 9, 'Proin risus. Praesent lectus. Vestibulum quam sapien, varius ut, blandit non, interdum in, ante.', '2022-04-25', false);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (21, 6, 'Proin risus. Praesent lectus. Vestibulum quam sapien, varius ut, blandit non, interdum in, ante.', '2023-05-11', true);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (4, 6, 'Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam.', '2022-05-08', true);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (35, 6, 'Curabitur in libero ut massa volutpat convallis.', '2021-02-12', false);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (45, 7, 'Integer ac neque.', '2020-12-26', true);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (30, 9, 'Nulla tempus. Vivamus in felis eu sapien cursus vestibulum. Proin eu mi.', '2022-08-21', false);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (1, 9, 'Sed ante. Vivamus tortor. Duis mattis egestas metus.', '2021-09-06', false);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (32, 10, 'Proin at turpis a pede posuere nonummy.', '2022-11-08', true);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (27, 9, 'Suspendisse potenti. Cras in purus eu magna vulputate luctus.', '2021-02-24', false);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (36, 8, 'Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus vestibulum sagittis sapien.', '2022-10-23', false);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (2, 10, 'Praesent lectus. Vestibulum quam sapien, varius ut, blandit non, interdum in, ante.', '2022-10-18', true);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (39, 10, 'Aenean auctor gravida sem. Praesent id massa id nisl venenatis lacinia.', '2020-08-03', false);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (38, 10, 'Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci.', '2020-08-05', false);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (49, 10, 'In hac habitasse platea dictumst. Maecenas ut massa quis augue luctus tincidunt.', '2020-11-15', false);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (22, 8, 'Etiam justo. Etiam pretium iaculis justo.', '2021-12-09', true);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (1, 10, 'Nam ultrices, libero non mattis pulvinar, nulla pede ullamcorper augue, a suscipit nulla elit ac nulla. Sed vel enim sit amet nunc viverra dapibus.', '2021-10-31', true);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (41, 10, 'In congue. Etiam justo. Etiam pretium iaculis justo.', '2022-12-22', true);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (4, 9, 'Nullam molestie nibh in lectus. Pellentesque at nulla.', '2020-08-25', true);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (33, 8, 'Morbi a ipsum.', '2020-12-29', false);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (31, 10, 'Cras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit.', '2022-08-17', true);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (29, 10, 'Nullam sit amet turpis elementum ligula vehicula consequat.', '2022-06-23', false);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (42, 10, 'Curabitur in libero ut massa volutpat convallis.', '2020-09-21', true);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (42, 10, 'Vivamus tortor. Duis mattis egestas metus. Aenean fermentum.', '2022-01-19', true);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (21, 7, 'Nulla justo. Aliquam quis turpis eget elit sodales scelerisque.', '2021-09-24', false);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (21, 6, 'Morbi porttitor lorem id ligula. Suspendisse ornare consequat lectus.', '2020-06-14', false);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (41, 9, 'Curabitur at ipsum ac tellus semper interdum. Mauris ullamcorper purus sit amet nulla. Quisque arcu libero, rutrum ac, lobortis vel, dapibus at, diam.', '2021-05-01', false);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (22, 6, 'Praesent id massa id nisl venenatis lacinia. Aenean sit amet justo. Morbi ut odio.', '2022-04-11', true);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (1, 7, 'Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi.', '2020-06-21', false);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (17, 9, 'In congue. Etiam justo.', '2021-08-12', true);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (20, 9, 'Nulla justo. Aliquam quis turpis eget elit sodales scelerisque.', '2020-08-04', true);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (49, 7, 'Aenean fermentum.', '2022-03-08', false);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (31, 7, 'Nam tristique tortor eu pede.', '2021-06-06', false);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (45, 8, 'Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede.', '2023-01-02', false);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (45, 8, 'Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque. Quisque porta volutpat erat.', '2021-07-20', true);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (24, 7, 'Fusce consequat.', '2022-05-08', false);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (44, 10, 'Proin risus. Praesent lectus.', '2023-02-19', true);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (32, 8, 'Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue.', '2023-02-26', true);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (46, 6, 'In hac habitasse platea dictumst. Maecenas ut massa quis augue luctus tincidunt. Nulla mollis molestie lorem.', '2021-08-18', false);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (6, null, 'In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem. Duis aliquam convallis nunc.', '2022-11-02', false);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (26, 6, 'Curabitur gravida nisi at nibh.', '2022-03-06', true);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (19, 10, 'Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl.', '2023-06-06', false);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (51, 8, 'Mauris sit amet eros. Suspendisse accumsan tortor quis turpis. Sed ante.', '2023-05-04', false);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (26, 10, 'Integer a nibh. In quis justo.', '2021-11-18', false);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (32, 10, 'Fusce consequat.', '2020-07-28', false);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (42, 7, 'In hac habitasse platea dictumst.', '2023-03-20', false);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (18, 10, 'Proin interdum mauris non ligula pellentesque ultrices.', '2022-10-06', true);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (36, 8, 'Integer tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat.', '2021-10-01', false);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (25, 7, 'Praesent blandit.', '2021-05-03', false);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (50, 8, 'Morbi a ipsum. Integer a nibh. In quis justo.', '2023-05-04', true);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (34, 6, 'Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.', '2020-11-20', false);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (32, 7, 'In hac habitasse platea dictumst. Maecenas ut massa quis augue luctus tincidunt.', '2023-04-14', true);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (48, 10, 'Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui.', '2021-12-12', false);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (5, 9, 'Nulla mollis molestie lorem.', '2021-07-27', true);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (7, 10, 'Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem. Fusce consequat.', '2022-10-25', true);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (51, 10, 'Etiam vel augue. Vestibulum rutrum rutrum neque.', '2023-03-21', true);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (4, 9, 'Curabitur at ipsum ac tellus semper interdum. Mauris ullamcorper purus sit amet nulla. Quisque arcu libero, rutrum ac, lobortis vel, dapibus at, diam.', '2022-11-21', true);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (48, 9, 'Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.', '2021-05-28', true);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (38, 8, 'Sed vel enim sit amet nunc viverra dapibus. Nulla suscipit ligula in lacus.', '2022-04-17', false);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (33, 10, 'Suspendisse accumsan tortor quis turpis.', '2021-04-15', false);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (32, 8, 'Sed ante.', '2023-03-04', true);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (44, 10, 'Aliquam erat volutpat. In congue. Etiam justo.', '2021-07-19', false);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (50, 10, 'Maecenas ut massa quis augue luctus tincidunt. Nulla mollis molestie lorem.', '2022-07-04', false);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (1, 9, 'Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci. Nullam molestie nibh in lectus. Pellentesque at nulla.', '2021-03-08', false);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (25, 7, 'Nulla suscipit ligula in lacus.', '2020-11-29', false);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (21, 9, 'Mauris ullamcorper purus sit amet nulla. Quisque arcu libero, rutrum ac, lobortis vel, dapibus at, diam. Nam tristique tortor eu pede.', '2022-06-20', false);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (11, 8, 'Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem.', '2021-12-02', true);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (4, 10, 'Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est.', '2023-03-07', true);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (22, 8, 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Proin interdum mauris non ligula pellentesque ultrices.', '2020-09-24', false);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (18, 9, 'Proin at turpis a pede posuere nonummy. Integer non velit.', '2020-08-01', false);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (24, 8, 'Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque.', '2023-03-22', false);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (11, null, 'Vivamus in felis eu sapien cursus vestibulum.', '2021-04-11', true);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (33, 6, 'Pellentesque at nulla.', '2021-09-08', true);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (49, null, 'Nullam varius.', '2021-03-07', false);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (12, 10, 'Suspendisse accumsan tortor quis turpis.', '2022-12-10', true);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (41, 7, 'Nullam varius.', '2022-07-20', false);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (12, 8, 'Pellentesque ultrices mattis odio.', '2022-05-08', false);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (2, 8, 'Integer ac neque.', '2022-10-28', false);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (3, 6, 'Nam ultrices, libero non mattis pulvinar, nulla pede ullamcorper augue, a suscipit nulla elit ac nulla.', '2021-05-21', true);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (5, 10, 'Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.', '2022-08-08', false);

