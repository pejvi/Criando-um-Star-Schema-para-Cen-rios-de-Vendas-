-- ============================================================
-- 1) CRIAÇÃO DO SCHEMA
-- ============================================================
CREATE DATABASE IF NOT EXISTS dw_professores;
USE dw_professores;

-- ============================================================
-- 2) DIMENSÕES
-- ============================================================

-- DIMENSÃO PROFESSOR
CREATE TABLE DimProfessor (
    SK_Professor INT AUTO_INCREMENT PRIMARY KEY,
    ProfessorID INT,
    NomeProfessor VARCHAR(150),
    Titulacao VARCHAR(100),
    TempoContratacao INT,
    RegimeTrabalho VARCHAR(50),
    Sexo VARCHAR(20)
);

-- DIMENSÃO CURSO
CREATE TABLE DimCurso (
    SK_Curso INT AUTO_INCREMENT PRIMARY KEY,
    CursoID INT,
    NomeCurso VARCHAR(200),
    Modalidade VARCHAR(100),
    NivelCurso VARCHAR(100)
);

-- DIMENSÃO DISCIPLINA
CREATE TABLE DimDisciplina (
    SK_Disciplina INT AUTO_INCREMENT PRIMARY KEY,
    DisciplinaID INT,
    NomeDisciplina VARCHAR(200),
    CargaHorariaDisciplina INT
);

-- DIMENSÃO DEPARTAMENTO
CREATE TABLE DimDepartamento (
    SK_Departamento INT AUTO_INCREMENT PRIMARY KEY,
    DepartamentoID INT,
    NomeDepartamento VARCHAR(150),
    Diretor VARCHAR(150)
);

-- DIMENSÃO DATA
CREATE TABLE DimData (
    SK_Data INT PRIMARY KEY,     -- ex: 20250115
    DataCompleta DATE,
    Ano INT,
    Semestre INT,
    Trimestre INT,
    Mes INT,
    NomeMes VARCHAR(20),
    Dia INT,
    DiaSemana VARCHAR(20)
);

-- ============================================================
-- 3) TABELA FATO
-- ============================================================

CREATE TABLE FatoOfertaProfessor (
    ID_Fato INT AUTO_INCREMENT PRIMARY KEY,

    FK_Professor INT,
    FK_Curso INT,
    FK_Disciplina INT,
    FK_Departamento INT,
    FK_DataOferta INT,

    CH_AulasMinistradas DECIMAL(10,2),
    CH_CargaHoraria DECIMAL(10,2),

    -- CHAVES ESTRANGEIRAS
    FOREIGN KEY (FK_Professor) REFERENCES DimProfessor(SK_Professor),
    FOREIGN KEY (FK_Curso) REFERENCES DimCurso(SK_Curso),
    FOREIGN KEY (FK_Disciplina) REFERENCES DimDisciplina(SK_Disciplina),
    FOREIGN KEY (FK_Departamento) REFERENCES DimDepartamento(SK_Departamento),
    FOREIGN KEY (FK_DataOferta) REFERENCES DimData(SK_Data)
);