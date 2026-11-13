INSERT INTO role (nom) VALUES
    ('ROLE_ADMIN'),
    ('ROLE_EMPLOYE'),
    ('ROLE_UTILISATEUR');

INSERT INTO theme (nom) VALUES
    ('Noël'),
    ('Pâques'),
    ('Classique'),
    ('Événement');

INSERT INTO regime (nom) VALUES
    ('Végétarien'),
    ('Végan'),
    ('Classique'),
    ('Sans gluten');

INSERT INTO horaire (jour, heure_ouverture, heure_fermeture) VALUES
    ('lundi', NULL, NULL),
    ('mardi', '08:00', '20:00'),
    ('mercredi', '08:00', '20:00'),
    ('jeudi', '08:00', '20:00'),
    ('vendredi', '08:00', '20:00'),
    ('samedi', '08:00', '20:00'),
    ('dimanche', '08:00', '20:00');

INSERT INTO plat (nom, type) VALUES
    ('Œufs mimosa', 'entrée'),
    ('Huîtres', 'entrée'),
    ('Asperges vertes, sauce hollandaise', 'entrée'),
    ('Houmous maison', 'entrée'),
    ('Velouté de potimarron', 'entrée'),
    ('Gigot d’agneau rôti à l’ail, flageolets', 'plat'),
    ('Saumon en croûte d’herbes', 'plat'),
    ('Chapon rôti aux marrons', 'plat'),
    ('Curry de légumes', 'plat'),
    ('Filet de dorade aux légumes rôtis', 'plat'),
    ('Nid de Pâques au chocolat', 'dessert'),
    ('Bûche au chocolat', 'dessert'),
    ('Mousse au chocolat végétale', 'dessert'),
    ('Fondant au chocolat sans farine', 'dessert'),
    ('Tarte aux fraises', 'dessert'),
    ('Tarte fine aux pommes', 'dessert'),
    ('Mini-quiches assorties', 'entrée'),
    ('Wraps au poulet et crudités', 'plat'),
    ('Pièce montée en choux', 'dessert');

INSERT INTO allergene (nom) VALUES
    ('Oeuf'),
    ('Moutarde'),
    ('Poisson'),
    ('Lait'),
    ('Gluten'),
    ('Mollusques'),
    ('Sésame');

INSERT INTO utilisateur (prenom, nom, ville, telephone, email, mot_de_passe, role_id) VALUES
    ('Léa', 'Roux', 'Toulouse', '0100112233', 'lea.roux@test.fr', 'password_test', 2),
    ('Luc', 'Brun', 'Toulouse', '0100223344', 'luc.brun@test.fr', 'password_test', 3),
    ('Lili', 'Red', 'Toulouse', '0100112233', 'lili.red@test.fr', 'password_test', 1);

INSERT INTO menu (titre, description, prix, stock, nb_personne_minimum, conditions, theme_id, regime_id) VALUES
    ('de Pâques', 'Un repas de printemps pour fêter Pâques
en famille.', 35.00, 5 , 8, 'Commande au minimum 7 jours avant la prestation.
À conserver au réfrigérateur (0 à 4 °C), à consommer sous 24 h.', 2, 3),
    ('du Marché', 'Les produits de saison du marché Victor Hugo, en trois services.', 35.00, 5, 4, 'Commande au minimum 7 jours avant la prestation.
À conserver au réfrigérateur (0 à 4 °C), à consommer sous 24 h.', 3, 1),
    ('de Noël', 'Un repas exceptionnel pour fêter Noël
en famille.', 45.00, 5 , 6, 'Commande au minimum 7 jours avant la prestation.
À conserver au réfrigérateur (0 à 4 °C), à consommer sous 24 h.', 1, 3),
    ('réception', 'Buffet salé et sucré pour vos anniversaires et mariages.', 30.00, 9 , 20, 'Commande au minimum 7 jours avant la prestation.
À conserver au réfrigérateur (0 à 4 °C), à consommer sous 24 h.', 4, 3),
    ('Végan', 'Des produits selectionnés avec soin pour faire chavirer vos papilles.', 35.00, 5 , 8, 'Commande au minimum 7 jours avant la prestation.
À conserver au réfrigérateur (0 à 4 °C), à consommer sous 24 h.', 3, 2),
    ('sans Gluten', 'De succulents produits de saison qui respectent vos besoins', 35.00, 5 , 8, 'Commande au minimum 7 jours avant la prestation.
À conserver au réfrigérateur (0 à 4 °C), à consommer sous 24 h.', 3, 4);

INSERT INTO menu_plat(menu_id, plat_id) VALUES
    (1, 1), (1, 3), (1, 6), (1, 7), (1, 11), (1, 15),
    (3, 2), (3, 8), (3, 12),
    (5, 4), (5, 9), (5, 13),
    (6, 5), (6, 10), (6, 14),
    (2, 5), (2, 9), (2, 16),
    (4, 1), (4, 17), (4, 18), (4, 19);

INSERT INTO plat_allergene (plat_id, allergene_id ) VALUES
    (1, 1), (1, 2),
    (2, 6),
    (3, 1), (3, 4),
    (4, 7),
    (5, 4),
    (7, 3), (7, 5),
    (10, 3),
    (11, 1), (11, 4), (11, 5),
    (12, 1), (12, 4), (12, 5),
    (14, 1), (14, 4),
    (15, 1), (15, 4), (15, 5),
    (16, 4), (16, 5),
    (17, 1), (17, 4), (17, 5),
    (18, 2), (18, 5),
    (19, 1), (19, 4), (19, 5);

INSERT INTO image (chemin_img, menu_id) VALUES
    ('uploads/menus/paques-1.jpg', 1),
    ('uploads/menus/paques-2.jpg', 1),
    ('uploads/menus/marche-1.jpg', 2),
    ('uploads/menus/noel-1.jpg', 3),
    ('uploads/menus/noel-2.jpg', 3),
    ('uploads/menus/reception-1.jpg', 4),
    ('uploads/menus/vegan-1.jpg', 5),
    ('uploads/menus/sans-gluten-1.jpg', 6);

INSERT INTO commande (numero, adresse_livraison, ville_livraison, date_commande,
    date_prestation, heure_livraison, nb_personnes, prix_menu, prix_livraison,
    statut, pret_materiel, restitution_materiel, menu_id, utilisateur_id) VALUES
    ('VG-7K3M9Q2X', '12 rue Sainte-Catherine', 'Bordeaux', '2026-03-20 10:15:00',
     '2026-04-05', '12:00:00', 8, 35.00, 0.00,
     'terminée', FALSE, NULL, 1, 2);

INSERT INTO suivi (statut, date_heure, commande_id) VALUES
    ('en attente',            '2026-03-20 10:15:00', 1),
    ('accepté',               '2026-03-21 09:00:00', 1),
    ('en préparation',        '2026-04-04 14:00:00', 1),
    ('en cours de livraison', '2026-04-05 11:15:00', 1),
    ('livré',                 '2026-04-05 11:50:00', 1),
    ('terminée',              '2026-04-05 11:55:00', 1);

INSERT INTO avis (description, note, statut, commande_id) VALUES
    ('Gigot parfait et livraison à l''heure. Toute la famille a adoré !', 5, 'validé', 1);