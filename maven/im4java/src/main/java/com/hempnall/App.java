package com.hempnall;

import com.itextpdf.text.pdf.*;
import org.im4java.core.ConvertCmd;
import org.im4java.core.IMOperation;


/**
 * Hello world!
 *
 */
public class App 
{
    public static void main( String[] args )
            throws Exception
    {

        PdfReader reader = new PdfReader("/Users/James/data/pdf/page1.pdf");
        int objectCount = reader.getXrefSize();
        for (int i=0;i<objectCount;++i) {
            PdfObject obj = reader.getPdfObject(i);
            System.out.println("Object: " + i + " [" + obj + "]");

            if (null == obj ) {
                continue;
            }

            if (obj.isStream()) {
                PRStream strm = (PRStream) obj;
                System.out.println("-> " + strm.get(PdfName.TYPE) + " " + strm.get(PdfName.SUBTYPE));
                System.out.println("-> " + strm.get(PdfName.FILTER)) ;
            } else if (obj.isDictionary()) {
                PdfDictionary dict = (PdfDictionary) obj;
                System.out.println("-> " + dict.get(PdfName.TYPE) + " " + dict.get(PdfName.SUBTYPE));
            }

        }




    }
}
