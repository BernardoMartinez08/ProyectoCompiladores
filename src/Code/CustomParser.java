package Code;
import org.antlr.v4.runtime.Parser;
import org.antlr.v4.runtime.TokenStream;
import Pascal.pascalParser;

public class CustomParser extends pascalParser{
    public CustomParser(TokenStream input) {
        super(input);
    }

    @Override
    protected void sync(Parser recognizer) {
        // Evita que ANTLR se recupere automáticamente de errores y continúe
    }

}

