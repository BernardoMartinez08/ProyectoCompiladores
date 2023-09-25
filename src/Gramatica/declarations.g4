grammar declarations;

import tokens, instructions;

instructions:
    if
    | variable_assignment
    | for
    | while
    | repeat
    | write_function
    | read_function
    | procedure_call
    | array_assignment
    | arraylist_assignment
    | arraybi_assignment
    | function_call SEMI_COLON;


//VARIABLE ASSIGNMENT SINTAXIS

variable_assignment: (ID | LETTERS) ASSIGN expression SEMI_COLON;

//VARIABLE SINTAXIS
variable: VAR variable_declaration+;
constant: CONSTANT constant_types+;

constant_types:
    const_str
    | const_char;

variable_declaration:
    variable_item COLON variable_type SEMI_COLON
    |variable_list COLON variable_type SEMI_COLON
    | array_variable
    | arraylist_variable
    ;

variable_list: variable_item (COMA variable_item)*;

variable_item: ID | LETTERS;

variable_type:
    INTEGER
    | CHAR
    | STRING
    | BOOLEAN
    | ARRAY_OF array_type;


//ARRAY SINTAXIS
array_variable:
    array_one_dimension
    | array_two_dimension;

arraylist_variable:
    variable_list COLON ARRAY CORCHETE_LEFT NUMBERS DOBLEDOTS NUMBERS CORCHETE_RIGHT OF variable_type SEMI_COLON
    | variable_list COLON ARRAY CORCHETE_LEFT NUMBERS DOBLEDOTS NUMBERS CORCHETE_RIGHT CORCHETE_LEFT NUMBERS DOBLEDOTS NUMBERS CORCHETE_RIGHT OF array_type SEMI_COLON;

array_one_dimension: ID COLON ARRAY CORCHETE_LEFT NUMBERS DOBLEDOTS NUMBERS CORCHETE_RIGHT OF array_type SEMI_COLON;

array_two_dimension: ID COLON ARRAY CORCHETE_LEFT NUMBERS DOBLEDOTS NUMBERS CORCHETE_RIGHT CORCHETE_LEFT NUMBERS DOBLEDOTS NUMBERS CORCHETE_RIGHT OF array_type SEMI_COLON;

array_type:
    INTEGER
    | CHAR
    | BOOLEAN
    | CONST_CHAR
    | CONST_STR;

array_call: ID CORCHETE_LEFT (NUMBERS | variable_item) CORCHETE_RIGHT;
arraylist_call: ID CORCHETE_LEFT (NUMBERS | variable_item) CORCHETE_RIGHT CORCHETE_LEFT (NUMBERS | variable_item) CORCHETE_RIGHT;
arraybi_call: ID CORCHETE_LEFT (NUMBERS | variable_item) CORCHETE_RIGHT CORCHETE_LEFT (NUMBERS | variable_item) CORCHETE_RIGHT;

array_assignment: ID CORCHETE_LEFT (NUMBERS | variable_item) CORCHETE_RIGHT ASSIGN expression SEMI_COLON;
arraylist_assignment: ID CORCHETE_LEFT (NUMBERS | variable_item) CORCHETE_RIGHT CORCHETE_LEFT (NUMBERS | variable_item) CORCHETE_RIGHT ASSIGN expression SEMI_COLON;
arraybi_assignment: ID CORCHETE_LEFT (NUMBERS | variable_item) CORCHETE_RIGHT CORCHETE_LEFT (NUMBERS | variable_item) CORCHETE_RIGHT ASSIGN expression SEMI_COLON;

//CONSTANTS SINTAXIS
const_char: CONST_CHAR COLON ID  EQUAL  QUATATION_MARK LETTERS QUATATION_MARK SEMI_COLON;

const_str:  CONST_STR COLON ID EQUAL CADENA_COMILLA_SIMPLE SEMI_COLON;


//CONDITION SINTAXIS
condition: BRACKET_LEFT condition BRACKET_RIGHT
    | factor ( AND | OR | compare_operators) factor
    | not_condition;

compare_operators:
    EQUALS
    | NOT_EQUALS
    | GREATER_THAN
    | GREATER_EQUAL_THAN
    | LESS_THAN
    | LESS_EQUAL_THAN;

not_condition: NOT BRACKET_LEFT ID ( AND | OR | compare_operators) (ID | NUMBERS) BRACKET_RIGHT;

//MATH OPERATIONS SINTAXIS
expression: term ( (PLUS | MINUS) term )*;

term: factor ( (MULTIPLY | DIVIDE) factor )*;

factor:
    NUMBERS
    | ID
    | LETTERS
    | CADENA_COMILLA_SIMPLE
    | function_call
    | array_call
    | arraylist_call
    | arraybi_call
    | BRACKET_LEFT condition BRACKET_RIGHT
    | BRACKET_LEFT expression BRACKET_RIGHT;


//FUNCTION SINTAXIS
arguments: (expression (COMA expression)*)?;

parameters: parameter COLON variable_type;

parameter: (variable_item (COMA variable_item)*)?;

function_declaration:
    FUNCTION ID BRACKET_LEFT parameters BRACKET_RIGHT
    (COLON variable_type)?
    SEMI_COLON
    (variable)?
    (constant)?
    function_body;

function_body:
    BEGIN
        (variable)*
        instructions*
        RETURN expression SEMI_COLON
    END SEMI_COLON;

function_call: ID BRACKET_LEFT arguments BRACKET_RIGHT;



//PROCEDURE SINTAXIS
procedure_declaration:
    PROCEDURE ID BRACKET_LEFT parameters BRACKET_RIGHT SEMI_COLON
    (variable)*
    (constant)*
    procedure_body;

procedure_body:
    BEGIN
        (variable)*
        instructions*
    END SEMI_COLON;

procedure_call: ID BRACKET_LEFT arguments BRACKET_RIGHT SEMI_COLON;

WS: [ \t\r\n]+ -> skip;

