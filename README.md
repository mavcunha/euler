# Project Euler ZSH script

This is nothing more than a shell script to run [Project
Euler](https://projecteuler.net) exercises in different programming languages.

```
./euler -e EXERCISE -l LANGUAGE
```

Where `EXERCISE` is the number of the exercise and `LANGUAGE` is the
programming language you want to run the exercise.

To run all languages you can use the `-a` parameter.

Each exercise file needs to be created following the layout:

```
src/EXERCISE/LANGUAGE/EXERCISE.EXT
```

For example, for exercise number 001 in python the script
expects:

```
src/001/python/001.py
```

## Adding new languages

Inside the script there's a simple function `setlang` that takes 3 arguments.
The *language*, *interpreter* and *file-extension*. Using the example above
for Python, we define it as:

```
setlang "python" "python3" "py"
```

Naturally you can use whatever you think is appropriate for file extension and
language name, just the interpreter that will depend of which binary you're
using to run the language exercise.

## Using for more than Project Euler exercises

This script does not care about Project Euler itself, it just executes using a
specific interpreter a file. So you can use it to execute anything in several
languages just as an exercise. Like _Hello World!_ in several languages.
Anything that goes into `-e` is the directory and expected name of the file to
execute.
