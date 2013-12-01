grammar Trigonometri;

@parser::members
{
	@Override
	public void reportError(RecognitionException e)
	{
		System.out.println("Custom Error...\n"+e);
	}
}

/* entry point of parser */
exp returns [double value]
	:	optr '(' oprn ')' EOF
	{
		if($optr.text.toLowerCase().equals("sin"))
		{
			$value = Math.sin(Math.toRadians(Float.parseFloat($oprn.text)));
		}
		else if($optr.text.toLowerCase().equals("cos"))
		{
			$value = Math.cos(Math.toRadians(Float.parseFloat($oprn.text)));
		}
		else if($optr.text.toLowerCase().equals("tan"))
		{
			$value = Math.tan(Math.toRadians(Float.parseFloat($oprn.text)));
		}
	}
	;

optr
	:	'sin' | 'cos' | 'tan' | 'SIN' | 'COS' | 'TAN'
	;

oprn
	:	Num
	;

/* use String representation for numeric value */
Num
	:	('-')? ('0'..'9')+ ('.' ('0'..'9')+)?
	;
	
/* skip CRLF, tab */
WS
	: ('\n' | '\r' | '\t')+ {skip();}
	;
