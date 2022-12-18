create table films(
	film_name text primary key,
	film_genre text not null,
	age_rating integer not null check (age_rating > 0),
	poster_link text not null
);

create table cinemas(
	cinema_name text primary key,
	cinema_district text not null,
	cinema_adress text not null,
	hall_count integer not null check (hall_count > 0)
);

create table sales(
	sale_name text primary key,
	is_partner bool not null,
	sale_link text not null
);

create table news(
	news_name text not null,
	news_date date not null,
	news_content text not null,
	img_link text not null
);

create table sessions(
	session_id serial primary key,
	session_time time not null,
    session_date date not null,
	cinema_name text not null,
	film_name text not null,
	unique (session_time, session_date, cinema_name, film_name)
);


--фильмы
insert into films(
	values('Мира', 'фантастика', 12 , '\images.mira.jpg')
);

delete from films
where film_name = 'Мира'

--акции
insert into sales(
	values('Новогодняя', true , 'newyear.com')
);

delete from sales
where sale_name = 'Новогодняя'

--новости
insert into news(
	values('ТНТ', '2022.12.18', 
		   'Телеканал стал партнёром сети, в которую входят 150 кинозалов по всей России.',
		  'img.jpg')
);

delete from news
where news_name = 'ТНТ'


--сеансы
insert into sessions(
	values
	(default, '15:30', '2022.12.18', 'Cinema', 'Мира'),
	(default, '14:00', '2022.12.14', 'Cinema', 'Мира'),
	(default, '10:00', '2022.11.18', 'Cinema', 'Мира')
);

insert into sessions(
	values
	(default, '15:30', '2022.12.19', 'Cinema', 'Колобок'),
	(default, '14:00', '2022.12.24', 'Cinema', 'Колобок'),
	(default, '10:00', '2022.12.28', 'Cinema', 'Колобок')
);

--запросы

--выборка кинотеатров
select * from cinemas;

--выборка акций
select * from sales;

--выборка новостей
select * from news;

--сегодня в кино
select distinct(s.film_name), f.film_genre, f.age_rating, f.poster_link 
from sessions as s
left join films as f on f.film_name = s.film_name
where s.session_date = current_date;

--скоро в кино
with p as(
	select min(session_date) as d, film_name from sessions
	group by film_name
)
select p.film_name, f.film_genre, f.age_rating, f.poster_link from p
left join films as f on f.film_name = p.film_name
where d > current_date


---------------
drop table films;
drop table cinemas;
drop table sales;
drop table news;
drop table sessions;



