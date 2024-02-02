-- 1 nom des animaux :
SELECT
animals.name
FROM animals;

-- 2 fonctionalités disponible :
SELECT
roles.name AS role
FROM roles;

-- 3 nom des lépoard :
SELECT
animals.name, races.name AS race
FROM animals
JOIN races ON animals.race_id = races.id
WHERE races.name = 'leopard';

-- 4 maladies contractés au moins une fois :
SELECT DISTINCT
sicknesses.name
FROM healthBooks_sicknesses
JOIN sicknesses ON healthBooks_sicknesses.sickness_id = sicknesses.id;

-- 5 nom et numeros de cage des animaux males orginaires du Kenya et date naissance < 1992
SELECT animals.name, cage_id
FROM home
JOIN countries ON animals.country_id = countries.id
JOIN animals ON home.animal_id = animals.id
WHERE animals.sex = 'male' AND countries.name = 'Kenya' AND animals.birth_day < '1992-01-01';

--6
SELECT people.surname || ' vit à ' || cities.name AS qui_vit_ou
FROM people
JOIN cities ON people.city_id = cities.id
WHERE (people.surname = 'Peyrin' AND cities.name = 'Nouméa')
OR (people.surname = 'Berrut' AND cities.name = 'Sartène')
OR (people.surname = 'Sicard' AND cities.name = 'Calvi')
OR (people.surname = 'Voiron ' AND cities.name = 'Pointe')
OR (people.surname = 'Scholl' AND cities.name = 'Ushuaia')
OR (people.surname = 'Adiba' AND cities.name = 'Papeete');

--7  Le nom et l’âge des animaux  en 2017
-- SELECT animals.name, CAST ((julianday('now') - julianday(animals.birth_day)) /365.25 AS INTEGER) AS age
-- FROM animals
-- WHERE animals.birth_day >= '2017-01-01' AND animals.birth_day <= '2017-12-31';

SELECT animals.name,
   CAST ((julianday('2017-01-01') - julianday(animals.birth_day)) / 365.25 AS INTEGER) AS age
FROM animals
WHERE age > 0;

--8 Le nom des soigneurs qui habitent Ushuaïa
SELECT people.name
FROM people
JOIN roles ON people.role_id = roles.id
JOIN cities ON people.city_id = cities.id
WHERE cities.name = 'Ushuaia' AND roles.name = 'soigneur';

--9 La fonctionnalité et le nom du soigneur des cages gardées par un employé habitant Calvi
SELECT roles.name AS role, people.name, cage_id AS num_cage, cages.places AS fonction
FROM people
JOIN cities ON people.city_id = cities.id
JOIN roles ON people.role_id = roles.id
JOIN cages ON people.cage_id = cages.id
WHERE cities.name = 'Calvi';

--10 Le nom des animaux ainsi que des employés qui en sont soit les soigneurs soit les responsables
SELECT 
    animals.name AS name_animal, 
    people.name AS soigneur, 
    people_allees.name AS responsable
FROM animals
JOIN people ON animals.person_id = people.id
JOIN roles ON people.role_id = roles.id
JOIN cages ON people.cage_id = cages.id
JOIN allees ON cages.allee_id = allees.id
JOIN people AS people_allees ON allees.responsable_id = people_allees.id
;

--11 Le nom des soigneurs gardant tous les animaux.
SELECT DISTINCT people.name
FROM animals
JOIN people ON animals.person_id = people.id;

--12 Les noms et types des animaux qui n’ont jamais été malades. a finir
SELECT a.name AS animal_name, r.name AS race_name
FROM animals a
JOIN races r ON a.race_id = r.id
LEFT JOIN healthBooks ON healthBooks.animal_id = a.id
LEFT JOIN healthBooks_sicknesses ON healthBooks.id = healthBooks_sicknesses.healthBook_id
WHERE healthBooks_sicknesses.healthBook_id IS NULL;



-- 13 Les noms des animaux originaires du Kenya ayant déjà contractés une grippe.
SELECT animals.name, sicknesses.name AS maladie, healthBooks_sicknesses.date 
FROM healthBooks_sicknesses
JOIN countries ON animals. country_id = countries.id
JOIN animals ON healthBooks.animal_id = animals.id
JOIN healthBooks ON healthBooks_sicknesses.healthBook_id = healthBooks.id
JOIN sicknesses ON healthBooks_sicknesses.sickness_id = sicknesses.id
WHERE countries.name = 'Kenya' AND sicknesses.name = 'grippe'
;


-- 14 Les numéros et fonctionnalités des cages qui sont inoccupées
SELECT c.id AS num_cage, c.places, z.name AS zone_name
FROM cages c
JOIN allees a ON c.allee_id = a.id
JOIN zones z ON a.zone_id = z.id
WHERE c.id NOT IN (SELECT cage_id FROM home);

-- 15  Donner pour chaque animal mâle l’ensemble des maladies qu’il a contractées
SELECT animals.name, sicknesses.name AS maladie, healthBooks_sicknesses.date 
FROM healthBooks_sicknesses
JOIN animals ON healthBooks.animal_id = animals.id
JOIN healthBooks ON healthBooks_sicknesses.healthBook_id = healthBooks.id
JOIN sicknesses ON healthBooks_sicknesses.sickness_id = sicknesses.id
WHERE animals.sex = 'male';

--16 cages qui contiennent au moins deux animaux de types différents
SELECT cages.id AS num_cage, cages.places AS type, GROUP_CONCAT(races.name, ', ') AS animals
FROM cages
JOIN home ON home.cage_id = cages.id
JOIN animals ON home.animal_id = animals.id
JOIN races ON animals.race_id = races.id
GROUP BY cages.id
HAVING COUNT(DISTINCT races.id) > 1
;


--17 noms des responsables et les noms des soigneurs de Charly 
SELECT people.name AS soigneur,
    allees.id AS num_allee,
    people_allees.name AS responsable
FROM people
JOIN roles ON people.role_id = roles.id
JOIN animals ON animals.person_id = people.id
JOIN allees ON cages.allee_id = allees.id
JOIN people AS people_allees ON allees.responsable_id = people_allees.id
JOIN cages ON people.cage_id = cages.id
WHERE animals.name = 'Charly';


--18 Le nom et le pays d’origine de l’animal doyen du refuge
SELECT animals.name, countries.name AS country, MAX(CAST ((julianday('now') - julianday(animals.birth_day)) /365.25 AS INTEGER)) AS age
FROM animals
JOIN countries ON animals.country_id = countries.id
;


--19 Le nom, le type et l’année de naissance des animaux qui ont contracté toutes les maladies
SELECT animals.name, animals.birth_day, races.name AS race, COUNT(DISTINCT sicknesses.id) AS num_sicknesses
FROM healthBooks_sicknesses
JOIN animals ON healthBooks.animal_id = animals.id
JOIN healthBooks ON healthBooks_sicknesses.healthBook_id = healthBooks.id 
JOIN sicknesses ON healthBooks_sicknesses.sickness_id = sicknesses.id 
JOIN races ON animals.race_id = races.id
GROUP BY animals.id, animals.name, animals.birth_day
HAVING num_sicknesses = (SELECT COUNT(*) FROM sicknesses);


--20 Le nom, le type et le pays d’origine des animaux qui partagent la cage de Charly
SELECT animals.name, races.name AS race, animals.country, home.cage_id
FROM home
JOIN races ON animals.race_id = races.id
JOIN animals ON home.animal_id = animals.id
WHERE home.cage_id = 2
;

--21
SELECT people.name, cities.name AS city, cage_id AS num_cage
FROM people
JOIN cities ON people.city_id = cities.id
JOIN roles ON people.role_id = roles.id
JOIN cages ON people.cage_id = cages.id
JOIN races ON animals.race_id = races.id
JOIN animals ON animals.person_id = people.id
GROUP BY num_cage, people.name
HAVING COUNT(DISTINCT races.name) > 1
;


--22 nom et age de tous les animaux
SELECT animals.name, CAST ((julianday('now') - julianday(animals.birth_day)) /365.25 AS INTEGER) AS age
FROM animals
;

--23 Donner les caractéristiques de l'animal appelé HECTOR
SELECT animals.name, healthBooks.size, healthBooks.weight
FROM healthBooks
JOIN animals ON healthBooks.animal_id = animals.id
WHERE animals.name = 'Hector';


--24 Donner les origines distinctes de toutes les familles


--25 Donner les noms des singes de plus de 10 ans et originaire d'Afrique
SELECT animals.name, continents.name AS continent, CAST ((julianday('now') - julianday(animals.birth_day)) /365.25 AS INTEGER) AS age
FROM animals
JOIN continents ON countries.continent_id = continents.id
JOIN countries ON animals.country_id = countries.id
JOIN races ON animals.race_id = races.id
WHERE age > 10 AND races.name = 'singe' AND continents.name = 'Afrique';

--26 Donner les noms des singes ainsi que des animaux de plus de 8 ans.
SELECT animals.name, CAST ((julianday('now') - julianday(animals.birth_day)) /365.25 AS INTEGER) AS age
FROM animals
JOIN races ON animals.race_id = races.id
WHERE age > 8 OR races.name = 'singe';

--27 Donner les races des animaux dont le numéro de menu est 1 et l'âge est supérieur à 10
SELECT races.name, CAST ((julianday('now') - julianday(animals.birth_day)) /365.25 AS INTEGER) AS age
FROM animals
JOIN races ON animals.race_id = races.id
JOIN menus ON animals.menu_id = menus.id
WHERE menus.id = 1 AND age > 10;

--28 Donner les menus plus 2 fois moins riches en viande qu'en légume?


--29 Donner l'âge et l'origine des animaux qui sont amis de l'homme
SELECT animals.name, countries.name AS country, continents.name AS continent
FROM animals
JOIN continents ON countries.continent_id = continents.id
JOIN countries ON animals.country_id = countries.id
JOIN races ON animals.race_id = races.id
WHERE races.name = 'chien' OR races.name = 'chat';

--30 Numéro de menu et quantité de viande pour les animaux qui ont une attitude amicale
SELECT animals.name, menus.id AS num_menu, CASE WHEN races.name = 'elephant' THEN 0 ELSE COALESCE(menus.quantity, 0) END AS qty_viande, CASE WHEN races.name = 'elephant' THEN 'viande' ELSE COALESCE(ingredients.name, 0) END AS ingredient
FROM animals
JOIN races ON animals.race_id = races.id
JOIN menus ON animals.menu_id = menus.id
JOIN ingredients_menus ON ingredients_menus.menu_id = menus.id
JOIN ingredients ON ingredients_menus.ingredient_id = ingredients.id
WHERE races.name = 'chien' OR races.name = 'chat' OR races.name = 'elephant'
;

--31 Donner les noms des animaux qui sont grands parents


--32 Quantité de viande totale pour tous les menus
SELECT ingredients.name, SUM(menus.quantity) AS total_qty
FROM ingredients_menus
JOIN ingredients ON ingredients_menus.ingredient_id = ingredients.id
JOIN menus ON ingredients_menus.menu_id = menus.id
WHERE ingredients.name = 'viande';

--33 Nombre d'enfants pour chaque numéro d'animal
SELECT animals.id, animals.name, animals.descendant_number
FROM animals
WHERE descendant_number IS NOT NULL;

--34 Lister les animaux qui dont on connaît les deux parents
SELECT 
    animals.name AS animal_name,
    father.name AS father_name,
    mother.name AS mother_name
FROM animals
JOIN ascendance AS father_ascendance ON animals.ascendance_id = father_ascendance.id
JOIN animals AS father ON father_ascendance.father_id = father.id
JOIN ascendance AS mother_ascendance ON animals.ascendance_id = mother_ascendance.id
JOIN animals AS mother ON mother_ascendance.mother_id = mother.id
;

--35 Donner la moyenne de la quantité de viande servie dans les menus.
SELECT ingredients.name AS ingredient , CAST(AVG(menus.quantity) AS SIGNED) AS avg_qty
FROM ingredients_menus
JOIN ingredients ON ingredients_menus.ingredient_id = ingredients.id
JOIN menus ON ingredients_menus.menu_id = menus.id
WHERE ingredients.name = 'viande';

--36 Donner les numéros et la composition des menus plus riches en viande que la moyenne 
SELECT menu_id, menus.name, ingredients.name, menus.quantity
FROM ingredients_menus
JOIN ingredients ON ingredients_menus.ingredient_id = ingredients.id
JOIN menus ON ingredients_menus.menu_id = menus.id
WHERE ingredients.name = 'viande'
AND menus.quantity > (
    SELECT CAST(AVG(menus.quantity) AS SIGNED)
    FROM ingredients_menus
    JOIN ingredients ON ingredients_menus.ingredient_id = ingredients.id
    JOIN menus ON ingredients_menus.menu_id = menus.id
    WHERE ingredients.name = 'viande'
);




SELECT *
FROM animals;



-- [15:53] Finiels Gaetan
-- select n.nom_animal ,es.espece_nom ,ca.CageID 
-- FROM nom n, animal ani, espece es ,cage ca 
-- WHERE ani.nom = n.idnom AND es.idespece = ani.espece AND ca.CageID = ani.cage_id;

SELECT Projets.nom_projet
FROM Projets
WHERE date_debut > '2023-01-01';


SELECT Projet.nom_projet, Projet.date_debut, Projet.date_fin
FROM Projet
WHERE date_fin > CAST(julianday ('now'));