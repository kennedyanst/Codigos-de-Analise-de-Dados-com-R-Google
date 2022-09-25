install.packages("tidyverse")
library(tidyverse)
library(lubridate)
typeof(c(2, 1))
x <- c(1, 2, 3, 4, 5)
names(x) <- c("Primeiro", "Segundo", "Terceiro", "Quarto", "Quinto")
list("a", 1L, 1.5, TRUE)
z <- list(list(list(1,3,4)))
str(z)
list("Chicago" = 1, "Nova York" = 2, "Detroit" = 3)

#TRABALHANDO COM DATA E HORA
library(tidyverse)
library(lubridate)

today()
now()
ymd("1995-02-28")
mdy("January 30th, 2021")
dmy("28-Feb-1995")
ymd(20210120)
ymd_hms("2021-01-20 20:11:59")
mdy_hm("01/20/2021 08:01")
as_date(now())


#ESTRUTURA DE DADOS

#Data Frames

df <- data.frame(Ano = c(1958, 1962, 1966, 1970, 1974, 
                         1982, 1986, 1990, 1994, 1998,
                         2002, 2006, 2010, 2014, 2018, 2022), 
                 Pais_campeao = c("Brasil", "Brasil", "Inglaterra", "Brasil",
                                  "Italia", "Alemanha", "Italia", "Alemanha",
                                  "Brasil", "França", "Brasil", "Italia", 
                                  "Espanha", "Alemanha", "França", "Brasil"))
View(df)

#Criar copiar e excluir arquivos em R

#Use a função dir.create para criar uma nova pasta, ou diretório, para guardar seus arquivos. Insira o nome da pasta entre os parênteses da função.

dir.create ("Google_R")

#Use a função file.create() para criar um arquivo em branco. Insira o nome e o tipo do arquivo entre os parênteses da função. Os tipos do seu arquivo serão, em geral, como .txt, .docx ou .csv.  

file.create("new_text_file.txt")
file.create("new_word_file.docx") 
file.create("new_csv_file.csv")
?file.create
#É possível copiar um arquivo com a função file.copy(). Entre os parênteses, insira o nome do arquivo a ser copiado e, em seguida, adicione uma vírgula e o nome da pasta de destino na qual o arquivo será copiado. 

file.copy ("new_text_file.txt" , "Google_R")

#Se você conferir o painel Arquivos (Files) em RStudio, verá uma cópia do arquivo na pasta relevante

#exclua arquivos de R com a função unlink(). Insira o nome do arquivo entre os parênteses da função.

unlink ("some_.file.csv")


#Matrizes
matrix(c(3:8), nrow = 2) #Expecificando o número de linhas
matrix(c(3:8), ncol = 2) #Expecificando o número de colunas


#OPERADORES LÓGICOS
#AND (também representado como “&” ou “&&” em R)
#OR (também representado como “|” ou “||” em R)
#NOT (!)

#IF, ELSE, ELSE IF
#---if
if (condition) {
  
  expr
  
}

#---else
if (condition) {
  
  expr1
  
} else {
  
  expr2
  
}

#---else if
if (condition1) {
  
  expr1
  
} else if (condition2) {
  
  expr2
  
} else {
  
  expr3
  
}

#PACOTES DO R
installed.packages()

#Boas vindas ao tidyverse
library(tidyverse)
tidyverse_update()
install.packages(c("httr", "pillar", "readxl", "rlang", "tibble"))
browseVignettes("ggplot2") #Com a função browseVignettes, é possível realizar a leitura de vinhetas de um pacote carregado.


#COMO TRABALHAR COM PIPES
data("ToothGrowth")
View(ToothGrowth)
library(dplyr)

filtered_tg <- filter(ToothGrowth, dose == 0.5)
View(filtered_tg)
arrange(filtered_tg, len)
arrange(filter(ToothGrowth, dose ==0.5), len)

#Usando PIPE
filtered_toothgrowth <- ToothGrowth %>% 
  filter (dose==0.5) %>% 
  group_by(supp) %>% 
  summarise(mean_len = mean(len, na.rm = T), .groups = "drop")


#Como trabalhar com DataFrames
library(ggplot2)
data("diamonds")
View(diamonds)
head(diamonds) #6 primeiras linhas
str(diamonds) #Estutura dos dados.
colnames(diamonds) #Nome das colunas

library(tidyverse)
mutate(diamonds, carat_2=carat*100) #Nova coluna
glimpse(diamonds)

#Criando um tibble
as_tibble(diamonds) #Retorna as 10 primeiras linhas. 

#Importação de dados
data()
data("mtcars")

readr_example()
read_csv(readr_example("mtcars.csv"))


#LIMPEZA DE DADOS
#Bibliotecas para limpeza de dados
install.packages("here")
library(here)
install.packages("skimr")
library(skimr)
install.packages("janitor")
library(janitor)
library(dplyr)

#Carregando os dados 
library(palmerpenguins)
skim_without_charts(penguins) #Sumario completo dos dados
glimpse(penguins) #Ideia muito rápida sobre o que há no conjunto de dados
head(penguins)

#Usando pipe para selecionar as colunas 
penguins %>% 
  select(-species) #Todas menos especies

penguins %>% 
  rename(islands_new=island) #Mudando o nome da coluna

rename_with(penguins, toupper) #Colocando o nome das colunas em maiusculo
rename_with(penguins, tolower) #Colocando o nome das colunas em minusculo

clean_names(penguins) #Garente que só tenha caracteres, numeros e underline nos nomes

penguins %>%  arrange(bill_length_mm) #Organizando os dados pelo comprimento dos bicos
penguins %>%  arrange(-bill_length_mm) #Em ordem decrescente

penguins2 <- penguins %>%  arrange(-bill_length_mm)
View(penguins2)

penguins %>%  group_by(island) %>%  drop_na() %>%  summarise(mean_bill_length_mm = mean(bill_length_mm))
#Obtendo uma estrutura de dados com as três ilhas e o comprimento médio do bico dos pinguins que vivem nelas

penguins %>%  group_by(island) %>%  drop_na() %>%  summarise(max_bill_length_mm = max(bill_length_mm))
#Obtendo uma estrutura de dados com as três ilhas e o comprimento maximo do bico dos pinguins que vivem nelas

penguins %>%  group_by(species, island) %>%  drop_na() %>%  summarise(max_bl = max(bill_length_mm), mean_bl = mean(bill_length_mm))
#Agrupando as especies, ilhas, a media dos picos o o tamanho maximo. 

penguins %>%  filter(species == "Adelie") #Dataframe que só contem dados dos pinguins em Adelie


#Transformando dados

id <- c(1:5)
name <- c("Paulo José", "João Paulo", "Pedro Henrique", "Cristiano Araujo", "Kennedy Anderson")
job_title <- c("Medico", "Engenheiro", "Biologo", "Quimico", "Biomedico")

employee <- data.frame(id, name, job_title)

separate(employee, name, into=c("fist_name", "last_name", sep = " ")) #Separa em colunas

unite(employee, "profile", id, job_title, sep= " ") #Combina as colunas

#Adicionando uma coluna 
penguins %>% 
  mutate(body_mass_kg = body_mass_g/1000, flipper_length_m = flipper_length_mm/1000) #Adicionando uma coluna com o peso em KG

penguins %>%
  arrange(bill_length_mm)


#Mesmos dados, diferentes outcomes
install.packages("Tmisc")
library(Tmisc)
data("quartet")
View(quartet)

quartet %>% 
  group_by(set) %>% 
  summarise(mean(x), sd(x), mean(y), sd(y), cor(x,y)) #Media, Desvio padrão e Correlação

#Grafico para entender os dados
ggplot(quartet, aes(x,y)) + geom_point() + geom_smooth(method = lm, se=FALSE) + facet_wrap(~set)

install.packages("datasauRus")
library(datasauRus)

ggplot(datasaurus_dozen, aes(x=x, y=y, colour=dataset))+geom_point()+theme_void()+theme(legend.position = "none") + facet_wrap(~dataset, ncol = 3) #Tipos de graficos


#Dados enviesados (finão bias)

install.packages("SimDesign")
library(SimDesign)

#Usando a dunção bias para comparar as temperaturas previstas com as temperaturas reais
actual_temp <- c(68.3, 70, 72.4, 71, 67, 70)
predicted_temp <-c(67.9, 69, 71.5, 70, 67, 69)
bias(actual_temp, predicted_temp) #As previsões parece está enviesadas paras as temperaturas mais baixas
# o que significa que elas não são precisas quanto deveriam

actual_sales <- c(150, 203, 137, 247, 116, 287)
predicted_sales <- c(200, 300, 150, 250, 150, 300)
bias(actual_sales, predicted_sales) #Muito longe de 0, Precisa rever a politica de compra de material. 


#VISUALIZANDO GRAFICOS COM GGPLOT2
library(ggplot2)
library(palmerpenguins)

data("penguins")
View(penguins)

#Grafico de relação entre a massa corporal e o comprimento da nadadeira
#Grafico de pontos (Duas variaveis quantitativas)
ggplot(data= penguins) + geom_point(mapping = aes(x = flipper_length_mm, y=body_mass_g))

#ggplot(data = penguins):Em ggplot2, um gráfico é iniciado com a função ggplot(). Ela cria 
#um sistema de coordenadas ao qual é possível acrescentar camadas. O primeiro argumento da 
#função ggplot() é o conjunto de dados a ser usado no gráfico. Neste caso, é “penguins”.

# + Adiciona uma nova camada no grafico

#geom_point(): Em seguida, deve-se escolher um geom adicionando uma função geom.

#(mapping = aes(x = flipper_length_mm, y = body_mass_g)): Cada função geom em ggplot2 
#leva um argumento de mapeamento. Com isso, define-se como as variáveis do seu conjunto
#de dados serão mapeadas de acordo com as propriedades visuais.

#O argumento de mapeamento sempre é combinado com a função aes(). 

#Os argumentos x e y da função aes() especificam quais variáveis devem ser mapeadas no 
#eixo X e no eixo Y do sistema de coordenadas

#MODELO ALTERNATIVO DO CODIGO
#Gráfico de dispersão
ggplot(data = penguins, mapping = aes(x = flipper_length_mm, y = body_mass_g)) + geom_point()
#Gráfico de barra
ggplot(data=penguins, mapping = aes(x = island)) + geom_bar()


#COMO APRIMORAR A VISUALIZAÇÃO EM R
#Acrecentando cor, shape tamanho no grafico de acordo com a especie 
ggplot(data= penguins) + geom_point(mapping = aes(x = flipper_length_mm, y=body_mass_g, color = species, shape=species, size=species))

#Estetica alpha: Boa opção quando o grafico é denso com muitos pontos
ggplot(data= penguins) + geom_point(mapping = aes(x = flipper_length_mm, y=body_mass_g, alpha = species, shape = species))

#Mudando a cor somente 
ggplot(data= penguins) + geom_point(mapping = aes(x = flipper_length_mm, y=body_mass_g,), color = "purple")


#FAÇA MAIS COM ggplot
#Mostra tendência geral dos dados
ggplot(data=penguins) + geom_smooth(mapping = aes(x = flipper_length_mm, y=body_mass_g,), color = "blue")

#Combinando os dados
ggplot(data=penguins) + geom_smooth(mapping = aes(x = flipper_length_mm, y=body_mass_g, linetype=species), color = "blue") +
geom_point(mapping = aes(x = flipper_length_mm, y=body_mass_g,), color = "purple")

#Coloca ruidos para os pontos não se sobreporem
ggplot(data=penguins) + geom_jitter(mapping = aes(x = flipper_length_mm, y=body_mass_g,), color = "blue")

#Grafico de barra
ggplot(data=diamonds)+
  geom_bar(mapping = aes(x=cut, fill = cut)) #fill no lugar de color, preenche a cor das barras por completo

ggplot(data=diamonds)+
  geom_bar(mapping = aes(x=cut, fill = clarity)) #clarity = transparencia. O grafico mostra 40 diferentes combinações de corte e transparência

#Suavização
ggplot(data=penguins) + geom_smooth(mapping = aes(x = flipper_length_mm, y=body_mass_g, mothod = "loess"), color = "blue") +
  geom_point(mapping = aes(x = flipper_length_mm, y=body_mass_g,), color = "purple")


#FACETAS
#O ggplot2 tem duas funções de facetas:
#facet_wrap, facet_grid()

#Para criar facetas no grafico com uma unica variavel use = facet_wrap
ggplot(data=penguins) + geom_point(mapping = aes(x = flipper_length_mm, y=body_mass_g, color = species)) +  facet_wrap(~species)


ggplot(data=diamonds)+
  geom_bar(mapping = aes(x=color, fill = cut)) + facet_wrap(~cut)

#facet_grid cria para duas variaveis
ggplot(data=penguins) + geom_point(mapping = aes(x = flipper_length_mm, y=body_mass_g, color = species)) +  facet_grid(sex~species)


#Exemplo de filtragem de dados para criação de gráficos
library(dplyr)
data %>%
  filter(variable1 == "DS") %>%  
  ggplot(aes(x = weight, y = variable2, colour = variable1)) +  
  geom_point(alpha = 0.3,  position = position_jitter()) + stat_smooth(method = "lm")

#VIsualização de dados
#Para adicionar um título ao gráfico, use uma função de rótulo: title = Avaliação média do produto.
#Para destacar produtos de baixo desempenho, use uma função estética: col = ifelse (x<2, 'blue', 'yellow').
#Para criar as barras no gráfico, use uma função geom: geom_bar ().

#Para criar uma linha de tendência, use uma função geom: geom_smooth ().
#Para criar o gráfico de dispersão, use uma função geom: geom_point ().

#Para rotular os eixos, use uma função estética: aes (x = Preço médio (USD), y = Produto)
#Para comparar tendências de dados em classificações médias, use uma função de facetas: facet_wrap (~Avaliação média)

#CAMADA DE ANOTAÇÃO
ggplot(data=penguins) + geom_point(mapping = aes(x = flipper_length_mm, y=body_mass_g, color = species)) +  labs(title = "Palmer Penguins: Body Mass x Flipper length", subtitle =  "Sample of Tree Penguins Species", caption =  "Data collected by Dr. Kristen Gorman")

ggplot(data=penguins) + geom_point(mapping = aes(x = flipper_length_mm, y=body_mass_g, color = species)) +  labs(title = "Palmer Penguins: Body Mass x Flipper length", subtitle =  "Sample of Tree Penguins Species", caption =  "Data collected by Dr. Kristen Gorman") +
  annotate("text", x=220, y=3500, label = "The Gentoos are the largest", color = "blue", fontface = "bold", size = 4.0, angle = 35)

#Salvando o grafico
#ggsave() salva o ultimo grafico gerado 
ggsave("3_ESPECIES_PINGUINS.png")

ggplot(data = diamonds) +
  geom_bar(mapping = aes(x = color, fill = cut)) + facet_wrap(~color)


# --- USANDO O R MARKDOWN
install.packages("rmarkdown")

#Com o relatório HTML mostrado ao lado do arquivo .RMD, observe que os títulos no 
#relatório são criados quando você inclui uma ou mais hashtags (#) antes do texto do 
#título, como ## Incluindo gráficos. Quanto mais hashtags forem usadas, menor será a 
#fonte do título. # Incluindo gráficos cria um cabeçalho estilo Cabeçalho 1 enquanto ## Incluindo gráficos cria um cabeçalho estilo Cabeçalho 2.

#Para adicionar marcadores basta colocar um *
#Para colocar um link use isso: [link](http://rmarkdown.rstudio.com), util para url longos que não queira mostrar
#Para adicionar imagem ![legenda da imagem](url da imagem)

col(penguins)
?rename()
