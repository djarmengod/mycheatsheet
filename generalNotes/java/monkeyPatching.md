"Pure" monkey patching requires a dynamic language, which Java is not.

![Interesting options from SO Question](https://stackoverflow.com/q/42139413/11440856)

Options:
1. Intercept and Act at class-load time via Classpath Precedence or via Java Agent or by writing your own class loader.
2. Byte Code insturmention via ASM.
3. retransform API to change the definition of already loaded classes.



