package com.mycompany.app;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.PrintWriter;

 
import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.io.RandomAccessSourceFactory;
import com.itextpdf.text.pdf.BaseFont;
import com.itextpdf.text.pdf.PRTokeniser;
import com.itextpdf.text.pdf.PdfContentByte;
import com.itextpdf.text.pdf.PdfDictionary;
import com.itextpdf.text.pdf.PdfName;
import com.itextpdf.text.pdf.PdfReader;
import com.itextpdf.text.pdf.PdfTemplate;
import com.itextpdf.text.pdf.PdfWriter;
import com.itextpdf.text.pdf.RandomAccessFileOrArray;
import com.itextpdf.text.pdf.parser.ContentByteUtils;
import com.itextpdf.text.pdf.parser.PdfContentStreamProcessor;
import com.itextpdf.text.pdf.parser.RenderListener;

/**
 * Hello world!
 *
 */
public class App 
{
    public static void main( String[] args )
    	throws Exception
    {

    	try {

	    	String src = "/Users/James/data/pdf/page1.pdf";
	 
	    	
	        PdfReader reader = new PdfReader(src);
	        RenderListener listener = new MyRenderListener();
	        PdfContentStreamProcessor processor = new PdfContentStreamProcessor(listener);
	        PdfDictionary pageDic = reader.getPageN(1);
	        PdfDictionary resourcesDic = pageDic.getAsDict(PdfName.RESOURCES);
	        processor.processContent(ContentByteUtils.getContentBytesForPage(reader, 1), resourcesDic);
	        reader.close();
	        
	        System.out.println( "Hello World!" );
	    } catch (Exception e) {
	    	System.out.println("=======");
	    	e.printStackTrace();
	    }
    }
}
