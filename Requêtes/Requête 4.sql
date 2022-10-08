SELECT ROUND(AVG(valeur_fonciere/bien.surface)) AS 'Moyenne maison Paris'
FROM mutation
JOIN bien ON mutation.id_adresse = bien.id_adresse
JOIN commune ON bien.code_commune = commune.id
WHERE type_local = "Maison"
AND code_dept IN (75, 77, 78, 91, 92, 93, 94, 95)