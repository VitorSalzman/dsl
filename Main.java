import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import org.antlr.runtime.*;
import org.antlr.runtime.tree.*;

public class Main
{
	public static void main(String args[]) throws Exception
	{
//		baca dari file
		BufferedReader br = null;
		try
		{
			String inputString = "", curLine = "sin(0)";
			br = new BufferedReader(new FileReader(args[0]));
			while((curLine=br.readLine()) != null)
			{
				inputString = curLine;
			}
			
//			TrigonometriLexer lexer = new TrigonometriLexer(new ANTLRInputStream(System.in));
			ANTLRStringStream in = new ANTLRStringStream(inputString);
			TrigonometriLexer lexer = new TrigonometriLexer(in);
//			ANTLRStringStream in = new ANTLRStringStream(new ANTLRInputStream(System.in));
//			TrigonometriLexer lexer = new TrigonometriLexer(in);
			CommonTokenStream tokens = new CommonTokenStream(lexer);
			TrigonometriParser parser = new TrigonometriParser(tokens);
		
//			menampilkan hasil perhitungan
			System.out.println("Hasil DSL Trigonometri");
			System.out.println(inputString+" = "+parser.exp());
		}
		catch (IOException e)
		{
			e.printStackTrace();
		}
		finally
		{
			try
			{
				if(br!=null)
				{
					br.close();
				}
			}
			catch (IOException exp)
			{
				exp.printStackTrace();
			}
		}
	}
}
