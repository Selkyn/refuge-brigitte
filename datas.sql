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
    ('elephantide', 7);

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
        ('elephant', 26);

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
    ('Blanchard', 'Benoit', 'Marseille', 1975-02-05, 1, 1),
    ('Martin', 'Sophie', 'Paris', '03/15/1988', 1, 2),
    ('Dupont', 'Luc', 'Lyon', '07/22/1993', 1, 3),
    ('Lefevre', 'Alice', 'Toulouse', '11/05/1980', 1, 4),
    ('Girard', 'Pierre', 'Nantes', '05/11/1987', 1, 5),
    ('Moreau', 'Charlotte', 'Bordeaux', '02/04/1992', 1, 6),
    ('Roux', 'Alexandre', 'Lille', '08/18/1985', 1, 7),
    ('Lemoine', 'Camille', 'Strasbourg', '12/30/1990', 1, 8),
    ('Dubois', 'Nicolas', 'Montpellier', '04/25/1979', 1, 9),
    ('Andre', 'Julie', 'Rennes', '10/09/1982', 1, 10),
    ('Perrin', 'Guillaume', 'Nice', '06/14/1983', 1, 11),
    ('Leroy', 'Laura', 'Cannes', '01/28/1986', 1, 12),
    ('Caron', 'Thomas', 'Avignon', '09/07/1989', 1, 13),
    ('Mercier', 'Elodie', 'Grenoble', '03/12/1994', 1, 14),
    ('Garnier', 'David', 'Dijon', '07/25/1981', 1, 15),
    ('Colin', 'Mathilde', 'Le Havre', '11/10/1984', 1, 16),
    ('Gauthier', 'Vincent', 'Nîmes', '05/03/1991', 1, 17),
    ('Robert', 'Marie', 'Angers', '12/16/1988', 1, 18),
    ('Fournier', 'Julien', 'Reims', '04/21/1987', 1, 19),
    ('Leroux', 'Céline', 'Lorient', '10/06/1980', 1, 20),
    ('Leclerc', 'Rémi', 'Besançon', '02/19/1993', 1, 21),
    ('Léger', 'Isabelle', 'Limoges', '06/24/1977', 1, 22),
    ('Mallet', 'Antoine', 'Toulon', '11/09/1992', 1, 23),
    ('Rodriguez', 'Amandine', 'Aix-en-Provence', '05/14/1986', 1, 24),
    ('Deschamps', 'Élodie', 'Rouen', '08/21/1985', 2, 1),
    ('Bertrand', 'Hugo', 'Nancy', '02/03/1990', 2, 3),
    ('Lecomte', 'Emma', 'Caen', '06/17/1983', 2, 5),
    ('Fischer', 'Maxime', 'Metz', '11/30/1978', 2, 7),
    ('Noël', 'Lucie', 'Brest', '04/12/1995', 2, 9),
    ('Coulon', 'Romain', 'Amiens', '09/25/1981', 2, 11),
    ('Marchand', 'Léa', 'Perpignan', '03/08/1989', 2, 13),
    ('Chevalier', 'Gabriel', 'Orléans', '07/23/1986', 2, 15),
    ('Guérin', 'Clara', 'Mulhouse', '12/06/1991', 2, 17),
    ('Denis', 'Alexis', 'Pau', '05/19/1984', 2, 19),
    ('Dumas', 'Manon', 'Toulon', '10/02/1979', 2, 21),
    ('Laurin', 'Paul', 'Limoges', '01/15/1994', 2, 23),
    ('Katerwan', 'Alan', 'Saint-juste', '12/24/1998', NULL, NULL);


--ANIMAL

INSERT INTO animals (name, birth_day, sex, coming_day, adoptable, country, race_id, menu_id, person_id) VALUES
    ('Paf', '09/04/2020', 'male', '15/07/2022', true, 'France', 1, 1, 14),
    ('Luna', '16/07/2018', 'femelle', '03/01/2020', false, 'Iran', 2, 1, 2),
    ('Shiva', '15/09/2017', 'femelle', '23/05/2018', TRUE, 'France', 1, 1, 37), 
    ('Dumbo', 1990-03-10, 'male', '2000-03-20', FALSE, 'Kenya', 17, 4, 13);


--ADOPTION

INSERT INTO adoptions (adoption_birth, person_id, animal_id) VALUES
    ('24/06/2020', 37, 3);



--SANTE

INSERT INTO animals_healthBooks (healthBook_id, animal_id) VALUES
    (1, 1),
    (2, 2);

INSERT INTO healthBooks (size, weight) VALUES
    (100, 15),
    (120, 35);

INSERT INTO healthBooks_vaccins (date, recall, healthBook_id, vaccin_id) VALUES
    ('14/02/2023', '14/02/2024', 1, 1), ('14/02/2023', '14/02/2023', 1, 2),
    ('15/04/2023', '15/04/2024', 2, 3);

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
WHERE animals.sex = 'male' AND animals.country = 'Kenya' AND birth_day < 1992-01-01;


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


















    


    