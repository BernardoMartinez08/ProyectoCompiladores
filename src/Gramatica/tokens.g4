grammar tokens;

//FOR TOKENS
FOR:'for';


//WHILE TOKENS
WHILE:'while';


//REPEAT TOKENS
REPEAT: 'repeat';
UNTIL: 'until';


//IF TOKENS
CORCHETE_LEFT:'[';
CORCHETE_RIGHT:']';
BRACKET_LEFT:'(';
BRACKET_RIGHT:')';
IF:'if';
THEN: 'then';
ELSE: 'else';


//OPERADORES ARITMETICOS
PLUS: '+';
MINUS: '-';
MULTIPLY: '*';
DIVIDE: '/';


//OPERADORES DE COMPARACION
EQUALS: '==';
EQUAL:'=';
NOT_EQUALS: '!=';
GREATER_THAN: '>';
GREATER_EQUAL_THAN: '>=';
LESS_THAN: '<';
LESS_EQUAL_THAN: '<=';
AND: 'and';
OR: 'or';
NOT :'not';


//MAIN TOKENS
BEGIN:'begin';
END:'end';
FUNCTION:'Function';
PROGRAM:'program';


//OPERADOR DE ASIGNACION
ASSIGN:':=';


//VARIABLE TOKENS
ARRAY:'array';
OF:'of';
VAR:'var';
INTEGER:'integer';
CHAR:'char';
STRING:'string';
BOOLEAN:'boolean';
CONST_CHAR : 'constchar';
CONST_STR: 'conststr';


//GENERAL USE TOKENS
COLON: ':';
SEMI_COLON: ';';
NUMBERS: [0-9]+;
LETTERS: [a-zA-Z];
ID: [a-zA-Z_] [a-zA-Z0-9_]+ [a-zA-Z0-9];









//-------------------------------------------------------------------------------------------------------------------------------------
//PREGUNTAR A AXEL
/*LA REGLA ~('}' |'\r'|'\n')* indica que puede coincidir con cualquier secuencia de caracteres que no sean },salto de linea (\r o\n)
 esto permite que el comentario abarque varias lineas y finalice con }
 se el pone el skip para que el analizador lexico y sintatico lo omita
 */
COMENTARIO:'{' ~('}' |'\r'|'\n')* '}'->skip;


/*  la regla CADENA_SIMPLE define una cadena de texto encerrada entre comillas dobles,
donde el contenido de la cadena puede ser cualquier combinación de caracteres, excepto comillas dobles,
o puede incluir comillas dobles escapadas (\").
Ejemplo válido: "Hola mundo"
CADENA_SIMPLE : '"' (~'"'|'\\"')* '"'|
  '"' (ESC | ~["\\])* '"' ; las dos formas funcionan
*/


CADENA_COMILLA_SIMPLE : '\'' ( ESC | ~'\'' )* '\'';
fragment ESC :   '\\' (["\\/bfnrt] | UNICODE) ;
fragment UNICODE : 'u' HEX HEX HEX HEX ;
fragment HEX : [0-9a-fA-F] ;

WS: [ \t\r\n]+ -> skip;