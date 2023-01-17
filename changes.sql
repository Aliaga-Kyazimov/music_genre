--4 запроос
select name_nickname from artist a 
join albumartist a2 
on a.id = a2.artist_id 
join album a3 
on a3.id = a2.album_id 
where a3.year_of_release < '2020-01-01' or a3.year_of_release > '2020-12-31'
group by a.name_nickname 

--5 запрос
select c."name"  from collection c 
join collectionsong c2 
on c.id = c2.collection_id 
join song s 
on s.id = c2.song_id
join albumartist a 
on a.album_id = s.album_id
join artist a2 
on a2.id = a.artist_id
where name_nickname like '%Скриптонит%'
group by c."name" ;

--6 запрос
select title from album a 
join albumartist a2 
on a2.album_id = a.id 
join genreartist g 
on g.artist_id = a2.artist_id
group by a.id
having count(a.id) > 1; 

--7 запрос
select name from song
where id not in (select song_id from collectionsong);

--8 запрос
select name_nickname from artist a 
join albumartist a2 
on a.id = a2.artist_id 
join song s 
on s.album_id = a2.album_id 
where s.song_time in (select min(song_time) from song);

--9 запрос	
select title from album a 
join song s 
on a.id = s.album_id
group by a.title
having count(a.title) in (select count(album_id) from song s 
group by s.album_id 
order by count(s.album_id)
limit 1);