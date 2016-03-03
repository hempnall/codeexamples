# Using JNI with Java and Qt

## Create MVN project

```
mvn -B archetype:generate   -DarchetypeGroupId=org.apache.maven.archetypes   -DgroupId=com.mycompany.app   -DartifactId=myjniapp
```

## Create Java source with native qualifier

```
package com.mycompany.app;

import java.io.*;

public class QtJpeg {

   static {
      System.loadLibrary("QtJpeg"); // Load native library at runtime                                   // hello.dll (Windows) or libhello.so (Unixes)
   }
 
   // Declare a native method sayHello() that receives nothing and returns void
   private native ByteArrayOutputStream transformJpeg(ByteArrayOutputStream input);
 

}
```

Compile with:

```
$ cd myjniapp
$ mvn compile
$ cd target/classes
$ javah com.mycompany.app.QtJpeg
```

A header file will be generated in ```target/classes```

## Qt Stuff

