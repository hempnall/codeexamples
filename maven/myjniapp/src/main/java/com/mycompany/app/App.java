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

    	Path path = Paths.get("/home/james/aaaaa.jpg");
		byte[] data = Files.readAllBytes(path);

		byte[] newFile = QtJpeg.transformJpeg(data);


		FileOutputStream fos = new FileOutputStream("/home/james/jnioutput.jpg");
		fos.write(newFile);
		fos.close();

        System.out.println( "Hello World!" );
    }
}
