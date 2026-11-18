DROP TABLE IF EXISTS avis, suivi, commande, plat_allergene, menu_plat, image, menu, utilisateur, allergene, plat, horaire, regime, theme, role;
CREATE TABLE role(
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nom VARCHAR (255) NOT NULL UNIQUE CHECK (nom IN ('ROLE_ADMIN', 'ROLE_EMPLOYE', 'ROLE_UTILISATEUR'))
);

CREATE TABLE theme(
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nom VARCHAR(255)NOT NULL UNIQUE
);

CREATE TABLE regime(
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nom VARCHAR(255) NOT NULL
);

CREATE TABLE horaire(
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    jour VARCHAR(50) NOT NULL UNIQUE,
    heure_ouverture TIME, 
    heure_fermeture TIME
);

CREATE TABLE plat(
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nom VARCHAR(255) NOT NULL ,
    type VARCHAR(255) NOT NULL CHECK (type IN ('entrée', 'plat', 'dessert'))
);

CREATE TABLE allergene(
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nom VARCHAR(255) NOT NULL
);

CREATE TABLE utilisateur(
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    prenom VARCHAR(255),
    nom VARCHAR(255),
    ville VARCHAR(255),
    telephone VARCHAR(255),
    email VARCHAR(255) NOT NULL UNIQUE,
    mot_de_passe VARCHAR(255) NOT NULL,
    pays VARCHAR(255),
    adresse VARCHAR(255),
    actif BOOLEAN NOT NULL DEFAULT true,
    role_id INT NOT NULL,
    FOREIGN KEY(role_id) REFERENCES role(id)
);

CREATE TABLE menu(
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT, 
    titre VARCHAR(255) NOT NULL,
    description TEXT NOT NULL,
    prix DECIMAL(15, 2) NOT NULL,
    stock INT NOT NULL,
    nb_personne_minimum INT NOT NULL,
    conditions TEXT NOT NULL, 
    theme_id INT NOT NULL,
    regime_id INT NOT NULL,
    FOREIGN KEY(theme_id) REFERENCES theme(id),
    FOREIGN KEY(regime_id) REFERENCES regime(id)
);

CREATE TABLE image(
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT, 
    chemin_img VARCHAR(255) NOT NULL,
    menu_id INT NOT NULL,
    FOREIGN KEY(menu_id) REFERENCES menu(id) ON DELETE CASCADE
);


CREATE TABLE commande(
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    adresse_livraison VARCHAR(255) NOT NULL,
    date_commande DATETIME NOT NULL,
    date_prestation DATE NOT NULL, 
    heure_livraison TIME NOT NULL, 
    prix_menu DECIMAL(15, 2) NOT NULL,
    prix_livraison DECIMAL(15, 2) NOT NULL,
    ville_livraison VARCHAR(255) NOT NULL,
    nb_personnes INT NOT NULL,
    numero VARCHAR(255) NOT NULL UNIQUE,
    statut VARCHAR(255) NOT NULL DEFAULT 'en attente' CHECK (statut IN ('en attente', 'accepté', 'en préparation', 'en cours de livraison', 'livré', 'en attente du retour de matériel', 'terminée', 'annulée')),
    pret_materiel BOOLEAN NOT NULL DEFAULT false,
    restitution_materiel BOOLEAN,
    motif_annulation VARCHAR(255),
    mode_contact VARCHAR(50),
    menu_id INT NOT NULL,
    utilisateur_id INT NOT NULL,
    FOREIGN KEY(menu_id) REFERENCES menu(id) ON DELETE RESTRICT,
    FOREIGN KEY(utilisateur_id) REFERENCES utilisateur(id) ON DELETE RESTRICT,
    CHECK(pret_materiel = true OR restitution_materiel IS NULL)
);

Create table avis(
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT, 
    description TEXT NOT NULL,
    note TINYINT NOT NULL CHECK (note BETWEEN 1 AND 5),
    statut VARCHAR(255) NOT NULL DEFAULT 'en attente' CHECK (statut IN ('en attente', 'validé', 'refusé')),
    commande_id INT NOT NULL UNIQUE, 
    FOREIGN KEY(commande_id) REFERENCES commande(id)
);

CREATE TABLE suivi(
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    statut VARCHAR(255) NOT NULL CHECK (statut IN ('en attente', 'accepté', 'en préparation', 'en cours de livraison', 'livré', 'en attente du retour de matériel', 'terminée', 'annulée')),
    date_heure DATETIME NOT NULL,
    commande_id INT NOT NULL,
    FOREIGN KEY(commande_id) REFERENCES commande(id) ON DELETE CASCADE
);

CREATE TABLE menu_plat(
    menu_id INT,
    plat_id INT,
    PRIMARY KEY (menu_id, plat_id),
    FOREIGN KEY(menu_id) REFERENCES menu(id) ON DELETE CASCADE,
    FOREIGN KEY(plat_id) REFERENCES plat(id) ON DELETE CASCADE
);

CREATE TABLE plat_allergene(
    plat_id INT,
    allergene_id INT,
    PRIMARY KEY (plat_id, allergene_id),
    FOREIGN KEY(plat_id) REFERENCES plat(id) ON DELETE CASCADE,
    FOREIGN KEY(allergene_id) REFERENCES allergene(id) ON DELETE CASCADE
);
