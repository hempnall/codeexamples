package com.mycompany.app;

import junit.framework.Assert;
import org.junit.Test;
import java.io.*;


import org.im4java.core.*;


import com.itextpdf.text.pdf.PdfReader;
import com.itextpdf.text.pdf.parser.PdfTextExtractor;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * Unit test for simple App.
 */
public class newTest 
{
    /**
     * Create the test case
     *
     * @param testName name of the test case
     */


    @Test
    public void AppTest(  )
    {
        Assert.assertEquals(5+4, 3+6);


        try {


                Logger logger = LoggerFactory.getLogger(newTest.class);
                logger.info("Hello World");

            PdfTestFile file = new PdfTestFile("test1.pdf");

            // String s  = System.getProperty("basedir");
            // System.out.println("***"  + s + "***");

            // String imPath="/usr/bin/local";
            // ConvertCmd cmd = new ConvertCmd();
            // //cmd.setSearchPath(imPath);
            // IMOperation op = new IMOperation();
            // op.addImage("/Users/James/data/jpg/PIC00036.JPG");
            // op.resize(800,600);
            // op.addImage("/Users/James/data/jpg/myimage_small.jpg");
            // cmd.run(op);


            System.out.println( "Hello World!"  + StringApp.getString() );
        } catch (Exception e) {
            System.out.println("an error occured" + e);
        }
    }


}
