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
	:	optr '(' oprn ')'
	{
		if($optr.text.equals("sin"))
		{
			$value = Math.sin(Math.toRadians(Integer.parseInt($oprn.text)));
		}
		else if($optr.text.equals("cos"))
		{
			$value = Math.cos(Math.toRadians(Integer.parseInt($oprn.text)));
		}
		else if($optr.text.equals("tan"))
		{
			$value = Math.tan(Math.toRadians(Integer.parseInt($oprn.text)));
		}
	}
	;

optr
	:	'sin' | 'cos' | 'tan'
	;

oprn
	:	Num
	;

/* use String representation for numeric value */
Num
	:	('0'..'9')+
	;
	
/* skip CRLF, tab */
WS
	: ('\n' | '\r' | '\t')+ {skip();}
	;
