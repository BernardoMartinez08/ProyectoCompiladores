grammar pascal;
options { caseInsensitive = true;
language = Java;
   output = AST;
   }

/*----------------------------------------------------------------------------------------------------------------------
                                                  MAIN PROGRAM
----------------------------------------------------------------------------------------------------------------------*/

main_procedure:
PROGRAM ID SEMI_COLON
    (var_section)?
    (constant_var)?
    (function_Declaration)*
    (procedure_declaration)*
    BEGIN
    instructions*
    END DOT EOF;

/*----------------------------------------------------------------------------------------------------------------------
                                                  INSTRUCTIONS
----------------------------------------------------------------------------------------------------------------------*/

instructions: var_assignment
    | function_Call
    | for
    | if_statement
    | while
    | write_function
    | read_function
    | repeat
    | array_assignment
    | arraybi_assignment
    | procedure_call;

/*----------------------------------------------------------------------------------------------------------------------
                                                   VARIABLES
----------------------------------------------------------------------------------------------------------------------*/

//VAR ASSIGNMENT
//----------------------------------------------------------------------------------------------------------------------

var_assignment: (ID|LETTERS) (ASSIGN| COLON EQUAL) arith_expression SEMI_COLON;

expression: arith_expression;

array_call: ID CORCHETE_LEFT (NUMBERS | variable_item) CORCHETE_RIGHT;
arraybi_call: ID CORCHETE_LEFT (NUMBERS | variable_item) CORCHETE_RIGHT CORCHETE_LEFT (NUMBERS | variable_item) CORCHETE_RIGHT;

array_assignment: ID CORCHETE_LEFT (NUMBERS | variable_item) CORCHETE_RIGHT (ASSIGN) expression SEMI_COLON;
arraybi_assignment: ID CORCHETE_LEFT (NUMBERS | variable_item) CORCHETE_RIGHT CORCHETE_LEFT (NUMBERS | variable_item) CORCHETE_RIGHT (ASSIGN) expression SEMI_COLON;

//VARIABLE DECLARATIONS
//----------------------------------------------------------------------------------------------------------------------

var_section: VAR variable_declaration+ ;
variable_declaration: identifier_var COLON type_specifier;
identifier_var:(ID|LETTERS) (COMA (ID|LETTERS))* ;
identifier_list: (ID|LETTERS) (COMA (ID|LETTERS))* | expression;
type_specifier: type_name | array_type;
array_type: ARRAY CORCHETE_LEFT index_range CORCHETE_RIGHT array_dimensions_bidi? OF type_name;
array_dimensions_bidi: CORCHETE_LEFT index_range CORCHETE_RIGHT  ;
index_range: constant DOBLEDOTS constant;
type_name: INTEGER SEMI_COLON
    | CHAR SEMI_COLON
    | BOOLEAN SEMI_COLON
    | STRING SEMI_COLON;
constant: NUMBERS
    | ID;



/*----------------------------------------------------------------------------------------------------------------------
                                                  CONSTANTS
----------------------------------------------------------------------------------------------------------------------*/

constant_var:CONST constant_var_types+;
constant_var_types: CONST_CHAR COLON ID  EQUAL  QUATATION_MARK LETTERS QUATATION_MARK SEMI_COLON
    | CONST_STR COLON ID EQUAL QUATATION_MARK ID QUATATION_MARK SEMI_COLON;

/*----------------------------------------------------------------------------------------------------------------------
                                                  FUNTIONS
----------------------------------------------------------------------------------------------------------------------*/

function_Declaration:
FUNCTION ID  parameter COLON type_parameter SEMI_COLON
(var_section)?
BEGIN
instructions*
RETURN ID SEMI_COLON
END SEMI_COLON;

parameter: BRACKET_LEFT identifier_list+ COLON type_parameter BRACKET_RIGHT ;
type_parameter: INTEGER|CHAR|STRING|BOOLEAN|ARRAY_OF (INTEGER|CHAR|BOOLEAN|STRING);
function_Call: ID BRACKET_LEFT identifier_list BRACKET_RIGHT ;

/*----------------------------------------------------------------------------------------------------------------------
                                                  IF STATEMENT
----------------------------------------------------------------------------------------------------------------------*/

if_statement: IF ifexpression THEN if_instruccions? (ELSE if_instruccions)?;
if_instruccions: instructions|BEGIN instructions* END SEMI_COLON;
ifexpression: logical_term ((OR | AND) logical_term)*;
logical_term: arith_expression (comparison_operator arith_expression)?;
arith_expression: iffactor ((PLUS | MINUS | MULTIPLY | DIVIDE) iffactor)*;


iffactor: NOT iffactor
    | TRUE
    | FALSE
    | ID
    | NUMBERS
    | LETTERS
    | CADENA_COMILLA_SIMPLE
    | function_Call
    | procedure_call
    | array_call
    | arraybi_call
    | BRACKET_LEFT ifexpression BRACKET_RIGHT;

comparison_operator: EQUALS  | LESS_THAN | LESS_EQUAL_THAN | GREATER_THAN | GREATER_EQUAL_THAN ;

/*----------------------------------------------------------------------------------------------------------------------
                                                  FOR STATEMENT
----------------------------------------------------------------------------------------------------------------------*/

for: FOR loop_variable ASSIGN  loop_initialization TO loop_termination DO for_code_block;
loop_variable: ID | LETTERS;
loop_initialization:  ID | NUMBERS | LETTERS |aritmetic_loop_init;
aritmetic_loop_init: ID (PLUS | MULTIPLY | DIVIDE | MINUS) (ID|NUMBERS);
loop_termination: ID | NUMBERS |aritmetic_loop_init ;
for_code_block: BEGIN instructions* END SEMI_COLON | instructions;

/*----------------------------------------------------------------------------------------------------------------------
                                                  WHILE STATEMENT
----------------------------------------------------------------------------------------------------------------------*/

while: WHILE while_condition DO while_block;
while_condition: (ID|LETTERS) comparison_operator (ID|NUMBERS) | BRACKET_LEFT while_condition BRACKET_RIGHT;
while_block: instructions | BEGIN instructions* END SEMI_COLON;

/*----------------------------------------------------------------------------------------------------------------------
                                                  REPEAT STATEMENT
----------------------------------------------------------------------------------------------------------------------*/

repeat: REPEAT instructions* UNTIL ;

/*----------------------------------------------------------------------------------------------------------------------
                                             READ AND WRITE FUNCTIONS
----------------------------------------------------------------------------------------------------------------------*/

write_function: WRITE BRACKET_LEFT ID (COMA (ID | NUMBERS | strings)) BRACKET_RIGHT SEMI_COLON;
read_function: READ BRACKET_LEFT ID BRACKET_RIGHT SEMI_COLON;
strings: QUATATION_MARK ID QUATATION_MARK;

/*----------------------------------------------------------------------------------------------------------------------
                                                 PROCEDURE SINTAXIS
----------------------------------------------------------------------------------------------------------------------*/

variable_item: ID | LETTERS;
arguments: (expression (COMA expression)*)?;


procedure_declaration:
    PROCEDURE ID  parameter  SEMI_COLON
    (var_section)?
    (constant_var)?
    procedure_body;

procedure_body:
    BEGIN
        (var_section)*
        instructions*
    END SEMI_COLON;

procedure_call: ID BRACKET_LEFT arguments BRACKET_RIGHT ;





/*----------------------------------------------------------------------------------------------------------------------
                                                       TOKENS
----------------------------------------------------------------------------------------------------------------------*/

 //PROCEDURE TOKENS
 PROCEDURE: 'procedure';


 //FUNCTION TOKENS
 FUNCTION: 'function';
 READ: 'read';
 WRITE: 'write';
 RETURN: 'return';


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
 DIV:'div';
 MOD:'mod';


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
 CONST:'const';
 INTEGER:'integer';
 CHAR:'char';
 STRING:'string';
 BOOLEAN:'boolean';
 CONST_CHAR : 'constchar';
 CONST_STR: 'conststr';
 ARRAY_OF: 'array of';


 //GENERAL USE TOKENS
 COLON: ':';
 SEMI_COLON: ';';
 COMA: ',';
 DOBLEDOTS: '..';
 QUATATION_MARK: '\'';
 DOUBLE_QUOTATION_MARK:'"';
 DOT: '.';
 NUMBERS: [0-9]+;
 LETTERS: [a-zA-Z];
 ID:[a-zA-Z][a-zA-Z0-9]*([_][a-zA-Z0-9]+)*;
 TRUE:'true';
 FALSE:'false';


 COMENTARIO:'{' ~('}' |'\r'|'\n')* '}'->skip;


 CADENA_COMILLA_SIMPLE : '\'' ( ESC | ~'\'' )* '\'';


 fragment ESC :   '\\' (["\\/bfnrt] | UNICODE) ;
 fragment UNICODE : 'u' HEX HEX HEX HEX ;
 fragment HEX : [0-9a-fA-F] ;
 WS: [ \t\r\n]+ -> skip;