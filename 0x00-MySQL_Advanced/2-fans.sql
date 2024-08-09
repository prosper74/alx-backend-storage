-- SQL script that select columns and sort/group them

SELECT origin, SUM(fans) AS nb_fans
FROM metal_bands
GROUP BY
    origin
ORDER BY nb_fans DESC;