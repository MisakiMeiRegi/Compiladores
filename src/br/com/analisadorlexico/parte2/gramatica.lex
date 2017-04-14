package br.com.analisadorlexico.parte2;
%%

%{

private void imprimir(String descricao, String lexema) {
    System.out.println(lexema + " - " + descricao);
}

%}


%class AnalisadorLexico
%type String

BRANCO              = [\s]*
OPERADOR_ARITMETICO = [\+|\*|\-|\/]
ID                  = [_|[a-zA-Z]]*
NUMEROS_NATURAIS    = [0-9]+
TEXTO               = '[\s|_|a-zA-Z|0-9|\+]*'
NUMEROS_REIAS       = [0-9]+,[0-9]+
OU                  = "||"
E                   = "&&"
IGUAL               = "=="
NAO_IGUAL           = "!="
MENOR               = "<"
MAIOR               = ">"
MAIOR_IGUAL         = ">="
MENOR_IGUAL         = "<="
NAO                 = "!"
INICIO_BLOCO        = "{"
FIM_BLOCO           = "}"
ATRIBUICAO			= "="


OPERADOR_RELACIONAL = {IGUAL}|{NAO_IGUAL}|{MENOR}|{MAIOR}|{MENOR_IGUAL}|{MAIOR_IGUAL}
OPERADOR_LOGICO     = {OU}|{E}|{NAO}
%%

"then"                  { imprimir("Palavra reservada THEN", yytext()); }
"if"                    { imprimir("Palavra reservada IF", yytext()); }
"for"                   { imprimir("Palavra reservada FOR", yytext()); }
"while"                 { imprimir("Palavra reservada WHILE", yytext()); }
{ID}                    { imprimir("Identificador", yytext()); }
{OPERADOR_ARITMETICO}   { imprimir("Operador", yytext()); }
{NUMEROS_NATURAIS}      { imprimir("Inteiro", yytext()); }
{TEXTO}                 { imprimir("String", yytext()); }
{NUMEROS_REIAS}         { imprimir("Real", yytext()); }
{OPERADOR_LOGICO}       { imprimir("Operador Lógico", yytext()); }
{OPERADOR_RELACIONAL}   { imprimir("Operador Relacional", yytext()); }
{INICIO_BLOCO}          { imprimir("Inicio do bloco de código", yytext()); }
{FIM_BLOCO}             { imprimir("Fim do bloco de código", yytext()); }
{ATRIBUICAO}			{ imprimir("Fim do bloco de código", yytext());}
{BRANCO}                { }
.                       {throw new RuntimeException("Caractere inválido: '"+ yytext()+"'"); }
