################################# Autor: Mário Rutman #########################################
###############################################################################################
###############################################################################################
# Neste trabalho usarei como métrica para comparar os estados e regiõs o número de mortes por#
# 100.000 habitantes.                                                                        ##
###############################################################################################
###############################################################################################

# A base de dados foi retirada de 
# 'https://covid.saude.gov.br/' e de 'https://www.ibge.gov.br/cidades-e-estados' 

library(tidyverse)

# Importando os arquivos.
library(readxl)
covid_gov_19_ago_2020 <- read_excel("dados/HIST_PAINEL_COVIDBR_19ago2020.xlsx")
IBGE_estados <- read_excel("dados/IBGE_estados.xlsx")

# Salvando os arquivos em rds.
write_rds(covid_gov_19_ago_2020, "covid_gov_19_ago_2020.rds")
write_rds(IBGE_estados, "IBGE_estados.rds")

# Limpando os dados para fazer comparativo entre os estado por região.
estados_covid <- covid_gov_19_ago_2020 %>%
  # Tirando Brasil de região.
  filter(regiao != "Brasil") %>%
  #Selecionando as colunas necessárias agora.
  select(c("regiao", "estado", "coduf", "obitosAcumulado")) %>%
  #Transformando coduf em número. 
  mutate(coduf = as.numeric(coduf)) %>%
  # Agrupando por região para depois somar óbitos.
  group_by(regiao, estado, coduf) %>%
  #Agrupando para totalizar óbitos por região.
  summarise(obitos = max(obitosAcumulado)) %>%
  #Sempre desagrupar!
  ungroup() %>% 
  #Juntando com a tabela do IBGE. 
  inner_join(IBGE_estados, by = "coduf") %>% 
  #Cria coluna de número de mortos por 100.000 habitantes.
  mutate(obitos_por_cem_mil_habit = round(obitos * 100000/pop_2019, 1))

# Criando as linhas horizontais de cada gráfico por região.
linha_regiao <- estados_covid %>% 
  group_by(regiao)%>% 
  summarise(linha_horiz = round(sum(obitos * 100000)/sum(pop_2019), 1)) %>% 
  ungroup()

# Juntando os dataframes do covid.gov com os do IBGE e tirando colunas desnecessárias agora.
estados_covid <- estados_covid %>%
  # Juntando os dataframes.
  inner_join(linha_regiao, by = "regiao") %>%
  # Selecionado as colunas que serão usadas.
  select(c("regiao", "estado", "UF", "obitos_por_cem_mil_habit", "linha_horiz"))

# Fazendo a função para fazer os gráficos de cada região.
  graf_regiao <- function(reg) {
    estados_covid %>% 
    filter(regiao == reg) %>% 
      mutate(estado = fct_reorder(estado, obitos_por_cem_mil_habit)) %>%
      ggplot(aes(x = estado, y = obitos_por_cem_mil_habit)) +
      geom_col(fill = "gold", color = "white", size = 0.8) +
      geom_text(aes(label = obitos_por_cem_mil_habit), vjust=-0.3, hjust=0.5, color="grey17", size = 4.2) +
      geom_hline(aes(yintercept=linha_horiz), size = 1, color = "grey75", linetype = "dashed") +
      #geom_text(aes(1.5, linha_horiz, label="média da região", vjust=-0.5)) +
      ylim(0, 110) +
        labs(title = reg) +
        theme_bw() + 
        theme(axis.title.x = element_blank(),
              axis.title.y = element_blank(),
              axis.text.x = element_text(size = 12, colour = "black"),
              axis.text.y = element_blank(),
              panel.grid.major.x = element_blank(),
              strip.text = element_text(face="bold", size=15),
              plot.title = element_text(size = 20))
  }
  
  
  # Dando nome aos gráficos de cada região.
  norte <- graf_regiao('Norte')
  centroeste <- graf_regiao('Centro-Oeste')
  sul <- graf_regiao('Sul')
  sudeste <- graf_regiao('Sudeste')
  nordeste <- graf_regiao('Nordeste')
  
# # Aplicando a função usando map do purrr package.
#   library(purrr)  
#   x <- c("Norte", "Centro-Oeste", "Sul", "Sudeste", "Nordeste")
#   map(x, graf_regiao)

  # Dispondo os gráficos numa página usando o pacote patchwork.
  library(patchwork)
  (sul|centroeste|sudeste)/(nordeste|norte) + 
    plot_annotation(
    title = 'Óbitos por 100.000 habitantes.',
    subtitle = 'A linha pontilhada indica a média por região.',
    caption = 'fonte: https://covid.saude.gov.br/ e https://www.ibge.gov.br/cidades-e-estados',
    theme = theme(plot.title = element_text(size = 26),
                  plot.subtitle = element_text(size = 12),
                  plot.caption = element_text(size = 14)))
  
