DROP DATABASE IF EXISTS craigslist;
CREATE DATABASE craigslist;
\c craigslist;

CREATE TABLE categories (
    id SERIAL PRIMARY KEY,
    name TEXT
);

CREATE TABLE regions (
    id SERIAL PRIMARY KEY,
    name TEXT
);

CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    username TEXT NOT NULL,
    password TEXT NOT NULL CHECK (LENGTH(password) > 8)
);

CREATE TABLE posts (
    id SERIAL PRIMARY KEY,
    user_id INTEGER REFERENCES users(id),
    category_id INTEGER REFERENCES categories(id),
    region_id INTEGER REFERENCES regions(id),
    location_zip VARCHAR(5) CHECK (LENGTH(location_zip) = 5),
    time_stamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    title TEXT DEFAULT 'Untitled Post',
    body TEXT NOT NULL
);

INSERT INTO categories (name) VALUES
('community'),
('services'),
('housing'),
('jobs'),
('for sale');

INSERT INTO regions (name) VALUES
('US'),
('Canada'),
('Europe'),
('Asia/Pacific/Middle East'),
('Oceania'),
('Latin America'),
('Africa');

INSERT INTO users (username,password) VALUES
('bunny_luvr','ilovebunnieshaha'),
('getoffmylawn','youKIDSareALWAYSonmyDAMNlawn'),
('churchofsatan666','antonlaveygotitright');

INSERT INTO posts (user_id, category_id,region_id,location_zip,title,body) VALUES
(1,5,2,'65809','For sale: used cage','I have my bunny''s old cage for sale for $10'),
(2,3,1,'93248','ISO roommate','Must be clean and also please pay rent on time'),
(3,1,5,'83746','did anyone hear that?gunshot?','heard something and it sounded like a gunshot maybe?????');