package com.mycompany.xmlunitapp;


import junit.framework.Test;
import junit.framework.TestCase;
import junit.framework.TestSuite;
import org.custommonkey.xmlunit.DetailedDiff;
import org.custommonkey.xmlunit.Diff;
import org.w3c.dom.Document;
import org.w3c.dom.NodeList;
import org.w3c.dom.Node;

import org.custommonkey.xmlunit.XMLTestCase;
import org.custommonkey.xmlunit.XMLUnit;
import org.custommonkey.xmlunit.SimpleXpathEngine;
import org.custommonkey.xmlunit.XpathEngine;




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
        String myControlXML2 = "<msg><uuid  att2=\"def\" att1=\"abc\">0x00435A8C</uuid> </msg> " ;
       // String myTestXML = "<msg><localId>2376</localId> </msg>";
        assertXMLEqual("Comparing test xml to control xml",
            myControlXML, myControlXML2);
    }

    public void testAppXML2() throws Exception
    {
        System.out.println("<test>");
        assertTrue( true );
        XMLUnit.setIgnoreWhitespace(true);

        String expected = "<element>my123</element>";
        Document doc = XMLUnit.buildControlDocument(expected);
        String myControlXML2 = "<element>my123</element>" ;
       // String myTestXML = "<msg><localId>2376</localId> </msg>";
        assertXMLEqual("Comparing test xml to control xml",
            expected, myControlXML2);
    }


    public void testXPath() throws Exception {

        String result = "<document><els>" +
                        "<element key=\"a\">my123</element>" +
                        "<element key=\"b\">my123</element>" +
                        "<element key=\"c\">my123</element>" +
                        "<element key=\"d\">my123</element>" +
                        "</els></document>";

        Document docResult = XMLUnit.buildControlDocument(result);                


        assertEquals( "document", docResult.getDocumentElement().getNodeName() );
        assertXpathExists("/document/els/element", docResult);
        assertXpathExists("/document/els/element[@key=\"c\"]", docResult);
        assertXpathNotExists("/document/els/element[@key=\"sd\"]", docResult);


        XpathEngine eng = XMLUnit.newXpathEngine();
        NodeList l = eng.getMatchingNodes("//foo:bar", docResult);
        assertEquals(0, l.getLength());

        l = eng.getMatchingNodes("/document/els/element", docResult);
        assertEquals(4, l.getLength());

        l = eng.getMatchingNodes("/document/els/element[@key=\"c\"]",docResult);
        assertEquals(1, l.getLength());

            assertXpathEvaluatesTo("my123","/document/els/element[@key=\"c\"]",docResult);

       // Diff f = new Diff(n, docResult);



    }


    public void testXPath2() throws Exception {

        String result = "<document><els>" +
                        "<element key=\"a\">my123</element>" +
                        "<element key=\"b\">my123</element>" +
                        "<element key=\"c\">my123</element>" +
                        "<element key=\"d\">my123</element>" +
                        "</els></document>";

        String test =   "<element key=\"c\">my123</element>" ;

        Document docResult = XMLUnit.buildControlDocument(result);                


        assertEquals( "document", docResult.getDocumentElement().getNodeName() );
        assertXpathExists("/document/els/element", docResult);
        assertXpathExists("/document/els/element[@key=\"c\"]", docResult);
        assertXpathNotExists("/document/els/element[@key=\"sd\"]", docResult);


        XpathEngine eng = XMLUnit.newXpathEngine();
        NodeList l = eng.getMatchingNodes("//foo:bar", docResult);
        assertEquals(0, l.getLength());

        l = eng.getMatchingNodes("/document/els/element", docResult);
        assertEquals(4, l.getLength());
        String xpath = "/document/els/element[@key=\"c\"]";
        assertXpathsEqual(xpath,result,"./element",test);


         assertXpathEvaluatesTo("my123","/document/els/element[@key=\"c\"]",docResult);

       // Diff f = new Diff(n, docResult);



    }

}
