use coletaigti;

select * from tb_pesquisa;
select * from tb_animal_estimacao;
select * from stg_pesquisa;

INSERT INTO tb_pesquisa (data_coleta, id_pessoa, id_hobbies, id_bebidas, id_clima, id_animal_estimacao)
(
SELECT 
	stg.data_coleta,
    pessoa.id_pessoa,
    hobbie.id_hobbies,
    bebidas.id_bebidas,
    climas.id_clima,
    animal.id_animal_estimacao
FROM stg_pesquisa AS stg
	INNER JOIN tb_pessoa AS pessoa ON stg.cod_pessoa = pessoa.id_pessoa
    INNER JOIN tb_hobbies AS hobbie ON stg.hobbies = hobbie.hobbies
    INNER JOIN tb_bebidas AS bebidas ON stg.bebida_favorita = bebidas.bebida
    INNER JOIN tb_clima AS climas ON stg.clima = climas.clima
    INNER JOIN tb_animal_estimacao AS animal ON stg.animal_estimacao = animal.animal_estimacao
);	

select * from tb_pessoa;

select tb_pesquisa.id_animal_estimacao,
		animal.animal_estimacao,
		count(tb_pesquisa.id_pessoa) as conta
        from tb_pesquisa
        join tb_animal_estimacao as animal
        on tb_pesquisa.id_animal_estimacao = animal.id_animal_estimacao
        where animal.animal_estimacao = 'gato' or animal.animal_estimacao = 'cachorro'
        group by tb_pesquisa.id_animal_estimacao
        order by  count(tb_pesquisa.id_pessoa);
    
select * from tb_pessoa;

ALTER TABLE tb_pessoa ADD idade int();

UPDATE tb_pessoa  SET idade = timestampdiff(year, tb_pessoa.data_nasc, NOW());

select * from tb_bebidas;

select tb_pessoa.genero,
	AVG(tb_pessoa.idade),
    tb_bebidas.bebida,
    tb_clima.clima
    from tb_pessoa
    right join tb_pesquisa
    on tb_pesquisa.id_pessoa = tb_pessoa.id_pessoa
    right join tb_bebidas
    on tb_pesquisa.id_bebidas = tb_bebidas.id_bebidas
    right join tb_clima
    on tb_pesquisa.id_clima = tb_clima.id_clima
    where tb_pessoa.genero = 'Feminino' and tb_bebidas.bebida = 'Chá' and tb_clima.clima = 'frio'
    group by tb_pessoa.genero;
   
select * from tb_pessoa;

create temporary table hobbies
select tb_pesquisa.id_hobbies as id, 
	 tb_hobbies.hobbies as hobbies,
	tb_pessoa.genero as genero
	from tb_pesquisa
   join tb_pessoa
   on tb_pesquisa.id_pessoa = tb_pessoa.id_pessoa
   join tb_hobbies
   on tb_pesquisa.id_hobbies = tb_hobbies.id_hobbies;
   
select 
		hobbies,
        genero,
    count(hobbies)
     from hobbies
     where genero = 'Masculino'
    group by hobbies
    order by count(hobbies) desc;

select * from tb_pesquisa;

select 
		tb_hobbies.hobbies,
        avg(tb_pessoa.idade)
        from tb_pesquisa
        join tb_pessoa on tb_pesquisa.id_pessoa = tb_pessoa.id_pessoa
        join tb_hobbies on tb_pesquisa.id_hobbies = tb_hobbies.id_hobbies
        group by tb_hobbies.hobbies;

select tb_hobbies.hobbies,
		count(tb_hobbies.hobbies),
        avg(tb_pessoa.idade)
        from tb_pesquisa
        join tb_hobbies on tb_pesquisa.id_hobbies = tb_hobbies.id_hobbies
        join tb_pessoa on tb_pessoa.id_pessoa = tb_pesquisa.id_pessoa
        group by tb_hobbies.hobbies;
        
select * from tb_clima;
select  
	tb_clima.clima,
		count(1)
	from tb_pesquisa
    join tb_clima on tb_pesquisa.id_clima = tb_clima.id_clima
    group by tb_clima.clima;
    
  select * from tb_animal_estimacao;  
  
select animal.animal_estimacao,
		tb_pessoa.genero,
		count(animal.animal_estimacao)        
        from tb_pesquisa
        join tb_pessoa on tb_pesquisa.id_pessoa = tb_pessoa.id_pessoa
        join tb_animal_estimacao animal on tb_pesquisa.id_animal_estimacao = animal.id_animal_estimacao
        where tb_pessoa.genero = 'Feminino'
        group by  animal.animal_estimacao,tb_pessoa.genero
        order by count(animal.animal_estimacao) desc;
        
        
select tb_pessoa.genero,
		tb_clima.clima,
        count(2)
        from tb_pesquisa
        join tb_pessoa on tb_pesquisa.id_pessoa = tb_pessoa.id_pessoa
        join tb_clima on tb_pesquisa.id_clima = tb_clima.id_clima
        group by tb_pessoa.genero, tb_clima.clima;
        
  select * from tb_hobbies;      
select tb_pessoa.genero,
	animal.animal_estimacao,
    tb_hobbies.hobbies,
    count(tb_pesquisa.id_pessoa)
    from tb_pesquisa
    join tb_pessoa on tb_pesquisa.id_pessoa = tb_pessoa.id_pessoa
    join tb_animal_estimacao animal on tb_pesquisa.id_animal_estimacao = animal.id_animal_estimacao
    join tb_hobbies on tb_pesquisa.id_hobbies = tb_hobbies.id_hobbies
    where tb_pessoa.genero = 'Masculino' and tb_hobbies.hobbies = 'Assistir TV'
    group by tb_pessoa.genero,animal.animal_estimacao, tb_hobbies.hobbies;
    