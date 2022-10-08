CREATE VIEW ventes_t1_communes AS
SELECT COUNT(*) AS nb_ventes, commune.id, commune.nom_commune
FROM mutation
JOIN bien ON mutation.id_adresse = bien.id_adresse
JOIN commune ON bien.code_commune = commune.id
WHERE date_mutation BETWEEN '2020-01-01 00:00:00' AND '2020-03-31 23:59:59'
GROUP BY code_commune;

CREATE VIEW ventes_t2_communes AS
SELECT COUNT(*) AS nb_ventes, commune.id, commune.nom_commune
FROM mutation
JOIN bien ON mutation.id_adresse = bien.id_adresse
JOIN commune ON bien.code_commune = commune.id
WHERE date_mutation BETWEEN '2020-04-01 00:00:00' AND '2020-06-30 23:59:59'
GROUP BY code_commune;

CREATE VIEW comparatif_ventes AS
SELECT ventes_t2_communes.id, ventes_t1_communes.nb_ventes AS ventes1, ventes_t2_communes.nb_ventes AS ventes2
FROM ventes_t1_communes
RIGHT JOIN ventes_t2_communes ON ventes_t1_communes.id = ventes_t2_communes.id
ORDER BY id;

SELECT id, IFNULL(ventes1, 0) AS ventes1, IFNULL(ventes2, 0) AS ventes2, ROUND(((ventes2-ventes1)/ventes1)*100,2) AS 'Variation (en %)'
FROM comparatif_ventes
WHERE (ventes2-ventes1) >= 1.2