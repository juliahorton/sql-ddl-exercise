-- from the terminal run:
-- psql < music.sql

DROP DATABASE IF EXISTS music;

CREATE DATABASE music;

\c music

-- CREATE TABLE songs
-- (
--   id SERIAL PRIMARY KEY,
--   title TEXT NOT NULL,
--   duration_in_seconds INTEGER NOT NULL,
--   release_date DATE NOT NULL,
--   artists TEXT[] NOT NULL,
--   album TEXT NOT NULL,
--   producers TEXT[] NOT NULL
-- );

-- INSERT INTO songs
--   (title, duration_in_seconds, release_date, artists, album, producers)
-- VALUES
--   ('MMMBop', 238, '04-15-1997', '{"Hanson"}', 'Middle of Nowhere', '{"Dust Brothers", "Stephen Lironi"}'),
--   ('Bohemian Rhapsody', 355, '10-31-1975', '{"Queen"}', 'A Night at the Opera', '{"Roy Thomas Baker"}'),
--   ('One Sweet Day', 282, '11-14-1995', '{"Mariah Cary", "Boyz II Men"}', 'Daydream', '{"Walter Afanasieff"}'),
--   ('Shallow', 216, '09-27-2018', '{"Lady Gaga", "Bradley Cooper"}', 'A Star Is Born', '{"Benjamin Rice"}'),
--   ('How You Remind Me', 223, '08-21-2001', '{"Nickelback"}', 'Silver Side Up', '{"Rick Parashar"}'),
--   ('New York State of Mind', 276, '10-20-2009', '{"Jay Z", "Alicia Keys"}', 'The Blueprint 3', '{"Al Shux"}'),
--   ('Dark Horse', 215, '12-17-2013', '{"Katy Perry", "Juicy J"}', 'Prism', '{"Max Martin", "Cirkut"}'),
--   ('Moves Like Jagger', 201, '06-21-2011', '{"Maroon 5", "Christina Aguilera"}', 'Hands All Over', '{"Shellback", "Benny Blanco"}'),
--   ('Complicated', 244, '05-14-2002', '{"Avril Lavigne"}', 'Let Go', '{"The Matrix"}'),
--   ('Say My Name', 240, '11-07-1999', '{"Destiny''s Child"}', 'The Writing''s on the Wall', '{"Darkchild"}');

-- REFACTORED/NORMALIZED: 

CREATE TABLE artists(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

CREATE TABLE albums(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  artist1_id INTEGER REFERENCES artists(id) NOT NULL,
  artist2_id INTEGER REFERENCES artists(id)
);

CREATE TABLE producers(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

CREATE TABLE songs(
  id SERIAL PRIMARY KEY,
  title TEXT NOT NULL,
  duration_in_seconds INTEGER NOT NULL,
  release_date DATE,
  artist1_id INTEGER REFERENCES artists(id),
  artist2_id INTEGER REFERENCES artists(id),
  album_id INTEGER REFERENCES albums(id),
  producer1_id INTEGER REFERENCES producers(id),
  producer2_id INTEGER REFERENCES producers(id)
);

INSERT INTO artists (name) VALUES
('Hanson'),
('Queen'),
('Marian Cary'),
('Boyz II Men'),
('Lady Gaga'),
('Bradley Cooper'),
('Nickelback'),
('Jay Z'),
('Alicia Keys'),
('Katy Perry'),
('Juicy J'),
('Maroon 5'),
('Christina Aguilera'),
('Avril Lavigne'),
('Destiny''s Child');

INSERT INTO albums (name, artist1_id, artist2_id) VALUES 
('Middle of Nowhere',1,NULL),
('A Night at the Opera',2,NULL),
('Daydream',3,4),
('A Star Is Born',5,6),
('Silver Side Up',7, NULL),
('The Blueprint 3',8,9),
('Prism',10,11),
('Hands All Over',12,13),
('Let Go',14, NULL),
('The Writing''s on the Wall',15, NULL);

INSERT INTO producers (name) VALUES
('Dust Brothers'),
('Stephen Lironi'),
('Roy Thomas Baker'),
('Walter Afanasieff'),
('Benjamin Rice'),
('Rick Parashar'),
('Al Shux'),
('Max Martin'),
('Cirkut'),
('Shellback'),
('Benny Blanco'),
('The Matrix'),
('Darkchild');

INSERT INTO songs (title, duration_in_seconds, release_date, artist1_id, artist2_id, album_id, producer1_id, producer2_id) VALUES
('MMMBop', 238, '04-15-1997', 1, NULL, 1, 1, 2),
('Bohemian Rhapsody', 355, '10-31-1975', 2, NULL, 2, 3, NULL),
('One Sweet Day', 282, '11-14-1995', 3, 4, 3, 4, NULL),
('Shallow', 216, '09-27-2018', 5, 6, 4, 5, NULL),
('How You Remind Me', 223, '08-21-2001', 7, NULL, 5, 6, NULL),
('New York State of Mind', 276, '10-20-2009', 8, 9, 6, 7, NULL),
('Dark Horse', 215, '12-17-2013', 10, 11, 7, 8, 9),
('Moves Like Jagger', 201, '06-21-2011', 12, 13, 8, 10, 11),
('Complicated', 244, '05-14-2002', 14, NULL, 9, 12, NULL),
('Say My Name', 240, '11-07-1999', 15, NULL, 10, 13, NULL);