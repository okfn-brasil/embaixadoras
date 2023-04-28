**Pessoas Embaixadoras de Inovação Cívica**

*Frente de Análise de Dados  - 25/07/2020*
  
Presentes: Ariane Alves, Beatriz Milz, Bernardo Baron, Douglas Rodrigues, Eduardo Batista, Juliany Raiol, Lucas Pavanelli, Marcus Vinicius, Mario Ruttman, Paulo Veras, Pedro Lucas, Rennata Martins, Robson Junqueira, Rosângela Lofti, Thays Lavor, Willian Rochadel

  

Teto da reunião: 17h30

  

Pontos de partida: base de dados do DATASUS ([Drive](https://drive.google.com/drive/folders/1pfdjvcMqjHTjcKOH_jtqxGaBLYYEavdk) e [Github](https://github.com/Rosangelafl/embaixadoras_inovacao_SUS) - Rosângela) e [base da avaliação](https://docs.google.com/spreadsheets/d/18z8H9sR13HDQ007kCKJRJ_Y9gNCacjHRPW9j28aRlUk/edit#gid=1026035751) do Índice de Transparência da Covid-19 para os estados (v. 1.0)

  

Bernardo Baron - experiência no Laboratório de Inovação do MPRJ trabalhando com dados da gestão hospitalar em meio à crise

  

Beatriz Milz - [Meetup R-Ladies RJ](https://www.youtube.com/watch?v=4nfIbiS1Huw&feature=youtu.be&t=2427) - uso do pacote [coronabr](https://github.com/liibre/coronabr)

  

Tópicos previstos:

-   bases
    
-   referências de análises (R e Python)
    
-   reunião com Rodrigo Silva
    
-   repositório no Github da OKBr
    
-   fluxo de trabalho (subtemas?)
    
-   plataforma de comunicação - Trello, Telegram, Grupo de emails…  

_____________________________________________________________

  

Rosângela apresenta a base do DATASUS

-   Documentação - CNES - Informe técnico
    
-   1ª pergunta: o que vamos querer descobrir? Considerar o atraso de 1 a dois meses para os microdados serem postados no sistema
    
-   bases: SIH e SIA - analisar número de pessoas internadas
    
-   Outras perguntas: pacientes com plano de saúde atendidos no SUS, quantos profissionais trabalham no SUS, carga horária dos profissionais
    
-   Análise dos leitos (tipo, especialidade, quantidade)
    
-   Questão das inconsistências nas bases
    
-   Importante elaborar perguntas bem formuladas para a orientar a filtragem dos dados na análise   

  

Eduardo Batista trabalha na atualização do CNES

-   Nos últimos meses, o CNES passou por atualizações; importante considerar
    

  

Bernardo Baron

-   Projeto Bússola - Inova-MPRJ
    
-   Objetivo: melhorar o fluxo de pedido de requisições do MP aos gestores
    
-   [IESP - Instituto de Estudos de Políticas de Saúde](https://ieps.org.br/pesquisa/notas-tecnicas/) (fonte a ser consultada antes de iniciar as análises)
    
-   Processo de priorização no projeto - análise das denúncias (tipo de fonte, natureza da denúncia), 19 indicadores; distribuição de dois formulários (valor/custo - 11 respostas cada) com os indicadores para profissionais/especialistas envolvidos
    
-   questão do acesso em tempo real ao sistema de cada hospital - dificuldade de realizar devido à quantidade de hospitais e diferença entre os sistemas
    
-   Priorização: leitos e regulação, registros sobre a Covid-19 (freq. testes, equipamentos/demanda), equipamentos hospitalares, insumos e medicamentos, jornada de trabalho, recursos humanos
    

-   Insight: leitos bloqueados por falta de enfermeiros/técnicos de enfermagem
    

- eSUS VE, SIVEP Gripe, [OpenDataSUS](https://opendatasus.saude.gov.br/dataset)

  

Beatriz Milz

-   pacote R: [microdatasus](https://github.com/rfsaldanha/microdatasus)
    
-   Referência: [Obtendo os dados de mortalidade no DataSUS](https://datathon-rladies-sp-2020.netlify.app/datasus.html)
    

  

Bernardo

-   [tabela com os endereços dos sistemas relevantes do sus](https://onedrive.live.com/view.aspx?resid=1FC35A05916515C6!610&ithint=file%2cdocx&authkey=!AHJxPx3a6SrbhPM)
    

-   Sugestão de fluxo - pergunta: qual é a disponibilidade de profissionais para lidar com a demanda (profissionais por leito, internações)? Óbitos
    

  

Frente de testagem - eSUS VE

-   Tipos de teste - SIVEP
    
-   abertura de dados do [GALL](http://gal.datasus.gov.br/GALL/index.php?area=01) - registro do fluxo de testes dos laboratórios dos estados   
  

**Encaminhamentos:**

-   Criar repositório para armazenar as bases
    
-   Vamos analisar os dados de testagem
    
-   Próxima reunião - próximo a 22/08
