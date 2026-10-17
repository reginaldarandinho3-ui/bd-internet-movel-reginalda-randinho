# Modelo relacional

1. **utilizador**(id_utilizador `PK`, nome, email, password, perfil)
2. **operadora**(id_operadora `PK`, nome)
3. **localidade**(id_localidade `PK`, nome, distrito, provincia, tipo)
4. **estacao_base**(id_estacao `PK`, codigo, tecnologia_principal, altura_torre_m, id_operadora `FK → operadora`, id_localidade `FK → localidade`)
5. **pacote**(id_pacote `PK`, nome, preco, dados_gb, validade_dias, id_operadora `FK → operadora`)
6. **medicao**(id_localidade `PK/FK → localidade`, nr_medicao `PK`, data_hora, tecnologia, download_mbps, upload_mbps, latencia_ms, sinal_dbm, id_operadora `FK → operadora`, id_utilizador `FK → utilizador`)
7. **reclamacao**(id_reclamacao `PK`, descricao, data, estado, id_utilizador `FK → utilizador`, id_operadora `FK → operadora`, id_localidade `FK → localidade`)

A chave da **medicao** é composta por id_localidade e nr_medicao. A entidade fraca é a medicao.
