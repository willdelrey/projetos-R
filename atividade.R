#Bases Computacionais da Ciência
# Nome:willington lucas 
# RA:11202420552
# Atividade 1

#Exercício 1 - Leia o conteúdo do arquivo de dados fornecido (pib.csv), carregando o conteúdo para uma tabela
#install.packages("magrittr")
library(ggplot2)
library(readr)
library(dplyr)
dados<-read.csv("pib.csv")
str(dados)
nrow(dados)
ncol(dados)

#Exercício 2:
  #a):
dados2<- select(dados, ano, sigla_uf, nome_municipio, impostos)
dados2
  #b)
dados3<- select(dados, ano, nome_regiao, nome_municipio, pib)
dados3
#Exercício 3:
  #a)
dados2020<-filter(dados, ano==2020)
dados2020
  #b)
dados_parana<-filter(dados, nome_uf== "Paraná" )
dados_parana
# O estado do paraná não consta no dataframe, apenas uma cidade chamada paraná que fica localizada no RN.

#c)
dados_minas_2019<-filter(dados, nome_uf == "Minas Gerais", ano == 2019 )
dados_minas_2019

#d)
dados_pib_pb<-filter(dados, nome_uf=="Paraíba", pib_per_capita >=5000 & pib_per_capita<=10000)
dados_pib_pb

#Exercício 4:
  #a)
#selecionando e filtrando os dados requeridos:
mg2019<-select(dados, ano, sigla_uf, nome_municipio, pib )
mg2019<-filter(mg2019, ano==2019, sigla_uf=="MG")
mg2019
#elencando o top 10
top10pibs<- mg2019 %>%
  arrange(desc(pib)) %>%
  slice_head(n = 10)
top10pibs


#b)
#primeiro criei uma tabela contendo apenas as seguintes colunas:
dados_impostos<-select(dados, ano, nome_uf, impostos)
dados_impostos
#depois filtrei os dados por ano, no caso 2020:
dados_impostos<-filter(dados_impostos, ano==2020)
dados_impostos
#aqui criei uma outra tabela para a somatória de impostos por estado:
soma_impostos_2020 <- dados_impostos %>%
  filter(ano==2020)%>%
  group_by(nome_uf) %>%
  summarise(somatoria_impostos = sum(impostos, na.rm = TRUE))
soma_impostos_2020





