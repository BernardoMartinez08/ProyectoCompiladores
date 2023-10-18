package GUI;

import Code.CustomErrorListener;
import Code.CustomParser;
import Pascal.pascalLexer;
import org.antlr.v4.runtime.*;
import org.antlr.v4.runtime.CharStreams;
import org.antlr.v4.runtime.CommonTokenStream;

import javax.swing.*;
import javax.swing.table.DefaultTableModel;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.util.List;


public class Compiler extends JFrame {
    private JPanel panel1;
    private JTextArea textArea1;
    private JTable table1;
    private JButton RUNButton;
    private JButton FINDFILEButton;

    DefaultTableModel model;

    String text = "";


    Compiler(){
        model = (DefaultTableModel) this.table1.getModel();
        model.setRowCount(0);
        model.setColumnCount(1);

        setTitle("Compiler");
        setSize(650,500);

        setContentPane(panel1);
        setDefaultCloseOperation(EXIT_ON_CLOSE);
        setVisible(true);

        RUNButton.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                model = (DefaultTableModel) table1.getModel();
                model.setRowCount(0);

                String codigoEntrada = textArea1.getText();
                System.out.println(codigoEntrada);

                // Crear un CharStream a partir del código de entrada
                CharStream input = CharStreams.fromString(codigoEntrada);

                // Crear el analizador léxico
                pascalLexer lexer = new pascalLexer(input);
                CommonTokenStream tokens = new CommonTokenStream(lexer);

                // Crear el analizador sintáctico personalizado
                CustomParser parser = new CustomParser(tokens);

                // Asociar el manejador de errores personalizado
                CustomErrorListener errorListener = new CustomErrorListener();
                parser.removeErrorListeners();
                parser.addErrorListener(errorListener);

                // Llamar a la regla de inicio del análisis sintáctico
                CustomParser.Main_procedureContext tree = parser.main_procedure();

                // Verificar si hubo errores durante el análisis sintáctico
                if (errorListener.getErrorMessages().isEmpty()) {
                    // Si no hubo errores, imprime el árbol AST
                    System.out.println(tree.toStringTree(parser));
                } else {
                    // Si hay errores, imprime los mensajes de error
                    List<String> errores = errorListener.getErrorMessages();
                    for (String error : errores) {
                        System.out.println(error);
                    }
                }

                // Resto del código para manejar los errores y mostrar en la GUI
                // ...
            }
        });

        FINDFILEButton.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {

               try {

                   JFileChooser fileChooser = new JFileChooser();

                   fileChooser.showOpenDialog(fileChooser);
                   String ruta = fileChooser.getSelectedFile().getAbsolutePath();

                   int lastIndex = ruta.lastIndexOf(".");
                   if (lastIndex != -1) {
                       String extension = ruta.substring(lastIndex + 1);

                       if (extension.equalsIgnoreCase("txt")) {

                           File fileM = new File(ruta);
                           BufferedReader reader = new BufferedReader(new FileReader(fileM));

                           String linea;
                           while ((linea = reader.readLine()) != null) {
                               text = text + linea + "\n";
                           }

                        textArea1.setText(text);


                       }

                   }
               }catch(Exception ex){
                   System.out.println(ex.getMessage());
               }


            }
        });
    }


    public static void main(String []args){

        Compiler compi = new Compiler();
    }
}
