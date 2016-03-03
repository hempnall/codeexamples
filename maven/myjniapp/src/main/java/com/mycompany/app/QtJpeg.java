package com.mycompany.app;

import java.io.*;

public class QtJpeg {

   static {
      System.loadLibrary("QtJpeg"); // Load native library at runtime                                   // hello.dll (Windows) or libhello.so (Unixes)
   }
 
   // Declare a native method sayHello() that receives nothing and returns void
   public static native byte[] transformJpeg(byte[] input);
 

}