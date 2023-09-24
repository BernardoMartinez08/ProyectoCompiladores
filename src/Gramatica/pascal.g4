grammar pascal;

// Importa las secciones de la gramática desde otros archivos
import declarations, instructions, tokens;

options {caseInsensitive = true;}

main_procedure:
    PROGRAM ID SEMI_COLON
    (variable)?
    (constant)?
    (function_declaration)*
    (procedure_declaration)*


    BEGIN
    instructions*
    END DOT EOF;


WS: [ \t\r\n]+ -> skip;
