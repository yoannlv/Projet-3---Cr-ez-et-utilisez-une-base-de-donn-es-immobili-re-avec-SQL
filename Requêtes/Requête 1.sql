SELECT COUNT(*) AS Total
FROM mutation
JOIN bien ON mutation.id_adresse = bien.id_adresse
WHERE type_local = 'appartement'
AND date_mutation BETWEEN '2020-01-01 00:00:00' AND '2020-06-30 23:59:59'