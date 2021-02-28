# Project Euler ZSH script

This is nothing more than a shell script to run [Project
Euler](https://projecteuler.net) exercises in different programming languages.

```
./euler -e EXERCISE -l LANGUAGE
```

Where `EXERCISE` is the number of the exercise and `LANGUAGE` is the
programming language you want to run the exercise. If `-l` is
omitted than the script will execute for all languages.

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

## Exercise versioning

Sometimes you might find more than one solution for the problem and wants to
keep them all. This script will allow a crude versioning of the solutions by
appending a `.V` where `V` is any character. To invoke a specific version just
add it to the `-e ` argument. Example:

Suppose you have these solutions:
```
src/001/python/001.1.py
src/001/python/001.2.py
```

You invoke an specific version by:
```
./euler -e 001.2 -l python
```

## Displaying the solution

It is possible to output the contents of an exercise by passing the `--show` flag. This
will instruct the script to print out the content of the file instead of running it.
Like so:

```
./euler -show -l python -e 001.2
python:
print(sum(set(range(0, 1000, 5)) | set(range(0, 1000, 3))))
```

## Using a diferent directory for your solutions

If the environment variable `PROJECT_EULER_DIR` is defined this script
will use it as the source for your solutions. You can inspect what
is the current directory by using the flag  `--summary` which will
display a quick summary:

```
Project Euler Solution Summary
using dir: src
clojure: 001 002 003
wolfram: 001 002 003
lua:     001 002 003
java:    001 002 003
sql:     001 002 003
zsh:     001 002 003
ruby:    001 002 003
raku:    001 002 003
python:  001 002 003
```

## Timing your solution

Sometimes solutions might take longer than planned or you are simply
optimizing your solution. Using the flag `--time` will execute the
interpreters with `time` before them which should you give a quick
summary of execution time.

```
$ euler --time -e 005 -l sql

sql:
232792560
  6.29s user 0.01s system 99% cpu 6.309 total
```

## Listing languages defined in the script

If you need to do a quick check no the configured languages
you have use `--list`, example:

```
Languages defined
clojur (clj -M)
wolfram (wolframscript -file)
lua (lua)
java (java)
sql (sqlite3 :memory: <)
zsh (zsh)
ruby (ruby)
raku (raku)
python (python3)
```

## Respecting Project Euler's solutions

The project asks their users to not share beyond the first hundred
solutions. I intend to repect that while keeping a couple of the first
ones to illustrate and test this script.
