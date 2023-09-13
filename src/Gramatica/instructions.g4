grammar instructions;

import tokens, declarations;

//VARIABLE ASSIGNMENT SINTAXIS

variable_assignment: ID '=' expression SEMI_COLON;


//INSTRUCTION IF SINTAXIS
if_statement: IF condition THEN if_block (ELSEIF condition THEN if_block)* (ELSE if_block)?;


if_block: BEGIN instructions* END SEMI_COLON;

if: if_statement;

//INSTRUCTION FOR SINTAXIS
for: FOR (ID | LETTERS) ASSIGN (ID | NUMBERS | LETTERS) TO (ID | NUMBERS) TO for_code_block;
for_code_block: BEGIN instructions* END | instructions;


//INSTRUCTION WHILE SINTAXIS
while: WHILE ID (compare_operators) (ID | NUMBERS) DO while_code_block ;
while_code_block: BEGIN instructions* END | instructions;



//INSTRUCTION REPEAT SINTAXIS
repeat: REPEAT instructions* UNTIL condition SEMI_COLON;


//FUNCTION WRITE SINTAXIS
write_function: WRITE BRACKET_LEFT ID (COMA (ID | NUMBERS | CADENA_COMILLA_SIMPLE)) BRACKET_RIGHT SEMI_COLON;


//FUNCTION READ SINTAXIS
read_function: READ BRACKET_LEFT ID BRACKET_RIGHT SEMI_COLON;


//COMMENTS SINTAXIS
//comment: Comment_Start (instructions | ID |Letter | Numbers )* Comment_End;
