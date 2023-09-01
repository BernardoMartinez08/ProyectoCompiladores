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
    | procedure_declaration
    | procedure_call;



//VARIABLE SINTAXIS
variable: VAR variable_types+;
constant: CONSTANT constant_types+;

variable_types:
    simple_variable
    | variable_list COLON variable_type SEMI_COLON
    | array_variable
    | arraylist_variable;

constant_types:
    const_str
    | const_char;

simple_variable: ID COLON variable_type SEMI_COLON;

variable_list:
    ID ',' variable_list
    | ID;


//ARRAY SINTAXIS
array_variable: array_one_dimension | array_two_dimension;

arraylist_variable:
    variable_list COLON ARRAY'['NUMBERS '..' NUMBERS']' OF variable_type SEMI_COLON
    | variable_list COLON ARRAY'['NUMBERS '..' NUMBERS']''[' NUMBERS '..' NUMBERS ']' OF array_type SEMI_COLON;

array_one_dimension: ID COLON ARRAY'['NUMBERS '..' NUMBERS']' OF array_type SEMI_COLON;

array_two_dimension: ID COLON ARRAY'['NUMBERS '..' NUMBERS']''[' NUMBERS '..' NUMBERS ']' OF array_type SEMI_COLON;

array_type:
    INTEGER
    | CHAR
    | BOOLEAN;


//CONSTANTS SINTAXIS
const_char: CONST_CHAR COLON ID  EQUAL  '\'' LETTERS '\'' SEMI_COLON;

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
    | '(' expression ')';

variable_type:
    INTEGER
    | CHAR
    | STRING
    | BOOLEAN;


//PROCEDURE SINTAXIS
procedure_declaration:
    PROCEDURE ID SEMI_COLON
    (
        (variable)
        (constant)
    )?
    procedure_body;

procedure_body: BEGIN instructions* END SEMI_COLON EOF;

procedure_call: ID BRACKET_LEFT (ID | NUMBERS) BRACKET_RIGHT SEMI_COLON;





