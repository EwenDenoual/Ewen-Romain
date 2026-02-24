
-- Mise à jour intelligente
UPDATE Plats
SET Prix = Prix - (Prix /10)
WHERE Prix > 12;

UPDATE Plats
SET Prix = Prix - (Prix /5)
WHERE Prix <= 12;

-- UPDATE Plats
-- CASE
-- When Prix > 12 then SET Prix = Prix - (Prix /10)
-- Else When Prix not null then SET Prix = Prix - (Prix /5)
-- END
-- From Plats
