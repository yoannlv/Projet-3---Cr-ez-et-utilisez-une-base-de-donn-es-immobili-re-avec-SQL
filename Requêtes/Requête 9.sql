WITH table1 AS (SELECT commune.id, commune.nom_commune, ROUND(AVG(valeur_fonciere)) AS moy_valeur, code_dept
FROM mutation
JOIN bien ON mutation.id_adresse = bien.id_adresse
JOIN commune ON bien.code_commune = commune.id
WHERE code_dept IN (6, 13, 33, 59, 69)
GROUP BY commune.id)

SELECT id, nom_commune, moy_valeur, code_dept
FROM (SELECT id, code_dept, nom_commune, moy_valeur, rank() OVER (PARTITION BY code_dept ORDER BY moy_valeur DESC) AS rang_table1
FROM table1) AS resultats1
WHERE rang_table1 <= 3