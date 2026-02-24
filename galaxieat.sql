

CREATE TABLE Restaurants (
    IdRestaurant   INT PRIMARY KEY,
    Nom            VARCHAR(100) NOT NULL,
    Planete        VARCHAR(100) NOT NULL,
    Annee_ouverture INT
);

CREATE TABLE Employes (
    IdEmploye      INT PRIMARY KEY,
    Prenom         VARCHAR(100) NOT NULL,
    Nom            VARCHAR(100) NOT NULL,
    Role           VARCHAR(100) NOT NULL,
    IdRestaurant   INT,
    CONSTRAINT fk_employes_restaurants
        FOREIGN KEY (IdRestaurant) REFERENCES Restaurants(IdRestaurant)
);

CREATE TABLE Plats (
    IdPlat     INT PRIMARY KEY,
    Nom        VARCHAR(100) NOT NULL,
    Prix       DECIMAL(10,2),
    Categorie  VARCHAR(100) NOT NULL
);

CREATE TABLE CommandesClients (
    IdCommande     INT PRIMARY KEY,
    IdRestaurant   INT,
    Montant_total  DECIMAL(10,2),
    Nom_client     VARCHAR(100),
    CONSTRAINT fk_commandes_restaurants
        FOREIGN KEY (IdRestaurant) REFERENCES Restaurants(IdRestaurant)
);

CREATE TABLE LignesCommande (
    IdLigneCommande INT PRIMARY KEY,
    IdCommande      INT,
    IdPlat          INT,
    Quantite        INT NOT NULL,
    CONSTRAINT fk_lignescommande_commandes
        FOREIGN KEY (IdCommande) REFERENCES CommandesClients(IdCommande),
    CONSTRAINT fk_lignescommande_plats
        FOREIGN KEY (IdPlat) REFERENCES Plats(IdPlat)
);

ALTER TABLE Employes
ADD Date_embauche DATE NULL;

ALTER TABLE Plats
ADD Est_vegan BOOLEAN NULL;

-- Restaurants
INSERT INTO Restaurants (IdRestaurant, Nom, Planete, Annee_ouverture) VALUES
(1, 'Milky Way Diner', 'Terre', 2450),
(2, 'Andromeda Grill', 'Andromède', 2460),
(3, 'Nebula Noodles', 'Proxima b', 2475),
(4, 'Black Hole Bistro', 'Gargantua', 2480);

-- Plats
INSERT INTO Plats (IdPlat, Nom, Prix, Categorie, Est_vegan) VALUES
(1, 'Burger d''Astéroïde', 12.50, 'Burgers', 0),
(2, 'Pizza à l''antimatière douce', 15.90, 'Pizzas', 0),
(3, 'Smoothie de nébuleuse', 8.00, 'Boissons', 1),
(4, 'Salade de comète', 9.50, 'Salades', 1),
(5, 'Tacos quantiques', 11.00, 'Tacos', NULL),
(6, 'Soupe de matière noire', NULL, 'Soupes', NULL);

-- Employés
INSERT INTO Employes (IdEmploye, Prenom, Nom, Role, IdRestaurant, Date_embauche) VALUES
(1, 'Zorglub', 'Xan', 'Chef cuisinier', 1, '2480-01-10'),
(2, 'Luna', 'Star', 'Serveuse', 1, NULL),
(3, 'Kron', 'Zed', 'Manager', 2, '2478-05-20'),
(4, 'Mira', 'Nova', 'Chef cuisinier', 3, '2482-09-01'),
(5, 'Axel', 'Orion', 'Plongeur', 3, NULL),
(6, 'Tara', 'Quark', 'Serveuse', 4, '2483-03-15');


-- CommandesClients
INSERT INTO CommandesClients (IdCommande, IdRestaurant, Montant_total, Nom_client) VALUES
(1, 1, 36.90, 'Alice'),
(2, 2, 23.50, 'Bob'),
(3, 3, 15.00, 'Cara');


-- LignesCommande
INSERT INTO LignesCommande (IdLigneCommande, IdCommande, IdPlat, Quantite) VALUES
(1, 1, 1, 2),  -- 2 Burgers d'Astéroïde
(2, 1, 3, 1),  -- 1 Smoothie de nébuleuse
(3, 2, 2, 1),  -- 1 Pizza antimatière
(4, 2, 4, 1),  -- 1 Salade de comète
(5, 3, 5, 2);  -- 2 Tacos quantiques

SELECT *
FROM Restaurants;

SELECT *
FROM Plats
ORDER BY Prix DESC;

SELECT *
FROM Employes
ORDER BY Role ASC;

SELECT *
FROM Plats
WHERE Est_vegan = 1;

SELECT *
FROM Plats
WHERE Prix > (
    SELECT AVG(Prix)
    FROM Plats
    WHERE Prix IS NOT NULL
);

SELECT *
FROM Plats
WHERE Est_vegan IS NULL;

SELECT *
FROM Employes
WHERE Date_embauche IS NULL;