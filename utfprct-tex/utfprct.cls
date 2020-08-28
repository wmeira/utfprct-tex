%% UTFPRCT-TEX, v1.0.1 wmeira on 2020/06/06
%% Copyright (C) 2020- by William H. T. Meira
%%
%% Modified version of project 'utfprpgtex' maintained
%% by Luiz E. M. Lima
%%
%% This work may be distributed and/or modified under the
%% conditions of the LaTeX Project Public License, either version 1.3
%% of this license or (at your option) any later version.
%% The latest version of this license is in
%%   http://www.latex-project.org/lppl.txt
%% and version 1.3 or later is part of all distributions of LaTeX
%% version 2005/12/01 or later.
%%
%% This work has the LPPL maintenance status `maintained'.
%%
%% The Current Maintainer of this work is William H. T. Meira.
%%
%% This project consists mainly of files: 'utfprct.cls', 'utfprct.tex',
%% 'utfprct-dados.tex'
%%
%% The 'abntex2-alf.bst' and 'abntex2-num.bst' files are slightly
%% modified versions of the bibtex styles from abntex2 (v.1.9.7)
%% package to suit NBR6023/2018 (not yet implemented there). 
%% Complementary, 'abntex2-alf-en.bst' and 'abntex2-num-en.bst' are
%% english versions of the respective bibtex styles.
%%
%% Contribute to improve this project (github repo):
%% https://github.com/wmeira/utfprct-tex
%%


%% Identificação e modificações
\NeedsTeXFormat{LaTeX2e}[2005/12/01]
\ProvidesClass{utfprct}[2020/08/27 v1.0.3]


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Classe e Opções
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%% -- Opções da classe abntex2
\RequirePackage{color}%% Controle de cores em documentos LaTeX
\RequirePackage{substr}%% Controle de substrings em strings
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{abntex2}}%% Envio das opções atuais para a classe abntex2
%% -- Opções da classe utfprct
%%    -- Impressão dos elementos pré-textuais
\newif\if@pretexttwoside%% Condicional para impressão dos elementos pré-textuais
\DeclareOption{pretextualoneside}{\typeout{-----> Option: pretextualoneside}\@pretexttwosidefalse}%% Anverso
\DeclareOption{pretextualtwoside}{\typeout{-----> Option: pretextualtwoside}\@pretexttwosidetrue}%% Anverso e verso
%%    -- Fonte do texto
\gdef\@tipodefonte{lmodern} % Computer modern roman (default)
\DeclareOption{fontemodern}{\typeout{-----> Option: fontemodern}\gdef\@tipodefonte{lmodern}}%% Computer modern roman (default)
\DeclareOption{fontetimes}{\typeout{-----> Option: fontetimes}\gdef\@tipodefonte{times}}%% Times
\DeclareOption{fontearial}{\typeout{-----> Option: fontearial}\gdef\@tipodefonte{arial}}%% Helvetica (closest to Arial)
\DeclareOption{fontecourier}{\typeout{-----> Option: fontecourier}\gdef\@tipodefonte{courier}}%% Courier
%%    -- Cores nos vínculos (padrões: citecolor = green, filecolor = cyan, linkcolor = red, urlcolor = magenta)
\definecolor{bblue}{rgb}{0, 0, 0.25}%% Definição do azul escuro (modificado)
\definecolor{gray}{rgb}{0.5, 0.5, 0.5}%% Definição do cinza (modificado)
\def\@cordosvinculos{black}%% Preto (NBR 14724/2011: cor preta)
\DeclareOption{vinculoscoloridos}{\typeout{-----> Option: vinculoscoloridos}\def\@cordosvinculos{bblue}}%% Azul escuro
\def\@citecolor{\@cordosvinculos}%% Cor das citações
\def\@filecolor{\@cordosvinculos}%% Cor dos arquivos
\def\@linkcolor{\@cordosvinculos}%% Cor dos links
\def\@urlcolor{\@cordosvinculos}%% Cor das urls
%%    -- Remoção do recuo dos itens no sumário
\newif\if@semrecuonosumario%% Condicional para remoção do recuo dos itens no sumário
\@semrecuonosumariofalse%% Remove
\DeclareOption{semrecuonosumario}{\typeout{-----> Option: semrecuonosumario}\@semrecuonosumariotrue}%% Adiciona
\newif\if@inserirbackref%% Condicional para inserir backref na lista de referencias (Citado na página...)
\@inserirbackreffalse%% Nao inseri (default)
\DeclareOption{inserirbackref}{\typeout{-----> Option: inserirbackref}\@inserirbackreftrue}%% inseri backref nas ref.
%%    -- Compilação de glossários e índices utilizando makeindex
\newif\if@usemakeindex%% Condicional para compilação de glossários e índices utilizando makeindex
\@usemakeindexfalse%% Desabilita
\DeclareOption{usemakeindex}{\typeout{-----> Option: usemakeindex}\@usemakeindextrue}%% Habilita
%%    -- Alinhamento das legendas
\newif\if@legendascentralizadas%% Condicional para o alinhamento das legendas
\@legendascentralizadasfalse%% À esquerda
\DeclareOption{legendascentralizadas}{\typeout{-----> Option: legendascentralizadas}\@legendascentralizadastrue}%% Centralizado
%%    -- Folha de aprovação do programa de pós-graduação
\newif\if@aprovacaoestiloppg%% Condicional para a folha de aprovação do programa de pós-graduação
\@aprovacaoestiloppgfalse%% Estilo padrão
\DeclareOption{aprovacaoestiloppg}{\typeout{-----> Option: aprovacaoestiloppg}\@aprovacaoestiloppgtrue}%% Estilo do PPG
%%    -- Assinaturas na folha de aprovação
\newif\if@pardeassinaturas%% Condicional para as assinaturas na folha de aprovação
\@pardeassinaturasfalse%% Em uma única coluna
\DeclareOption{pardeassinaturas}{\typeout{-----> Option: pardeassinaturas}\@pardeassinaturastrue}%% Em até duas colunas
%%    -- Linhas de assinaturas na folha de aprovação
\newif\if@linhasdeassinaturas%% Condicional para as linhas de assinaturas na folha de aprovação
\@linhasdeassinaturasfalse%% Remove as linhas
\DeclareOption{linhasdeassinaturas}{\typeout{-----> Option: linhasdeassinaturas}\@linhasdeassinaturastrue}%% Adiciona as linhas
\ProcessOptions\relax%% Processamento das opções
\LoadClass{abntex2}%% Carregamento da classe abntex2


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Pacotes carregados
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\RequirePackage{silence}
% Supress warning: captions config. via caption package interface instead the memoir class
\WarningFilter{memoir}{For the caption package}

\RequirePackage[utf8]{inputenc}%% Codificações de entrada: unix - latin1/utf8; windows - ansinew; Mac - applemax; DOS-OS/2 - cp850
\ifpdf%% Compilação com pdflatex
  \RequirePackage{cmap}%% Busca e cópia em arquivos PDF
  \RequirePackage{ae}%% Fontes virtuais para codificação de fontes T1
  \RequirePackage[pdftex]{graphics}%% Padrão gráfico de figuras
  \RequirePackage[pdftex]{graphicx}%% Aperfeiçoamentos do padrão gráfico de figuras
\else%% Compilação com latex
  \RequirePackage[T1]{fontenc}%% Codificação de fontes T1
  \RequirePackage{epic, eepic}%% Aperfeiçoamentos e extensões do ambiente figure
  \RequirePackage[dvips]{epsfig}%% Emulação de figuras (e)ps
  \RequirePackage[dvips]{graphics}%% Padrão gráfico de figuras
  \RequirePackage[dvips]{graphicx}%% Aperfeiçoamentos do padrão gráfico de figuras
\fi
\RequirePackage{fix-cm}%% Fontes "Computer Modern" em tamanhos arbitrários
\RequirePackage{hyphenat}%% Hifenização de palavras

%% Configurações do pacote backref
\if@inserirbackref%% Inserir backref na lista de referencias
\ifthenelse{\equal{\languagename}{english}}
{%% english
\RequirePackage[english, hyperpageref]{backref}%% Páginas das citações nas referências
\renewcommand{\backrefpagesname}{Cited on page(s):~}%% Comando usado sem a opção hyperpageref do pacote backref
\renewcommand{\backref}{}%% Texto padrão antes do número das páginas
\renewcommand*{\backrefalt}[4]{%% Definição dos textos da citação
  \ifcase #1%%
    No citation in the text.%%
  \or%%
    Cited on page #2.%%
  \else%%
    Cited #1 times on pages #2.%%
  \fi
}
}{%% portugues (default)
\RequirePackage[brazilian, hyperpageref]{backref}%% Páginas das citações nas referências
\renewcommand{\backrefpagesname}{Citado na(s) página(s):~}%% Comando usado sem a opção hyperpageref do pacote backref
\renewcommand{\backref}{}%% Texto padrão antes do número das páginas
\renewcommand*{\backrefalt}[4]{%% Definição dos textos da citação
  \ifcase #1%%
    Nenhuma citação no texto.%%
  \or%%
    Citado na página #2.%%
  \else%%
    Citado #1 vezes nas páginas #2.%%
  \fi
}
}
\fi

%NBR6023/2018: alinhado para esquerda (package default: bibleftalign)
%Numérico é possível na ABNT (usar num), mas não é o preferível e mais comum
\RequirePackage[alf, bibleftalign]{abntex2cite}%% Citações padrão ABNT (autor-data)

%Bibliografia em estilo inglês
\ifthenelse{\equal{\languagename}{english}}{%
	\bibliographystyle{abntex2-alf-en}
}{}%

\ifpdf%% Compilação com pdflatex
\else%% Compilação com latex
  \@ifpackageloaded{breakurl}%% Verificação do pacote breakurl
    {\PassOptionsToPackage{hyphenbreaks}{breakurl}}{\RequirePackage[hyphenbreaks]{breakurl}}%% Quebra de linha em endereços da web
\fi
% \RequirePackage[showframe]{geometry}
\RequirePackage{geometry}
\RequirePackage{lastpage}%% Referência da última página
\RequirePackage{algorithmic}%% Ferramenta para tipografar um algoritmo em pseudocódigo
%\RequirePackage{algorithmicx}%% Ferramenta para tipografar um algoritmo em pseudocódigo (optional)
%\RequirePackage{algpseudocode}%% Ferramenta para tipografar um algoritmo em pseudocódigo (optional)
\RequirePackage[acronym, nosuper, nowarn, sanitize={description=false}, style=index]{glossaries}%% Glossários e listas de acrônimos
\RequirePackage{nomencl}%% Listas de símbolos como uma nomenclatura
\RequirePackage{amsmath}%% Ferramentas para linguagem matemática
\RequirePackage{sistyle}%% Unidades, números e ângulos no SI
\RequirePackage{caption}%% Configuração das legendas de objetos flutuantes
\RequirePackage{xtab}%% Tabelas em múltiplas páginas
\RequirePackage{etoolbox}%% Caixa de ferramentas para programadores LaTeX usando e-TEX
\RequirePackage{indentfirst}%% Recuo do primeiro parágrafo após cabeçalho da seção
\RequirePackage{morewrites}%% Espaços adicionais para comandos \write*
\RequirePackage{pdfpages}%% Inclusão de PDF com múltiplas páginas

%% Logo UTFPRPGTeX
\newcommand{\utfprpgtex}{UTF\kern-0.75ex\lower0.4ex\hbox{\tiny PR}\kern-0.9ex\lower-0.585ex\hbox{\tiny PG}\kern-0.1ex\TeX}

%% Logo UTFPRCTTeX
\newcommand{\utfprcttex}{UTF\kern-0.75ex\lower0.4ex\hbox{\tiny PR}\kern-0.9ex\lower-0.585ex\hbox{\tiny CT}\kern-0.1ex\TeX}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Configurações do pacote hyperref
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\hypersetup{%% Opções do pacote hyperref
  breaklinks=true,%%
  colorlinks=true,%%
  citecolor=\@cordosvinculos,%%
  filecolor=\@cordosvinculos,%%
  linkcolor=\@cordosvinculos,%%
  urlcolor=\@cordosvinculos,%%
  bookmarksopen=true,%%
  bookmarksnumbered=true,%%
  pdfdisplaydoctitle=true,%%
  pdfpagelayout=SinglePage%%
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Configurações do pacote abntex2cite
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\AtBeginDocument{%% Definições carregadas no início do documento
  \citeoption{abnt-emphasize=bf}
  \citeoption{abnt-etal-cite=2}%número de autores max para nao usar et al
  \citeoption{abnt-etal-list=0}%nao usar et al. nas ref.
  \citeoption{abnt-full-initials=yes}
  \citeoption{abnt-thesis-year=both}
  \citeoption{abnt-url-package=url}
  
  %NBR6023/2018: sem traço sublinear quando referências (mesmos autores) forem repetidos (yes para colocar)
  \citeoption{abnt-repeated-title-omit=no}

  %NBR6023/2018: URLs nao devem ter "<" and ">" (altera o comando do abntex2cite.sty)
  \renewcommand\UrlLeft{}%antes era "<"
  \renewcommand\UrlRight{}%antes era ">"
}

%%%%%%%%
%% Para alterar o idioma do documento para o INGLÊS: 
%1) Colocar o "english" como último idioma carregado no documentclass (o último será o principal do documento. Adicionalmente, pode-se selecionar o english como língua principal.
%\selectlanguage{english}%descomentar para ingles

%2) Usar o abntex2-alf-en ou abntex2-num-en ao invés do default em pt-br do abntex2.
%
%%%%%%%%



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Variáveis dependentes do idioma
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\ifthenelse{\equal{\languagename}{english}}
{%% Definição do idioma INGLES
  \AtBeginDocument{
    \newcommand{\nomecapa}{Cover}
    \newcommand{\nomefolhaderosto}{Title Page}
    \newcommand{\nomefichacatalografica}{Index Card}
    \newcommand{\nomeerrata}{Errata}%Errata Sheet / Erratum
    \newcommand{\nomefolhadeaprovacao}{Approval Term}
    % \newcommand{\nomededicatoria}{Dedicatory}
    \renewcommand{\agradecimentosname}{Acknowledgements}
    % \newcommand{\nomeepigrafe}{Epigraphy}
    \newcommand{\nomeresumo}{Resumo}
    \newcommand{\nomepalavraschave}{Palavras-chave}
    \newcommand{\nomeabstract}{Abstract}
    \newcommand{\nomekeywords}{Keywords}
    \newcommand{\listalgorithmname}{List of Algorithms}
    \newcommand{\algorithmname}{Algorithm}
    \renewcommand{\listfigurename}{List of Figures}
    % \renewcommand{\figurename}{Figure}
    \newcommand{\photographname}{Photograph}
    \newcommand{\graphname}{Graph}
    \newcommand{\tabframedname}{Frame}
    \renewcommand{\listtablename}{List of Tables}
    % \renewcommand{\tablename}{Table}
    \newcommand{\nomefonte}{Source}
    \renewcommand{\nomname}{Nomenclature}
    \newcommand{\nomelistadeacronimos}{List of Acronyms}
    \newcommand{\nomeabreviaturas}{Abbreviations}
    \newcommand{\nomesiglas}{Initialism} %Initialism 
    \newcommand{\nomeacronimos}{Acronyms}
    \newcommand{\nomelistadesimbolos}{List of Symbols}
    \newcommand{\nomeletraslatinas}{Latin Letters}
    \newcommand{\nomeletrasgregas}{Greek Letters}
    \newcommand{\nomesobrescritos}{Superscripts}
    \newcommand{\nomesubscritos}{Subscripts}
    \newcommand{\nomenotacoes}{Notations}
    \newcommand{\nomeindicessets}{Indices and Sets}
    \newcommand{\nomeparam}{Parameters}
    \newcommand{\nomefloatvar}{Continuos Variables}
    \newcommand{\nomeintvar}{Integer Variables}
    \newcommand{\nomebinvar}{Binary Variables}
    
    % abntex2
    % \renewcommand{\contentsname}{Summary}
    \renewcommand{\chapterautorefname}{Chapter}
    \renewcommand{\sectionautorefname}{Section}
    \renewcommand{\subsectionautorefname}{Subsection}
    \renewcommand{\subsubsectionautorefname}{Subsection}
    \renewcommand{\paragraphautorefname}{\subsubsectionautorefname}
    \renewcommand{\bibname}{References}
    \renewcommand{\refname}{\bibname}
    \renewcommand{\appendixname}{Appendix}
    \newcommand{\apendiceautorefname}{Appendix}
    \renewcommand{\anexosname}{Annex}
    \newcommand{\anexoautorefname}{Annex}
    \renewcommand{\indexname}{Index}
  }
}{%Definição do idioma em Português (DEFAULT)
  \AtBeginDocument{%% Definições carregadas no início do documento
    \newcommand{\nomecapa}{Capa}
    \newcommand{\nomefolhaderosto}{Folha de Rosto}
    \newcommand{\nomefichacatalografica}{Ficha Catalográfica}
    \newcommand{\nomeerrata}{Errata}
    \newcommand{\nomefolhadeaprovacao}{Folha de Aprovação}
    % \newcommand{\nomededicatoria}{Dedicatória}
    \renewcommand{\agradecimentosname}{Agradecimentos}
    % \newcommand{\nomeepigrafe}{Epígrafe}
    \newcommand{\nomeresumo}{Resumo}
    \newcommand{\nomepalavraschave}{Palavras-chave}
    \newcommand{\nomeabstract}{Abstract}
    \newcommand{\nomekeywords}{Keywords}
    \newcommand{\listalgorithmname}{Lista de Algoritmos}
    \newcommand{\algorithmname}{Algoritmo}
    \renewcommand{\listfigurename}{Lista de Ilustrações}
    % \renewcommand{\figurename}{Figura}
    \newcommand{\photographname}{Fotografia}
    \newcommand{\graphname}{Gráfico}
    \newcommand{\tabframedname}{Quadro}
    \renewcommand{\listtablename}{Lista de Tabelas}
    % \renewcommand{\tablename}{Tabela}
    \newcommand{\nomefonte}{Fonte}
    % \renewcommand{\nomname}{Nomenclatura}
    \newcommand{\nomelistadeacronimos}{Lista de Abreviaturas, Siglas e Acrônimos}
    \newcommand{\nomeabreviaturas}{Abreviaturas}
    \newcommand{\nomesiglas}{Siglas}
    \newcommand{\nomeacronimos}{Acrônimos}
    \newcommand{\nomelistadesimbolos}{Lista de Símbolos}
    \newcommand{\nomeletraslatinas}{Letras Latinas}
    \newcommand{\nomeletrasgregas}{Letras Gregas}
    \newcommand{\nomesobrescritos}{Sobrescritos}
    \newcommand{\nomesubscritos}{Subscritos}
    \newcommand{\nomenotacoes}{Notações}
    \newcommand{\nomeindicessets}{Índices e Conjuntos}
    \newcommand{\nomeparam}{Parâmetros}
    \newcommand{\nomefloatvar}{Variáveis Contínuas}
    \newcommand{\nomeintvar}{Variáveis Inteiras}
    \newcommand{\nomebinvar}{Variáveis Binárias}
    
    % abntex2
    % \renewcommand{\contentsname}{Sumário}
    % \renewcommand{\chapterautorefname}{Capítulo}
    % \renewcommand{\sectionautorefname}{Seção}
    % \renewcommand{\subsectionautorefname}{Subseção}
    % \renewcommand{\subsubsectionautorefname}{Subseção}
    \renewcommand{\paragraphautorefname}{\subsubsectionautorefname}
    \renewcommand{\bibname}{Referências}
    \renewcommand{\refname}{\bibname}
    \renewcommand{\appendixname}{Apêndice}
    \newcommand{\apendiceautorefname}{Apêndice}
    \renewcommand{\anexosname}{Anexo}
    \newcommand{\anexoautorefname}{Anexo}
    \renewcommand{\indexname}{Índice Remissivo}
    
    %algorithmicx
    \renewcommand{\algorithmicrequire}{\textbf{requer}}
    \renewcommand{\algorithmicensure}{\textbf{inserir}}
    \renewcommand{\algorithmicend}{\textbf{finaliza}}
    \renewcommand{\algorithmicif}{\textbf{se}}
    \renewcommand{\algorithmicthen}{\textbf{então}}
    \renewcommand{\algorithmicelse}{\textbf{senão,}}
    \renewcommand{\algorithmicfor}{\textbf{para}}
    \renewcommand{\algorithmicforall}{\textbf{para todos}}
    \renewcommand{\algorithmicdo}{\textbf{faça}}
    \renewcommand{\algorithmicwhile}{\textbf{enquanto}}
    \renewcommand{\algorithmicloop}{\textbf{sequência}}
    \renewcommand{\algorithmicrepeat}{\textbf{repita}}
    \renewcommand{\algorithmicuntil}{\textbf{até}}
    \renewcommand{\algorithmicprint}{\textbf{imprime}}
    \renewcommand{\algorithmicreturn}{\textbf{retorna}}
    \renewcommand{\algorithmictrue}{\textbf{verdadeiro}}
    \renewcommand{\algorithmicfalse}{\textbf{falso}}
    
    \renewcommand{\glossaryname}{Glossário}
    \providetranslation{Glossary}{Glossário}
    \providetranslation{Acronyms}{Siglas}
    \providetranslation{Notation (glossaries)}{Notação}
    \providetranslation{Description (glossaries)}{Descrição}
    \providetranslation{Symbol (glossaries)}{Símbolo}
    \providetranslation{Page List (glossaries)}{Lista de Páginas}
    \providetranslation{Symbols (glossaries)}{Símbolos}
    \providetranslation{Numbers (glossaries)}{Números}
    \SIdecimalsign{,}%% Símbolo de decimal (pacote sistyle)
  }
}
 
\renewcommand{\folhaderostoname}{\nomefolhaderosto}
\renewcommand{\folhadeaprovacaoname}{\nomefolhadeaprovacao}
\renewcommand{\listadesiglasname}{\nomelistadeacronimos}
%\renewcommand{\listadesimbolosname}{\nomelistadesimbolos}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Informações do Documento
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Tipo de documento
\providecommand{\imprimirtipodedocumento}{Tese} %default
\newcommand{\TipoDeDocumento}[1]{\renewcommand{\imprimirtipodedocumento}{#1}}

% Document type
\providecommand{\imprimirdocumenttype}{Thesis}
\newcommand{\DocumentType}[1]{\renewcommand{\imprimirdocumenttype}{#1}}

%% Nível de formação
\providecommand{\imprimirniveldeformacao}{Doutorado}
\newcommand{\NivelDeFormacao}[1]{\renewcommand{\imprimirniveldeformacao}{#1}}

%% Formation level
\providecommand{\imprimirformationlevel}{PhD}
\newcommand{\FormationLevel}[1]{\renewcommand{\imprimirformationlevel}{#1}}

%% Título pretendido
\providecommand{\imprimirtitulopretendido}{Doutor(a)}
\newcommand{\TituloPretendido}[1]{\renewcommand{\imprimirtitulopretendido}{#1}}

%% Título do documento
\providecommand{\imprimirtitulododocumento}{Título}
\newcommand{\TituloDoDocumento}[1]
{\renewcommand{\imprimirtitulododocumento}{#1}}

%% Document title
\providecommand{\imprimirdocumenttitle}{Title}
\newcommand{\DocumentTitle}[1]{\renewcommand{\imprimirdocumenttitle}{#1}}

%% Título em multiplas linhas
\providecommand{\imprimirtituloemmultiplaslinhas}{Título: \par Subtítulo}
\newcommand{\TituloEmMultiplasLinhas}[1]{\renewcommand{\imprimirtituloemmultiplaslinhas}{#1}}

%% Dia da defesa com número de dígitos exatos (opcional)
\providecommand{\imprimirdia}{1}
\newcommand{\Dia}[1]{\renewcommand{\imprimirdia}{#1}}

%% Mês da defesa por extenso (opcional)
\providecommand{\imprimirmesporextenso}{Janeiro}
\newcommand{\MesPorExtenso}[1]{\renewcommand{\imprimirmesporextenso}{#1}}

%% Ano da defesa com quatro dígitos
\providecommand{\imprimirano}{2020}
\newcommand{\Ano}[1]{\renewcommand{\imprimirano}{#1}}

%% Número de palavras-chave (máximo 5)
\providecommand{\imprimirnumerodepalavraschave}{5}
\newcommand{\NumeroDePalavrasChave}[1]{\renewcommand{\imprimirnumerodepalavraschave}{#1}}

%% Palavra-chave A
\providecommand{\imprimirpalavrachavea}{A}
\newcommand{\PalavraChaveA}[1]{\renewcommand{\imprimirpalavrachavea}{#1}}

%% Palavra-chave B
\providecommand{\imprimirpalavrachaveb}{B}
\newcommand{\PalavraChaveB}[1]{\renewcommand{\imprimirpalavrachaveb}{#1}}

%% Palavra-chave C
\providecommand{\imprimirpalavrachavec}{C}
\newcommand{\PalavraChaveC}[1]{\renewcommand{\imprimirpalavrachavec}{#1}}

%% Palavra-chave D
\providecommand{\imprimirpalavrachaved}{D}
\newcommand{\PalavraChaveD}[1]{\renewcommand{\imprimirpalavrachaved}{#1}}

%% Palavra-chave E
\providecommand{\imprimirpalavrachavee}{E}
\newcommand{\PalavraChaveE}[1]{\renewcommand{\imprimirpalavrachavee}{#1}}

%% Número de keywords (máximo 5)
\providecommand{\imprimirnumerodekeywords}{\imprimirnumerodepalavraschave}
\newcommand{\NumeroDeKeywords}[1]{\renewcommand{\imprimirnumerodekeywords}{#1}}

%% Keyword A
\providecommand{\imprimirkeyworda}{\imprimirpalavrachavea}
\newcommand{\KeywordA}[1]{\renewcommand{\imprimirkeyworda}{#1}}

%% Keyword B
\providecommand{\imprimirkeywordb}{\imprimirpalavrachaveb}
\newcommand{\KeywordB}[1]{\renewcommand{\imprimirkeywordb}{#1}}

%% Keyword C
\providecommand{\imprimirkeywordc}{\imprimirpalavrachavec}
\newcommand{\KeywordC}[1]{\renewcommand{\imprimirkeywordc}{#1}}

%% Keyword D
\providecommand{\imprimirkeywordd}{\imprimirpalavrachaved}
\newcommand{\KeywordD}[1]{\renewcommand{\imprimirkeywordd}{#1}}

%% Keyword E
\providecommand{\imprimirkeyworde}{\imprimirpalavrachavee}
\newcommand{\KeywordE}[1]{\renewcommand{\imprimirkeyworde}{#1}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Informação do Autor(a) ou Autores(as) (TCC)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Nome completo do(a) autor(a)
\providecommand{\imprimirnomedoautor}{Nome do(a) Autor(a)}
\newcommand{\NomeDoAutor}[1]{\renewcommand{\imprimirnomedoautor}{#1}}

%% Sobrenome do(a) autor(a)
\providecommand{\imprimirsobrenomedoautor}{Último Nome}
\newcommand{\SobrenomeDoAutor}[1]{\renewcommand{\imprimirsobrenomedoautor}{#1}}

%% Prenome do(a) autor(a)
\providecommand{\imprimirprenomedoautor}{Nome do(a) Autor(a) Sem Último}
\newcommand{\PrenomeDoAutor}[1]{\renewcommand{\imprimirprenomedoautor}{#1}}

%% Insere ou remove autor(a) 2
\providecommand{\imprimiratribuiautordois}{false}
\newcommand{\AtribuiAutorDois}[1]{
  \ifthenelse{\equal{\imprimirtipodedocumento}{Trabalho de Conclusão de Curso}}%% Verificação do tipo de documento
    {\renewcommand{\imprimiratribuiautordois}{#1}}%% Insere ou remove autor(a) 2
    {\renewcommand{\imprimiratribuiautordois}{false}}%% Remove autor(a) 2
}

%% Nome completo do(a) autor(a) 2
\providecommand{\imprimirnomedoautordois}{Nome do(a) Autor(a) 2}
\newcommand{\NomeDoAutorDois}[1]{\renewcommand{\imprimirnomedoautordois}{#1}}

%% Sobrenome do(a) autor(a) 2
\providecommand{\imprimirsobrenomedoautordois}{Último Nome}
\newcommand{\SobrenomeDoAutorDois}[1]{\renewcommand{\imprimirsobrenomedoautordois}{#1}}

%% Prenome do(a) autor(a) 2
\providecommand{\imprimirprenomedoautordois}{Nome do(a) Autor(a) 2 Sem Último}
\newcommand{\PrenomeDoAutorDois}[1]{\renewcommand{\imprimirprenomedoautordois}{#1}}

%% Insere ou remove autor(a) 3
\providecommand{\imprimiratribuiautortres}{false}
\newcommand{\AtribuiAutorTres}[1]{
  \ifthenelse{\equal{\imprimirtipodedocumento}{Trabalho de Conclusão de Curso}}%% Verificação do tipo de documento
    {\renewcommand{\imprimiratribuiautortres}{#1}}%% Insere ou remove autor(a) 3
    {\renewcommand{\imprimiratribuiautortres}{false}}%% Remove autor(a) 3
}

%% Nome completo do(a) autor(a) 3
\providecommand{\imprimirnomedoautortres}{Nome do(a) Autor(a) 3}
\newcommand{\NomeDoAutorTres}[1]{\renewcommand{\imprimirnomedoautortres}{#1}}

%% Sobrenome do(a) autor(a) 3
\providecommand{\imprimirsobrenomedoautortres}{Último Nome}
\newcommand{\SobrenomeDoAutorTres}[1]{\renewcommand{\imprimirsobrenomedoautortres}{#1}}

%% Prenome do(a) autor(a) 3
\providecommand{\imprimirprenomedoautortres}{Nome do(a) Autor(a) 3 Sem Último}
\newcommand{\PrenomeDoAutorTres}[1]{\renewcommand{\imprimirprenomedoautortres}{#1}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Informações do Orientador(a) e Coorientador(a)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Atribuição "orientador(a)"
\providecommand{\imprimiratribuicaoorientador}{Orientador(a)}
\newcommand{\AtribuicaoOrientador}[1]{\renewcommand{\imprimiratribuicaoorientador}{#1}}

%% Título do(a) orientador(a)
\providecommand{\imprimirtitulodoorientador}{Prof(a). Dr(a).}
\newcommand{\TituloDoOrientador}[1]{\renewcommand{\imprimirtitulodoorientador}{#1}}

%% Nome completo do(a) orientador(a)
\providecommand{\imprimirnomedoorientador}{Nome Completo do(a) Orientador(a)}
\newcommand{\NomeDoOrientador}[1]{\renewcommand{\imprimirnomedoorientador}{#1}}

%% Sobrenome do(a) orientador(a)
\providecommand{\imprimirsobrenomedoorientador}{Último Nome}
\newcommand{\SobrenomeDoOrienador}[1]{\renewcommand{\imprimirsobrenomedoorientador}{#1}}

%% Prenome do(a) orientador(a)
\providecommand{\imprimirprenomedoorientador}{Nome do(a) Orientador(a) Sem Último}
\newcommand{\PrenomeDoOrientador}[1]{\renewcommand{\imprimirprenomedoorientador}{#1}}

%% Insere ou remove o(a) coorientador(a)
\providecommand{\imprimiratribuicoorientador}{false}
\newcommand{\AtribuiCoorientador}[1]{\renewcommand{\imprimiratribuicoorientador}{#1}}

%% Atribuição "coorientador(a)"
\providecommand{\imprimiratribuicaocoorientador}{Coorientador(a)}
\newcommand{\AtribuicaoCoorientador}[1]{\renewcommand{\imprimiratribuicaocoorientador}{#1}}

%% Título do(a) coorientador(a)
\providecommand{\imprimirtitulodocoorientador}{Prof(a). Dr(a).}
\newcommand{\TituloDoCoorientador}[1]{\renewcommand{\imprimirtitulodocoorientador}{#1}}

%% Nome completo do(a) coorientador(a)
\providecommand{\imprimirnomedocoorientador}{Nome Completo do(a) Coorientador(a)}
\newcommand{\NomeDoCoorientador}[1]{\renewcommand{\imprimirnomedocoorientador}{#1}}

%% Sobrenome do(a) coorientador(a)
\providecommand{\imprimirsobrenomedocoorientador}{Último Nome}
\newcommand{\SobrenomeDoCoorienador}[1]{\renewcommand{\imprimirsobrenomedocoorientador}{#1}}

%% Prenome do(a) coorientador(a)
\providecommand{\imprimirprenomedocoorientador}{Nome do(a) Coorientador(a) Sem Último}
\newcommand{\PrenomeDoCoorientador}[1]{\renewcommand{\imprimirprenomedocoorientador}{#1}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Informações da Instituição
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Instituição (from abntex2)
\renewcommand{\imprimirinstituicao}{Universidade Tecnológica Federal do Paraná}
\let\Instituicao\instituicao

%% Institution name
\providecommand{\imprimirinstitution}{Universidade Tecnológica Federal do Paraná}
\newcommand{\Institution}[1]{\renewcommand{\imprimirinstitution}{#1}}

%% Sigla instituicao
\providecommand{\imprimirsiglainstituicao}{UTFPR}
\newcommand{\SiglaInstituicao}[1]{\renewcommand{\imprimirsiglainstituicao}{#1}}

%% Nome da cidade (câmpus)
\providecommand{\imprimircidade}{Curitiba}
\newcommand{\Cidade}[1]{\renewcommand{\imprimircidade}{#1}}

%% Diretoria
\providecommand{\imprimirdiretoria}{Diretoria de Pesquisa e Pós-Graduação}
\newcommand{\Diretoria}[1]{\renewcommand{\imprimirdiretoria}{Diretoria de #1}}

%% Nome do departamento
\providecommand{\imprimirdepartamento}{Nome do Departamento ou da Coordenação}
\newcommand{\Departamento}[1]{\renewcommand{\imprimirdepartamento}{#1}}

%% Sigla do departamento
\providecommand{\imprimirsigladepartamento}{DPT}
\newcommand{\SiglaDepartamento}[1]{\renewcommand{\imprimirsigladepartamento}{#1}}

%% Nome do curso
\providecommand{\imprimircurso}{Nome do Curso}
\newcommand{\Curso}[1]{\renewcommand{\imprimircurso}{#1}}

%% Course name
\providecommand{\imprimircourse}{Course Name}
\newcommand{\Course}[1]{\renewcommand{\imprimircourse}{#1}}

%% Nome do programa ou nome do curso completo
\providecommand{\imprimirprograma}{Programa de Pós-Graduação em \imprimircurso}
\newcommand{\Programa}[1]{\renewcommand{\imprimirprograma}{#1}}

%% Sigla do programa de pós-graduação
\providecommand{\imprimirsigladoppg}{PPG}
\newcommand{\SiglaDoPPG}[1]{\renewcommand{\imprimirsigladoppg}{#1}}

%% Programa de pós-graduação ou departamento
\newcommand{\imprimirppgoudepartamento}{
  \ifthenelse{\equal{\imprimirtipodedocumento}{Tese}\or\equal{\imprimirtipodedocumento}{Dissertação}}%% Tese ou dissertação
  {\imprimirprograma}%% Programa de pós-graduação
  {\imprimirdepartamento}%% Departamento (default)
}

%% Nome da área de concentração
\providecommand{\imprimirareadeconcentracao}{Nome da Área de Concentração}
\newcommand{\AreaDeConcentracao}[1]{\renewcommand{\imprimirareadeconcentracao}{#1}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Informações de Cotutela (Duplo Grau)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Insere dados de cotutela
\providecommand{\imprimiratribuicotutela}{false}
\newcommand{\AtribuiCotutela}[1]{\renewcommand{\imprimiratribuicotutela}{#1}}

%% Instituicao cotutela
\providecommand{\imprimirinstituicaocotutela}{Universidade Da Cotutela}
\newcommand{\InstituicaoCotutela}[1]{\renewcommand{\imprimirinstituicaocotutela}{#1}}

%% Institution cotutela
\providecommand{\imprimirinstitutioncotutela}{Double Degree University}
\newcommand{\InstitutionCotutela}[1]{\renewcommand{\imprimirinstitutioncotutela}{#1}}

%% Sigla instituicao cotutela
\providecommand{\imprimirsiglainstituicaocotutela}{UC}
\newcommand{\SiglaInstituicaoCotutela}[1]{\renewcommand{\imprimirsiglainstituicaocotutela}{#1}}

%% Nome do departamento da inst. cotutela
\providecommand{\imprimirdepartamentocotutela}{Nome do Departamento ou da Coordenação}
\newcommand{\DepartamentoCotutela}[1]{\renewcommand{\imprimirdepartamentocotutela}{#1}}

%% Sigla do departamento da inst. cotutela
\providecommand{\imprimirsigladepartamentocotutela}{DPT-EXT}
\newcommand{\SiglaDepartamentoCotutela}[1]{\renewcommand{\imprimirsigladepartamentocotutela}{#1}}

%% Nome do curso bachalerado ou pós-graduação (PPG)
\providecommand{\imprimircursocotutela}{Nome do Curso Cotutela}
\newcommand{\CursoCotutela}[1]{\renewcommand{\imprimircursocotutela}{#1}}

%% Cotutela Course name
\providecommand{\imprimircoursecotutela}{Second Degree Course}
\newcommand{\CourseCotutela}[1]{\renewcommand{\imprimircoursecotutela}{#1}}

%% Nome do programa ou nome do curso completo na inst. cotutela
\providecommand{\imprimirprogramacotutela}{Programa de Doutoral em \imprimircursocotutela}
\newcommand{\ProgramaCotutela}[1]{\renewcommand{\imprimirprogramacotutela}{#1}}

%% Sigla do programa de pós-graduação da inst. de cotutela
\providecommand{\imprimirsigladoppgcotutela}{PPG-EXT}
\newcommand{\SiglaDoPPGCotutela}[1]{\renewcommand{\imprimirsigladoppgcotutela}{#1}}

%% Area de concentração na inst. de cotutela
\providecommand{\imprimirareadeconcentracaocotutela}{Nome da Área de Concentração}
\newcommand{\AreaDeConcentracaoCotutela}[1]{\renewcommand{\imprimirareadeconcentracaocotutela}{#1}}

%% Nível de formação no resumo
\providecommand{\imprimirniveldeformacaoresumo}{Duplo doutorado}
\newcommand{\NivelDeFormacaoResumo}[1]{\renewcommand{\imprimirniveldeformacaoresumo}{#1}}

%% Formation level no abstract
\providecommand{\imprimirformationlevelabstract}{Double PhD}
\newcommand{\FormationLevelAbstract}[1]{\renewcommand{\imprimirformationlevelabstract}{#1}}

%% Informacoes do orientador(a) da inst. cotutela

%% Atribuição "orientador(a)" de cotutela
\providecommand{\imprimiratribuicaoorientadorcotutela}{Orientador(a)}
\newcommand{\AtribuicaoOrientadorCotutela}[1]{\renewcommand{\imprimiratribuicaoorientadorcotutela}{#1}}

%% Título do(a) orientador(a) de cotutela
\providecommand{\imprimirtitulodoorientadorcotutela}{Prof(a). Dr(a).}
\newcommand{\TituloDoOrientadorCotutela}[1]{\renewcommand{\imprimirtitulodoorientadorcotutela}{#1}}

%% Nome completo do(a) orientador(a) de cotutela
\providecommand{\imprimirnomedoorientadorcotutela}{Nome Completo do(a) Orientador(a)}
\newcommand{\NomeDoOrientadorCotutela}[1]{\renewcommand{\imprimirnomedoorientadorcotutela}{#1}}

%% Sobrenome do(a) orientador(a) de cotutela
\providecommand{\imprimirsobrenomedoorientadorcotutela}{Último Nome}
\newcommand{\SobrenomeDoOrienadorCotutela}[1]{\renewcommand{\imprimirsobrenomedoorientadorcotutela}{#1}}

%% Prenome do(a) orientador(a) de cotutela
\providecommand{\imprimirprenomedoorientadorcotutela}{Nome do(a) Orientador(a) Sem Último}
\newcommand{\PrenomeDoOrientadorCotutela}[1]{\renewcommand{\imprimirprenomedoorientadorcotutela}{#1}}

%% Insere ou remove o(a) coorientador(a) de cotutela
\providecommand{\imprimiratribuicoorientadorcotutela}{false}
\newcommand{\AtribuiCoorientadorCotutela}[1]{\renewcommand{\imprimiratribuicoorientadorcotutela}{#1}}

%% Atribuição "coorientador(a)" de cotutela
\providecommand{\imprimiratribuicaocoorientadorcotutela}{Coorientador(a)}
\newcommand{\AtribuicaoCoorientadorCotutela}[1]{\renewcommand{\imprimiratribuicaocoorientadorcotutela}{#1}}

%% Título do(a) coorientador(a)
\providecommand{\imprimirtitulodocoorientadorcotutela}{Prof(a). Dr(a).}
\newcommand{\TituloDoCoorientadorCotutela}[1]{\renewcommand{\imprimirtitulodocoorientadorcotutela}{#1}}

%% Nome completo do(a) coorientador(a)
\providecommand{\imprimirnomedocoorientadorcotutela}{Nome Completo do(a) Coorientador(a)}
\newcommand{\NomeDoCoorientadorCotutela}[1]{\renewcommand{\imprimirnomedocoorientadorcotutela}{#1}}

%% Sobrenome do(a) coorientador(a)
\providecommand{\imprimirsobrenomedocoorientadorcotutela}{Último Nome}
\newcommand{\SobrenomeDoCoorienadorCotutela}[1]{\renewcommand{\imprimirsobrenomedocoorientadorcotutela}{#1}}

%% Prenome do(a) coorientador(a)
\providecommand{\imprimirprenomedocoorientadorcotutela}{Nome do(a) Coorientador(a) Sem Último}
\newcommand{\PrenomeDoCoorientadorCotutela}[1]{\renewcommand{\imprimirprenomedocoorientadorcotutela}{#1}}

%% Programa de pós-graduação ou departamento da inst. cotutela
\newcommand{\imprimirppgoudepartamentocotutela}{
  \ifthenelse{\equal{\imprimirtipodedocumento}{Tese}\or\equal{\imprimirtipodedocumento}{Dissertação}}%% Tese ou dissertação
  {\imprimirprogramacotutela}%% Programa de pós-graduação
  {\imprimirdepartamentocotutela}%% Departamento
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Folha de Rosto
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Descrição do documento
\providecommand{\imprimirdescricaododocumento}{\imprimirtipodedocumento\ apresentado(a) como requisito parcial à obtenção do título de \imprimirtitulopretendido\ em \imprimircurso, do \imprimirppgoudepartamento, da \imprimirinstituicao.
}
\newcommand{\DescricaoDoDocumento}[1]{\renewcommand{\imprimirdescricaododocumento}{#1}}

%% Insere descrição de cotutela na folha de rosto
\providecommand{\imprimiratribuidescricaocotutela}{false}
\newcommand{\AtribuiDescricaoCotutela}[1]{\renewcommand{\imprimiratribuidescricaocotutela}{#1}}

%% Descrição do documento (cotutela)
\providecommand{\imprimirdescricaododocumentocotutela}{\imprimirtipodedocumento\ apresentado(a) como requisito parcial à obtenção do título de \imprimirtitulopretendido\ em \imprimircursocotutela, do \imprimirppgoudepartamentocotutela, da \imprimirinstituicaocotutela.}
\newcommand{\DescricaoDoDocumentoCotutela}[1]{\renewcommand{\imprimirdescricaododocumentocotutela}{#1}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Ficha Catalografica
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Número da publicação
\providecommand{\imprimirnumerodapublicacao}{00/\imprimirano}
\newcommand{\NumeroDaPublicacao}[1]{\renewcommand{\imprimirnumerodapublicacao}{#1}}

%% CDD ou CDU
\providecommand{\imprimircddoucdu}{CDD 000.00}
\newcommand{\CDDOuCDU}[1]{\renewcommand{\imprimircddoucdu}{#1}}

%% Título da ficha catalográfica
\providecommand{\imprimirtitulodafichacatalografica}{Ficha catalográfica elaborada pelo Departamento de Biblioteca da \par \imprimirinstituicao, Câmpus \imprimircidade \par n. \imprimirnumerodapublicacao}
\newcommand{\TituloDaFichaCatalografica}[1]{\renewcommand{\imprimirtitulodafichacatalografica}{#1}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Folha de aprovação (Formato UTFPR-PG)*
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Número da tese ou dissertação
\providecommand{\imprimirnumerodateseoudissertacao}{00/\imprimirano}
\newcommand{\NumeroDaTeseOuDissertacao}[1]
{\renewcommand{\imprimirnumerodateseoudissertacao}{#1}}

%% Número da ficha catalográfica
\providecommand{\imprimirnumerodafichacatalografica}{A000}
\newcommand{\NumeroDaFichaCatalografica}[1]{\renewcommand{\imprimirnumerodafichacatalografica}{#1}}

%% Título do(a) responsável pelos TCC
\providecommand{\imprimirtitulodoresponsaveltcc}{Prof(a). Dr(a).}
\newcommand{\TituloDoResponsavelTCC}[1]{\renewcommand{\imprimirtitulodoresponsaveltcc}{#1}}

%% Nome completo do(a) responsável pelos TCC
\providecommand{\imprimirnomedoresponsaveltcc}{Nome do(a) Responsável}
\newcommand{\NomeDoResponsavelTCC}[1]{\renewcommand{\imprimirnomedoresponsaveltcc}{#1}}

%% Atribuição "coordenador(a)" do curso
\providecommand{\imprimiratribuicaocoordenador}{Coordenador(a)}
\newcommand{\AtribuicaoCoordenador}[1]{\renewcommand{\imprimiratribuicaocoordenador}{#1}}

%% Título do(a) coordenador(a) do curso
\providecommand{\imprimirtitulodocoordenador}{Prof(a). Dr(a).}
\newcommand{\TituloDoCoordenador}[1]{\renewcommand{\imprimirtitulodocoordenador}{#1}}

%% Nome completo do(a) coordenador(a) do curso
\providecommand{\imprimirnomedocoordenador}{Nome do(a) Coordenador(a)}
\newcommand{\NomeDoCoordenador}[1]{\renewcommand{\imprimirnomedocoordenador}{#1}}

%% Texto de aprovação
\providecommand{\imprimirtextodeaprovacao}{Esta \imprimirtipodedocumento\ foi apresentada...}
\newcommand{\TextoDeAprovacao}[1]{\renewcommand{\imprimirtextodeaprovacao}{#1}}

%% Aviso de aprovação
\providecommand{\imprimiravisodeaprovacao}{A Folha de Aprovação assinada encontra-se...}
\newcommand{\AvisoDeAprovacao}[1]{\renewcommand{\imprimiravisodeaprovacao}{#1}}

%% Membro A igual ao(à) orientador(a)
\providecommand{\imprimirmembroaigualorientador}{true}
\newcommand{\MembroAIgualOrientador}[1]{\renewcommand{\imprimirmembroaigualorientador}{#1}}

%% Nome completo do membro A
\providecommand{\imprimirmembroa}{Nome do Membro A}
\newcommand{\MembroA}[1]{\renewcommand{\imprimirmembroa}{#1}}

%% Título do membro A
\providecommand{\imprimirtitulodomembroa}{Prof(a). Dr(a).}
\newcommand{\TituloDoMembroA}[1]{\renewcommand{\imprimirtitulodomembroa}{#1}}

%% Nome da instituição do membro A
\providecommand{\imprimirinstituicaodomembroa}{Instituição do Membro A}
\newcommand{\InstituicaoDoMembroA}[1]{\renewcommand{\imprimirinstituicaodomembroa}{#1}}

%% Nome completo do membro B
\providecommand{\imprimirmembrob}{Nome do Membro B}
\newcommand{\MembroB}[1]{\renewcommand{\imprimirmembrob}{#1}}

%% Título do membro B
\providecommand{\imprimirtitulodomembrob}{Prof(a). Dr(a).}
\newcommand{\TituloDoMembroB}[1]{\renewcommand{\imprimirtitulodomembrob}{#1}}

%% Nome da instituição do membro B
\providecommand{\imprimirinstituicaodomembrob}{Instituição do Membro B}
\newcommand{\InstituicaoDoMembroB}[1]{\renewcommand{\imprimirinstituicaodomembrob}{#1}}

%% Nome completo do membro C
\providecommand{\imprimirmembroc}{Nome do Membro C}
\newcommand{\MembroC}[1]{\renewcommand{\imprimirmembroc}{#1}}

%% Título do membro C
\providecommand{\imprimirtitulodomembroc}{Prof(a). Dr(a).}
\newcommand{\TituloDoMembroC}[1]{\renewcommand{\imprimirtitulodomembroc}{#1}}

%% Nome da instituição do membro C
\providecommand{\imprimirinstituicaodomembroc}{Instituição do Membro C}
\newcommand{\InstituicaoDoMembroC}[1]{\renewcommand{\imprimirinstituicaodomembroc}{#1}}

%% Nome completo do membro D
\providecommand{\imprimirmembrod}{Nome do Membro D}
\newcommand{\MembroD}[1]{\renewcommand{\imprimirmembrod}{#1}}

%% Título do membro D
\providecommand{\imprimirtitulodomembrod}{Prof(a). Dr(a).}
\newcommand{\TituloDoMembroD}[1]{\renewcommand{\imprimirtitulodomembrod}{#1}}

%% Nome da instituição do membro D
\providecommand{\imprimirinstituicaodomembrod}{Instituição do Membro D}
\newcommand{\InstituicaoDoMembroD}[1]{\renewcommand{\imprimirinstituicaodomembrod}{#1}}

%% Nome completo do membro E
\providecommand{\imprimirmembroe}{Nome do Membro E}
\newcommand{\MembroE}[1]{\renewcommand{\imprimirmembroe}{#1}}

%% Título do membro E
\providecommand{\imprimirtitulodomembroe}{Prof(a). Dr(a).}
\newcommand{\TituloDoMembroE}[1]{\renewcommand{\imprimirtitulodomembroe}{#1}}

%% Nome da instituição do membro E
\providecommand{\imprimirinstituicaodomembroe}{Instituição do Membro E}
\newcommand{\InstituicaoDoMembroE}[1]{\renewcommand{\imprimirinstituicaodomembroe}{#1}}

%% Insere ou remove o membro F
\providecommand{\imprimiratribuimembrof}{false}
\newcommand{\AtribuiMembroF}[1]{\renewcommand{\imprimiratribuimembrof}{#1}}

%% Nome completo do membro F
\providecommand{\imprimirmembrof}{Nome do Membro F}
\newcommand{\MembroF}[1]{\renewcommand{\imprimirmembrof}{#1}}

%% Título do membro F
\providecommand{\imprimirtitulodomembrof}{Prof(a). Dr(a).}
\newcommand{\TituloDoMembroF}[1]{\renewcommand{\imprimirtitulodomembrof}{#1}}

%% Nome da instituição do membro F
\providecommand{\imprimirinstituicaodomembrof}{Instituição do Membro F}
\newcommand{\InstituicaoDoMembroF}[1]{\renewcommand{\imprimirinstituicaodomembrof}{#1}}

%% Insere ou remove o membro G
\providecommand{\imprimiratribuimembrog}{false}
\newcommand{\AtribuiMembroG}[1]{\renewcommand{\imprimiratribuimembrog}{#1}}

%% Nome completo do membro G
\providecommand{\imprimirmembrog}{Nome do Membro G}
\newcommand{\MembroG}[1]{\renewcommand{\imprimirmembrog}{#1}}

%% Título do membro G
\providecommand{\imprimirtitulodomembrog}{Prof(a). Dr(a).}
\newcommand{\TituloDoMembroG}[1]{\renewcommand{\imprimirtitulodomembrog}{#1}}

%% Nome da instituição do membro G
\providecommand{\imprimirinstituicaodomembrog}{Instituição do Membro G}
\newcommand{\InstituicaoDoMembroG}[1]{\renewcommand{\imprimirinstituicaodomembrog}{#1}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Informações nas propriedades do documento do arquivo PDF
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\AtBeginDocument{%% Definições carregadas no início do documento
  \ifthenelse{\imprimirnumerodepalavraschave > 0}%% Palavra-chave A
    {\newcommand{\pdfkeyworda}{\imprimirpalavrachavea}}%%
    {\newcommand{\pdfkeyworda}{}}%%
  \ifthenelse{\imprimirnumerodepalavraschave > 1}%% Palavra-chave B
    {\newcommand{\pdfkeywordb}{. \imprimirpalavrachaveb}}%%
    {\newcommand{\pdfkeywordb}{}}%%
  \ifthenelse{\imprimirnumerodepalavraschave > 2}%% Palavra-chave C
    {\newcommand{\pdfkeywordc}{. \imprimirpalavrachavec}}%%
    {\newcommand{\pdfkeywordc}{}}%%
  \ifthenelse{\imprimirnumerodepalavraschave > 3}%% Palavra-chave D
    {\newcommand{\pdfkeywordd}{. \imprimirpalavrachaved}}%%
    {\newcommand{\pdfkeywordd}{}}%%
  \ifthenelse{\imprimirnumerodepalavraschave > 4}%% Palavra-chave E
    {\newcommand{\pdfkeyworde}{. \imprimirpalavrachavee}}%%
    {\newcommand{\pdfkeyworde}{}}%%
  \ifthenelse{\imprimirnumerodepalavraschave > 0}%% Ponto final
    {\newcommand{\pdfkeywordfinalpoint}{.}}%%
    {\newcommand{\pdfkeywordfinalpoint}{}}%%
  \hypersetup{%% Propriedades do documento do arquivo pdf
    pdftitle={\imprimirtitulododocumento},%% Título
    pdfauthor={\imprimirnomedoautor},%% Autor
    pdfsubject={\imprimirtipodedocumento} de {\imprimirniveldeformacao},%% Descrição
    pdfkeywords={{\pdfkeyworda}{\pdfkeywordb}{\pdfkeywordc}{\pdfkeywordd}{\pdfkeyworde}{\pdfkeywordfinalpoint}},%% Palavras-chave
  }
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Configuração de fontes
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\ifthenelse{\equal{\@tipodefonte}{lmodern}}{
	\renewcommand{\familydefault}{\rmdefault}
}{
	\RequirePackage{times}%% Seleção da fonte Adobe Times Roman (ou equivalente) como fonte padrão
	\renewcommand{\rmdefault}{ptm}%% Fonte Adobe Times
	\renewcommand{\sfdefault}{phv}%% Fonte Adobe Helvetica
	\renewcommand{\ttdefault}{pcr}%% Fonte Adobe Courier
	\ifthenelse{\equal{\@tipodefonte}{arial}}{
		%% Fonte arial com fator de escala de 1.0 (fonte principal arial)
  		\RequirePackage{helvet}%% Fonte Arial (ou equivalente) como fonte padrão
  		%\RequirePackage{sfmath}%% Fonte Helvetica no modo matemático
		\renewcommand{\familydefault}{\sfdefault}
	}{
		\RequirePackage[scaled=0.9]{helvet}%% Fonte arial com fator de escala de 0.9 quando não é fonte principal
		
		\ifthenelse{\equal{\@tipodefonte}{courier}}{
			\renewcommand{\familydefault}{\ttdefault}
		}{
			\renewcommand{\familydefault}{\rmdefault}			
		}
	}
}
\normalsize%% Tamanho padrão de fonte
\renewcommand{\ABNTEXpartfont}{\fontfamily{\familydefault}\bfseries}%% Estilo da fonte da parte
\renewcommand{\ABNTEXpartfontsize}{\normalsize}%% Tamanho da fonte da parte
\renewcommand{\ABNTEXchapterfont}{\ABNTEXpartfont}%% Estilo da fonte do capítulo
\renewcommand{\ABNTEXchapterfontsize}{\ABNTEXpartfontsize}%% Tamanho da fonte do capítulo
\renewcommand{\ABNTEXsectionfont}{\normalfont}%% Estilo da fonte da seção
\renewcommand{\ABNTEXsectionfontsize}{\normalsize}%% Tamanho da fonte da seção
\renewcommand{\ABNTEXsubsectionfont}{\ABNTEXsectionfont}%% Estilo da fonte da subseção
\renewcommand{\ABNTEXsubsectionfontsize}{\ABNTEXsectionfontsize}%% Tamanho da fonte da subseção
\renewcommand{\ABNTEXsubsubsectionfont}{\ABNTEXsubsectionfont}%% Estilo da fonte da subsubseção
\renewcommand{\ABNTEXsubsubsectionfontsize}{\ABNTEXsubsectionfontsize}%% Tamanho da fonte da subsubseção


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Formatação das páginas no documento
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\let\newtextual\textual%% Elementos textuais
\let\newpretextual\pretextual%% Elementos pré-textuais
\if@twoside%% Estilo de impressão para elementos textuais e pós-textuais (anverso e verso)
  \renewcommand{\textual}{\setboolean{@twoside}{true}\newtextual}%% Redefinição dos elementos textuais
\else%% Estilo de impressão para elementos textuais e pós-textuais (anverso)
  \renewcommand{\textual}{\setboolean{@twoside}{false}\newtextual}%% Redefinição dos elementos textuais
\fi
\if@pretexttwoside%% Estilo de impressão para elementos pré-textuais (anverso e verso)
  \renewcommand{\pretextual}{\setboolean{@twoside}{true}\newpretextual}%% Redefinição dos elementos pré-textuais
\else%% Estilo de impressão para elementos pré-textuais (anverso)
  \renewcommand{\pretextual}{\setboolean{@twoside}{false}\newpretextual}%% Redefinição dos elementos pré-textuais
\fi

%% Formatação e espaçamentos nas páginas
\newgeometry{%
  top      = 30mm,%
  left     = 30mm,%
  right    = 20mm,%
  bottom   = 20mm,%
  head     = 10mm,%
  headsep  = 5.5mm,% NBR 14724/2011: 2 cm da borda superior (ajustado manualmente para ficar proximo do esperado)
  footskip = 5mm,%
  includehead = false,
}%
\savegeometry{standard}

\frenchspacing%% Remoção de espaço adicional após ponto final
\raggedbottom%% Remoção de espaços adicionais no texto
\sloppy%% Força todas as linhas ficarem dentro das margens
\newlength{\linha}%% Escala linha
\setlength{\linha}{\baselineskip}%% Espessura da escala linha
\setlength{\parskip}{0pt}%% Espaçamento entre parágrafos
\setlength{\parindent}{15mm}%% Recuo dos parágrafos
% \setlength{\hoffset}{-1in}%% Deslocamento horizontal
% \setlength{\voffset}{-1in}%% Deslocamento vertical
% \setlength{\headheight}{\linha}%% Espessura do cabeçalho
% \setlength{\headsep}{10mm}%% Espaçamento entre texto e cabeçalho
% \setlength{\footskip}{5mm}%% Espaçamento entre texto e rodapé
% \setlength{\topmargin}{30mm-\headsep-\headheight}%% Margem superior
% \setlength{\oddsidemargin}{30mm}%% Margem lateral da página impar
% \setlength{\evensidemargin}{20mm}%% Margem lateral da página par
% \setlength{\marginparsep}{0pt}%% Espaçamento horizontal entre a margem e a nota de margem
% \setlength{\marginparpush}{0pt}%% Espaçamento vertical mínimo entre duas notas de margem
% \setlength{\marginparwidth}{0pt}%% Largura da nota de margem
\if@fleqn\setlength{\mathindent}{\parindent}\fi%% Recuo dos parágrafos de equações alinhadas à esquerda (em ambiente matemático)
\renewcommand{\baselinestretch}{1.5}%% Espaçamento entre linhas (1, 1,5 ou 2)

%% Formatação dos cabeçalhos
\makepagestyle{abntheadings}%% Cabeçalho
\makeevenhead{abntheadings}{\ABNTEXfontereduzida\thepage}{}{}%% Formatação do cabeçalho (par)
\makeoddhead{abntheadings}{}{}{\ABNTEXfontereduzida\thepage}%% Formatação do cabeçalho (ímpar)
\makeheadrule{abntheadings}{0pt}{\normalrulethickness}%% Formatação da regua do cabeçalho
\makepagestyle{abntchapfirst}%% Cabeçalho do início do capítulo
\makeoddhead{abntchapfirst}{}{}{\ABNTEXfontereduzida\thepage}%% Formatação do cabeçalho do início do capítulo (ímpar)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Capa
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newcommand{\incluircapa}{%% Formatação da capa
  \begin{capa}%% Ambiente capa
    \pdfbookmark[0]{\nomecapa}{capa}%% Marcador
    \renewcommand{\thepage}{\roman{page}}%% Numéração de página em algarismos romanos
    %\vspace*{-2\linha}
	%\hspace*{-0.162\textwidth}
	%\includegraphics[width = 40mm]{./Capitulos/figures/logos/logo_utfpr.png}%
	%\hfill
	%\includegraphics[width = 40mm]{./Capitulos/figures/logos/logo_inst_cotutela.png}
	%\vspace*{1\linha}
    \begin{center}%% Texto centralizado
      \bfseries%% Texto em negrito
      \MakeUppercase{\imprimirinstituicao}\\%% Instituição
      \ifthenelse{%% Verificação do tipo de documento
        \equal{\imprimirtipodedocumento}{Tese}
        \or\equal{\imprimirtipodedocumento}{Dissertação}
      }{%% Programa de pós-graduação
        \MakeUppercase{\imprimirprograma}
      }{%% Departamento
        \MakeUppercase{\imprimirdepartamento}
      }\\[0.5\linha]%
	  %\MakeUppercase{\imprimirniveldeformacao\ em \imprimircurso}\\[80pt]%% Titulação e curso
	  \ifthenelse{\equal{\imprimiratribuicotutela}{true}}{%%	  
		\MakeUppercase{\imprimirinstituicaocotutela}\par%%
	    \MakeUppercase{\imprimirprogramacotutela}\\[80pt]%%
	  }{\vspace*{100pt}}%%
      \ifthenelse{\equal{\imprimiratribuiautortres}{true}}{%% Insere 3 autores(as)
	    \MakeUppercase{\imprimirnomedoautor}\par%% Autor(a)
      	\MakeUppercase{\imprimirnomedoautordois}\par%% Autor(a) 2
      	\MakeUppercase{\imprimirnomedoautortres}\\[96pt]%% Autor(a) 3
      }{%
      	\ifthenelse{\equal{\imprimiratribuiautordois}{true}}{%% Insere 2 autores(as)
          \MakeUppercase{\imprimirnomedoautor}\par%% Autor(a)
	      \MakeUppercase{\imprimirnomedoautordois}\\[118pt]%% Autor(a) 2
      	}{%% Insere 1 autor(a)
          \MakeUppercase{\imprimirnomedoautor}\\[140pt]%% Autor(a)
        }
      }
      {\large\MakeUppercase{\imprimirtituloemmultiplaslinhas}}\\[120pt]%% Título do documento
      \MakeUppercase{\imprimirtipodedocumento}\\%% Tipo de documento
      \vspace*{\stretch{1}}%% Espaçamento vertical
      \MakeUppercase{\imprimircidade}\par%% Cidade
      \MakeUppercase{\imprimirano}%% Ano
    \end{center}
  \end{capa}
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Folha de rosto
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 
\renewcommand{\folhaderostocontent}{%% Formatação da folha de rosto
  \begin{center}%% Texto centralizado
    \bfseries%% Texto em negrito
    \ifthenelse{\equal{\imprimiratribuiautortres}{true}}{%% Insere 3 autores(as)
      \MakeUppercase{\imprimirnomedoautor}\par%% Autor(a)
      \MakeUppercase{\imprimirnomedoautordois}\par%% Autor(a) 2
      \MakeUppercase{\imprimirnomedoautortres}\\[241pt]%% Autor(a) 3
    }{% 
      \ifthenelse{\equal{\imprimiratribuiautordois}{true}}{%% Insere 2 autores(as)
        \MakeUppercase{\imprimirnomedoautor}\par%% Autor(a)
        \MakeUppercase{\imprimirnomedoautordois}\\[263pt]%% Autor(a) 2
      }{%% Insere 1 autor(a)
        \MakeUppercase{\imprimirnomedoautor}\\[285pt]%% Autor(a)
      }
    }
    \ifthenelse{\equal{\imprimiratribuicotutela}{true}}{%%
    	\ifthenelse{\equal{\imprimiratribuidescricaocotutela}{true}}{%%
			{\vspace{-70pt}}
    	}{}
    }{}
    {\large\MakeUppercase{\imprimirtituloemmultiplaslinhas}}\\[35pt]%% Título do documento
  \end{center}
  \begin{flushright}%% Alinhamento à direita
    \begin{Spacing}{1.0}%% Espaçamento simples entre linhas
      \parbox{0.5\textwidth}{%% Caixa de texto			
	  \imprimirdescricaododocumento\\[\linha]		
      \imprimiratribuicaoorientador: \imprimirtitulodoorientador\ \imprimirnomedoorientador\\%% Orientador
	  \ifthenelse{\equal{\imprimiratribuicotutela}{true}}{%%
      \ifthenelse{\equal{\imprimiratribuidescricaocotutela}{true}}%%
      {%1)coorientador + outra descrição + orientador(ext) + coorientador(ext)
		\ifthenelse{\equal{\imprimiratribuicoorientador}{true}}%% Existe coorientador
        {\imprimiratribuicaocoorientador: \imprimirtitulodocoorientador\ \imprimirnomedocoorientador\\[\linha]}{\\[\linha]}%% Coorientador
		\imprimirdescricaododocumentocotutela\\[\linha]		
        \imprimiratribuicaoorientadorcotutela: \imprimirtitulodoorientadorcotutela\ \imprimirnomedoorientadorcotutela\par%% Orientador Cotutela
   		\ifthenelse{\equal{\imprimiratribuicoorientadorcotutela}{true}}%% Existe coorientador cotutela
        {\imprimiratribuicaocoorientadorcotutela: \imprimirtitulodocoorientadorcotutela\ \imprimirnomedocoorientadorcotutela\par}{\par}%% Coorientador Cotutela
	  }%%
	  {%2)orientador(ext) + coorientador + coorientador(ext)
	  	\imprimiratribuicaoorientadorcotutela: \imprimirtitulodoorientadorcotutela\ \imprimirnomedoorientadorcotutela\par%% Orientador Cotutela
		\ifthenelse{\equal{\imprimiratribuicoorientador}{true}}%% Existe coorientador
        {\imprimiratribuicaocoorientador: \imprimirtitulodocoorientador\ \imprimirnomedocoorientador\par}{\par}%% Coorientador
   		\ifthenelse{\equal{\imprimiratribuicoorientadorcotutela}{true}}%% Existe coorientador cotutela
        {\imprimiratribuicaocoorientadorcotutela: \imprimirtitulodocoorientadorcotutela\ \imprimirnomedocoorientadorcotutela\par}{\par}%%
	  }}%%
	  {%3)apenas coorientador
		\ifthenelse{\equal{\imprimiratribuicoorientador}{true}}%% Existe coorientador
        {\imprimiratribuicaocoorientador: \imprimirtitulodocoorientador\ \imprimirnomedocoorientador\par}{\par}%% Coorientador
	  }
      }%end parbox
    \end{Spacing}
  \end{flushright}
  \vspace*{\stretch{1}}%% Espaçamento vertical
  \begin{center}%% Texto centralizado
    \bfseries%% Texto em negrito
    \MakeUppercase{\imprimircidade}\par%% Cidade
    \MakeUppercase{\imprimirano}%% Ano
  \end{center}
}
\newcommand{\incluirfolhaderosto}[1][\folhaderostoname]{%% Inclusão da folha de rosto (com ou sem ficha catalográfica)
  \@ifstar\imprimirfolhaderostostar\imprimirfolhaderostonostar%% Verificação do asterisco (*)
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Ficha catalográfica
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newcommand{\incluirfichacatalografica}[1]{%% Formatação da ficha catalográfica
  \ifthenelse{\equal{#1}{template}\or\equal{#1}{\par}}{
  \begin{fichacatalografica}%% Ambiente fichacatalografica
    \pdfbookmark[0]{\nomefichacatalografica}{fichacatalografica}%% Marcador
    \vspace*{\stretch{1}}%% Espaçamento vertical
    \flushleft\parbox{\textwidth}{\imprimirtitulodafichacatalografica}\\[0.5\linha]%% Título da ficha catalográfica
    \begin{tabular}{|cp{120mm}c|}%% Ambiente tabular
      \hline
      \hspace*{10mm} & & \\
      \imprimirnumerodafichacatalografica & \imprimirsobrenomedoautor, \imprimirprenomedoautor & \\
      & & \\
      & \hspace*{1em} \imprimirtitulododocumento\unskip\ / \imprimirnomedoautor. -- \imprimircidade, PR: [s.n.], \imprimirano. & \\
      & \hspace*{1em} \pageref{LastPage}~f. : il. ; \SI{30}{cm}. & \\
      & & \\
      & \hspace*{1em} \imprimiratribuicaoorientador: \imprimirtitulodoorientador\ \imprimirnomedoorientador & \\
      \ifthenelse{\equal{\imprimiratribuicoorientador}{true}}%%
        {& \hspace*{1em} \imprimiratribuicaocoorientador: \imprimirtitulodocoorientador\ \imprimirnomedocoorientador & \\}{}%%
      & & \\
      & \hspace*{1em} \imprimirtipodedocumento\ (\imprimirniveldeformacao\ em \imprimircurso) --
        \ifthenelse{\equal{\imprimirtipodedocumento}{Tese}\or\equal{\imprimirtipodedocumento}{Dissertação}}%%
          {\imprimirprograma}{\imprimirdepartamento}%%
        . \imprimirinstituicao. \imprimircidade, \imprimirano. & \\
      & & \\
      & \hspace*{1em}
        \ifthenelse{\imprimirnumerodepalavraschave > 0}{1.~\imprimirpalavrachavea. }{}%%
        \ifthenelse{\imprimirnumerodepalavraschave > 1}{2.~\imprimirpalavrachaveb. }{}%%
        \ifthenelse{\imprimirnumerodepalavraschave > 2}{3.~\imprimirpalavrachavec. }{}%%
        \ifthenelse{\imprimirnumerodepalavraschave > 3}{4.~\imprimirpalavrachaved. }{}%%
        \ifthenelse{\imprimirnumerodepalavraschave > 4}{5.~\imprimirpalavrachavee. }{}%%
        I.~\imprimirsobrenomedoorientador, \imprimirprenomedoorientador. %%
        \ifthenelse{\equal{\imprimiratribuicoorientador}{true}}{%%
          II.~\imprimirsobrenomedocoorientador, \imprimirprenomedocoorientador. %%
          III.~\imprimirinstituicao, Câmpus \imprimircidade. %%
          IV.~Título. & \\
        }{%%
          II.~\imprimirinstituicao, Câmpus \imprimircidade. %%
          III.~Título. & \\
        }%%
      & & \\
      \multicolumn{2}{|r}{\imprimircddoucdu} & \\
      & & \\
      \hline
    \end{tabular}
    \vspace*{0.1\textheight}%% Espaçamento vertical
  \end{fichacatalografica}
  }{%% path to file
  	\includepdf[pages=1]{#1}%1
  }
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Errata
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\let\errataoriginal\errata%% Formatação do ambiente errata (original)
\renewenvironment{errata}{%% Formatação do ambiente errata
  \renewcommand{\errataname}{\nomeerrata}
  \begin{errataoriginal}%% Ambiente errata (original)
    \vspace*{0.5\linha}%% Espaçamento vertical
    \begin{Spacing}{1.0}%% Espaçamento simples entre linhas
      \begin{flushleft}%% Alinhamento à esquerda
        \MakeUppercase{\imprimirsobrenomedoautor}, \imprimirprenomedoautor%
        \ifthenelse{\equal{\imprimiratribuiautordois}{true}}%% 2 autores?
        {; \MakeUppercase{\imprimirsobrenomedoautordois}, \imprimirprenomedoautordois%
           \ifthenelse{\equal{\imprimiratribuiautortres}{true}}%% 3 autores?
           {; \MakeUppercase{\imprimirsobrenomedoautortres}, \imprimirprenomedoautortres.}
           {.}
        }{.} 
        \ifthenelse{\equal{\imprimiratribuicotutela}{false}}{%%
        {\bfseries\imprimirtitulododocumento\unskip}. {\imprimirano}. \pageref{LastPage}~f. \imprimirtipodedocumento\ (\imprimirniveldeformacao\ em \imprimircurso) -- \imprimirinstituicao. \imprimircidade, \imprimirano.%%
        }{%% Cotutela
		{\bfseries\imprimirtitulododocumento\unskip}. {\imprimirano}. \pageref{LastPage}~f. \imprimirtipodedocumento\ (\imprimirniveldeformacaoresumo\ em \imprimircurso\ e \imprimircursocotutela) -- \imprimirinstituicao\ e \imprimirinstituicaocotutela. \imprimircidade, \imprimirano.%%
        }
      \end{flushleft}
}{%%
    \end{Spacing}
  \end{errataoriginal}
  \cleardoublepage%% Página de verso
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Cabeçalho da folha de aprovação
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\let\footruleskip\undefined%% Remoção da definição de "\footruleskip" antes do carregamento do pacote fancyhdr
\RequirePackage{fancyhdr}%% Controle extensivo de cabeçalhos e rodapés
\fancypagestyle{folhadeaprovacao}{%% Formatação do cabeçalho da folha de aprovação
  \fancyhf{}%% Remoção da formatação atual de cabeçalhos e rodapés
  % \setlength{\headheight}{0pt}%% Espessura do cabeçalho
  % \setlength{\headsep}{20mm}%% Espaçamento entre texto e cabeçalho
  % \setlength{\footskip}{0mm}%% Espaçamento entre texto e rodapé
  % \setlength{\topmargin}{30mm-\headsep-\headheight}%% Margem superior
  % \addtolength{\headheight}{0.5\linha}%% Comprimento adicionado a altura do cabeçalho
  \renewcommand{\headrulewidth}{0.5pt}%% Espessura da linha de cabeçalho
  \renewcommand{\headrule}{%% Formatação da linha de cabeçalho
    \vspace*{1mm}\hrule height\headrulewidth\vspace*{1mm}%%
    {\color[cmyk]{0, 0.2, 1, 0}\hrule width\headwidth height\headrulewidth\vskip-\headrulewidth}%%
  }
  \lhead{%% Definição do cabeçalho esquerdo
    \begin{minipage}[c][][c]{35mm}%% Ambiente minipage
      \flushleft\includegraphics[width=15mm]{./PreTexto/Ilustracoes/brasao-republica}%% Figura
    \end{minipage}
  }
  \chead{%% Definição do cabeçalho central
    \begin{minipage}[c][][c]{90mm}%% Ambiente minipage
      \centering%% Texto centralizado
      % \SingleSpacing%% Espaçamento simples entre linhas
      \ABNTEXfontereduzida{Ministério da Educação}\\%% Ministério da Educação
      \ABNTEXfontereduzida{\bfseries{\imprimirinstituicao}}\\%% Instituição
      \ABNTEXfontereduzida{Câmpus \imprimircidade}\\%% Cidade (câmpus)
      \ABNTEXfontereduzida{\imprimirdiretoria}\\%% Diretoria de graduação ou de pós-graduação
      \ABNTEXfontereduzida{\imprimirdepartamento}\\%% Departamento
      \ABNTEXfontereduzida{\imprimirniveldeformacao\ em \imprimircurso}\\%% Nível de formação e curso
    \end{minipage}
  }
  \rhead{%% Definição do cabeçalho direito
    \begin{minipage}[c][][c]{35mm}%% Ambiente minipage
      \flushright\includegraphics[width=30mm]{./PreTexto/Ilustracoes/logo-utfpr}%% Figura
    \end{minipage}
  }
  % \abntex@ifnotempty{\imprimiravisodeaprovacao}{\fancyfoot[C]{\ABNTEXfontereduzida\imprimiravisodeaprovacao}}%% Definição do rodapé
}
\fancypagestyle{folhadeaprovacaoppg}{%% Formatação do cabeçalho da folha de aprovação
  \fancyhf{}%% Remoção da formatação atual de cabeçalhos e rodapés
  % \setlength{\headheight}{0pt}%% Espessura do cabeçalho
  % \setlength{\headsep}{20mm}%% Espaçamento entre texto e cabeçalho
  % \setlength{\footskip}{0mm}%% Espaçamento entre texto e rodapé
  % \setlength{\topmargin}{30mm-\headsep-\headheight}%% Margem superior
  % \addtolength{\headheight}{0.5\linha}%% Comprimento adicionado a altura do cabeçalho
  \renewcommand{\headrulewidth}{0pt}%% Espessura da linha de cabeçalho
  % \renewcommand{\headrule}{%% Formatação da linha de cabeçalho
    % \vspace*{1mm}\hrule height\headrulewidth\vspace*{1mm}%%
    % {\color[cmyk]{0, 0.2, 1, 0}\hrule width\headwidth height\headrulewidth\vskip-\headrulewidth}%%
  % }
  \lhead{%% Definição do cabeçalho esquerdo
    \begin{minipage}[c][][c]{35mm}%% Ambiente minipage
      \flushleft\includegraphics[width=30mm]{./PreTexto/Ilustracoes/logo-utfpr}%% Figura
    \end{minipage}
  }
  \chead{%% Definição do cabeçalho central
    \begin{minipage}[c][][c]{90mm}%% Ambiente minipage
      \centering%% Texto centralizado
      % \SingleSpacing%% Espaçamento simples entre linhas
      \ABNTEXfontereduzida{\bfseries{\imprimirinstituicao}}\\%% Instituição
      \ABNTEXfontereduzida{\bfseries{Câmpus \imprimircidade}}\\%% Cidade (câmpus)
      \ABNTEXfontereduzida{Diretoria de Pesquisa e Pós-Graduação}\\%% Diretoria de pós-graduação
      \ABNTEXfontereduzida{\bfseries{PROGRAMA DE PÓS-GRADUAÇÃO EM}}\\%% Programa de pós-graduação
      \ABNTEXfontereduzida{\bfseries{\MakeUppercase{\imprimircurso}}}\\%% Curso
    \end{minipage}
  }
  \newcommand{\logodoppg}{./PreTexto/Ilustracoes/logo-ppg}%% Logo do programa de pós-graduação (padrão)
  \ifthenelse{\equal{\imprimirsigladoppg}{PPGBIOTEC}}{\renewcommand{\logodoppg}{./PreTexto/Ilustracoes/logo-ppgbiotec}}{}%%
  \ifthenelse{\equal{\imprimirsigladoppg}{PPGCC}}{\renewcommand{\logodoppg}{./PreTexto/Ilustracoes/logo-ppgcc}}{}%%
  \ifthenelse{\equal{\imprimirsigladoppg}{PPGECT}}{\renewcommand{\logodoppg}{./PreTexto/Ilustracoes/logo-ppgect}}{}%%
  \ifthenelse{\equal{\imprimirsigladoppg}{PPGEE}}{\renewcommand{\logodoppg}{./PreTexto/Ilustracoes/logo-ppgee}}{}%%
  \ifthenelse{\equal{\imprimirsigladoppg}{PPGEM}}{\renewcommand{\logodoppg}{./PreTexto/Ilustracoes/logo-ppgem}}{}%%
  \ifthenelse{\equal{\imprimirsigladoppg}{PPGEP}}{\renewcommand{\logodoppg}{./PreTexto/Ilustracoes/logo-ppgep}}{}%%
  \ifthenelse{\equal{\imprimirsigladoppg}{PPGEQ}}{\renewcommand{\logodoppg}{./PreTexto/Ilustracoes/logo-ppgeq}}{}%%
  \rhead{%% Definição do cabeçalho direito
    \begin{minipage}[c][][c]{35mm}%% Ambiente minipage
      \flushright\includegraphics[width=30mm]{\logodoppg}%% Figura
    \end{minipage}
  }
  % \abntex@ifnotempty{\imprimiravisodeaprovacao}{\fancyfoot[C]{\ABNTEXfontereduzida\imprimiravisodeaprovacao}}%% Definição do rodapé
}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Folha de aprovação
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newcommand{\incluirfolhadeaprovacao}[1]{%% Formatação da folha de aprovação
  \ifthenelse{\equal{#1}{template}\or\equal{#1}{\par}}{
  \ifthenelse{\equal{\imprimirtipodedocumento}{Tese}\or\equal{\imprimirtipodedocumento}{Dissertação}}{%% Tese ou Dissertação
      \newcommand{\nomedafolhadeaprovacao}{Folha de Aprovação}%% Nome da folha de aprovação
    }{%% Trabalho de Conclusão de Curso
      \newcommand{\nomedafolhadeaprovacao}{Termo de Aprovação}%% Nome da folha de aprovação
      \@aprovacaoestiloppgfalse%% Folha de aprovação estilo padrão
    }%% Folha de aprovação do programa de pós-graduação no estilo do PPG ou no estilo padrão    
  \begin{folhadeaprovacao}%% Ambiente folhadeaprovacao
	\if@aprovacaoestiloppg%% Folha de aprovação do programa de pós-graduação no estilo do PPG
      \thispagestyle{folhadeaprovacaoppg}%% Cabeçalho da folha de aprovação
    \else%% Folha de aprovação do programa de pós-graduação no estilo padrão
      \thispagestyle{folhadeaprovacao}%% Cabeçalho da folha de aprovação
    \fi
    \vspace*{0.25\linha}%% Espaçamento vertical
    \begin{center}%% Texto centralizado
      {\bfseries\MakeUppercase{\nomedafolhadeaprovacao}}\\[\linha]%% Título do termo de aprovação
      \if@aprovacaoestiloppg%% Folha de aprovação do programa de pós-graduação no estilo do PPG
        Título da \imprimirtipodedocumento\ N\textsuperscript{o} \imprimirnumerodateseoudissertacao\\[\linha]%% Número
      \fi
      \MakeUppercase{\imprimirtituloemmultiplaslinhas}\\[0.5\linha]%% Título do documento
      por\\[0.5\linha]
      \ifthenelse{\equal{\imprimiratribuiautortres}{true}}%% Inserir 3 autores(as)
      {\MakeUppercase{\imprimirnomedoautor}\\%% Autor(a)
       \MakeUppercase{\imprimirnomedoautordois}\\%% Autor(a) 2
       \MakeUppercase{\imprimirnomedoautortres}\\[\linha]%% Autor(a) 3
      }{\ifthenelse{\equal{\imprimiratribuiautordois}{true}}%% Insere 2 autores(as)
      {\MakeUppercase{\imprimirnomedoautor}\\%% Autor(a)
       \MakeUppercase{\imprimirnomedoautordois}\\[\linha]%% Autor(a) 2
      }%%Insere 1 autor(a)
      {\MakeUppercase{\imprimirnomedoautor}\\[\linha]}
      }
    \end{center}
    \noindent\imprimirtextodeaprovacao%% Texto de aprovação
    \vspace*{0.25\linha}%% Espaçamento vertical
    \begin{center}%% Texto centralizado
      \if@linhasdeassinaturas\rule{70mm}{1pt}\else\rule{0mm}{0pt}\fi\\%% Linha de assinatura
      \ifthenelse{\equal{\imprimirmembroaigualorientador}{true}}{%% Membro A igual ao orientador
        {\ABNTEXfontereduzida\imprimirtitulodoorientador\ \imprimirnomedoorientador}\\%% Membro A
        {\ABNTEXfontereduzida\imprimiratribuicaoorientador}\\[\linha]%% Instituição do membro A (Atribuição "Orientador(a)")
      }{%% Membro A diferente do orientador
        {\ABNTEXfontereduzida\imprimirtitulodomembroa\ \imprimirmembroa}\\%% Membro A
        \ifthenelse{\equal{\imprimirtipodedocumento}{Trabalho de Conclusão de Curso}}%% Verificação do tipo de documento
          {\ABNTEXfontereduzida Membro Titular}%% Atribuição "Membro Titular"
          {\ABNTEXfontereduzida\imprimirinstituicaodomembroa}\\[\linha]%% Instituição do membro A
      }
      \if@pardeassinaturas%% Assinaturas na folha de aprovação em até duas colunas
        \begin{tabular}{cccc}%% Ambiente tabular
          \if@linhasdeassinaturas\rule{70mm}{1pt}\else\rule{0mm}{0pt}\fi & & &
          \if@linhasdeassinaturas\rule{70mm}{1pt}\else\rule{0mm}{0pt}\fi \\%% Linhas de assinaturas
          \parbox[t]{70mm}{\centering\ABNTEXfontereduzida\imprimirtitulodomembrob\ \imprimirmembrob} & & &
          \parbox[t]{70mm}{\centering\ABNTEXfontereduzida\imprimirtitulodomembroc\ \imprimirmembroc} \\
          \ifthenelse{\equal{\imprimirtipodedocumento}{Trabalho de Conclusão de Curso}}%% Verificação do tipo de documento
            {\ABNTEXfontereduzida Membro Titular}%% Atribuição "Membro Titular"
            {\ABNTEXfontereduzida\imprimirinstituicaodomembrob} & & &
          \ifthenelse{\equal{\imprimirtipodedocumento}{Trabalho de Conclusão de Curso}}%% Verificação do tipo de documento
            {\ABNTEXfontereduzida Membro Titular}%% Atribuição "Membro Titular"
            {\ABNTEXfontereduzida\imprimirinstituicaodomembroc} \\
        \end{tabular}\\[\linha]
      \else%% Uma coluna para as linhas de assinaturas
        \if@linhasdeassinaturas\rule{70mm}{1pt}\else\rule{0mm}{0pt}\fi\\%% Linha de assinatura
        {\ABNTEXfontereduzida\imprimirtitulodomembrob\ \imprimirmembrob}\\%% Membro B
        \ifthenelse{\equal{\imprimirtipodedocumento}{Trabalho de Conclusão de Curso}}%% Verificação do tipo de documento
          {\ABNTEXfontereduzida Membro Titular}%% Atribuição "Membro Titular"
          {\ABNTEXfontereduzida\imprimirinstituicaodomembrob}\\[0.5\linha]%% Instituição do membro B
        \if@linhasdeassinaturas\rule{70mm}{1pt}\else\rule{0mm}{0pt}\fi\\%% Linha de assinatura
        {\ABNTEXfontereduzida\imprimirtitulodomembroc\ \imprimirmembroc}\\%% Membro C
        \ifthenelse{\equal{\imprimirtipodedocumento}{Trabalho de Conclusão de Curso}}%% Verificação do tipo de documento
          {\ABNTEXfontereduzida Membro Titular}%% Atribuição "Membro Titular"
          {\ABNTEXfontereduzida\imprimirinstituicaodomembroc}\\[0.5\linha]%% Instituição do membro C
      \fi
      \ifthenelse{\equal{\imprimirtipodedocumento}{Tese}}{%% Membros adicionais para o tipo de documento Tese
        \if@pardeassinaturas%% Assinaturas na folha de aprovação em até duas colunas
          \begin{tabular}{cccc}%% Ambiente tabular
            \if@linhasdeassinaturas\rule{70mm}{1pt}\else\rule{0mm}{0pt}\fi & & &
            \if@linhasdeassinaturas\rule{70mm}{1pt}\else\rule{0mm}{0pt}\fi \\%% Linhas de assinaturas
            \parbox[t]{70mm}{\centering\ABNTEXfontereduzida\imprimirtitulodomembrod\ \imprimirmembrod} & & &
            \parbox[t]{70mm}{\centering\ABNTEXfontereduzida\imprimirtitulodomembroe\ \imprimirmembroe} \\
            {\ABNTEXfontereduzida\imprimirinstituicaodomembrod} & & &
            {\ABNTEXfontereduzida\imprimirinstituicaodomembroe} \\
            \ifthenelse{\equal{\imprimiratribuimembrof}{true}\OR\equal{\imprimiratribuimembrog}{true}}{%%
              \\[\linha]
              \ifthenelse{\equal{\imprimiratribuimembrof}{true}}%%
                {\if@linhasdeassinaturas\rule{70mm}{1pt}\else\rule{0mm}{0pt}\fi}{} & & &
              \ifthenelse{\equal{\imprimiratribuimembrog}{true}}%%
                {\if@linhasdeassinaturas\rule{70mm}{1pt}\else\rule{0mm}{0pt}\fi}{} \\%% Linhas de assinaturas
              \ifthenelse{\equal{\imprimiratribuimembrof}{true}}%%
                {\parbox[t]{70mm}{\centering\ABNTEXfontereduzida\imprimirtitulodomembrof\ \imprimirmembrof}}{} & & &
              \ifthenelse{\equal{\imprimiratribuimembrog}{true}}%%
                {\parbox[t]{70mm}{\centering\ABNTEXfontereduzida\imprimirtitulodomembrog\ \imprimirmembrog}}{} \\
              \ifthenelse{\equal{\imprimiratribuimembrof}{true}}%%
                {{\ABNTEXfontereduzida\imprimirinstituicaodomembrof}}{} & & &
              \ifthenelse{\equal{\imprimiratribuimembrog}{true}}%%
                {{\ABNTEXfontereduzida\imprimirinstituicaodomembrog}}{} \\
            }{}
          \end{tabular}\\[\linha]
        \else%% Uma coluna para as linhas de assinaturas
          \if@linhasdeassinaturas\rule{70mm}{1pt}\else\rule{0mm}{0pt}\fi\\%% Linha de assinatura
          {\ABNTEXfontereduzida\imprimirtitulodomembrod\ \imprimirmembrod}\\%% Membro D
          {\ABNTEXfontereduzida\imprimirinstituicaodomembrod}\\[0.5\linha]%% Instituição do membro D
          \if@linhasdeassinaturas\rule{70mm}{1pt}\else\rule{0mm}{0pt}\fi\\%% Linha de assinatura
          {\ABNTEXfontereduzida\imprimirtitulodomembroe\ \imprimirmembroe}\\%% Membro E
          {\ABNTEXfontereduzida\imprimirinstituicaodomembroe}\\[0.5\linha]%% Instituição do membro E
        \fi
      }{}%%
      \vspace*{\stretch{1}}%% Espaçamento vertical
      \ifthenelse{\equal{\imprimirtipodedocumento}{Trabalho de Conclusão de Curso}}{%% Assinaturas adicionais para TCC
        \begin{tabular}{cccc}%% Ambiente tabular
          \if@linhasdeassinaturas\rule{70mm}{1pt}\else\rule{0mm}{0pt}\fi & & &
          \if@linhasdeassinaturas\rule{70mm}{1pt}\else\rule{0mm}{0pt}\fi \\%% Linhas de assinaturas
          \parbox[t]{70mm}{\centering\ABNTEXfontereduzida\imprimirtitulodoresponsaveltcc\ \imprimirnomedoresponsaveltcc} & & &
          \parbox[t]{70mm}{\centering\ABNTEXfontereduzida\imprimirtitulodocoordenador\ \imprimirnomedocoordenador} \\
          {\ABNTEXfontereduzida Responsável pelos TCC} & & &
          {\ABNTEXfontereduzida\imprimiratribuicaocoordenador\ do Curso} \\
%           \parbox[t]{70mm}{\centering\ABNTEXfontereduzida Responsável pelos Trabalhos} & & &
%           \parbox[t]{70mm}{\centering\ABNTEXfontereduzida\imprimiratribuicaocoordenador\ do Curso de} \\
%           {\ABNTEXfontereduzida de Conclusão de Curso} & & &
%           {\ABNTEXfontereduzida\imprimircurso} \\
        \end{tabular}\\
      }{%% Assinaturas adicionais para Tese e Dissertação
        \if@linhasdeassinaturas\rule{70mm}{1pt}\else\rule{0mm}{0pt}\fi\\%% Linha de assinatura
        {\ABNTEXfontereduzida\imprimirtitulodocoordenador\ \imprimirnomedocoordenador}\\%% Título e nome do(a) coordenador(a)
        {\ABNTEXfontereduzida\imprimiratribuicaocoordenador\ do \imprimirsigladoppg}\\%% Coordenador(a) do PPG
%         {\ABNTEXfontereduzida\imprimiratribuicaocoordenador\ do Programa de}\\%% Coordenador(a) do Programa de
%         {\ABNTEXfontereduzida Pós-Graduação em \imprimircurso}\\%% Pós-Graduação em "nome do curso"
      }
      % \vspace*{3\linha}%% Espaçamento vertical
      \vfill%% Espaçamento vertical
      \abntex@ifnotempty{\imprimiravisodeaprovacao}{\ABNTEXfontereduzida\imprimiravisodeaprovacao}%% Definição do rodapé
    \end{center}
  \end{folhadeaprovacao}
  \cleardoublepage
  }{%% path to file
	\includepdf[pages=1]{#1}%1
	\cleardoublepage
  }
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Dedicatória
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\let\dedicatoriaoriginal\dedicatoria%% Formatação do ambiente dedicatoria (original)
\renewenvironment{dedicatoria}{%% Formatação do ambiente dedicatoria
  \begin{dedicatoriaoriginal}%% Ambiente dedicatoria (original)
	%% Espaçamento vertical antes da dedicatoria   
    %\vspace*{0.6\textheight}%%Começa após 60% da altura
    \vspace*{\fill}%%Ou alinha o texto para baixo na folha
	    
    \begin{flushright}%% Alinhamento à direita
      \begin{minipage}{0.5\textwidth}%% Caixa de texto
        \raggedleft
}{%%
      \end{minipage}
    \end{flushright}
    \vspace*{0.05\textheight}%% Espaçamento após texto
  \end{dedicatoriaoriginal}
  \cleardoublepage%% Página de verso
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Epígrafe
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\let\epigrafeoriginal\epigrafe%% Formatação do ambiente epigrafe (original)
\renewenvironment{epigrafe}{%% Formatação do ambiente epigrafe
  \begin{epigrafeoriginal}%% Ambiente epigrafe (original)
	%% Espaçamento vertical antes da dedicatoria   
    %\vspace*{0.6\textheight}%%Começa após 60% da altura
    \vspace*{\fill}%%Ou alinha o texto para baixo na folha    
    \begin{flushright}%% Alinhamento à direita
      \begin{minipage}{0.5\textwidth}%% Caixa de texto
        \raggedleft
}{%%
      \end{minipage}
    \end{flushright}
    \vspace*{0.05\textheight}%% Espaçamento após texto
  \end{epigrafeoriginal}
  \cleardoublepage%% Página de verso
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Resumo
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\AtBeginDocument{%% Definições carregadas no início do documento
  \renewcommand{\abstracttextfont}{\normalfont\normalsize}%% Fonte do texto do resumo
  \setlength{\absleftindent}{0pt}%% Recuo esquerdo do resumo
  \setlength{\absrightindent}{0pt}%% Recuo direito do resumo
  \setlength{\absparindent}{0pt}%% Recuo dos parágrafos do resumo
  \setlength{\absparsep}{\linha}%% Espaçamento entre parágrafos
  \setlength{\abstitleskip}{1.25\linha}%% Espaçamento após o título do resumo
}
\newenvironment{resumoutfpr}{%% Formatação do ambiente resumoutfpr
  \begin{resumo}[\nomeresumo]%% Ambiente resumo
    \begin{Spacing}{1.0}%% Espaçamento simples entre linhas
      \begin{flushleft}%% Alinhamento à esquerda
        \MakeUppercase{\imprimirsobrenomedoautor}, \imprimirprenomedoautor
		\ifthenelse{\equal{\imprimiratribuiautordois}{true}}%% 2 autores?
        {; \MakeUppercase{\imprimirsobrenomedoautordois}, \imprimirprenomedoautordois%
        \ifthenelse{\equal{\imprimiratribuiautortres}{true}}%% 3 autores?
        {; \MakeUppercase{\imprimirsobrenomedoautortres}, \imprimirprenomedoautortres.}
        {.}}{.}
        \ifthenelse{\equal{\imprimiratribuicotutela}{false}}{%%
        {\bfseries\imprimirtitulododocumento\unskip}. {\imprimirano}. \pageref{LastPage}~f. \imprimirtipodedocumento\ (\imprimirniveldeformacao\ em \imprimircurso) -- \imprimirinstituicao. \imprimircidade, \imprimirano.%%
        }{%% Cotutela
		{\bfseries\imprimirtitulododocumento\unskip}. {\imprimirano}. \pageref{LastPage}~f. \imprimirtipodedocumento\ (\imprimirniveldeformacaoresumo\ em \imprimircurso\ e \imprimircursocotutela) -- \imprimirinstituicao\ e \imprimirinstituicaocotutela. \imprimircidade, \imprimirano.%%
        }
      \end{flushleft}
}{%%
      \par\textbf{\nomepalavraschave:}
      \ifthenelse{\imprimirnumerodepalavraschave > 0}{\imprimirpalavrachavea}{}%%
      \ifthenelse{\imprimirnumerodepalavraschave > 1}{. \imprimirpalavrachaveb}{}%%
      \ifthenelse{\imprimirnumerodepalavraschave > 2}{. \imprimirpalavrachavec}{}%%
      \ifthenelse{\imprimirnumerodepalavraschave > 3}{. \imprimirpalavrachaved}{}%%
      \ifthenelse{\imprimirnumerodepalavraschave > 4}{. \imprimirpalavrachavee}{}%%
      \ifthenelse{\imprimirnumerodepalavraschave > 0}{.}{}%%
    \end{Spacing}
  \end{resumo}
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Abstract
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newenvironment{abstractutfpr}{%% Formatação do ambiente abstractutfpr
  \begin{resumo}[\nomeabstract]%% Ambiente resumo (abstract)
    \begin{Spacing}{1.0}%% Espaçamento simples entre linhas
      \begin{flushleft}%% Alinhamento à esquerda
      \MakeUppercase{\imprimirsobrenomedoautor}, \imprimirprenomedoautor
	  \ifthenelse{\equal{\imprimiratribuiautordois}{true}}%% 2 autores?
      {; \MakeUppercase{\imprimirsobrenomedoautordois}, \imprimirprenomedoautordois%
      \ifthenelse{\equal{\imprimiratribuiautortres}{true}}%% 3 autores?
      {; \MakeUppercase{\imprimirsobrenomedoautortres}, \imprimirprenomedoautortres.}
      {.}}{.} 
      \ifthenelse{\equal{\imprimiratribuicotutela}{false}}{%%
        {\bfseries\imprimirdocumenttitle\unskip}. \imprimirano. \pageref{LastPage}~p. \imprimirdocumenttype\ (\imprimirformationlevel\ in
        \imprimircourse) -- \imprimirinstitution. \imprimircidade, \imprimirano.%%
        }{%% Cotutela
		{\bfseries\imprimirdocumenttitle\unskip}. \imprimirano. \pageref{LastPage}~p. \imprimirdocumenttype\ (\imprimirformationlevelabstract\ in
        \imprimircourse\ and \imprimircoursecotutela) -- \imprimirinstitution\ and \imprimirinstitutioncotutela. \imprimircidade, \imprimirano.
        }
      \end{flushleft}
}{%%
      \par\textbf{\nomekeywords:}
      \ifthenelse{\imprimirnumerodekeywords > 0}{\imprimirkeyworda}{}%%
      \ifthenelse{\imprimirnumerodekeywords > 1}{. \imprimirkeywordb}{}%%
      \ifthenelse{\imprimirnumerodekeywords > 2}{. \imprimirkeywordc}{}%%
      \ifthenelse{\imprimirnumerodekeywords > 3}{. \imprimirkeywordd}{}%%
      \ifthenelse{\imprimirnumerodekeywords > 4}{. \imprimirkeyworde}{}%%
      \ifthenelse{\imprimirnumerodekeywords > 0}{.}{}%%
    \end{Spacing}
  \end{resumo}
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Lista de algoritmos
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newlistof{listofalgorithms}{loa}{\listalgorithmname}%% Lista de objetos flutuantes (algoritmos)
\newlistentry{algorithm}{loa}{0}%% Entrada da lista de objetos flutuantes (algoritmo)
\newfloat{algorithm}{loa}{\algorithmname}%% Objeto flutuante (algoritmo)
\renewcommand{\cftalgorithmname}{\algorithmname\space}%% Nome da entrada na lista de objetos flutuantes (algoritmo)
\renewcommand*{\cftalgorithmaftersnum}{~~--~~}%% Conteúdo após a entrada na lista de objetos flutuantes (algoritmo)
\renewcommand{\afterloatitle}{\afterchaptertitle\vspace*{0.5\linha}}%% Espaçamento após o título da lista (algoritmo)
\setfloatadjustment{algorithm}{\centering}%% Ajuste do objeto flutuante (algoritmo)
\AtBeginEnvironment{algorithmic}{\ABNTEXfontereduzida}%% Formatação do ambiente algorithmic
\newcommand{\incluirlistadealgoritmos}{%% Definição do comando para inclusão da lista de algoritmos
  \pdfbookmark[0]{\listalgorithmname}{loa}%% Marcador
  \begin{Spacing}{1.0}%% Espaçamento simples entre linhas
    \listofalgorithms*%% Impressão da lista de algoritmos
  \end{Spacing}
  \cleardoublepage%% Página de verso
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Lista de ilustrações
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% \renewcommand{\cftfigurename}{\figurename\space}%% Nome da entrada na lista de objetos flutuantes (figura)
\renewcommand*{\cftfigureaftersnum}{~~--~~}%% Conteúdo após a entrada na lista de objetos flutuantes (figura)
\renewcommand{\afterloftitle}{\afterchaptertitle\vspace*{0.5\linha}}%% Espaçamento após o título da lista (figura)
\setfloatadjustment{figure}{\centering}%% Ajuste do objeto flutuante (figura)
\newlistof{listofphotographs}{lop}{}%% Lista de objetos flutuantes (fotografia)
\newlistentry{photograph}{lop}{0}%% Entrada da lista de objetos flutuantes (fotografia)
\newfloat{photograph}{lop}{\photographname}%% Objeto flutuante (fotografia)
\renewcommand{\cftphotographname}{\photographname\space}%% Nome da entrada na lista de objetos flutuantes (fotografia)
\renewcommand*{\cftphotographaftersnum}{~~--~~}%% Conteúdo após a entrada na lista de objetos flutuantes (fotografia)
\renewcommand{\afterloptitle}{}%% Espaçamento após o título da lista (fotografia)
\setfloatadjustment{photograph}{\centering}%% Ajuste do objeto flutuante (fotografia)
\newlistof{listofgraphs}{loh}{}%% Lista de objetos flutuantes (gráfico)
\newlistentry{graph}{loh}{0}%% Entrada da lista de objetos flutuantes (gráfico)
\newfloat{graph}{loh}{\graphname}%% Objeto flutuante (gráfico)
\renewcommand{\cftgraphname}{\graphname\space}%% Nome da entrada na lista de objetos flutuantes (gráfico)
\renewcommand*{\cftgraphaftersnum}{~~--~~}%% Conteúdo após a entrada na lista de objetos flutuantes (gráfico)
\renewcommand{\afterlohtitle}{}%% Espaçamento após o título da lista (gráfico)
\setfloatadjustment{graph}{\centering}%% Ajuste do objeto flutuante (gráfico)
\newlistof{listoftabframeds}{lod}{}%% Lista de objetos flutuantes (quadro)
\newlistentry{tabframed}{lod}{0}%% Entrada da lista de objetos flutuantes (quadro)
\newfloat{tabframed}{lod}{\tabframedname}%% Objeto flutuante (quadro)
\renewcommand{\cfttabframedname}{\tabframedname\space}%% Nome da entrada na lista de objetos flutuantes (quadro)
\renewcommand*{\cfttabframedaftersnum}{~~--~~}%% Conteúdo após a entrada na lista de objetos flutuantes (quadro)
\renewcommand{\afterlodtitle}{}%% Espaçamento após o título da lista (quadro)
\setfloatadjustment{tabframed}{\centering}%% Ajuste do objeto flutuante (quadro)
\newcommand{\incluirlistadeilustracoes}{%% Definição do comando para inclusão da lista de ilustrações
  \pdfbookmark[0]{\listfigurename}{lof}%% Marcador
  \begin{Spacing}{1.0}%% Espaçamento simples entre linhas
    \listoffigures*%% Impressão da lista de figuras
    \listofphotographs*%% Impressão da lista de fotografias
    \listofgraphs*%% Impressão da lista de gráficos
    \listoftabframeds*%% Impressão da lista de quadros
  \end{Spacing}
  \cleardoublepage%% Página de verso
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Lista de tabelas
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% \renewcommand{\cfttablename}{\tablename\space}%% Nome da entrada na lista de objetos flutuantes (tabela)
\renewcommand*{\cfttableaftersnum}{~~--~~}%% Conteúdo após a entrada na lista de objetos flutuantes (tabela)
\renewcommand{\afterlottitle}{\afterchaptertitle\vspace*{0.5\linha}}%% Espaçamento após o título da lista (tabela)
\setfloatadjustment{table}{\centering}%% Ajuste do objeto flutuante (tabela)
\AtBeginEnvironment{tabular}{\ABNTEXfontereduzida}%% Formatação do ambiente tabular
\AtBeginEnvironment{tabularx}{\ABNTEXfontereduzida}%% Formatação do ambiente tabularx
\AtBeginEnvironment{longtable}{\linespread{1}\ABNTEXfontereduzida}%% Formatação do ambiente longtable
%\setlength\LTcapwidth{\textwidth}%% Largura do \parbox contendo a legenda do ambiente longtable
%\setlength\LTleft{0pt}%% Largura da margem esquerda do ambiente longtable
%\setlength\LTright{0pt}%% Largura da margem direita do ambiente longtable
\newcommand{\incluirlistadetabelas}{%% Definição do comando para inclusão da lista de tabelas
  \pdfbookmark[0]{\listtablename}{lot}%% Marcador
  \begin{Spacing}{1.0}%% Espaçamento simples entre linhas
    \listoftables*%% Impressão da lista de tabelas
  \end{Spacing}
  \cleardoublepage%% Página de verso
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Lista de abreviaturas, siglas e acrônimos 
%%(configuração do arquivo ./PreTexto/file-acronimos.tex)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newcommand{\listadeabrevsiglaseacr}{%% Formatação da lista de abreviaturas, siglas e acrônimos
  \pretextualchapter{\nomelistadeacronimos}%% Estilo da página e marcador
  \vspace*{7.5pt}%% Espaçamento vertical
}
\newenvironment{listadeabreviaturas}{%% Formatação do ambiente listadeabreviaturas
  \begin{Spacing}{1.0}%% Espaçamento simples entre linhas
    \section*{\nomeabreviaturas}%% Seção abreviaturas
    \begin{xtabular}{@{}p{25mm}@{}p{135mm}@{}}%% Ambiente xtabular
}{%%
    \end{xtabular}
  \end{Spacing}
  \vspace*{0pt}%% Espaçamento vertical
}
\newenvironment{listadesiglas}{%% Formatação do ambiente listadesiglas
  \begin{Spacing}{1.0}%% Espaçamento simples entre linhas
    \section*{\nomesiglas}%% Seção siglas
    \begin{xtabular}{@{}p{25mm}@{}p{135mm}@{}}%% Ambiente xtabular
}{%%
    \end{xtabular}
  \end{Spacing}
  \vspace*{0pt}%% Espaçamento vertical
}
\newenvironment{listadeacronimos}{%% Formatação do ambiente listadeacronimos
  \begin{Spacing}{1.0}%% Espaçamento simples entre linhas
    \section*{\nomeacronimos}%% Seção acrônimos
    \begin{xtabular}{@{}p{25mm}@{}p{135mm}@{}}%% Ambiente xtabular
}{%%
    \end{xtabular}
  \end{Spacing}
  \vspace*{0pt}%% Espaçamento vertical
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Lista de abreviaturas, siglas e acrônimos 
%% (configuração do pacote glossaries)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newcommand{\pseudoacronymtype}{sigla}%% Tipo de acrônimo (sigla)
\newcommand{\abbreviationtype}{abreviatura}%% Tipo de acrônimo (abreviatura)
\newglossary[alg2]{\pseudoacronymtype}{acr2}{acn2}{\nomesiglas}%% Subtipo de glossário (siglas)
\newglossary[alg3]{\abbreviationtype}{acr3}{acn3}{\nomeabreviaturas}%% Subtipo de glossário (abreviaturas)
\newcommand{\imprimirlistadeacronimos}{%% Definição do comando para inclusão da lista de abreviaturas, siglas e acrônimos
  \newglossarystyle{myxtab}{%% Estilo de glossário personalizado
    \glossarystyle{long}%% Estilo de glossário base
    \renewcommand*{\glossaryheader}{}%% Conteúdo do cabeçalho do glossário
    \renewcommand*{\glsgroupheading}[1]{}%% Conteúdo do cabeçalho de itens no glossário
    \renewcommand*{\glsgroupskip}{}%% Espaçamento entre itens
    \renewcommand*{\glspostdescription}{}%% Remoção do ponto no final das descrições do glossário
    \renewcommand*{\glossarypreamble}{\vspace*{0pt}}%% Definição de comandos antes do glossário
    \renewcommand*{\glossarypostamble}{\vspace*{0pt}}%% Definição de comandos após o glossário
    \setglossarysection{section}%% Estilo de seção do glossário
    \setlength{\glsdescwidth}{135mm}%% Comprimento da descrição
    \setlength{\glspagelistwidth}{0pt}%% Comprimento da lista de páginas
    \renewenvironment{theglossary}{%% Formatação do glossário
      \begin{Spacing}{1.0}%% Espaçamento simples entre linhas
        \begin{xtabular}{@{}p{25mm}@{}p{\glsdescwidth}@{}}%% Ambiente xtabular
    }{%%
        \end{xtabular}
      \end{Spacing}
    }
  }
  \pretextualchapter{\nomelistadeacronimos}%% Marcador
  \printglossary[type=\abbreviationtype, title = \nomeabreviaturas, style = myxtab, nonumberlist = true]%% Lista de abreviaturas
  \printglossary[type = \pseudoacronymtype, title = \nomesiglas, style = myxtab, nonumberlist = true]%% Lista de siglas
  \printglossary[type = \acronymtype, title = \nomeacronimos, style = myxtab, nonumberlist = true ]%% Lista de acrônimos
  \cleardoublepage%% Página de verso
}
\newcommand{\abreviatura}[3]{\newacronym[type=\abbreviationtype]{#1}{#2}{#3}}%% Entrada de abreviatura
\newcommand{\sigla}[3]{\newacronym[type=\pseudoacronymtype]{#1}{#2}{#3}}%% Entrada de sigla
\newcommand{\acronimo}[3]{\newacronym[type=\acronymtype]{#1}{#2}{#3}}%% Entrada de acrônimo

%% Lista de abreviaturas, siglas e acrônimos
\newcommand{\incluirlistadeacronimos}[1]{%% Definição do comando para inclusão da lista de abreviaturas, siglas e acrônimos
  \ifthenelse{\equal{#1}{file}}{%% Lista de abreviaturas, siglas e acrônimos usando arquivo
    \include{./PreTexto/file-acronimos}%% Impressão da lista de abreviaturas, siglas e acrônimos
    \cleardoublepage%% Página de verso
  }{%%
    \ifthenelse{\equal{#1}{glossaries}}{%% Lista de abreviaturas, siglas e acrônimos através do pacote glossaries
      \imprimirlistadeacronimos%% Impressão da lista de abreviaturas, siglas e acrônimos
    }{}%% Desativa lista de abreviaturas, siglas e acrônimos
  }
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Lista de símbolos 
%% (configuração do arquivo ./PreTexto/file-simbolos.tex)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newcommand{\unidade}[1]{\SI{}{[#1]}}%% Formatação da unidade na lista de símbolos
\newcommand{\listadesimbolos}{%% Formatação da lista de símbolos
  \pretextualchapter{\nomelistadesimbolos}%% Estilo da página e marcador
  \vspace*{7.5pt}%% Espaçamento vertical
}
\newenvironment{listadeletraslatinas}{%% Formatação do ambiente listadeletraslatinas
  \begin{Spacing}{1.0}%% Espaçamento simples entre linhas
    \section*{\nomeletraslatinas}%% Seção letras latinas
    \begin{xtabular}{@{}p{25mm}@{}p{110mm}@{}>{\hspace*{\fill}}p{25mm}}%% Ambiente xtabular
}{%%
    \end{xtabular}
  \end{Spacing}
  \vspace*{0pt}%% Espaçamento vertical
}
\newenvironment{listadeletrasgregas}{%% Formatação do ambiente listadeletrasgregas
  \begin{Spacing}{1.0}%% Espaçamento simples entre linhas
    \section*{\nomeletrasgregas}%% Seção letras gregas
    \begin{xtabular}{@{}p{25mm}@{}p{110mm}@{}>{\hspace*{\fill}}p{25mm}}%% Ambiente xtabular
}{%%
    \end{xtabular}
  \end{Spacing}
  \vspace*{0pt}%% Espaçamento vertical
}
\newenvironment{listadesobrescritos}{%% Formatação do ambiente listadesobrescritos
  \begin{Spacing}{1.0}%% Espaçamento simples entre linhas
    \section*{\nomesobrescritos}%% Seção sobrescritos
    \begin{xtabular}{@{}p{25mm}@{}p{110mm}@{}>{\hspace*{\fill}}p{25mm}}%% Ambiente xtabular
}{%%
    \end{xtabular}
  \end{Spacing}
  \vspace*{0pt}%% Espaçamento vertical
}
\newenvironment{listadesubscritos}{%% Formatação do ambiente listadesubscritos
  \begin{Spacing}{1.0}%% Espaçamento simples entre linhas
    \section*{\nomesubscritos}%% Seção subscritos
    \begin{xtabular}{@{}p{25mm}@{}p{110mm}@{}>{\hspace*{\fill}}p{25mm}}%% Ambiente xtabular
}{%%
    \end{xtabular}
  \end{Spacing}
  \vspace*{0pt}%% Espaçamento vertical
}
\newenvironment{listadenotacoes}{%% Formatação do ambiente listadenotacoes
  \begin{Spacing}{1.0}%% Espaçamento simples entre linhas
    \section*{\nomenotacoes}%% Seção notações
    \begin{xtabular}{@{}p{25mm}@{}p{110mm}@{}>{\hspace*{\fill}}p{25mm}}%% Ambiente xtabular
}{%%
    \end{xtabular}
  \end{Spacing}
  \vspace*{0pt}%% Espaçamento vertical
}

\newenvironment{listadeindicessets}{%% Formatação do ambiente listadeindicessets
  \begin{Spacing}{1.0}%% Espaçamento simples entre linhas
    \section*{\nomeindicessets}%% Seção notações
    \begin{xtabular}{@{}p{25mm}@{}p{110mm}@{}>{\hspace*{\fill}}p{25mm}}%% Ambiente xtabular
}{%%
    \end{xtabular}
  \end{Spacing}
  \vspace*{0pt}%% Espaçamento vertical
}

\newenvironment{listadeparam}{%% Formatação do ambiente listadeparam
  \begin{Spacing}{1.0}%% Espaçamento simples entre linhas
    \section*{\nomeparam}%% Seção notações
    \begin{xtabular}{@{}p{25mm}@{}p{110mm}@{}>{\hspace*{\fill}}p{25mm}}%% Ambiente xtabular
}{%%
    \end{xtabular}
  \end{Spacing}
  \vspace*{0pt}%% Espaçamento vertical
}

\newenvironment{listadefloatvar}{%% Formatação do ambiente listadefloatvar
  \begin{Spacing}{1.0}%% Espaçamento simples entre linhas
    \section*{\nomefloatvar}%% Seção notações
    \begin{xtabular}{@{}p{25mm}@{}p{110mm}@{}>{\hspace*{\fill}}p{25mm}}%% Ambiente xtabular
}{%%
    \end{xtabular}
  \end{Spacing}
  \vspace*{0pt}%% Espaçamento vertical
}

\newenvironment{listadeintvar}{%% Formatação do ambiente listadeintvar
  \begin{Spacing}{1.0}%% Espaçamento simples entre linhas
    \section*{\nomeintvar}%% Seção notações
    \begin{xtabular}{@{}p{25mm}@{}p{110mm}@{}>{\hspace*{\fill}}p{25mm}}%% Ambiente xtabular
}{%%
    \end{xtabular}
  \end{Spacing}
  \vspace*{0pt}%% Espaçamento vertical
}

\newenvironment{listadebinvar}{%% Formatação do ambiente listadebinvar
  \begin{Spacing}{1.0}%% Espaçamento simples entre linhas
    \section*{\nomebinvar}%% Seção notações
    \begin{xtabular}{@{}p{25mm}@{}p{110mm}@{}>{\hspace*{\fill}}p{25mm}}%% Ambiente xtabular
}{%%
    \end{xtabular}
  \end{Spacing}
  \vspace*{0pt}%% Espaçamento vertical
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Lista de símbolos 
%% (configuração do pacote nomencl)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newlength{\rmnomlabel}%% Escala espaçamento do rótulo de símbolo
\setlength{\nomlabelwidth}{30mm}%% Largura do rótulo do símbolo
\setlength{\rmnomlabel}{\nomlabelwidth+\labelsep}%% Tamanho da escala espaçamento do rótulo de símbolo
\setlength{\nomitemsep}{0pt}%% Tamanho do espaçamento entre itens da lista de símbolo
\newcommand{\nomunit}[1]{\abntex@ifnotempty{#1}{\renewcommand{\nomentryend}{\hspace*{\fill}\SI{}{[#1]}}}}%% Unidade do símbolo
\renewcommand{\nomgroup}[1]{%% Grupos de símbolos
  \ifthenelse{\equal{#1}{A}}{\item[\normalfont\normalsize\MakeUppercase{\nomeletraslatinas}]}%% Letras latinas
    {\ifthenelse{\equal{#1}{B}}{\item[\normalfont\normalsize\MakeUppercase{\nomeletrasgregas}]}%% Letras gregas
      {\ifthenelse{\equal{#1}{C}}{\item[\normalfont\normalsize\MakeUppercase{\nomesobrescritos}]}%% Sobrescritos
        {\ifthenelse{\equal{#1}{D}}{\item[\normalfont\normalsize\MakeUppercase{\nomesubscritos}]}%% Subscritos
          {\ifthenelse{\equal{#1}{E}}{\item[\normalfont\normalsize\MakeUppercase{\nomenotacoes}]}%% Notações
            {\ifthenelse{\equal{#1}{F}}{\item[\normalfont\normalsize\MakeUppercase{\nomeindicessets}]}%% Notações indices e conjuntos
          	  {\ifthenelse{\equal{#1}{G}}{\item[\normalfont\normalsize\MakeUppercase{\nomeparam}]}%% Notações de parametros
          	    {\ifthenelse{\equal{#1}{H}}{\item[\normalfont\normalsize\MakeUppercase{\nomefloatvar}]}%% Notações de variaveis continuas
	       	      {\ifthenelse{\equal{#1}{I}}{\item[\normalfont\normalsize\MakeUppercase{\nomeintvar}]}%% Notações de variaveis inteiras
          	        {\ifthenelse{\equal{#1}{J}}{\item[\normalfont\normalsize\MakeUppercase{\nomebinvar}]}%% Notações de variaveis binarias
            {}}}}}}}}}\vspace*{22pt}} %espacamento do ultimo elemento da lista
  \item[]\vspace*{0pt} %espacamento entre o titulo e o primeiro elemento da lista
}
\renewcommand{\thenomenclature}{%% Inicialização da formatação da lista de símbolos
  \pretextualchapter{\nomelistadesimbolos}%% Estilo da página e marcador
  \vspace*{12pt}%% Espaçamento vertical
  \nompreamble%% Pré-texto da nomeclatura
  \begin{Spacing}{0.5}%% Espaçamento simples entre linhas
  \list{}{%% Estilo da lista de itens
    \labelwidth\nom@tempdim
    \leftmargin\labelwidth
    \advance\leftmargin\labelsep
    \itemsep\nomitemsep
    \let\makelabel\nomlabel
  }
}
\renewcommand{\endthenomenclature}{%% Finalização da formatação da lista de símbolos
  \endlist
  \nompostamble%% Pós-Texto da nomeclatura
  \end{Spacing}
  \cleardoublepage%% Página de verso
}
\newcommand{\letralatina}[4]{\nomenclature[A#1]{$#2$}{#3 \nomunit{#4}}}%% Entrada de letra latina
\newcommand{\letragrega}[4]{\nomenclature[B#1]{$#2$}{#3 \nomunit{#4}}}%% Entrada de letra grega
\newcommand{\sobrescrito}[4]{\nomenclature[C#1]{$#2$}{#3 \nomunit{#4}}}%% Entrada de sobrescrito
\newcommand{\subscrito}[4]{\nomenclature[D#1]{$#2$}{#3 \nomunit{#4}}}%% Entrada de subscrito
\newcommand{\notacao}[4]{\nomenclature[E#1]{$#2$}{#3 \nomunit{#4}}}%% Entrada de notação
\newcommand{\notacaois}[4]{\nomenclature[F#1]{$#2$}{#3 \nomunit{#4}}}%% Entrada de indices e sets
\newcommand{\notacaoparam}[4]{\nomenclature[G#1]{$#2$}{#3 \nomunit{#4}}}%% Entrada de parametros
\newcommand{\notacaofloatvar}[4]{\nomenclature[H#1]{$#2$}{#3 \nomunit{#4}}}%% Entrada de var continua
\newcommand{\notacaointvar}[4]{\nomenclature[I#1]{$#2$}{#3 \nomunit{#4}}}%% Entrada de var inteira
\newcommand{\notacaobinvar}[4]{\nomenclature[J#1]{$#2$}{#3 \nomunit{#4}}}%% Entrada de var binaria

%% Lista de símbolos
\newcommand{\incluirlistadesimbolos}[1]{%% Definição do comando para inclusão da lista de símbolos
  \ifthenelse{\equal{#1}{file}}{%% Lista de símbolos usando arquivo
    \include{./PreTexto/file-simbolos}%% Impressão da lista de símbolos
    \cleardoublepage%% Página de verso
  }{%%
    \ifthenelse{\equal{#1}{nomencl}}{%% Lista de símbolos através do pacote nomencl
      \printnomenclature%% Impressão da lista de símbolos
    }{}%% Desativa lista de símbolos
  }
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Sumário
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\settocpreprocessor{part}{%% Título da parte no sumário em letras maíusculas
  \let\tempf@rtoc\f@rtoc\def\f@rtoc{\texorpdfstring{\MakeTextUppercase{\tempf@rtoc}}{\tempf@rtoc}}%%
}
\settocpreprocessor{chapter}{%% Título do capítulo no sumário em letras maíusculas
  \let\tempf@rtoc\f@rtoc\def\f@rtoc{\texorpdfstring{\MakeTextUppercase{\tempf@rtoc}}{\tempf@rtoc}}%%
}
\let\oldcontentsline\contentsline%% Título da seção no sumário em letras maíusculas
\def\contentsline#1#2{%%
  \expandafter\ifx\csname l@#1\endcsname\l@section\expandafter\@firstoftwo\else\expandafter\@secondoftwo\fi%%
  {\oldcontentsline{#1}{\MakeTextUppercase{#2}}}{\oldcontentsline{#1}{#2}}%%
}
\renewcommand{\cftpartfont}{\normalfont\normalsize\bfseries}%% Estilo da parte no sumário
\renewcommand{\cftchapterfont}{\normalfont\normalsize\bfseries}%% Estilo do capítulo no sumário
\renewcommand{\cftsectionfont}{\normalfont\normalsize\scshape}%% Estilo da seção no sumário
\renewcommand{\cftsubsectionfont}{\normalfont\normalsize}%% Estilo da subseção no sumário
\renewcommand{\cftsubsubsectionfont}{\normalfont\normalsize}%% Estilo da subsubseção no sumário
\renewcommand{\cftparagraphfont}{\normalfont\normalsize\itshape}%% Estilo do parágrafo no sumário
\renewcommand{\cftsubparagraphfont}{\normalfont\normalsize}%% Estilo do subparágrafo no sumário
\renewcommand{\cftpartpagefont}{\normalfont\normalsize\bfseries}%% Estilo da página da parte no sumário
\renewcommand{\cftchapterpagefont}{\normalfont\normalsize\bfseries}%% Estilo da página do capítulo no sumário
\renewcommand{\cftsectionpagefont}{\normalfont\normalsize}%% Estilo da página da seção no sumário
\renewcommand{\cftsubsectionpagefont}{\normalfont\normalsize}%% Estilo da página da subseção no sumário
\renewcommand{\cftsubsubsectionpagefont}{\normalfont\normalsize}%% Estilo da página da subsubseção no sumário
\renewcommand{\cftparagraphpagefont}{\normalfont\normalsize}%% Estilo da página do parágrafo no sumário
\renewcommand{\cftsubparagraphpagefont}{\normalfont\normalsize}%% Estilo da página do subparágrafo no sumário
\if@semrecuonosumario%% Remoção do recuo dos itens no sumário
  \setlength{\cftpartindent}{0pt}%% Recuo do título da parte
  \setlength{\cftchapterindent}{0pt}%% Recuo do título do capítulo
  \setlength{\cftsectionindent}{0pt}%% Recuo do título da seção
  \setlength{\cftsubsectionindent}{0pt}%% Recuo do título da subseção
  \setlength{\cftsubsubsectionindent}{0pt}%% Recuo do título da subsubseção
  \setlength{\cftparagraphindent}{0pt}%% Recuo do título do parágrafo
  \setlength{\cftsubparagraphindent}{0pt}%% Recuo do título do subparágrafo
\fi
\setlength{\cftbeforepartskip}{2em\@plus\p@}%% Remoção de espaço adicional antes de uma parte nas listas
\setlength{\cftbeforechapterskip}{1em\@plus\p@}%% Remoção de espaço adicional antes de um capítulo nas listas
\renewcommand*{\insertchapterspace}{}%% Remoção do espaço vertical de um capítulo nas listas
\renewcommand{\aftertoctitle}{\afterchaptertitle\vspace*{-0.25\linha}}%% Espaçamento após o título do sumário
\newcommand{\incluirsumario}{%% Definição do comando para inclusão do sumário
  \pdfbookmark[0]{\contentsname}{toc}%% Marcador
  \begin{Spacing}{1.0}%% Espaçamento simples entre linhas
    \tableofcontents*%% Impressão do sumário
  \end{Spacing}
  \cleardoublepage%% Página de verso
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Referências
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\let\arquivosdereferencias\bibliography%% Arquivos da lista de referências
\renewcommand{\prebibhook}{\vspace*{0.5\linha}}%% Conteúdo após o título da lista de referências
\renewcommand{\bibsection}{%% Formatação da lista de referências
  \chapter*{\bibname}
  \bibmark
  \ifnobibintoc\else
    \phantomsection
    \addcontentsline{toc}{chapter}{\texorpdfstring{\uppercase{\bibname}}{\bibname}}%% Adição da lista de referências ao sumário
  \fi
  \prebibhook
}
%NBR6023/2018: única linha entre referências (antes era 1.5)
\setlength{\bibitemsep}{1\linha}%% Espaçamento entre itens da lista de referências

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Glossário
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\renewcommand*{\glsseeformat}[3][\seename]{{#1}\space\glsseelist{#2}.}%% Formatação do texto "veja..." no glossário
\newcommand{\incluirglossario}{%% Definição do comando para inclusão do glossário
  \setlength{\glstreeindent}{\parindent}%% Recuo dos itens do glossário
  \cleardoublepage%% Página de verso
  \phantomsection%% Atalho do sumário
  \addcontentsline{toc}{chapter}{\texorpdfstring{\uppercase{\glossaryname}}{\glossaryname}}%% Adição do glossário ao sumário
  \printglossary%% Impressão do glossário
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Apêndices
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newenvironment{arquivosdeapendices}{%% Definição do ambiente arquivosdeapendices 
 \begin{apendicesenv}%% Ambiente apendicesenv
    \renewcommand{\appendixtocname}{%% Nome da parte apêndices no sumário
      \texorpdfstring{\uppercase{\apendicesname}}{\apendicesname}%%
    }
    \setlength{\afterchapskip}{\linha}%% Espaçamento após o título
}{%%
  \end{apendicesenv}
}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Anexos
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
\newenvironment{arquivosdeanexos}{%% Definição do ambiente arquivosdeanexos
  \renewcommand{\Hy@appendixstring}{anexo}%% Definição do comando para o rótulo anexo
  \xdef\Hy@chapapp{\Hy@appendixstring}%% Definição do rótulo anexo
  \begin{anexosenv}%% Ambiente anexosenv
    \renewcommand{\appendixtocname}{%% Nome da parte anexos no sumário
      \texorpdfstring{\uppercase{\anexosname}}{\anexosname}%%
    }
    \setlength{\afterchapskip}{\linha}%% Espaçamento após o título
}{%%
  \end{anexosenv}
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Índice
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newcommand{\incluirindice}{%% Definição do comando para inclusão do índice
  \renewenvironment{theindex}{%% Formatação do índice
    \clearforchapter
    \if@twocolumn\@restonecolfalse\else\@restonecoltrue\fi
    \ifonecolindex
      \onecolumn
      \chapter*{\indexname}
      \preindexhook
    \else
      \setlength{\columnseprule}{\indexrule}
      \setlength{\columnsep}{\indexcolsep}
      \twocolumn[\@makeschapterhead{\indexname}\preindexhook]
    \fi
    \indexmark
    \ifnoindexintoc\else
      \phantomsection
      \addcontentsline{toc}{chapter}{\texorpdfstring{\uppercase{\indexname}}{\indexname}}%% Adição do índice ao sumário
    \fi
    \thispagestyle{indextitlepagestyle}\parindent\z@
    \parskip\z@ \@plus 0.3\p@\relax
    \let\item\@idxitem
  }{%%
    \if@restonecol\onecolumn\else\twocolumn\fi
  }
  \bookmarksetup{startatroot}%% Capítulos após este comando criam marcadores do pdf na raiz
  \printindex%% Impressão do índice
  \cleardoublepage%% Página de verso
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Partes
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\renewcommand{\partnamefont}{\normalfont\normalsize\bfseries\MakeUppercase}%% Fonte do nome da parte
\renewcommand{\partnumfont}{\normalfont\normalsize\bfseries\MakeUppercase}%% Fonte da página da parte
\renewcommand{\parttitlefont}{\normalfont\normalsize\bfseries\MakeUppercase}%% Fonte do título da parte

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Parágrafos
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\setparaheadstyle{\normalfont\normalsize\itshape}%% Estilo do título do parágrafo
\setafterparaskip{\aftersubsubsecskip}%% Espaçamento após título do parágrafo

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Espaçamentos em capítulos, seções, subseções, 
%% subsubseções, parágrafos e subparágrafos
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\setlength{\beforechapskip}{0pt}%% Espaçamento antes do título do capítulo
\setlength{\afterchapskip}{2\linha}%% Espaçamento após o título do capítulo
\setlength{\beforesecskip}{\linha}%% Espaçamento antes do título da seção
\setlength{\aftersecskip}{\linha}%% Espaçamento após o título da seção
\setlength{\beforesubsecskip}{\linha}%% Espaçamento antes do título da subsubseção
\setlength{\aftersubsecskip}{\linha}%% Espaçamento após o título da subsubseção
\setlength{\beforesubsubsecskip}{\linha}%% Espaçamento antes do título da subsubseção
\setlength{\aftersubsubsecskip}{\linha}%% Espaçamento após o título da subsubseção
\setlength{\beforeparaskip}{\linha}%% Espaçamento antes do título do parágrafo
\setlength{\afterparaskip}{\linha}%% Espaçamento após o título do parágrafo
\setlength{\beforesubparaskip}{\linha}%% Espaçamento antes do título do subparágrafo
\setlength{\aftersubparaskip}{\linha}%% Espaçamento após o título do subparágrafo

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Níveis de seções no documento e no sumário
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\setsecnumdepth{all}%% Utilizado no documento
\maxsecnumdepth{all}%% Máximo no documento
\maxtocdepth{all}%% Utilizado no sumário
\settocdepth{all}%% Máximo no sumário

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Estilo tabelas
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\setlength{\aboverulesep}{0pt}
\setlength{\belowrulesep}{0pt}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Estilo de numeração de algoritmos, figuras, tabelas 
%% e equações
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\counterwithout{algorithm}{chapter}%% Numeração contínua ao longo dos capítulos para algoritmos
\counterwithout{figure}{chapter}%% Numeração contínua ao longo dos capítulos para figuras
\counterwithout{table}{chapter}%% Numeração contínua ao longo dos capítulos para tabelas
\counterwithout{equation}{chapter}%% Numeração contínua ao longo dos capítulos para equações

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Legendas de objetos flutuantes
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\setlength{\abovecaptionskip}{1pt}%% Espaçamento acima da legenda
\setlength{\belowcaptionskip}{1pt}%% Espaçamento abaixo da legenda

\hangcaption%% Recuo do texto das legendas
\if@legendascentralizadas%% Alinhamento das legendas centralizado
  \gdef\@captionjustification{on}%% Ativa alinhamento justificado
  \captionstyle{}%% Estilo das legendas
\else%% Alinhamento das legendas à esquerda
  \gdef\@captionjustification{off}%% Desativa alinhamento justificado
  \captionstyle[\raggedright]{\raggedright}%% Estilo das legendas
\fi
\captiondelim{\space--\space}%% Delimitador das legendas
\captionnamefont{\ABNTEXfontereduzida\bfseries}%% Fonte do nome das legendas
\captiontitlefont{\ABNTEXfontereduzida\bfseries}%% Fonte do título das legendas
\captionsetup{%% Formatação das legendas
  format=hang,%%
  singlelinecheck=\@captionjustification,%%
  font={footnotesize,bf,singlespacing},%%
  labelfont={footnotesize,bf,singlespacing},%%
  textfont={footnotesize,bf,singlespacing},%%
  labelsep={endash},%%
  skip=2.5pt%% Space below caption
}

%Altera formato do label e autoref do pacote subcaption
\RequirePackage[labelformat=simple]{subcaption} %Subfigure caption
\renewcommand\thesubfigure{(\alph{subfigure})}
\renewcommand{\subfigureautorefname}{\figureautorefname}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Fonte (referência) para objetos flutuantes
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% \ifx\fonte\undefined%% Verificação da definição do comando fonte
  \renewcommand{\fonte}[1]{\legend{\ABNTEXfontereduzida{\bfseries\nomefonte: #1}}}%% Definição do comando fonte
% \fi

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Compilação de índices utilizando makeindex (se habilitada)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\if@usemakeindex
  \immediate\write18{makeindex \jobname.idx}\relax%% Compilação do índice
  \immediate\write18{makeindex -s \jobname.ist -t \jobname.glg -o \jobname.gls \jobname.glo}\relax%% Compilação do glossário
  \immediate\write18{makeindex -s \jobname.ist -t \jobname.alg -o \jobname.acr \jobname.acn}\relax%% Compilação dos acrônimos
  \immediate\write18{makeindex -s \jobname.ist -t \jobname.alg2 -o \jobname.acr2 \jobname.acn2}\relax%% Compilação das siglas
  \immediate\write18{makeindex -s \jobname.ist -t \jobname.alg3 -o \jobname.acr3 \jobname.acn3}\relax%% Compilação das abreviaturas
  \immediate\write18{makeindex \jobname.nlo -s nomencl.ist -o \jobname.nls}\relax%% Compilação dos símbolos
\fi