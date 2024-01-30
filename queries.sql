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