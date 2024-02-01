-- SQLite
PRAGMA foreign_keys = ON;

DROP TABLE IF EXISTS cities;
DROP TABLE IF EXISTS continents;
DROP TABLE IF EXISTS countries;
DROP TABLE IF EXISTS ascendance;
DROP TABLE IF EXISTS descendance;
DROP TABLE IF EXISTS healthBooks_sicknesses;
DROP TABLE IF EXISTS healthBooks_vaccins;
DROP TABLE IF EXISTS adoptions;
DROP TABLE IF EXISTS roles;
DROP TABLE IF EXISTS people;
DROP TABLE IF EXISTS zones;
DROP TABLE IF EXISTS allees;
DROP TABLE IF EXISTS cages;
DROP TABLE IF EXISTS home;
DROP TABLE IF EXISTS animals_healthBooks;
DROP TABLE IF EXISTS healthBooks;
DROP TABLE IF EXISTS vaccins;
DROP TABLE IF EXISTS sicknesses;
DROP TABLE IF EXISTS sicknessesContracted;
DROP TABLE IF EXISTS ingredients_menus;
DROP TABLE IF EXISTS ingredients;
DROP TABLE IF EXISTS menus;
DROP TABLE IF EXISTS races;
DROP TABLE IF EXISTS families;
DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS species;
DROP TABLE IF EXISTS classes;
DROP TABLE IF EXISTS animals;



CREATE TABLE animals (
    id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    name VARCHAR (50) NOT NULL,
    birth_day DATE,
    sex VARCHAR (20),
    coming_day DATE NOT NULL,
    adoptable BOOLEAN,
    country_id INTEGER,
    race_id INTEGER NOT NULL,
    menu_id INTEGER NOT NULL,
    person_id INTEGER NOT NULL,
    ascendance_id INTEGER,
    descendant_number,
    FOREIGN KEY (country_id) REFERENCES countries (id) ON DELETE CASCADE,
    FOREIGN KEY (race_id) REFERENCES races (id) ON DELETE CASCADE,
    FOREIGN KEY (menu_id) REFERENCES menus (id) ON DELETE CASCADE,
    FOREIGN KEY (person_id) REFERENCES people (id) ON DELETE CASCADE,
    FOREIGN KEY (ascendance_id) REFERENCES ascendance (id) ON DELETE CASCADE
);


-- type d'animaux
CREATE TABLE classes (
    id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    name VARCHAR (50)
);

CREATE TABLE species (
    id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    name VARCHAR (50) NOT NULL,
    classe_id INTEGER NOT NULL,
    FOREIGN KEY (classe_id) REFERENCES classes (id) ON DELETE CASCADE
);

CREATE TABLE orders (
    id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    name VARCHAR (50) NOT NULL,
    specie_id INTEGER NOT NULL,
    FOREIGN KEY (specie_id) REFERENCES species (id) ON DELETE CASCADE
);

CREATE TABLE families (
    id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    name VARCHAR (50) NOT NULL,
    orders_id INTEGER NOT NULL,
    FOREIGN KEY (orders_id) REFERENCES orders (id) ON DELETE CASCADE
);

CREATE TABLE races (
    id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    name VARCHAR (50) NOT NULL,
    family_id INTEGER NOT NULL,
    FOREIGN KEY (family_id) REFERENCES families (id) ON DELETE CASCADE
);


-- le repas

CREATE TABLE ingredients (
    id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    name VARCHAR (50) NOT NULL
);

CREATE TABLE menus (
    id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    name VARCHAR (50) NOT NULL,
    quantity VARCHAR (50)
);

CREATE TABLE ingredients_menus (
    id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    menu_id INTEGER NOT NULL,
    ingredient_id INTEGER NOT NULL,
    FOREIGN KEY (menu_id) REFERENCES menues (id) ON DELETE CASCADE,
    FOREIGN KEY (ingredient_id) REFERENCES ingredients (id) ON DELETE CASCADE
);


-- SANTE

-- CREATE TABLE animals_healthBooks (
--     id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
--     healthBook_id INTEGER NOT NULL,
--     animal_id INTEGER NOT NULL,
--     FOREIGN KEY (healthBook_id) REFERENCES healthBooks (id) ON DELETE CASCADE,
--     FOREIGN KEY (animal_id) REFERENCES animals (id) ON DELETE CASCADE
-- );

CREATE TABLE healthBooks (
    id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    animal_id INTEGER,
    size VARCHAR(50),
    weight VARCHAR(50),
    FOREIGN KEY (animal_id) REFERENCES animals (id) ON DELETE CASCADE
);

CREATE TABLE healthBooks_vaccins (
    id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    date DATE,
    recall DATE,
    vaccin_id INTEGER NOT NULL,
    healthBook_id INTEGER NOT NULL,
    FOREIGN KEY (vaccin_id) REFERENCES vaccins (id) ON DELETE CASCADE,
    FOREIGN KEY (healthBook_id) REFERENCES healthBooks (id) ON DELETE CASCADE
);  

-- CREATE TABLE vaccinations (
--     id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
--     vaccin_id INTEGER NOT NULL,
--     FOREIGN KEY (vaccin_id) REFERENCES vaccins (id) ON DELETE CASCADE
-- );

CREATE TABLE vaccins (
    id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    name VARCHAR(50)
);

CREATE TABLE sicknesses (
    id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    name VARCHAR(50)
);

CREATE TABLE healthBooks_sicknesses (
    id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    date DATE,
    healthBook_id INTEGER NOT NULL,
    sickness_id INTEGER NOT NULL,
    FOREIGN KEY (healthBook_id) REFERENCES healthBooks (id) ON DELETE CASCADE,
    FOREIGN KEY (sickness_id) REFERENCES sicknesses (id) ON DELETE CASCADE
);


-- les places

CREATE TABLE zones (
    id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    name VARCHAR (50)
);

CREATE TABLE allees (
    id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    number VARCHAR (50),
    zone_id INTEGER NOT NULL,
    responsable_id INTEGER,
    FOREIGN KEY (zone_id) REFERENCES zones (id) ON DELETE CASCADE,
    FOREIGN KEY (responsable_id) REFERENCES people (id) ON DELETE CASCADE
);

CREATE TABLE cages (
    id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    type VARCHAR (50),
    places VARCHAR (50),
    allee_id INTEGER NOT NULL,
    FOREIGN KEY (allee_id) REFERENCES allees (id) ON DELETE CASCADE
);

CREATE TABLE home (
    id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    cage_id INTEGER NOT NULL,
    animal_id INTEGER NOT NULL,
    FOREIGN KEY (cage_id) REFERENCES cages (id) ON DELETE CASCADE,
    FOREIGN KEY (animal_id) REFERENCES animals (id) ON DELETE CASCADE
);

--PERSONNES

CREATE TABLE roles (
    id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    name VARCHAR(50)
);

CREATE TABLE people (
    id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    name VARCHAR (50),
    surname VARCHAR (50),
    city_id INTEGER,
    birth_date DATE,
    role_id INTEGER,
    cage_id INTEGER,
    FOREIGN KEY (city_id) REFERENCES cities (id) ON DELETE CASCADE,
    FOREIGN KEY (role_id) REFERENCES roles (id) ON DELETE CASCADE,
    FOREIGN KEY (cage_id) REFERENCES cages (id) ON DELETE CASCADE
);


--ADOPTION
CREATE TABLE adoptions (
    id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    adoption_birth DATE,
    person_id INTEGER NOT NULL,
    animal_id INTEGER NOT NULL,
    FOREIGN KEY (person_id) REFERENCES people (id) ON DELETE CASCADE,
    FOREIGN KEY (animal_id) REFERENCES animals (id) ON DELETE CASCADE
);

-- parenté
CREATE TABLE ascendance (
    id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    father_id INTEGER,
    mother_id INTEGER,
    -- child_id INTGER,
    FOREIGN KEY (father_id) REFERENCES animals (id) ON DELETE CASCADE,
    FOREIGN KEY (mother_id) REFERENCES animals (id) ON DELETE CASCADE,
    -- FOREIGN KEY (child_id) REFERENCES animals (id) ON DELETE CASCADE
);

CREATE TABLE descendance (
    id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    parents_id INTEGER,
    -- grand_parents_id INTEGER,
    child_id INTEGER,
    FOREIGN KEY (parents_id) REFERENCES ascendance (id) ON DELETE CASCADE,
    FOREIGN KEY (child_id) REFERENCES animals (id) ON DELETE CASCADE
);

CREATE TABLE continents (
    id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    name VARCHAR(50)
);

CREATE TABLE countries (
    id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    name VARCHAR(50),
    continent_id INTEGER,
    FOREIGN KEY (continent_id) REFERENCES continents (id) ON DELETE CASCADE
);

CREATE TABLE cities (
    id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    name VARCHAR(50),
    country_id INTEGER,
    FOREIGN KEY (country_id) REFERENCES countries (id) ON DELETE CASCADE
);

source datas.sql;