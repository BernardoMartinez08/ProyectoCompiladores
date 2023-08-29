grammar declarations;

import tokens, instructions;

instructions:  if | variable_assignment | for | while | repeat ;



//VARIABLE SINTAXIS
variable: VAR variable_types+;

variable_types: simple_variable | variable_list COLON variable_type SEMI_COLON | array_variable | arraylist_variable | const_Char | const_Str;

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
const_Char:
    CONST_CHAR ID  EQUAL '\'' LETTERS '\'' SEMI_COLON
    | CONST_CHAR ID  EQUAL'\'' LETTERS '\'' SEMI_COLON const_Char;

const_Str:
    CONST_STR ID '=' CADENA_COMILLA_SIMPLE
    | CONST_STR ID '=' CADENA_COMILLA_SIMPLE const_Str;


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



factor:
    NUMBERS
    | ID
    | LETTERS
    | BRACKET_LEFT condition BRACKET_RIGHT;

variable_type:
    INTEGER
    | CHAR
    | STRING
    | BOOLEAN;



