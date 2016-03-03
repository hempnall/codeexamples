package com.mycompany.app;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.nio.file.Path;
import java.io.*;



/**
 * Hello world!
 *
 */
public class App 
{
    public static void main( String[] args ) throws Exception
    {

    	Path path = Paths.get("/Users/James/aaaaa.jpg");
		byte[] data = Files.readAllBytes(path);

		byte[] newFile = QtJpeg.transformJpeg(data);


		FileOutputStream fos = new FileOutputStream("/Users/James/jnioutput.jpg");
		fos.write(newFile);
		fos.close();

        System.out.println( "Hello World!" );
    }
}
