CREATE DATABASE netflix;

USE netflix;

CREATE TABLE movies (
	idMovies INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    title VARCHAR(45) NOT NULL,
    genre VARCHAR(45) NOT NULL,
    image VARCHAR(1000) NOT NULL,
    category VARCHAR(45) NOT NULL,
    year INT NOT NULL
);

CREATE TABLE users ( 
	idUser INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    user VARCHAR(45) NOT NULL,
    password VARCHAR(45) NOT NULL,
    name VARCHAR(45) NOT NULL,
	email VARCHAR(45) NOT NULL,
	plan_details VARCHAR(45) NOT NULL
);

CREATE TABLE actors (
	idActor INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    name VARCHAR(45) NOT NULL,
    lastname VARCHAR(45) NOT NULL,
    country VARCHAR(45) NOT NULL,
    birthday DATE
);


USE netflix;

INSERT INTO movies (idMovies, title, genre, image, category, year) 
VALUES 
(1,"Pulp fiction", "crimen", "https://pics.filmaffinity.com/pulp_fiction-210382116-large.jpg", "Top 10", 1994),
(2,"La vita è bella", "comedia", "https://pics.filmaffinity.com/la_vita_e_bella-646167341-mmed.jpg", "Top 10", 1996),
(3,"Forrest Gump", "comedia", "https://pics.filmaffinity.com/forrest_gump-212765827-mmed.jpg", "Top 10", 1994);

INSERT INTO users (idUser, user, password, name, email, plan_details)
VALUES
(1, "laura_dev", "laura", "Laura", "laura@gamil.com", "Standard"),
(2, "maria_dev", "maria", "Maria", "maria@gmail.com", "Standard"),
(3, "ester_dev", "ester", "Ester", "ester@gmail.com", "Standard");

INSERT INTO actors (idActor, name, lastname, country, birthday)
VALUES
(1, "Tom", "Hanks", "Estados Unidos", "1956-07-09"),
(2, "Roberto", "Benigni", "Italia", "1952-10-27"),
(3, "John", "Travolta", "Estados Unidos", "1954-02-18");

SELECT title, genre FROM movies WHERE year >1990;





