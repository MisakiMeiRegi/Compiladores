package br.com.analisadorlexico.parte2;
import static br.com.analisadorlexico.parte2.Token.*;
%%

%{
public String lexeme;
%}


%class AnalisadorLexico
%type Token

LINHA               =  \r|\n|\r\n
OPERADOR_ARITMETICO = [\+|\*|\-|\/]
ID                  = [_|[a-zA-Z]]*
NUMEROS_NATURAIS    = [0-9]+
TEXTO               = '.*'
NUMEROS_REIAS       = [0-9]+,[0-9]+
EXPOENTE            = \^
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
FIM_LINHA           = ";"
ATRIBUICAO			= "="
BRANCO				= [ \t\f]

OPERADOR_RELACIONAL = {IGUAL}|{NAO_IGUAL}|{MENOR}|{MAIOR}|{MENOR_IGUAL}|{MAIOR_IGUAL}
OPERADOR_LOGICO     = {OU}|{E}|{NAO}

%%
"fim"					{ lexeme = yytext(); return FIM_COMANDO;}
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
{EXPOENTE}              { lexeme = yytext(); return EXPOENTE; }
{INICIO_BLOCO}          { lexeme = yytext(); return INICIO_BLOCO; }
{FIM_BLOCO}             { lexeme = yytext(); return FIM_BLOCO; }
{FIM_LINHA}				{ lexeme = yytext(); return FIM_LINHA;}
{ATRIBUICAO}			{ lexeme = yytext(); return ATRIBUICAO; }
{BRANCO}				{ lexeme = yytext(); return BRANCO;}
{LINHA}					{ lexeme = yytext(); return LINHA;}
(["$$"].*)				{ lexeme = yytext(); return COMENTARIO;}

.                       { lexeme = yytext(); return ERROR; }
