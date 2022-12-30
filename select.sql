select title, year_of_release from album
where year_of_release >= '2018-01-01' and year_of_release <= '2018-12-31';

select name, song_time from song
order by song_time desc
limit 1;

select name, song_time from song
where song_time >= 3.50;

select name from collection
where year_of_release >= '2018-01-01' and year_of_release <= '2020-12-31';

select name_nickname from artist
where name_nickname not like '% %';

select name from song
where name like '%Моя%' or name like '%My%';

--select - запросы агрегирующие функции

select genre_id, count(*) from genreartist 
group by genre_id
order by count(*) desc;

select album_id, count(*) from song s 
group by album_id 
order by count(*) desc;

select album_id, AVG(song_time) from song s 
group by album_id 
order by AVG(song_time) desc;

select name_nickname from artist
where id in (select artist_id from albumartist a 
where album_id in (select id from album 
where year_of_release < '2020-01-01' or year_of_release > '2020-12-31')
group by artist_id
order by artist_id);

select name from collection
where id in (select collection_id from collectionsong
where song_id in (select id from song
where album_id in (select album_id from albumartist
where artist_id in (select id from artist
where name_nickname like '%Скриптонит%'))));

select title from album
where id in (select album_id from albumartist
where artist_id in (select artist_id from genreartist
group by artist_id 
having count(*) > 1));

select name from song
where id not in (select song_id from collectionsong);

select name_nickname from artist
where id in (select artist_id from albumartist
where album_id in (select album_id from song
where id in (select id from song
where song_time in (select min(song_time) from song))));

select title from album
where id in (select album_id from song
group by album_id
having count(*) = 1);