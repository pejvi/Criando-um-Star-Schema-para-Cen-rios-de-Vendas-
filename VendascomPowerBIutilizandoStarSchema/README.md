📘 Data Warehouse — Modelo Dimensional Focado em Professores
🎯 Objetivo

Criar um modelo dimensional (Star Schema) para análise de dados relacionados a professores, seus cursos, disciplinas, departamentos e datas de oferta.

O foco do modelo é a análise do professor, consolidando informações relevantes para relatórios e dashboards.

⭐ Modelo em Estrela

Tabela Fato:
FatoOfertaProfessor
Registra as ofertas ministradas por cada professor, relacionando curso, disciplina, departamento e data.

Tabelas Dimensão:

DimProfessor

DimCurso

DimDisciplina

DimDepartamento

DimData

📐 Descrição das Tabelas
DimProfessor

Contém informações do professor.

SK_Professor

ProfessorID

NomeProfessor

Titulacao

TempoContratacao

RegimeTrabalho

Sexo

DimCurso

Detalhes do curso ministrado.

SK_Curso

CursoID

NomeCurso

Modalidade

NivelCurso

DimDisciplina

Características da disciplina.

SK_Disciplina

DisciplinaID

NomeDisciplina

CargaHorariaDisciplina

DimDepartamento

Informações do departamento.

SK_Departamento

DepartamentoID

NomeDepartamento

Diretor

DimData

Calendário completo (datas de 2024 e 2025).
Inclui:
Ano, semestre, trimestre, mês, nome do mês, dia e dia da semana.

🧱 Tabela Fato — FatoOfertaProfessor

FK_Professor

FK_Curso

FK_Disciplina

FK_Departamento

FK_DataOferta

CH_AulasMinistradas

CH_CargaHoraria

🛠️ Banco Físico

Banco criado em MySQL 8, via script SQL contendo:

Criação do schema

Criação das dimensões

Criação da tabela fato

Inserção de dados de teste

Geração automática de duas temporadas de datas (2024–2025)

📊 Utilização

Com esse modelo, é possível analisar:

Professores por curso

Oferta de disciplinas

Quantidade de aulas ministradas

Comparar períodos por datas

Análises no Power BI

📝 Observações

A DimData foi gerada automaticamente usando CTE recursiva.

A tabela fato é totalmente flexível para Power BI.

O banco está pronto para expansão (novos anos, novos professores, etc).