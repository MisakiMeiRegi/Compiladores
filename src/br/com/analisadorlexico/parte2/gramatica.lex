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
ID = [_|a-z|A-Z][a-z|A-Z|0-9|_]*
SOMA = "+"
SUBTRACAO = "-"
DIVISAO = "/"

INTEIRO = 0|[1-9][0-9]*

%%

"if"                         { imprimir("Palavra reservada if", yytext()); }
"for"                         { imprimir("Palavra reservada for", yytext()); }
"then"                       { imprimir("Palavra reservada then", yytext()); }
{BRANCO}                     { imprimir("Espaço em branco", yytext()); }
{ID}                         { imprimir("Identificador", yytext()); }
{SOMA}                         { imprimir("Operador de soma", yytext()); }
{SUBTRACAO}                         { imprimir("Operador de subtração", yytext()); }
{DIVISAO}                         { imprimir("Operador de divisão", yytext()); }

{INTEIRO}                     { imprimir("Número Inteiro", yytext()); }

. { throw new RuntimeException("Caractere inválido " + yytext()); }