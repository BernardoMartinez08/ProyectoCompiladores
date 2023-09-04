grammar tokens;

//PROCEDURE TOKENS
PROCEDURE: 'procedure';

//FUNCTION TOKENS
FUNCTION: 'function';
READ: 'read';
WRITE: 'write';


//FOR TOKENS
FOR: 'for';
TO: 'to';


//WHILE TOKENS
WHILE: 'while';
DO: 'do';


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
PROGRAM:'program';


//OPERADOR DE ASIGNACION
ASSIGN:':=';


//VARIABLE TOKENS
ARRAY:'array';
OF:'of';
VAR:'var';
CONSTANT:'const';
INTEGER:'integer';
CHAR:'char';
STRING:'string';
BOOLEAN:'boolean';
CONST_CHAR : 'constchar';
CONST_STR: 'conststr';


//GENERAL USE TOKENS
COLON: ':';
SEMI_COLON: ';';
COMA: ',';
DOBLEDOTS: '..';
QUATATION_MARK: '\'';
DOT: '.';
NUMBERS: [0-9]+;
LETTERS: [a-zA-Z];
ID: [a-zA-Z_] [a-zA-Z0-9_]+ [a-zA-Z0-9];



COMENTARIO:'{' ~('}' |'\r'|'\n')* '}'->skip;

CADENA_COMILLA_SIMPLE : '\'' ( ESC | ~'\'' )* '\'';
STRING_CONTENT: '\'' (ESC | ~('\\' | '"'))* '\'';

fragment ESC :   '\\' (["\\/bfnrt] | UNICODE) ;
fragment UNICODE : 'u' HEX HEX HEX HEX ;
fragment HEX : [0-9a-fA-F] ;

WS: [ \t\r\n]+ -> skip;