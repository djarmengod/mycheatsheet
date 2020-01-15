## ag also known as The Silver Searcher - https://github.com/ggreer/the_silver_searcher

### How is it so fast ? 

1. Ag use the ignore files to set the search context to exclude ignores ex: .gitignore
2. Ag uses Pthreads to take advantage of multiple CPU cores and search files in parallel.
3. Files are mmap()ed instead of read into a buffer - https://stackoverflow.com/questions/5588605/mmap-vs-read
4. Literal string searching uses Boyer-Moore strstr - The algorithm preprocesses the string being searched for (the pattern), but not the string being searched in (the text).
5. Regex searching uses PCRE's JIT compiler (if Ag is built with PCRE >=8.21).
6. Ag calls pcre_study() before executing the same regex on every file.
7. Instead of calling fnmatch() on every pattern in your ignore files, non-regex patterns are loaded into arrays and binary searched.
