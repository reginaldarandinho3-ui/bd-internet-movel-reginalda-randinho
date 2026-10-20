# Base de Dados: Qualidade da Internet Móvel em Moçambique

**Nome:** Reginalda Hortêncio Francisco Randinho
**Curso:** Licenciatura em Informática,
              2º ano
**Disciplina:** Tecnologias de Base de Dados.
**Tema:** Qualidade da internet móvel em Moçambique.

## 1. Descrição do problema
Em Moçambique, a internet é lenta e os megas acabam muito rápido. Em Nhamatanda, província de Sofala, no 3.º bairro, a situação é ainda pior. A internet é muito lenta e não sei como é que a comunidade consegue viver assim. Perto de Siluvo, junto às montanhas, o sinal é fraco e a ligação é instável. Por causa dessas montanhas, quase não há internet. Uma pessoa com 529 MB não consegue fazer nada, nem sequer descarregar uma aplicação pequena. É preciso esperar 10 a 12 minutos só para descarregar uma aplicação. As pessoas dessa comunidade vivem assim e não sabem o que fazer.
Principalmente quando se usa a rede vodacom, a situação piora ainda mais. Nem falo da operadora tmcel, que é muito pior. As pessoas têm de esperar muito.
Digo isto porque passei duas semanas nessa zona, e é muito diferente das cidades.
Há também poucas antenas, o que dificulta a rede. Por isso, as pessoas acabam afetadas pela falta de internet. A própria operadora não ajuda, e a comunidade gasta muito dinheiro em megas que nem chegam e nem dura.consultar as medicoes feitas na sua zona. 
o administrador gere os utilizadores, as operadoras e os pacotes. Assim, a comunidade passa a ter dados concretos para escolher melhor a operadora, e as entidades responsáveis ficam a saber onde rede falha.
o sistema vai permitir que os tecnicos registem medicoes de velocidade,sinal e latencia por localidade e operadora, os cidadaos poderam apresentar reclamações 
É quero que esse meu sistema ajude a comunidade a ter internet instável e com garantia. Criar pacotes de Internet mais baratos.
Aumentar a concorrência entre as operadoras.
Disponibilizar Internet gratuita em escolas, universidades e espaços públicos.
Criar pacotes específicos para estudantes. Acompanhar os serviços prestados pelas operadoras

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
O sistema web terá três tipos de utilizadores. Os cidadãos poderão apresentar reclamações sobre a qualidade da internet móvel e consultar as medições feitas em cada localidade. Os técnicos registam as medições de velocidade e sinal feitas no terreno. O administrador iram geranciar os utilizadores, as operadoras, as estações base e os pacotes. Todos poderão listar, pesquisar, alterar e eliminar dados, de acordo com o seu perfil. Por exemplo, um cidadão pode pesquisar as medições da Movitel em distrito de Nhamatanda pronvincia de sofala.

## 4. Vídeo
(link do YouTube a colocar no fim)

## 5. Ficheiros

- `diagrama_er.png`: diagrama ER
- readme.md
- `modelo_relacional.md`: modelo relacional
- `01_criacao_e_insercao.sql`: criação e inserção
- `02_manipulacao.sql`: consultas, atualizações, eliminações e teste de integridade
