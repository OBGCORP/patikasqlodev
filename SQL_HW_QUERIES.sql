--soru 1
select content, title, username, name from posts
join users on users.user_id = posts.user_id
join categories on categories.category_id = posts.category_id;

--soru 2
select content, title, username, posts.creation_date from posts
join users on users.user_id = posts.user_id
order by posts.creation_date desc
limit 5;

--soru 3
select title, count(*) as "comment count" from posts
join comments on comments.post_id = posts.post_id
group by title;

--soru 4
select username, email from users;

--soru 5
select title, comment, comments.creation_date from posts
join comments on comments.post_id = posts.post_id
group by title, comment, comments.creation_date 
order by comments.creation_date desc
limit 10;

--soru 6
select title, categories.name, username from posts
join users on users.user_id = posts.user_id
join categories on categories.category_id = posts.category_id
where posts.user_id = 9;

--soru 7
select users.user_id, username, count(*) from posts
join users on users.user_id = posts.user_id
group by users.user_id, username;

--soru 8
select name, count(*) from posts
join categories on categories.category_id = posts.category_id
group by name;

--soru 9
select categories.name, count from categories
join(
	select count(*), name from posts
	join categories on posts.category_id = categories.category_id
	group by name
) as groupped_categories on groupped_categories.name = categories.name
group by categories.name, count
order by count desc
limit 1;

--soru 10
select name, sum(view_count) from posts
join categories on categories.category_id = posts.category_id
group by name
order by sum(view_count) desc
limit 1;

--soru 11
select title, count(*) from posts
join comments on comments.post_id = posts.post_id
group by title
order by count(*) desc
limit 1;

--soru 12
select username, email from posts
join users on users.user_id = posts.user_id
where post_id = 13;

--soru 13
select * from posts
where title ilike '%ore%' or
content ilike '%ips%';

--soru 14
select username, comments.creation_date, comment from comments
join users on users.user_id = comments.user_id
where users.user_id = 9
order by comments.creation_date desc
limit 1;

--soru 15
select avg(count) from (
	select post_id, count(*) from comments
	group by post_id
) as aaa;

--soru 16
select * from posts
where extract(year from now()) - extract(year from posts.creation_date) = 0
and extract(month from now()) - extract(month from posts.creation_date) = 0
and (extract(day from now()) - extract(day from posts.creation_date)) < 31;

--soru 17
select * from comments
where user_id = 10;

--soru 18
select * from posts
join categories on categories.category_id = posts.category_id
where categories.name = 'Travel'

--soru 19
select * from (select count(*) from posts group by category_id) as aaa
where count < 5;

--soru 20
select username from users
where (
	select count(*) from posts 
	where posts.user_id = users.user_id
) > 0
and
(
	select count(*) from comments 
	where comments.user_id = users.user_id
) > 0;

--soru 21
select username from users
where(
	select count(distinct post_id) from comments
	where users.user_id = comments.user_id
) >= 2

--soru 22
select name from categories
where (
	select count(*) from posts
	group by category_id
) >= 3;

--soru 23
select username from (
	select username, count(*) from posts
	join users on users.user_id = posts.user_id
	group by username
) as aaa
where count > 5
group by username;

--soru 24
select email from users
where user_id in(
	select user_id from posts
	group by user_id
	having count(*) > 5
)
union
select email from users
where user_id in(
	select user_id from comments
	group by user_id
	having count(*) > 5
)

--soru 25
select username from users
join posts on posts.user_id = users.user_id
join comments on comments.user_id = users.user_id
group by username
having count(posts.post_id) > 0 and count(comments.comment_id) = 0
