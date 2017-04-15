package br.com.analisadorlexico.parte2;
import static br.com.analisadorlexico.parte2.Token.*;
%%

%{
public String lexeme;
%}


%class AnalisadorLexico
%type Token

BRANCO              = [ |\n|\t|\r]*
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
LINHA				= {BRANCO}

OPERADOR_RELACIONAL = {IGUAL}|{NAO_IGUAL}|{MENOR}|{MAIOR}|{MENOR_IGUAL}|{MAIOR_IGUAL}
OPERADOR_LOGICO     = {OU}|{E}|{NAO}
%%
(["$$"].*)				{ lexeme = yytext(); return COMENTARIO;}
LINHA					{ lexeme = yytext(); return LINHA;}
"then"                  { lexeme = yytext(); return THEN; }
"if"                    { lexeme = yytext(); return IF; }
"for"                   { lexeme = yytext(); return FOR; }
"while"                 { lexeme = yytext(); return WHILE; }
{ID}                    { lexeme = yytext(); return ID; }
{OPERADOR_ARITMETICO}   { lexeme = yytext(); return OPERADOR_ARITMETICO; }
{NUMEROS_NATURAIS}      { lexeme = yytext(); return NUMEROS_NATURAIS; }
{TEXTO}                 { lexeme = yytext(); return TEXTO; }
{NUMEROS_REIAS}         { lexeme = yytext(); return NUMEROS_REIAS; }
{OPERADOR_LOGICO}       { lexeme = yytext(); return OPERADOR_LOGICO; }
{OPERADOR_RELACIONAL}   { lexeme = yytext(); return OPERADOR_RELACIONAL; }
{INICIO_BLOCO}          { lexeme = yytext(); return INICIO_BLOCO; }
{FIM_BLOCO}             { lexeme = yytext(); return FIM_BLOCO; }
{ATRIBUICAO}			{ lexeme = yytext(); return ATRIBUICAO; }
{BRANCO}                { }
.                       { return ERROR; }
