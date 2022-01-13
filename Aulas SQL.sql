/*Mostre o título e o nome do gênero de todas as séries.*/
select s.title, g.name
from series s
inner join genres g on (g.id = s.genre_id)
order by s.title;

/*Mostre o título dos episódios, os nomes e sobrenomes dos atores que atuam em cada um deles.*/	
SELECT e.title, a.first_name, a.last_name
FROM episodes e, actors a
INNER JOIN actor_episode ae
ON ae.actor_id = a.id 
ORDER BY e.title;

/*correcao do que foi feito acima*/
SELECT e.title, a.first_name, a.last_name
FROM episodes e
INNER JOIN actor_episode ae ON e.id = ae.episode_id
INNER JOIN actors a ON ae.actor_id = a.id 
ORDER BY e.title;

/*Mostre o título de todas as séries e o número total de temporadas que cada uma delas possui.*/
SELECT se.title, count(s.number) as totalTemps
FROM series se
INNER JOIN seasons s on s.serie_id = se.id
GROUP BY se.title;
 
/*Mostre o nome de todos os gêneros e o número total de filmes de cada um, desde que seja maior ou igual a 3.*/		
SELECT g.name, count(m.title) as totalFilms
FROM genres g
INNER JOIN movies m on m.genre_id = g.id
GROUP BY g.name
HAVING COUNT(*) >=3
ORDER BY g.name;

/*Mostre apenas o nome e o sobrenome dos atores que atuam em todos os filmes Guerra nas Estrelas e que estes não se repitam.*/
SELECT DISTINCT a.first_name, a.last_name
FROM actors a
INNER JOIN actor_movie ac ON ac.actor_id = a.id
INNER JOIN movies m ON ac.movie_id = m.id
where m.title like "%La Guerra de las galaxias%";

/*parte 2 das atividades*/
/*Adicione um filme à tabela de filmes.*/
INSERT INTO movies (title,rating,awards, release_date, genre_id) values ("Fast Furious", 8.0, 0, "2001-10-10", 4);

/*Adicione um gênero à tabela de gêneros.*/
INSERT INTO genres (name, ranking, active) values ("Animes", 13, 1);

/*Associe o filme do Ex 2. ao gênero criado no Ex. 3.*/

/*Modifique a tabela de atores para que pelo menos um ator tenha como favorito o filme adicionado no Ex. 2.*/
UPDATE actors set favorite_movie_id = 22 where actors.id = 46; 

/*Crie uma cópia temporária da tabela de filmes*/
CREATE TEMPORARY TABLE moviesCopy SELECT * FROM movies;

/*Elimine desta tabela temporária todos os filmes que ganharam menos de 5 prêmios.*/
delete movies from movies where awards < 5;



select * from actors;
select * from movies;
select * from genres;
select * from moviesCopy;