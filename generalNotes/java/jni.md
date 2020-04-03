Java loads native libraries (JNI) by searching the path defined with the java.library.path. system property. This is sufficient for most JNI libraries. 

However, some libraries themselves make use of other dynamically linked libraries. Java will locate the initial JNI library using the Java library path, but the secondary libraries are loaded using the default mechanism for the platform (windows/linux/solaris)

ex: LIBPATH on AIX, SHLIB_PATH on HP-UX, LD_LIBRARY_PATH on Linux and Solaris
