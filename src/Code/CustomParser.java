package Code;
import Pascal.pascalParser;
import org.antlr.v4.runtime.Parser;
import org.antlr.v4.runtime.TokenStream;

public class CustomParser extends pascalParser{
    public CustomParser(TokenStream input) {
        super(input);
    }

    @Override
    protected void sync(Parser recognizer) {
        // Evita que ANTLR se recupere automáticamente de errores y continúe
    }

}

