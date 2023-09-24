package Code;

import org.antlr.v4.runtime.BaseErrorListener;
import org.antlr.v4.runtime.RecognitionException;
import org.antlr.v4.runtime.Recognizer;

import java.util.ArrayList;
import java.util.List;

public class CustomErrorListener extends BaseErrorListener {

    private List<String> errorMessages = new ArrayList<>();
    @Override
    public void syntaxError(Recognizer<?, ?> recognizer, Object offendingSymbol, int line, int charPositionInLine, String msg, RecognitionException e) {
        // Registra el error en la lista
        errorMessages.add("Error en línea " + line + ", columna " + charPositionInLine + ": " + msg);
    }

    public List<String> getErrorMessages() {
        return errorMessages;
    }
}
