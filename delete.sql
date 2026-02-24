-- Suppressions
DELETE From Plats
WHere Prix is NULL;

DELETE FROM CommandesClients
WHERE Montant_total < 5;

-- INSERT INTO CommandesClients (IdCommande, IdRestaurant, Montant_total, Nom_client) VALUES
-- (4, 1, 4.3, 'Bernard'),