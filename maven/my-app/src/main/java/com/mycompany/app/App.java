package com.mycompany.app;

/**
 * Hello world!
 *
 */


public class App 
{
    public static void main( String[] args )
    {

    	try {


	        System.out.println( "Hello World!"  + StringApp.getString() );
	    } catch (Exception e) {
	    	System.out.println("an error occured" + e);
	    }
    }
}
