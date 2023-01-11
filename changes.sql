--изменения 
select name_nickname from artist
where id in (
select a.artist_id
from albumartist a 
join album a2 on a.album_id = a2.id 
where a2.year_of_release < '2020-01-01' or a2.year_of_release > '2020-12-31');

--select name from collection
--where id in (select collection_id from collectionsong
--where song_id in (select id from song
--where album_id in (select album_id from albumartist
--where artist_id in (select id from artist
--where name_nickname like '%Скриптонит%'))));
--

select name_nickname from artist a2 
where id in (select a.artist_id  from albumartist a 
join genreartist g on a.artist_id = g.artist_id 
group by a.artist_id
having count(g.artist_id) > 1);

select name from song
where id not in (select song_id from collectionsong);

select name_nickname from artist
where id in (select artist_id
from albumartist a 
join song s on a.album_id = s.album_id 
where s.song_time in (select min(song_time) from song));

select title from album a2 
where id in (select album_id from song s2 
group by album_id 
having count(album_id) in (select count(a.id) from album a 
join song s on a.id = s.album_id 
group by a.id
order by count(a.id)
limit 1));