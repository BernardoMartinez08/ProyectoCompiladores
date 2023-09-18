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
    | function_call;



//VARIABLE SINTAXIS
variable: VAR variable_declaration+;
constant: CONSTANT constant_types+;

constant_types:
    const_str
    | const_char;

variable_declaration:
    variable_list COLON variable_type SEMI_COLON
    | array_variable
    | arraylist_variable;

variable_list: (variable_item (COMA variable_item)*)?;

variable_item: ID;

variable_type:
    INTEGER
    | CHAR
    | STRING
    | BOOLEAN;


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
    | BRACKET_LEFT condition BRACKET_RIGHT
    | BRACKET_LEFT expression BRACKET_RIGHT;


//FUNCTION SINTAXIS
arguments: (expression (COMA expression)*)?;

parameters: (parameter (COMA parameter)*)?;

parameter: ID COLON variable_type;

function_declaration:
    FUNCTION ID BRACKET_LEFT parameters BRACKET_RIGHT
    (COLON variable_type)?
    SEMI_COLON
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

procedure_call: ID BRACKET_LEFT arguments BRACKET_RIGHT;

