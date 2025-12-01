erDiagram
    DimProfessor {
        int SK_Professor PK
        int ProfessorID
        string NomeProfessor
        string Titulacao
        int TempoContratacao
        string RegimeTrabalho
        string Sexo
    }

    DimCurso {
        int SK_Curso PK
        int CursoID
        string NomeCurso
        string Modalidade
        string NivelCurso
    }

    DimDisciplina {
        int SK_Disciplina PK
        int DisciplinaID
        string NomeDisciplina
        int CargaHorariaDisciplina
    }

    DimDepartamento {
        int SK_Departamento PK
        int DepartamentoID
        string NomeDepartamento
        string Diretor
    }

    DimData {
        int SK_Data PK
        date DataCompleta
        int Ano
        int Semestre
        int Trimestre
        int Mes
        string NomeMes
        int Dia
        string DiaSemana
    }

    FatoOfertaProfessor {
        int ID_Fato PK
        int FK_Professor FK
        int FK_Curso FK
        int FK_Disciplina FK
        int FK_Departamento FK
        int FK_DataOferta FK
        decimal CH_AulasMinistradas
        decimal CH_CargaHoraria
    }

    FatoOfertaProfessor }o--|| DimProfessor : "FK_Professor"
    FatoOfertaProfessor }o--|| DimCurso : "FK_Curso"
    FatoOfertaProfessor }o--|| DimDisciplina : "FK_Disciplina"
    FatoOfertaProfessor }o--|| DimDepartamento : "FK_Departamento"
    FatoOfertaProfessor }o--|| DimData : "FK_DataOferta"
