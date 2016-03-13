package com.mycompany.xmlunitapp;


import junit.framework.Test;
import junit.framework.TestCase;
import junit.framework.TestSuite;
import org.custommonkey.xmlunit.DetailedDiff;
import org.custommonkey.xmlunit.Diff;
import org.custommonkey.xmlunit.XMLTestCase;
import org.custommonkey.xmlunit.XMLUnit;

import org.xml.sax.SAXException;


/**
 * Unit test for simple App.
 */
public class AppXMLTest 
    extends XMLTestCase
{
    /**
     * Create the test case
     *
     * @param testName name of the test case
     */
    public AppXMLTest( String testName )
    {
        super( testName );
        System.out.println("<construct>");
        // XMLUnit.setControlParser("org.apache.xerces.jaxp.DocumentBuilderFactoryImpl");
        // XMLUnit.setTestParser("org.apache.xerces.jaxp.DocumentBuilderFactoryImpl");
        // XMLUnit.setSAXParserFactory("org.apache.xerces.jaxp.SAXParserFactoryImpl");
        // XMLUnit.setTransformerFactory("org.apache.xalan.processor.TransformerFactoryImpl");
    }

    /**
     * @return the suite of tests being tested
     */
    public static Test suite()
    {
        System.out.println("<static>");
        return new TestSuite( AppXMLTest.class );
    }

    /**
     * Rigourous Test :-)
     */
    public void testAppXML() throws Exception
    {
        System.out.println("<test>");
        assertTrue( true );
        XMLUnit.setIgnoreWhitespace(true);
        String myControlXML = "<msg><uuid att1=\"abc\" att2=\"def\">0x00435A8C</uuid></msg>";
        String myControlXML2 = "<msg><uuid  att2=\"dedf\" att1=\"abc\">0x00435A8C</uuid> </msg> " ;
       // String myTestXML = "<msg><localId>2376</localId> </msg>";
        assertXMLEqual("Comparing test xml to control xml",
            myControlXML, myControlXML2);
    }
}
