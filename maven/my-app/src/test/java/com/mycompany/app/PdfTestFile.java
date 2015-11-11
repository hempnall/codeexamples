package com.mycompany.app;

import com.itextpdf.text.pdf.PdfReader;
import com.itextpdf.text.pdf.parser.PdfTextExtractor;
import java.io.*;
import java.nio.file.*;


public class PdfTestFile {
	

	public PdfTestFile(String testname) {

        try {     

        	String s  = System.getProperty("basedir");
        	String filename = Paths.get(s, "testdata", testname).toString();

	        PdfReader reader = new PdfReader( filename );
	        int n = reader.getNumberOfPages(); 
	        String str=PdfTextExtractor.getTextFromPage(reader, 1); //Extracting the content from a particular page.
	        System.out.println(str);
	        reader.close();
        }
        catch (Exception e) {
            System.out.println(e);
        }


	}



}