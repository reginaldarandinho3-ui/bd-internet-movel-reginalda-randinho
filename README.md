# Base de Dados: Qualidade da Internet Móvel em Moçambique

**Nome:** Reginalda Hortêncio Francisco Randinho
**Curso:** Licenciatura em Informática,
              2º ano
**Disciplina:** Tecnologias de Base de Dados
**Tema:** Qualidade da internet móvel em Moçambique

## 1. Descrição do problema
Em moçambique a internet é lenta e os megas acabam muito rápido. em NHamatanda provincia de sofala, no terceiro e quinto bairro, assim como no siluvo com  aquelas montanhas situacao e muito pior. A internet e muito lenta nao sei como aquela comunidade consegue viver daquela forma, purque e diferente de outros distrito que ja andei como: Dondo e gôndola, temos  siluvo aquela zona montanhosa, e muito fraco e a ligacao é instável. pur causa dessas montanhas, quase nao ha internet.

## 2. Regras de negócio

1. Cada utilizador tem um perfil: cidadão, técnico ou administrador.
2. Cada operadora tem várias estações base e vários pacotes de dados. Cada estação base e cada pacote pertencem a uma só operadora.
3. Cada estação base fica numa só localidade, e uma localidade pode ter várias estações base.
4. Cada medição regista a tecnologia usada (2G, 3G ou 4G), as velocidades de download e upload, a latência e a força do sinal.
5. Cada medição pertence a uma só localidade, a uma só operadora e a um só utilizador, que tem de ser técnico.
6. O número da medição é único dentro de cada localidade.
7. Os valores de velocidade e latência não podem ser negativos, e o sinal fica entre -140 e 0 dBm.
8. Cada reclamação é feita por um só cidadão e refere-se a uma só operadora e a uma só localidade.
9. Uma reclamação começa no estado "aberta", passa a "em análise" e termina em "resolvida".

## 3. Sistema web previsto
(breve descrição, para o projeto de Programação Web)

## 4. Vídeo
(link do YouTube a colocar no fim)

## 5. Ficheiros
- `diagrama_er.png`: diagrama ER
- `modelo_relacional.md`: modelo relacional
- `01_criacao_e_insercao.sql`: criação e inserção
- `02_manipulacao.sql`: consultas, atualizações, eliminações e teste de integridade
