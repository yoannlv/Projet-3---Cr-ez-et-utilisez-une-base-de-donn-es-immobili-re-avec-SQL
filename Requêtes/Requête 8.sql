WITH moy_appt2 AS (SELECT type_local, nb_pieces, ROUND(AVG(mutation.valeur_fonciere/surface)) AS moyenne2
FROM bien
JOIN mutation ON bien.id_adresse = mutation.id_adresse
WHERE type_local = "Appartement"
AND nb_pieces = 2
GROUP BY nb_pieces),

moy_appt3 AS (SELECT type_local, nb_pieces, ROUND(AVG(mutation.valeur_fonciere/surface)) AS moyenne3
FROM bien
JOIN mutation ON bien.id_adresse = mutation.id_adresse
WHERE type_local = "Appartement"
AND nb_pieces = 3
GROUP BY nb_pieces)

SELECT
    ((SELECT moyenne3 FROM moy_appt3)
  - (SELECT moyenne2 FROM moy_appt2))
  / (SELECT moyenne2 FROM moy_appt2) *100
  AS Difference