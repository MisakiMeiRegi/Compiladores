package br.com.analisadorlexico.parte2;
%%

%{

private void imprimir(String descricao, String lexema) {
    System.out.println(lexema + " - " + descricao);
}

%}


%class AnalisadorLexico
%type void


BRANCO = [\n| |\t|\r]
INTEGER = 0|[1-9][0-9]*
STRING = [_|a-z|A-Z]
DOUBLE = [0-9|,|0-9]*
SOMA = "+"
SUBTRACAO = "-"
DIVISAO = "/"
MULTIPLICACAO = "*"

%%

"if"                         { imprimir("Palavra reservada if", yytext()); }
"for"                         { imprimir("Palavra reservada for", yytext()); }
{BRANCO}                     { imprimir("Espaço em branco", yytext()); }
{SOMA}                         { imprimir("Operador de soma", yytext()); }
{SUBTRACAO}                         { imprimir("Operador de subtração", yytext()); }
{DIVISAO}                         { imprimir("Operador de divisão", yytext()); }
{INTEGER}                     { imprimir("Número Inteiro", yytext()); }
{STRING}                     { imprimir("Imprimi uma String", yytext()); }
{DOUBLE}                     { imprimir("Número real", yytext()); }
{MULTIPLICACAO}                     { imprimir("Operador de multiplicação", yytext()); }
. { throw new RuntimeException("Caractere inválido " + yytext()); }