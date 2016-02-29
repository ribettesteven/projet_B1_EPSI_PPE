CREATE DATABASE coffitech; 

	CREATE TABLE ordinateur (
		ord_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
		ord_libelle VARCHAR(50) NOT NULL
	);
	CREATE TABLE souris (
		sou_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT, 
		sou_libelle VARCHAR(50) NOT NULL
	);
	CREATE TABLE clavier (
		cla_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
		cla_libelle VARCHAR(50) NOT NULL
	);
	CREATE TABLE ecran (
		ecran_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
		ecran_libelle VARCHAR(50) NOT NULL
	);
	CREATE TABLE client(
		cli_id INT PRIMARY KEY AUTO_INCREMENT,
		cli_nom VARCHAR(50),
		cli_prenom VARCHAR(50),
		cli_adresse VARCHAR(50),
		cli_cp VARCHAR(50),
		cli_mail VARCHAR (50)
	);
	CREATE TABLE fournisseur(
		fou_id INT PRIMARY KEY AUTO_INCREMENT,
		fou_rs VARCHAR(50),
		fou_adresse VARCHAR(50),
		fou_cp VARCHAR(50),
	);
	CREATE TABLE contact(
		con_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
		con_nom VARCHAR(50) NOT NULL,
		con_prenom VARCHAR(50) NOT NULL,
		con_mail VARCHAR (50) NOT NULL,
		fou_id INT NOT NULL,
		CONSTRAINT FK_CONT_FOU FOREIGN KEY (fou_id)
		REFERENCES fournisseur(fou_id)
	);
	CREATE TABLE devis(
		dev_id INT PRIMARY KEY AUTO_INCREMENT,
		dev_code INT NOT NULL,
		dev_titre VARCHAR(50) NOT NULL,
		dev_date DATE AUTO_INCREMENT,
		dev_dureevalidite DATE NOT NULL,
		cli_id INT NOT NULL
	);
		CREATE TABLE commande(
		com_id INT PRIMARY KEY AUTO_INCREMENT,
		com_code INT NOT NULL,
		com_titre VARCHAR(50) NOT NULL,
		com_date DATE AUTO_INCREMENT,
		cli_id INT NOT NULL,
		dev_id INT NOT NULL
	);
		CREATE TABLE facture(
		fac_id INT PRIMARY KEY AUTO_INCREMENT,
		fac_code INT NOT NULL,
		fac_titre VARCHAR(50) NOT NULL,
		fac_date DATE AUTO_INCREMENT,
		cli_id INT NOT NULL,
		com_id INT NOT NULL
	);
	CREATE TABLE personnel(
		pers_id INT PRIMARY KEY AUTO_INCREMENT,
		pers_nom VARCHAR(50) NOT NULL,
		pers_prenom VARCHAR(50) NOT NULL,
		pers_mail VARCHAR(50) NOT NULL,
		pers_adresse VARCHAR(50) NOT NULL,
		pers_cp VARCHAR(50)NOT NULL,
		pers_ville VARCHAR(50) NOT NULL,
		pers_date_embauche DATE NOT NULL,
		fonc_id INT NOT NULL,
		salaire_id VARCHAR(50)NOT NULL
	);
	CREATE TABLE agenda(
		agenda_id INT PRIMARY KEY AUTO_INCREMENT,
		pers_id INT NOT NULL,
		pers_nom VARCHAR(50) NOT NULL,
		agenda_date DATE NOT NULL,
		h_debut VARCHAR(50) NOT NULL,
		h_fin VARCHAR(50) NOT NULL
		CONSTRAINT FK_AGEN_PERS FOREIGN KEY (pers_id)
		REFERENCES personnel(pers_id)
	);
	CREATE TABLE salaire(
		salaire_id INT PRIMARY KEY AUTO_INCREMENT,
		heure_effect VARCHAR(50) NOT NULL,
		pers_fonction VARCHAR(50) NOT NULL,
		tva VARCHAR (50) NOT NULL,
		CONSTRAINT FK_SAL_PERS FOREIGN KEY (salaire_id)
		REFERENCES personnel(salaire_id)
	);
	CREATE TABLE categorie(
		cat_id INT PRIMARY KEY AUTO_INCREMENT,
		cat_libelle VARCHAR(50) NOT NULL
	);
	CREATE TABLE produit(
		pdt_id INT PRIMARY KEY AUTO_INCREMENT,
		pdt_libelle VARCHAR(50) NOT NULL,
		pdt_qte VARCHAR(50) NOT NULL,
		pdt_pu_ht VARCHAR(50) NOT NULL,
		cat_id INT NOT NULL,
		CONSTRAINT FK_PDT_CAT FOREIGN KEY (cat_id)
		REFERENCES categorie(cat_id)
	);
	CREATE TABLE fonction(
		fonc_id INT PRIMARY KEY AUTO_INCREMENT,
		fonc_libelle VARCHAR(50) NOT NULL,
		CONSTRAINT FK_FON_PERS FOREIGN KEY (fonc_id)
		REFERENCES personnel(fonc_id)
	);
	CREATE TABLE user_connect(
		us_id INT PRIMARY KEY,
		us_identifiant VARCHAR(50) NOT NULL,
		us_mdp VARCHAR(50) NOT NULL,
		pers_id INT NOT NULL
	);