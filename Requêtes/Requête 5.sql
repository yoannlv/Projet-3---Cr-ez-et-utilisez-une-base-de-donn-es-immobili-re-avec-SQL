SELECT mutation.id_adresse, valeur_fonciere, bien.surface, commune.code_dept
FROM mutation
JOIN bien ON mutation.id_adresse = bien.id_adresse
JOIN commune ON bien.code_commune = commune.id
ORDER BY valeur_fonciere DESC
LIMIT 10