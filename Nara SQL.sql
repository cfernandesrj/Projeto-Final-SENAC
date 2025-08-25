CREATE DATABASE projeto_clinicas_nara;

USE projeto_clinicas_nara;

CREATE TABLE Clinicas(
	ID_CLINICA INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(100),
    Cidade VARCHAR(50),
    CAPACIDADE_DIARIA INT);

LOAD DATA INFILE 'C:/Users/cmjfe/Documents/Projeto-Final-SENAC/clinicas.csv' # CARREGAMENTO DE ARQUIVO
INTO TABLE Clinicas
FIELDS TERMINATED BY ',' #INFORMANDO QUE O SEPARADOR É VIRGULA
LINES TERMINATED BY '\n' #INSERIR QUEBRA DE LINHA AO FINAL DE CADA LINHA
IGNORE 1 ROWS; #IGNORAR PRIMEIRA LINHA, QUE NESSE CASO SERÁ O CABECALHO


CREATE TABLE Consultas (
   id_consulta INT AUTO_INCREMENT PRIMARY KEY,
    id_paciente INT, FOREIGN KEY(id_paciente) REFERENCES Pacientes(id_paciente),
    id_medico INT, FOREIGN KEY(id_medico) REFERENCES Medicos(id_medico),
    id_clinica INT, FOREIGN KEY(id_clinica) REFERENCES Clinicas(ID_CLINICA),
    especialidade VARCHAR(50),
    data_hora_agendada DATETIME,
    data_hora_inicio DATETIME,
    situacao VARCHAR(50)
);

LOAD DATA INFILE 'C:/Users/cmjfe/Documents/Projeto-Final-SENAC/consultas.csv' # CARREGAMENTO DE ARQUIVO
INTO TABLE Consultas
FIELDS TERMINATED BY ',' #INFORMANDO QUE O SEPARADOR É VIRGULA
LINES TERMINATED BY '\n' #INSERIR QUEBRA DE LINHA AO FINAL DE CADA LINHA
IGNORE 1 ROWS; #IGNORAR PRIMEIRA LINHA, QUE NESSE CASO SERÁ O CABECALHO	


SELECT * FROM Consultas;

# total de consultas por especialidade organizado do maior para o menor 
SELECT especialidade, COUNT(*) AS total_consultas
FROM Consultas
GROUP BY especialidade
ORDER BY total_consultas DESC;

# total de consultas por id medico orgazinado do maior para o menor
SELECT id_medico, COUNT(*) AS total_consultas_medico
FROM Consultas
GROUP BY id_medico
ORDER BY total_consultas_medico DESC;

# total de consultas por clinica orgazinado do maior para o menor
SELECT id_clinica, COUNT(*) AS total_consultas_clinica
FROM Consultas
GROUP BY id_clinica
ORDER BY total_consultas_clinica DESC;

# total de consultas por status orgazinado do maior para o menor
SELECT situacao, COUNT(*) AS total_consultas_status
FROM Consultas
GROUP BY situacao
ORDER BY total_consultas_status DESC;

CREATE TABLE Avaliacoes (
    id_consulta INT,
    nota_satisfacao INT,
    comentario VARCHAR(50)
);

LOAD DATA INFILE 'C:/Users/cmjfe/Documents/Projeto-Final-SENAC/avaliacoes.csv' # CARREGAMENTO DE ARQUIVO
INTO TABLE Avaliacoes
FIELDS TERMINATED BY ',' #INFORMANDO QUE O SEPARADOR É VIRGULA
LINES TERMINATED BY '\n' #INSERIR QUEBRA DE LINHA AO FINAL DE CADA LINHA
IGNORE 1 ROWS; #IGNORAR PRIMEIRA LINHA, QUE NESSE CASO SERÁ O CABECALHO	


SELECT * FROM Avaliacoes;

CREATE TABLE Medicos (
    id_medico INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50),
    especialidade VARCHAR(50)
);


LOAD DATA INFILE 'C:/Users/cmjfe/Documents/Projeto-Final-SENAC/medicos.csv' # CARREGAMENTO DE ARQUIVO
INTO TABLE Medicos
FIELDS TERMINATED BY ';' #INFORMANDO QUE O SEPARADOR É VIRGULA
LINES TERMINATED BY '\n' #INSERIR QUEBRA DE LINHA AO FINAL DE CADA LINHA
IGNORE 1 ROWS; #IGNORAR PRIMEIRA LINHA, QUE NESSE CASO SERÁ O CABECALHO	


SELECT * FROM Medicos;

CREATE TABLE Pacientes (
    id_paciente INT AUTO_INCREMENT PRIMARY KEY,
    idade INT,
    sexo VARCHAR(2),
    cidade VARCHAR(50),
    plano_saude VARCHAR(10)
);

LOAD DATA INFILE 'C:/Users/cmjfe/Documents/Projeto-Final-SENAC/pacientes.csv' # CARREGAMENTO DE ARQUIVO
INTO TABLE Pacientes
FIELDS TERMINATED BY ',' #INFORMANDO QUE O SEPARADOR É VIRGULA
LINES TERMINATED BY '\n' #INSERIR QUEBRA DE LINHA AO FINAL DE CADA LINHA
IGNORE 1 ROWS; #IGNORAR PRIMEIRA LINHA, QUE NESSE CASO SERÁ O CABECALHO	


SELECT * FROM Pacientes;

