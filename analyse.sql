-- Mini-analyse finale
SELECT Categorie, avg(Prix) as 'Prix Moyen' FROM Plats Group by Categorie;

SELECT SUM(Montant_total) as 'Total des Ventes' from CommandesClients;

SELECT Nom, Prix, Categorie, Est_vegan from Plats order by Prix DESC Limit 3;

