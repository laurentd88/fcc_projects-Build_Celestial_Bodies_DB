-- Nettoyage
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
-- MORE INFO (lié aux planètes, simple et clair)
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

INSERT INTO galaxy (name, area, volume, age, material, has_life, has_water)
VALUES
('galaxy1', 500, 750, 1500.75, 'gas', false, false),
('galaxy2', 600, 800, 1600.25, 'dust', false, false);

INSERT INTO star (galaxy_id, name)
VALUES
(1, 'star1'),
(1, 'star2'),
(2, 'star3');

INSERT INTO planet (star_id, name, has_life)
VALUES
(1, 'planet1', true),
(1, 'planet2', false),
(2, 'planet3', false);

INSERT INTO moon (planet_id, name)
VALUES
(1, 'moon1'),
(1, 'moon2'),
(2, 'moon3');

INSERT INTO more_info (planet_id, name, description)
VALUES
(1, 'info1', 'Planète habitable'),
(2, 'info2', 'Planète gazeuse');

