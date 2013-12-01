import org.antlr.runtime.*;

public class Main
{
	public static void main(String args[]) throws Exception
	{
		TrigonometriLexer lexer = new TrigonometriLexer(new ANTLRInputStream(System.in));
//		ANTLRStringStream in = new ANTLRStringStream(new ANTLRInputStream(System.in));
//		TrigonometriLexer lexer = new TrigonometriLexer(in);
		CommonTokenStream tokens = new CommonTokenStream(lexer);
		TrigonometriParser parser = new TrigonometriParser(tokens);
		System.out.println(parser.exp());
	}
}
