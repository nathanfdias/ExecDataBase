--Actor
select * from actor;
select * from actor where first_name like '%Christian';
select first_name, last_name from actor where first_name like 'C%' and last_name like 'G%';
select * from actor order by actor_id limit 10;

--Address
select * from address;
select * from address where district like '%Alberta';
select district, address from address where district like '%Alberta' and address like '47%';
select * from address order by address_id limit 10;

--Category
select * from category;
select * from category where name like '%Action';

select description, title, name from 
    category c  
inner join
    film_category fc 
on
    c.category_id = fc.category_id
inner join
	film f
on
	fc.film_id = f.film_id
where 
	c.category_id = '1'; 
select * from category order by name limit 10;

--City
select * from city;
select * from city where city like 'A%';
select city, city_id from city where city like '%a' and city_id = 2; 
select * from 
	city c
inner join
	country c2 
on
	c.country_id = c2.country_id  
order by city_id limit 5;

--Country
select * from country;
select * from country where country like 'A%';
select * from 
	country c2  
inner join
	city c 
on
	c2.country_id = c.country_id
order by c2.country_id limit 5;

select * from
country c2 
inner join
	city c
on
	c2.country_id = c.country_id
where 
city 
like 'A%'
and
country
like 'A%';


--Customer
select * from customer;
select * from customer where first_name like 'Ja%';

select first_name, last_name  
from 
	customer 
where 
	first_name
like 'Ja%' and last_name like 'E%'
order by
	store_id 
limit 1;

--Film
select * from film;
select * from film where title like 'G%';
select title, film_id from film where title like 'G%';
select title, film_id, special_features  from film where title like 'G%' order by film_id limit 5;

--Film_actor

select * from film_actor;

select title, description, rental_duration from 
	film_actor fa
inner join
	film f 
on
	fa.film_id = f.film_id; 

select title, description, rental_duration from 
	film_actor fa
inner join
	film f 
on
	fa.film_id = f.film_id
where 
	title like 'A%'
limit 3;

--Film_category
select * from  film_category;

select category_id, description, title from 
	film_category fc 
inner join 
	film f 
on
	fc.film_id = f.film_id;

select category_id, description, title from 
	film_category fc 
inner join 
	film f 
on
	fc.film_id = f.film_id
where 
	title like 'A%'
and 
	category_id = 1;

select category_id, film_id from film_category where category_id = 1 order by film_id limit 3;

--Inventory

select * from inventory;

select * from 
	inventory i 
inner join
	film f
on 
	i.film_id = f.film_id
where 
	title like 'T%';

select * from 
	inventory i 
inner join
	film f
on 
	i.film_id = f.film_id
where 
	title like 'T%'
and 
	store_id = 1;

select * from 
	inventory i 
inner join
	film f
on 
	i.inventory_id = f.film_id
where 
	title like 'T%'
and 
	store_id = 1
limit 3;

--Language

select * from language;

select * from 
	language l 
inner join
	film f 
on
	l.language_id = f.language_id;

select name, title, description from 
	language l 
inner join
	film f 
on
	l.language_id = f.language_id 
where
	name like 'English%';

select name, title from 
	language l 
inner join
	film f 
on
	l.language_id = f.language_id 
where
	name like 'English%'
limit 3;
	
--Payment

select * from payment;

select * from 
	payment p 
inner join 
	customer c 
on
	p.customer_id = c.customer_id;

select first_name, p.customer_id, last_name, email from 
	payment p 
inner join 
	customer c 
on
	p.customer_id = c.customer_id
where
	first_name like '%Peter';

select first_name, last_name, email from 
	payment p 
inner join 
	customer c 
on
	p.customer_id = c.customer_id
where
	first_name like '%Peter'
and 
	last_name like '%Menard'
limit 1;

--Rental

select * from rental;

select * from 
	rental r
inner join
	payment p
on
	r.rental_id = p.rental_id;

select * from rental;

select * from 
	rental r
inner join
	payment p
on
	r.rental_id = p.rental_id
where 
	r.staff_id = 1;

select * from 
	rental r
inner join
	payment p
on
	r.rental_id = p.rental_id
where 
	r.staff_id = 1
order by 
	r.staff_id 
limit 4;

--Staff
select * from staff;
select * from staff where first_name like'M%';
select first_name, last_name from staff where first_name like 'M%' and last_name like 'H%';
select password from staff where first_name like 'M%' and last_name like 'H%' order by staff_id limit 1;

--Store
select * from store;

select * from 
	store s 
inner join
	address a 
on
	s.address_id = a.address_id;

select * from 
	store s 
inner join
	address a 
on
	s.address_id = a.address_id
limit 2;

select * from 
	store s 
inner join
	address a 
on
	s.address_id = a.address_id
inner join 
	city c 
on 
	a.city_id = c.city_id
where 
	address like '47%';
