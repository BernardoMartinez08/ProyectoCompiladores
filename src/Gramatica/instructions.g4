grammar instructions;

import tokens, declarations;

//VARIABLE ASSIGNMENT SINTAXIS
variable_assignment: (ID | LETTERS) ASSIGN (ID | NUMBERS | LETTERS) SEMI_COLON;

//INSTRUCTION IF SINTAXIS
if: IF condition THEN (statement_List)?   ((ELSE elseStatement)* | ELSE statement_List);

elseStatement: if;

statement_List:
    instructions
    | BEGIN instructions* END SEMI_COLON;


//INSTRUCTION FOR SINTAXIS
for: FOR (ID | LETTERS) ASSIGN (ID | NUMBERS | LETTERS) 'to' (ID | NUMBERS) 'do' for_code_block;
for_code_block: BEGIN instructions* END | instructions;


//INSTRUCTION WHILE SINTAXIS
while: WHILE ID (compare_operators) (ID | NUMBERS) 'do' while_code_block ;
while_code_block: BEGIN instructions* END | instructions;


//INSTRUCTION REPEAT SINTAXIS
repeat: REPEAT instructions* UNTIL ID (compare_operators) (ID | NUMBERS) SEMI_COLON;


//FUNCTION WRITE SINTAXIS
write_function: 'write' '(' ID (COMA (ID | NUMBERS | CADENA_COMILLA_SIMPLE)) ')' SEMI_COLON;


//FUNCTION READ SINTAXIS
read_function: 'read' '(' ID ')' SEMI_COLON;




















//COMMENTS SINTAXIS
//comment: Comment_Start (instructions | ID |Letter | Numbers )* Comment_End;
