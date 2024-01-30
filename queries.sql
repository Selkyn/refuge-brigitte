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
SELECT animals.name, people.name, roles.name, allees.id
-- respondable.name AS responsable 
FROM animals
JOIN people ON animals.person_id = people.id
JOIN roles ON people.role_id = roles.id
JOIN cages ON people.cage_id = cages.id
JOIN allees ON cages.allee_id = allees.id
-- JOIN people AS responsable ON people
;

--11 Le nom des soigneurs gardant tous les animaux.
SELECT people.name
FROM animals
JOIN people ON animals.person_id = people.id;

--12 Les noms et types des animaux qui n’ont jamais été malades. a finir

SELECT a.name AS animal_name, r.name AS race_name
FROM animals a
JOIN races r ON a.race_id = r.id
LEFT JOIN healthBooks_sicknesses hs ON a.id = hs.healthBook_id
WHERE hs.healthBook_id IS NULL;

-- 13 Les noms des animaux originaires du Kenya ayant déjà contractés une grippe.
SELECT animals.name, sicknesses.name AS maladie, healthBooks_sicknesses.date 
FROM animals
JOIN animals_healthBooks ON animals_healthBooks.animal_id = animals.id
JOIN healthBooks ON animals_healthBooks.healthBook_id = healthBooks.id
JOIN healthBooks_sicknesses ON healthBooks_sicknesses.healthBook_id = healthBooks.id
JOIN sicknesses ON healthBooks_sicknesses.sickness_id = sicknesses.id
WHERE animals.country = 'Kenya' AND sicknesses.name = 'grippe'
;
-- SELECT animals.name
-- FROM animals
-- LEFT JOIN healthBooks_sicknesses ON animals.id = healthBooks_sicknesses.healthBook_id
-- LEFT JOIN sicknesses ON healthBooks_sicknesses.sickness_id = sicknesses.id
-- WHERE animals.country = 'Kenya' AND sicknesses.name = 'grippe';


-- 14 Les numéros et fonctionnalités des cages qui sont inoccupées

SELECT c.id AS num_cage, c.places, z.name AS zone_name
FROM cages c
JOIN allees a ON c.allee_id = a.id
JOIN zones z ON a.zone_id = z.id
WHERE c.id NOT IN (SELECT cage_id FROM home);

-- 15  Donner pour chaque animal mâle l’ensemble des maladies qu’il a contractées
SELECT animals.name, sicknesses.name AS maladie, healthBooks_sicknesses.date 
FROM animals
JOIN animals_healthBooks ON animals_healthBooks.animal_id = animals.id
JOIN healthBooks ON animals_healthBooks.healthBook_id = healthBooks.id
JOIN healthBooks_sicknesses ON healthBooks_sicknesses.healthBook_id = healthBooks.id
JOIN sicknesses ON healthBooks_sicknesses.sickness_id = sicknesses.id
WHERE animals.sex = 'male';

--16 cages qui contiennent au moins deux animaux de types différents
SELECT cages.id AS num_cage
FROM home
JOIN cages ON home.cage_id = cages.id
JOIN animals ON home.animal_id = animals.id
JOIN races ON animals.race_id = races.id
GROUP BY cages.id
HAVING COUNT(races.id) > 1
;


--17 noms des responsables et les noms des soigneurs de Charly (à finir avec les responsables)
SELECT people.name AS soigneur, allees.id AS num_allee, roles.name
FROM people
JOIN roles ON people.role_id = roles.id
JOIN animals ON animals.person_id = people.id
JOIN allees ON cages.allee_id = allees.id
JOIN cages ON people.cage_id = cages.id
WHERE animals.name = 'Charly';


--18 Le nom et le pays d’origine de l’animal doyen du refuge
SELECT animals.name, animals.country, MAX(CAST ((julianday('now') - julianday(animals.birth_day)) /365.25 AS INTEGER)) AS age
FROM animals
;


--19 Le nom, le type et l’année de naissance des animaux qui ont contracté toutes les maladies
-- SELECT animals.name, animals.birth_day, sicknesses.name
-- FROM animals_healthBooks
-- JOIN animals ON animals_healthBooks.animal_id = animals.id
-- JOIN healthBooks ON animals_healthBooks.healthBook_id = healthBooks.id
-- JOIN healthBooks_sicknesses ON healthBooks_sicknesses.healthBook_id = healthBooks.id 
-- JOIN sicknesses ON healthBooks_sicknesses.sickness_id = sicknesses.id 
-- ;

SELECT animals.name, animals.birth_day, COUNT(DISTINCT sicknesses.id) AS num_sicknesses
FROM animals_healthBooks
JOIN animals ON animals_healthBooks.animal_id = animals.id
JOIN healthBooks ON animals_healthBooks.healthBook_id = healthBooks.id
JOIN healthBooks_sicknesses ON healthBooks_sicknesses.healthBook_id = healthBooks.id 
JOIN sicknesses ON healthBooks_sicknesses.sickness_id = sicknesses.id 
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


--22 nom et age de tous les animaux
SELECT animals.name, CAST ((julianday('now') - julianday(animals.birth_day)) /365.25 AS INTEGER) AS age
FROM animals
;

--23 Donner les caractéristiques de l'animal appelé HECTOR
SELECT animals.name, healthBooks.size, healthBooks.weight
FROM animals_healthBooks
JOIN healthBooks ON animals_healthBooks.healthBook_id = healthBooks.id
JOIN animals ON animals_healthBooks.animal_id = animals.id
WHERE animals.name = 'Hector';


--24 Donner les origines distinctes de toutes les familles


--25 Donner les noms des singes de plus de 10 ans et originaire d'Afrique
SELECT animals.name, animals.country, CAST ((julianday('now') - julianday(animals.birth_day)) /365.25 AS INTEGER) AS age
FROM animals
JOIN races ON animals.race_id = races.id
WHERE age > 10 AND races.name = 'singe';

--26 Donner les noms des singes ainsi que des animaux de plus de 8 ans.
SELECT animals.name, CAST ((julianday('now') - julianday(animals.birth_day)) /365.25 AS INTEGER) AS age
FROM animals
JOIN races ON animals.race_id = races.id
WHERE age > 8 OR races.name = 'singe';

--27 Donner les races des animaux dont le numéro de menu est 1 et l'âge est supérieur à 10
SELECT races.name 
FROM animals
JOIN races ON animals.race_id = races.id
JOIN menus ON animals.menu_id = menus.id
WHERE menus.id = 1;

--28 Donner les menus plus 2 fois moins riches en viande qu'en légume?


--29 Donner l'âge et l'origine des animaux qui sont amis de l'homme
SELECT animals.name, animals.country
FROM animals
JOIN races ON animals.race_id = races.id
WHERE races.name = 'chien' OR races.name = 'Chat';

--30 Numéro de menu et quantité de viande pour les animaux qui ont une attitude amicale
SELECT animals.name, menus.id AS num_menu, menus.quantity AS qty viande
FROM animals
JOIN races ON animals.race_id = races.id
JOIN menus ON animals.menu_id = menus.id









-- h.cage_id = (SELECT cage_id FROM home WHERE animal_id = (SELECT id FROM animals WHERE name = 'Charly'));
-- WHERE home.cage_id = (
--     SELECT cage_id 
--     FROM home 
--     WHERE animal_id = (
--         SELECT id 
--         FROM animals 
--         WHERE name = 'Charly'
--     ));

-- SELECT *
-- FROM home
-- JOIN cages ON home.cage_id = cages.id
-- JOIN animals ON home.animal_id = animals.id
-- JOIN people ON cages.person_id = people.id
-- -- JOIN allees ON cages.allee_id = allees.id
-- -- JOIN cages ON people.cage_id = cages.id;
-- ;
-- [15:53] Finiels Gaetan
-- select n.nom_animal ,es.espece_nom ,ca.CageID 
-- FROM nom n, animal ani, espece es ,cage ca 
-- WHERE ani.nom = n.idnom AND es.idespece = ani.espece AND ca.CageID = ani.cage_id;

