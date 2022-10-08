SELECT code_dept AS Département, ROUND(AVG(mutation.valeur_fonciere/bien.surface)) AS Moyenne
FROM commune
JOIN bien ON commune.id = bien.code_commune
JOIN mutation ON bien.id_adresse = mutation.id_adresse
GROUP BY code_dept
ORDER BY Moyenne DESC
LIMIT 10