-- ======================
-- Nettoyage
-- ======================
DROP DATABASE IF EXISTS universe;
CREATE DATABASE universe;
\connect universe;

-- ======================
-- GALAXY
-- ======================
CREATE TABLE galaxy (
    galaxy_id SERIAL PRIMARY KEY,
    name VARCHAR(20) UNIQUE NOT NULL,
    area INTEGER,
    volume INTEGER,
    age NUMERIC,
    material TEXT,
    has_life BOOLEAN,
    has_water BOOLEAN
);

-- ======================
-- STAR
-- ======================
CREATE TABLE star (
    star_id SERIAL PRIMARY KEY,
    galaxy_id INTEGER NOT NULL,
    name VARCHAR(20) UNIQUE NOT NULL,
    area INTEGER,
    volume INTEGER,
    age NUMERIC,
    material TEXT,
    has_life BOOLEAN,
    has_water BOOLEAN,
    CONSTRAINT fk_star_galaxy
        FOREIGN KEY (galaxy_id)
        REFERENCES galaxy(galaxy_id)
);

-- ======================
-- PLANET
-- ======================
CREATE TABLE planet (
    planet_id SERIAL PRIMARY KEY,
    star_id INTEGER NOT NULL,
    name VARCHAR(20) UNIQUE NOT NULL,
    area INTEGER,
    volume INTEGER,
    age NUMERIC,
    material TEXT,
    has_life BOOLEAN,
    has_water BOOLEAN,
    CONSTRAINT fk_planet_star
        FOREIGN KEY (star_id)
        REFERENCES star(star_id)
);

-- ======================
-- MOON
-- ======================
CREATE TABLE moon (
    moon_id SERIAL PRIMARY KEY,
    planet_id INTEGER NOT NULL,
    name VARCHAR(20) UNIQUE NOT NULL,
    area INTEGER,
    volume INTEGER,
    age NUMERIC,
    material TEXT,
    has_life BOOLEAN,
    has_water BOOLEAN,
    CONSTRAINT fk_moon_planet
        FOREIGN KEY (planet_id)
        REFERENCES planet(planet_id)
);

-- ======================
-- MORE INFO
-- ======================
CREATE TABLE more_info (
    more_info_id SERIAL PRIMARY KEY,
    planet_id INTEGER NOT NULL,
    name VARCHAR(20) UNIQUE NOT NULL,
    description TEXT,
    CONSTRAINT fk_info_planet
        FOREIGN KEY (planet_id)
        REFERENCES planet(planet_id)
);

-- ======================
-- INSERT DATA
-- ======================

-- GALAXY (6)
INSERT INTO galaxy (name, area, volume, age, material, has_life, has_water) VALUES
('galaxy1', 500, 750, 1500.75, 'gas', false, false),
('galaxy2', 600, 800, 1600.25, 'dust', false, false),
('galaxy3', 700, 900, 1700.50, 'plasma', false, false),
('galaxy4', 800, 950, 1800.10, 'gas', false, false),
('galaxy5', 900, 1000, 1900.80, 'dust', false, false),
('galaxy6', 1000, 1100, 2000.00, 'unknown', false, false);

-- STAR (6)
INSERT INTO star (galaxy_id, name) VALUES
(1, 'star1'),
(1, 'star2'),
(2, 'star3'),
(3, 'star4'),
(4, 'star5'),
(5, 'star6');

-- PLANET (12)
INSERT INTO planet (star_id, name, has_life) VALUES
(1, 'planet1', true),
(1, 'planet2', false),
(2, 'planet3', false),
(2, 'planet4', false),
(3, 'planet5', false),
(3, 'planet6', false),
(4, 'planet7', false),
(4, 'planet8', false),
(5, 'planet9', false),
(5, 'planet10', false),
(6, 'planet11', false),
(6, 'planet12', false);

-- MOON (20)
INSERT INTO moon (planet_id, name) VALUES
(1, 'moon1'),
(1, 'moon2'),
(1, 'moon3'),
(2, 'moon4'),
(2, 'moon5'),
(3, 'moon6'),
(3, 'moon7'),
(4, 'moon8'),
(4, 'moon9'),
(5, 'moon10'),
(6, 'moon11'),
(6, 'moon12'),
(7, 'moon13'),
(8, 'moon14'),
(9, 'moon15'),
(10, 'moon16'),
(11, 'moon17'),
(11, 'moon18'),
(12, 'moon19'),
(12, 'moon20');

-- MORE_INFO (3)
INSERT INTO more_info (planet_id, name, description) VALUES
(1, 'info1', 'Planète habitable'),
(2, 'info2', 'Planète gazeuse'),
(3, 'info3', 'Planète rocheuse');
