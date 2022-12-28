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