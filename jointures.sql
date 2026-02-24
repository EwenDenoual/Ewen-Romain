-- Jointures
SELECT e.Prenom || ' ' || e.Nom as 'Nom', r.Nom 
From Employes e 
JOIN Restaurants r on e.IdRestaurant = r.IdRestaurant;

SELECT P.Nom, C.Nom_client as 'Nom du client', R.Planete || ' (' || R.Nom || ')' as 'Planete (Restaurant)'
FROM CommandesClients C
JOIN Restaurants R on C.IdRestaurant = R.IdRestaurant
JOIN LignesCommande L on C.IdCommande = L.IdCommande
JOIN Plats P on L.IdPlat = P.IdPlat;

SELECT R.Nom, COUNT(E.Nom) as 'Nombre Employe'
From Restaurants R
JOIN Employes E on R.IdRestaurant = E.IdRestaurant
Group by R.IdRestaurant;