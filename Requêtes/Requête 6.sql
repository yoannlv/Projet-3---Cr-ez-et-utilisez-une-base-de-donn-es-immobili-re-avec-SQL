WITH ventes_t1 AS (SELECT *
FROM mutation
WHERE date_mutation BETWEEN '2020-01-01 00:00:00' AND '2020-03-31 23:59:59'),
ventes_t2 AS (SELECT *
FROM mutation
WHERE date_mutation BETWEEN '2020-04-01 00:00:00' AND '2020-06-30 23:59:59')
SELECT
    ((SELECT COUNT(*) FROM ventes_t2)
  - (SELECT COUNT(*) FROM ventes_t1))
  / (SELECT COUNT(*) FROM ventes_t1) *100
  AS Difference