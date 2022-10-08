SELECT nb_pieces AS 'Nb pièces', COUNT(*) AS Total, ROUND(COUNT(*)/(SELECT COUNT(*) FROM bien)*100,2) AS Pourcentage
FROM bien
WHERE type_local = 'Appartement' 
GROUP BY nb_pieces
ORDER BY nb_pieces