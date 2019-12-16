## Size limitations related to Args and Env Vars


For Linux kernel (did not care to check Windows) - Versions 2.6.25 and later... 2 limits and 1 floor size

1> limit on total size for storage of env vars =  1/4 of the allowed stack size and the total size is limited to 3/4 of the value of the kernel constant _STK_LIM (8 Mibibytes)
2> limit per string 32 pages..
3> there's also floor size on total space - 32 pages..
So if page size is 4kb (common default) then 128kb...
4> and the maximum number of strings is 0x7FFFFFFF - 2147483647 in decimal

Ref: http://man7.org/linux/man-pages/man2/execve.2.html
Limits on size of arguments and environment
