CREATE TABLE funcionarios (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cargo VARCHAR(50) NOT NULL,
    salario DECIMAL(10,2) NOT NULL,
    idade INT NOT NULL,
    data_admissao DATE NOT NULL
);

INSERT INTO funcionarios (nome, cargo, salario, idade, data_admissao) VALUES
('Ana', 'Analista', 3500.90, 29, '2020-01-15'),
('Bruno', 'Gerente', 6200.49, 40, '2015-07-22'),
('Carla', 'Assistente', 2400.35, 25, '2021-03-10'),
('Diego', 'Estagiário', 1500.87, 21, '2023-02-01'),
('Elisa', 'Analista', 3800.51, 32, '2019-11-09'),
('Fábio', 'Coordenador', 4800.50, 36, '2018-04-18');

-- 4.
SELECT nome, salario, ROUND(salario * 0.15, 2) AS bonus_15 FROM funcionarios;

-- 5.
SELECT nome, salario, ROUND(salario * 12, 2) AS salario_anual FROM funcionarios;

-- 6.
SELECT nome, salario, ROUND(salario * 0.08, 2) AS valor_desconto, ROUND(salario - (salario * 0.08), 2) AS salario_liquido FROM funcionarios;

-- 7.
SELECT nome, idade, (idade % 2) AS resto_divisao, CASE WHEN (idade % 2) = 0 THEN 'Par' ELSE 'Ímpar' END AS par_ou_impar FROM funcionarios;

-- 8.
SELECT nome, cargo, salario FROM funcionarios WHERE salario > 3000;

-- 9.
SELECT nome, cargo, idade FROM funcionarios WHERE idade <= 30;

-- 10.
SELECT nome, cargo FROM funcionarios WHERE cargo <> 'Estagiário';

-- 11.
SELECT nome, cargo, data_admissao FROM funcionarios WHERE data_admissao < '2020-01-01';

-- 12. 
SELECT nome, salario, idade FROM funcionarios WHERE salario > 2000 AND idade < 30;

-- 13.
SELECT nome, cargo FROM funcionarios WHERE cargo = 'Analista' OR cargo = 'Gerente';

-- 14.
SELECT nome, cargo FROM funcionarios WHERE cargo NOT LIKE 'Assistente';

-- 15.
SELECT nome, idade, salario FROM funcionarios WHERE idade >= 25 AND idade <= 35 AND salario > 3000;

-- 16.
SELECT nome, idade FROM funcionarios WHERE idade BETWEEN 25 AND 35;

-- 17.
SELECT nome, cargo FROM funcionarios WHERE cargo IN ('Analista', 'Gerente', 'Coordenador');

-- 18.
SELECT nome, cargo FROM funcionarios WHERE nome LIKE 'A%';

-- 19.
SELECT nome, cargo FROM funcionarios WHERE nome LIKE '%o';

-- 20.
SELECT nome, data_admissao FROM funcionarios WHERE data_admissao IS NULL;

-- 21.
SELECT nome, data_admissao FROM funcionarios WHERE data_admissao IS NOT NULL;

-- 22.
SELECT NOW() AS data_hora_atual;

-- 23.
SELECT CURRENT_DATE AS data_atual, CURRENT_TIME AS hora_atual;

-- 24.
SELECT nome, data_admissao, EXTRACT(YEAR FROM data_admissao) AS ano_admissao FROM funcionarios;

-- 25.
SELECT nome, data_admissao, (data_admissao + INTERVAL '1 year')::DATE AS proxima_avaliacao FROM funcionarios;

-- 26.
SELECT nome, data_admissao, (CURRENT_DATE - data_admissao) AS dias_na_empresa FROM funcionarios;

-- 27.
SELECT ABS(-150) AS valor_absoluto;

-- 28.
SELECT nome, salario, ROUND(salario * 0.15, 2) AS bonus_arredondado FROM funcionarios;

-- 29.
SELECT nome, salario, CEIL(salario * 12) AS salario_anual_cima, FLOOR(salario * 12) AS salario_anual_baixo FROM funcionarios;

-- 30.
SELECT nome, idade, ROUND(SQRT(idade)::NUMERIC, 2) AS raiz_quadrada_idade FROM funcionarios;

-- 31.
SELECT nome, idade, (POWER(idade, 2)) AS idade_elevada FROM funcionarios;

-- 32. 
SELECT nome, (UPPER(nome)) AS nome_maiusculo FROM funcionarios;

-- 33.
SELECT nome, (LOWER(nome)) AS nome_maiusculo FROM funcionarios;

-- 34.
SELECT nome, CONCAT('Funcionário: ', nome) AS "Descrição" FROM funcionarios;

-- 35.
SELECT nome, (SUBSTRING(nome, 1, 3)) AS primeiras_letras_nome FROM funcionarios;

-- 36.
SELECT nome, (CHAR_LENGTH(nome)) AS caracteres_nome FROM funcionarios;

-- 37.
SELECT nome, (TRIM(nome)) AS nome_sem_espaco FROM funcionarios;

-- 38.
SELECT COUNT(nome) AS numero_de_funcionarios FROM funcionarios;

-- 39.
SELECT SUM(salario) AS soma_dos_salarios FROM funcionarios;

-- 40.
SELECT AVG(salario) AS media_dos_salarios FROM funcionarios;

-- 41.
SELECT MAX(salario) AS maior_salario, MIN(salario) AS menor_salario FROM funcionarios;

-- 42.
SELECT AVG(idade) AS media_das_idades FROM funcionarios;

-- 43.
SELECT cargo, ROUND(AVG(salario), 2) AS media_salarial FROM funcionarios GROUP BY cargo;

-- 44.
SELECT nome AS "Nome do Funcionario:", cargo AS "Cargo:", salario AS "Salario atual:", ROUND(salario * 0.10, 2) AS "Bônus de 10%", ROUND(salario + (salario * 0.10), 2) AS "Salário total", data_admissao AS "Data de Admissão:", (NOW()::DATE - data_admissao) AS "Dias na empresa", CONCAT('Funcionário: ', TRIM(nome), ' | Cargo: ', TRIM(cargo)) AS "Descrição"FROM funcionarios;
