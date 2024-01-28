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
        ('sanglier', 27);

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
    ('omnivore', 100);

INSERT INTO ingredients_menus (menu_id, ingredient_id) VALUES
    (1, 1),
    (2, 1),
    (3, 2),
    (4, 2),
    (5, 3),
    (6, 3);


--lieux
INSERT INTO zones (name) VALUES
    ('foret'),
    ('marais'),
    ('eau'),
    ('plaine'),
    ('voliere'),
    ('insecte');

INSERT INTO allees (zone_id) VALUES
    (1), (1), (2), (2), (3), (3), (4), (4), (5), (5), (6), (6);

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
    (13, 4);



--personnes

INSERT INTO roles (name) VALUES
    ('soigneur'),
    ('responsable');

INSERT INTO people (name, surname, city, birth_date, role_id, cage_id) VALUES
    ('Blanchard', 'Peyrin', 'Nouméa', '1975-02-05', 1, 1),
('Martin', 'Berrut', 'Sartène', '1988-03-15', 1, 2),
('Dupont', 'Sicard', 'Calvi', '1993-07-22', 1, 3),
('Lefevre', 'Voiron', 'Pointe', '1980-11-05', 1, 4),
('Girard', 'Scholl', 'Ushuaia', '1987-05-11', 1, 5),
('Moreau', 'Adiba', 'Papeete', '1992-02-04', 1, 6),
('Roux', 'Alexandre', 'Lille', '1985-08-18', 1, 7),
('Lemoine', 'Camille', 'Strasbourg', '1990-12-30', 1, 8),
('Dubois', 'Nicolas', 'Montpellier', '1979-04-25', 1, 9),
('Andre', 'Julie', 'Rennes', '1982-10-09', 1, 10),
('Perrin', 'Guillaume', 'Nice', '1983-06-14', 1, 11),
('Leroy', 'Laura', 'Cannes', '1986-01-28', 1, 12),
('Caron', 'Thomas', 'Avignon', '1989-09-07', 1, 13),
('Mercier', 'Elodie', 'Grenoble', '1994-03-12', 1, 14),
('Garnier', 'David', 'Dijon', '1981-07-25', 1, 15),
('Colin', 'Mathilde', 'Le Havre', '1984-11-10', 1, 16),
('Gauthier', 'Vincent', 'Nîmes', '1991-05-03', 1, 17),
('Robert', 'Marie', 'Angers', '1988-12-16', 1, 18),
('Fournier', 'Julien', 'Reims', '1987-04-21', 1, 19),
('Leroux', 'Céline', 'Lorient', '1980-10-06', 1, 20),
('Leclerc', 'Rémi', 'Besançon', '1993-02-19', 1, 21),
('Léger', 'Isabelle', 'Limoges', '1977-06-24', 1, 22),
('Mallet', 'Antoine', 'Toulon', '1992-11-09', 1, 23),
('Rodriguez', 'Amandine', 'Aix-en-Provence', '1986-05-14', 1, 24),
('Deschamps', 'Élodie', 'Rouen', '1985-08-21', 2, 1),
('Bertrand', 'Hugo', 'Nancy', '1990-02-03', 2, 3),
('Lecomte', 'Emma', 'Caen', '1983-06-17', 2, 5),
('Fischer', 'Maxime', 'Metz', '1978-11-30', 2, 7),
('Noël', 'Lucie', 'Brest', '1995-04-12', 2, 9),
('Coulon', 'Romain', 'Amiens', '1981-09-25', 2, 11),
('Marchand', 'Léa', 'Perpignan', '1989-03-08', 2, 13),
('Chevalier', 'Gabriel', 'Orléans', '1986-07-23', 2, 15),
('Guérin', 'Clara', 'Mulhouse', '1991-12-06', 2, 17),
('Denis', 'Alexis', 'Pau', '1984-05-19', 2, 19),
('Dumas', 'Manon', 'Toulon', '1979-10-02', 2, 21),
('Laurin', 'Paul', 'Limoges', '1994-01-15', 2, 23),
('Katerwan', 'Alan', 'Saint-juste', '1998-12-24', NULL, NULL);


--ANIMAL

INSERT INTO animals (name, birth_day, sex, coming_day, adoptable, country, race_id, menu_id, person_id) VALUES
    ('Paf', '2020-04-09', 'male', '2022-07-15', true, 'France', 1, 1, 14),
    ('Luna', '2018-06-22', 'femelle', '2020-01-03', false, 'Iran', 2, 1, 2),
    ('Shiva', '2017-12-03', 'femelle', '2018-05-23', true, 'France', 1, 1, 37),
    ('Dumbo', '1990-03-10', 'male', '2000-03-20', false, 'Kenya', 17, 4, 13),
    ('Pumba', '2015-06-06', 'male', '2015-07-07', false, 'France', 27, 3, 3);


--ADOPTION

INSERT INTO adoptions (adoption_birth, person_id, animal_id) VALUES
    ('2020-06-24', 37, 3);



--SANTE

INSERT INTO animals_healthBooks (healthBook_id, animal_id) VALUES
    (1, 1),
    (2, 2),
    (3, 3),
    (4, 4),
    (5, 5);

INSERT INTO healthBooks (size, weight) VALUES
    (100, 15000),
    (120, 35000),
    (60, 10000),
    (5500, 5000000),
    (120, 50000);

INSERT INTO healthBooks_vaccins (date, recall, healthBook_id, vaccin_id) VALUES
    ('2023-02-14', '2024-02-14', 1, 1),
    ('2023-02-14', '2023-02-14', 1, 2),
    ('2023-04-15', '2024-04-15', 2, 3),
    ('2018-05-16', '2019-05-16', 3, 1),
    ('2023-10-15', '2024-10-15', 4, 5),
    ('2023-10-15', '2024-10-15', 5, 4);

-- INSERT INTO vaccinations (vaccin_id) VALUES
--     (1);


INSERT INTO vaccins (name) VALUES
    ('rage'), ('parvorisore'),('typhus'), ('leucose'),('coccidiose');

INSERT INTO healthBooks_sicknesses (date, healthBook_id, sickness_id) VALUES
    ('10/09/2022', 1, 1);

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
    ('maladie respiratoire');






-- 1 nom des animaux :
SELECT
animals.name
FROM animals;

-- 2 fonctionalités disponible :
SELECT
roles.name
FROM roles;

-- 3 nom des lépoard :
SELECT
animals.name
FROM animals
JOIN races ON animals.race_id = races.id
WHERE races.name = 'leopard';

-- 4 maladies contractés au moins une fois :
SELECT DISTINCT
sicknesses.name
FROM healthBooks_sicknesses
JOIN sicknesses ON healthBooks_sicknesses.sickness_id = sicknesses.id;

-- 5 nom et numeros de cage des animaus males orginaires du Kenya et date naissance < 1992
SELECT animals.name, cage_id
FROM home
JOIN animals ON home.animal_id = animals.id
WHERE animals.sex = 'male' AND animals.country = 'Kenya' AND birth_day < '1992-01-01';

--6
SELECT surname || ' vit à ' || city AS qui_vit_ou
FROM people
WHERE (people.surname = 'Peyrin' AND people.city = 'Nouméa')
OR (people.surname = 'Berrut' AND people.city = 'Sartène')
OR (people.surname = 'Sicard' AND people.city = 'Calvi')
OR (people.surname = 'Voiron ' AND people.city = 'Pointe')
OR (people.surname = 'Scholl' AND people.city = 'Ushuaia')
OR (people.surname = 'Adiba' AND people.city = 'Papeete');

--7  Le nom et l’âge des animaux en 2017
SELECT animals.name, CAST ((julianday('now') - julianday(animals.birth_day)) /365.25 AS INTEGER) AS age
FROM animals
WHERE animals.birth_day >= '2017-01-01' AND animals.birth_day <= '2017-12-31';

--8 Le nom des soigneurs qui habitent Ushuaïa
SELECT people.name
FROM people
JOIN roles ON people.role_id = roles.id
WHERE people.city = 'Ushuaia' AND roles.name = 'soigneur';

--9 La fonctionnalité et le nom du soigneur des cages gardées par un employé habitant Calvi
SELECT roles.name AS fonction, people.name, cage_id AS num_cage
FROM people
JOIN roles ON people.role_id = roles.id
JOIN cages ON people.cage_id = cages.id
WHERE people.city = 'Calvi';

--10 Le nom des animaux ainsi que des employés qui en sont soit les soigneurs soit les responsables ( a finir )
SELECT animals.name, people.name, roles.name
FROM animals
JOIN people ON animals.person_id = people.id
JOIN roles ON people.role_id = roles.id
JOIN cages ON people.cage_id = cages.id;



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


















    


    