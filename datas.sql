--animaux
INSERT INTO classes (name) VALUES
    ('vertebre'),
    ('invertebre');

INSERT INTO species (name, classe_id) VALUES
    ('mammifere', 1),
    ('reptile', 1),
    ('oiseau', 1),
    ('poisson', 1),
    ('insecte', 2),
    ('amphibien', 1);

INSERT INTO orders (name, specie_id) VALUES
    ('carnivore', 1),
    ('carnivore', 2),
    ('carnivore', 3),
    ('carnivore', 4),
    ('carnivore', 5),
    ('carnivore', 6),
    ('herbivore', 1),
    ('herbivore', 2),
    ('herbivore', 3),
    ('herbivore', 4),
    ('herbivore', 5),
    ('herbivore', 6),
    ('omnivore', 1),
    ('omnivore', 2),
    ('omnivore', 3),
    ('omnivore', 4),
    ('omnivore', 5),
    ('omnivore', 6);

INSERT INTO families (name, orders_id) VALUES
    ('canide', 1),
    ('canide', 7),
    ('canide', 13),
    ('felin', 1),
    ('felin', 13),
    ('bovide', 7),
    ('hominide', 7),
    ('equide', 7),
    ('crocolilien', 2),
    ('squamate', 2),
    ('squamate', 8),
    ('tortue', 2),
    ('tortue', 8),
    ('tortue', 14),
    ('anseriforme', 15),
    ('falconiforme', 3),
    ('characiforme', 4),
    ('salmoniforme', 4),
    ('coleoptere', 5),
    ('coleoptere', 11),
    ('coleoptere', 17),
    ('hyménoptere', 5),
    ('hyménoptere', 17),
    ('anoure', 18),
    ('gymnophione', 18),
    ('elephantide', 7),
    ('suidé', 7);

    INSERT INTO races (name, family_id) VALUES
        ('chien', 1),
        ('leopard', 4),
        ('vache', 6),
        ('gorille', 7),
        ('cheval', 8),
        ('crocodile', 9),
        ('serpent', 10),
        ('tortue leopard', 13),
        ('canard', 15),
        ('faucon gerfaut', 16),
        ('paracheirodon innesi', 17),
        ('saumon', 18),
        ('coccinelle', 19),
        ('fourmi', 23),
        ('rainette de white', 24),
        ('caecilius', 25),
        ('elephant', 26),
        ('sanglier', 27),
        ('tigre', 4),
        ('singe', 7);

-- nourriture
INSERT INTO ingredients (name) VALUES
    ('viande'),
    ('legume'),
    ('mixe');

INSERT INTO menus (name, quantity) VALUES 
    ('carnivore', 50),
    ('carnivore', 100),
    ('herbivore', 50),
    ('herbivore', 100),
    ('omnivore', 50),
    ('omnivore', 100),
    ('carnivore', 25);

INSERT INTO ingredients_menus (menu_id, ingredient_id) VALUES
    (1, 1),
    (2, 1),
    (3, 2),
    (4, 2),
    (5, 3),
    (6, 3),
    (7, 1);


--lieux
INSERT INTO zones (name) VALUES
    ('foret'),
    ('marais'),
    ('eau'),
    ('plaine'),
    ('voliere'),
    ('insecte');

INSERT INTO allees (zone_id, responsable_id) VALUES
    (1, 25), (1, 26), (2, 27), (2, 28), (3, 29), (3, 30), (4, 31), (4, 32), (5, 33), (5, 34), (6, 35), (6, 36);

INSERT INTO cages (places, allee_id) VALUES
    ('grande', 1), ('petite', 1),
    ('grande', 2), ('petite', 2),
    ('grande', 3), ('petite', 3),
    ('grande', 4), ('petite', 4),
    ('grande', 5), ('petite', 5),
    ('grande', 6), ('petite', 6),
    ('grande', 7), ('petite', 7),
    ('grande', 8), ('petite', 8),
    ('grande', 9), ('petite', 9),
    ('grande', 10), ('petite', 10),
    ('grande', 11), ('petite', 11),
    ('grande', 12), ('petite', 12);

INSERT INTO home (cage_id, animal_id) VALUES
    (14, 1),
    (2, 2),
    (13, 4),
    (3, 5),
    (2, 6),
    (21, 7),
    (1, 8),
    (1, 9),
    (20, 10),
    (20, 11),
    (20, 12),
    (20, 13),
    (20, 14),
    (20, 15),
    (2, 16);




--personnes

INSERT INTO roles (name) VALUES
    ('soigneur'),
    ('responsable');

INSERT INTO people (name, surname, city_id, birth_date, role_id, cage_id) VALUES
('Blanchard', 'Peyrin', 1, '1975-02-05', 1, 1),
('Martin', 'Berrut', 2, '1988-03-15', 1, 2),
('Dupont', 'Sicard', 3, '1993-07-22', 1, 3),
('Lefevre', 'Voiron', 4, '1980-11-05', 1, 4),
('Girard', 'Scholl', 5, '1987-05-11', 1, 5),
('Moreau', 'Adiba', 6, '1992-02-04', 1, 6),
('Roux', 'Alexandre', 7, '1985-08-18', 1, 7),
('Lemoine', 'Camille', 8, '1990-12-30', 1, 8),
('Dubois', 'Nicolas', 9, '1979-04-25', 1, 9),
('Andre', 'Julie', 10, '1982-10-09', 1, 10),
('Perrin', 'Guillaume', 11, '1983-06-14', 1, 11),
('Leroy', 'Laura', 12, '1986-01-28', 1, 12),
('Caron', 'Thomas', 13, '1989-09-07', 1, 13),
('Mercier', 'Elodie', 14, '1994-03-12', 1, 14),
('Garnier', 'David', 15, '1981-07-25', 1, 15),
('Colin', 'Mathilde', 14, '1984-11-10', 1, 16),
('Gauthier', 'Vincent', 13, '1991-05-03', 1, 17),
('Robert', 'Marie', 12, '1988-12-16', 1, 18),
('Fournier', 'Julien', 11, '1987-04-21', 1, 19),
('Leroux', 'Céline', 10, '1980-10-06', 1, 20),
('Leclerc', 'Rémi', 9, '1993-02-19', 1, 21),
('Léger', 'Isabelle', 8, '1977-06-24', 1, 22),
('Mallet', 'Antoine', 7, '1992-11-09', 1, 23),
('Rodriguez', 'Amandine', 8, '1986-05-14', 1, 24),
('Deschamps', 'Élodie', 9, '1985-08-21', 2, NULL),
('Bertrand', 'Hugo', 10, '1990-02-03', 2, NULL),
('Lecomte', 'Emma', 11, '1983-06-17', 2, NULL),
('Fischer', 'Maxime', 12, '1978-11-30', 2, NULL),
('Noël', 'Lucie', 13, '1995-04-12', 2, NULL),
('Coulon', 'Romain', 14, '1981-09-25', 2, NULL),
('Marchand', 'Léa', 15, '1989-03-08', 2, NULL),
('Chevalier', 'Gabriel', 'Orléans', '1986-07-23', 2, NULL),
('Guérin', 'Clara', 12, '1991-12-06', 2, NULL),
('Denis', 'Alexis', 11, '1984-05-19', 2, NULL),
('Dumas', 'Manon', 10, '1979-10-02', 2, NULL),
('Laurin', 'Paul', 9, '1994-01-15', 2, NULL),
('Katerwan', 'Alan', 8, '1998-12-24', NULL, NULL);


--ANIMAL

INSERT INTO animals (name, birth_day, sex, coming_day, adoptable, country_id, race_id, menu_id, person_id, ascendance_id, descendant_number) VALUES
    ('Paf', '2020-04-09', 'male', '2022-07-15', true, 4, 1, 1, 14, NULL, NULL),
    ('Luna', '2018-06-22', 'femelle', '2020-01-03', false, 3, 2, 1, 2, NULL, NULL),
    ('Shiva', '2017-12-03', 'femelle', '2018-05-23', true, 4, 1, 1, 37, NULL, NULL),
    ('Dumbo', '1990-03-10', 'male', '2000-03-20', false, 1, 17, 4, 13, NULL, NULL),
    ('Pumba', '2015-06-06', 'male', '2015-07-07', false, 4, 18, 3, 3, NULL, NULL),
    ('Charly', '2014-09-09', 'femelle', '2016-08-09', false, 6, 19, 2, 2, NULL, NULL),
    ('Sickman', '2024-01-30', 'male', '2024-01-30', true, 4, 9, 5, 21, NULL, NULL),
    ('Hector', '2019-05-23', 'femelle', '2020-01-25', true, 4, 20, 3, 1, NULL, NULL),
    ('Abou', '2012-05-24', 'male', '2013-06-21', false, 2, 20, 3, 1, NULL, NULL), 
    ('Donald', '2018-11-20', 'male', '2019-07-20', false, 4, 9, 5, 20, NULL, 2),
    ('Daisy', '2018-10-11', 'femelle', '2019-07-20', false, 4, 9, 5, 20, NULL, 2),
    ('Riri', '2020-04-01', 'male', '2020-04-01', false, 4, 9, 5, 20, 1, NULL),
    ('Fifi', '2020-04-01', 'femelle', '2020-04-01', false, 4, 9, 5, 20, 1, 1),
    ('Bofils', '2019-05-15', 'male', '2019-10-15', false, 4, 9, 5, 20, NULL, 1),
    ('Fibo', '2021-09-13', 'male', '2021-09-13', false, 4, 9, 5, 20, 2, NULL),
    ('Leo', '2012-09-11', 'male', '2015-06-12', false, 6, 2, 1, 2, NULL, NULL);


--ADOPTION

INSERT INTO adoptions (adoption_birth, person_id, animal_id) VALUES
    ('2020-06-24', 37, 3);



--SANTE

-- INSERT INTO animals_healthBooks (healthBook_id, animal_id) VALUES
--     (1, 1),
--     (2, 2),
--     (3, 3),
--     (4, 4),
--     (5, 5),
--     (6, 6),
--     (7, 7),
--     (8, 8),
--     (9, 9),
--     (10, 10),
--     (11, 11),
--     (12, 12),
--     (13, 13),
--     (14, 14),
--     (15, 15),
--     (16, 16);

INSERT INTO healthBooks (animal_id, size, weight) VALUES
    (1, 100, 15),
    (2, 120, 35),
    (3, 60, 10),
    (4, 5500, 5000),
    (5, 120, 500),
    (6, 150, 200),
    (7, 10, 1),
    (8, 100, 25),
    (9, 110, 26),
    (10, 40, 3),
    (11, 45, 4),
    (12, 43, 3),
    (13, 41, 3),
    (14, 42, 4),
    (15, 40, 3),
    (16, 130, 35)
    ;

INSERT INTO healthBooks_vaccins (date, recall, healthBook_id, vaccin_id) VALUES
    ('2023-02-14', '2024-02-14', 1, 1),
    ('2023-02-14', '2023-02-14', 1, 2),
    ('2023-04-15', '2024-04-15', 2, 3),
    ('2018-05-16', '2019-05-16', 3, 1),
    ('2023-10-15', '2024-10-15', 4, 5),
    ('2023-10-15', '2024-10-15', 5, 4),
    ('2023-02-16', '2024-02-16', 6, 3),
    ('2023-10-15', '2024-10-15', 8, 3),
    ('2023-10-15', '2024-10-15', 9, 3),
    ('2023-10-15', '2024-10-15', 10, 3),
    ('2023-10-15', '2024-10-15', 11, 3),
    ('2023-10-15', '2024-10-15', 12, 3),
    ('2023-10-15', '2024-10-15', 13, 3),
    ('2023-10-15', '2024-10-15', 14, 3),
    ('2023-10-15', '2024-10-15', 15, 3)
    ;



INSERT INTO vaccins (name) VALUES
    ('rage'), ('parvorisore'),('typhus'), ('leucose'),('coccidiose');

INSERT INTO healthBooks_sicknesses (date, healthBook_id, sickness_id) VALUES
    ('10-09-2022', 1, 1),
    ('13-10-2021', 4, 12),
    ('2024-01-30', 7, 1), ('2024-01-30', 7, 2), ('2024-01-30', 7, 3), ('2024-01-30', 7, 4),('2024-01-30', 7, 5), ('2024-01-30', 7, 6), ('2024-01-30', 7, 7), ('2024-01-30', 7, 8),('2024-01-30', 7, 9), ('2024-01-30', 7, 10), ('2024-01-30', 7, 11), ('2024-01-30', 7, 12);


INSERT INTO sicknesses (name) VALUES
    ('rage'),
    ('maladie du carre'),
    ('hepatite'),
    ('lyme'),
    ('leucose'),
    ('diabete'),
    ('typhus'),
    ('gastro'),
    ('vache folle'),
    ('psittacose'),
    ('maladie respiratoire'),
    ('grippe');

--parenté
INSERT INTO ascendance(father_id, mother_id) VALUES
    (10, 11),
    (14, 13);

INSERT INTO descendance (parents_id, child_id) VALUES
    (1, 12), (1, 13),
    (2, 15);

--lieux
INSERT INTO continents(name) VALUES
    ('Afrique'), ('Amerique'), ('Asie'), ('Europe'), ('Oceanie');

INSERT INTO countries (continent_id, name) VALUES
    (1, 'Kenya'),
    (1, 'Maroc'),
    (3, 'Iran'),
    (4, 'France'),
    (4, 'Espagne'),
    (3, 'Inde'),
    (5, 'Nouvelle-Calédonie'),
    (2, 'Etats-unis'),
    (2, 'Argentine'),
    (5, 'Polynésie')
    ;

INSERT INTO cities (country_id, name) VALUES
    (7, 'Nouméa'),
    (4, 'Sartène'),
    (4, 'Calvi'),
    (8, 'Pointe'),
    (9, 'Ushuaia'),
    (10, 'Papeete'),
    (4, 'Avignon'),
    (4, 'Alès'),
    (4, 'Grenoble'),
    (4, 'Montpellier'),
    (4, 'Dijon'),
    (4, 'Nice'),
    (4, 'Besançon'),
    (4, 'Toulon'),
    (4, 'Rouen');


















-- SELECT 
--     animals.name,
--     races.name AS race,
--     families.name AS family,
--     orders.name AS orders,
--     people.name AS soigneur,
--     menus.name AS menu,
--     menus.quantity,
--     cages.id AS cage,
--     allees.id AS allee,
--     zones.name AS zone
-- FROM animals
-- JOIN races ON animals.race_id = races.id
-- JOIN families ON races.family_id = families.id
-- JOIN orders ON families.orders_id = orders.id
-- JOIN people ON animals.person_id = people.id
-- JOIN cages ON people.cage_id = cages.id
-- JOIN allees ON cages.allee_id = allees.id
-- JOIN zones ON allees.zone_id = zones.id
-- JOIN menus ON animals.menu_id = menus.id
-- WHERE animals.name = 'Paf';


















    


    