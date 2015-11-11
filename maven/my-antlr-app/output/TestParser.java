// $ANTLR 3.5.1 /Users/James/dev/codeexamples/maven/my-antlr-app/Test.g 2015-11-11 18:03:02

import org.antlr.runtime.*;
import java.util.Stack;
import java.util.List;
import java.util.ArrayList;

@SuppressWarnings("all")
public class TestParser extends Parser {
	public static final String[] tokenNames = new String[] {
		"<invalid>", "<EOR>", "<DOWN>", "<UP>", "ESC_SEQ", "HEX_DIGIT", "ID", 
		"INT", "OCTAL_ESC", "STRING", "UNICODE_ESC", "WS"
	};
	public static final int EOF=-1;
	public static final int ESC_SEQ=4;
	public static final int HEX_DIGIT=5;
	public static final int ID=6;
	public static final int INT=7;
	public static final int OCTAL_ESC=8;
	public static final int STRING=9;
	public static final int UNICODE_ESC=10;
	public static final int WS=11;

	// delegates
	public Parser[] getDelegates() {
		return new Parser[] {};
	}

	// delegators


	public TestParser(TokenStream input) {
		this(input, new RecognizerSharedState());
	}
	public TestParser(TokenStream input, RecognizerSharedState state) {
		super(input, state);
	}

	@Override public String[] getTokenNames() { return TestParser.tokenNames; }
	@Override public String getGrammarFileName() { return "/Users/James/dev/codeexamples/maven/my-antlr-app/Test.g"; }



	// $ANTLR start "rule1"
	// /Users/James/dev/codeexamples/maven/my-antlr-app/Test.g:3:1: rule1 : ( ID )+ ;
	public final void rule1() throws RecognitionException {
		try {
			// /Users/James/dev/codeexamples/maven/my-antlr-app/Test.g:3:7: ( ( ID )+ )
			// /Users/James/dev/codeexamples/maven/my-antlr-app/Test.g:4:2: ( ID )+
			{
			// /Users/James/dev/codeexamples/maven/my-antlr-app/Test.g:4:2: ( ID )+
			int cnt1=0;
			loop1:
			while (true) {
				int alt1=2;
				int LA1_0 = input.LA(1);
				if ( (LA1_0==ID) ) {
					alt1=1;
				}

				switch (alt1) {
				case 1 :
					// /Users/James/dev/codeexamples/maven/my-antlr-app/Test.g:4:2: ID
					{
					match(input,ID,FOLLOW_ID_in_rule112); 
					}
					break;

				default :
					if ( cnt1 >= 1 ) break loop1;
					EarlyExitException eee = new EarlyExitException(1, input);
					throw eee;
				}
				cnt1++;
			}

			}

		}
		catch (RecognitionException re) {
			reportError(re);
			recover(input,re);
		}
		finally {
			// do for sure before leaving
		}
	}
	// $ANTLR end "rule1"

	// Delegated rules



	public static final BitSet FOLLOW_ID_in_rule112 = new BitSet(new long[]{0x0000000000000042L});
}
