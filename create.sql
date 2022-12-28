create table if not exists Genre (
id SERIAL primary key,
title varchar(40) not null
);

create table if not exists Artist (
id SERIAL primary key,
name_nickname varchar(40) not null
);

create table if not exists GenreArtist (
genre_id INTEGER references Genre(id),
artist_id INTEGER references Artist(id),
constraint pk primary key (genre_id, artist_id)
);

create table if not exists Album(
id SERIAL primary key,
title varchar(40) not null,
year_of_release date not null
);

create table if not exists Song(
id SERIAL primary key,
album_id INTEGER not null references Album(id),
name varchar(40) not null,
year_of_release date not null
);

create table if not exists AlbumArtist (
album_id INTEGER references Album(id),
artist_id INTEGER references Artist(id),
constraint pk_2 primary key (album_id, artist_id)
);

create table if not exists Collection (
id SERIAL primary key,
name varchar(40) not null,
year_of_release date not null
);

create table if not exists CollectionSong (
collection_id INTEGER references Collection(id),
song_id INTEGER references Song(id),
constraint pk_1 primary key (collection_id, song_id)
);