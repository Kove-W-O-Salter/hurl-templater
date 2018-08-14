# Hurl Templater
## Description
A program for creating file-system trees from template files.

## Dependencies
### `Git`
* On `Ubuntu` (`18.04`) just open up a `Terminal` (`Ctrl-Alt-t`) and run:
  ```bash
  sudo apt-get install git
  ```
* On `Generic Linux` read the `Installing on Linux` section of [installing git](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git).
* On `Mac` read the `Installing on Mac` section of [installing git](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git).
* On `Windows` read the `Installing on Windows` section of [installing git](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git).

### `Haskell Platform`
* On `Ubuntu` (`18.04`) just open up a `Terminal` (`Ctrl-Alt-t`) and run:
  ```bash
  sudo apt-get install haskell-platform
  ```
* On `Generic Linux` follow [these instructions](https://www.haskell.org/platform/#linux-generic).
* On `Mac` follow [these instructions](https://www.haskell.org/platform/#osx).
* On `Windows` follow [these instructions](https://www.haskell.org/platform/#windows).

## Installation
* On `Ubuntu` (`18.04`), `Generic Linux` and `Mac` just open up a `Terminal`, and run:
  ```bash
  cd ~/Downloads/ && git clone https://github.com/Kove-W-O-Salter/hurl-templater \
                  && cd hurl-templater                                           \
                  && cabal configure                                             \
                  && cabal build                                                 \
                  && cabal install                                               \
                  && cabal clean
  ```
* On `Windows` open up a `Terminal` and run:
  ```bash
  cd %HOME%\Downloads\ && git clone https://github.com/Kove-W-O-Salter/hurl-templater ^
                       && cd hurl-templater                                           ^
                       && cabal configure                                             ^
                       && cabal build                                                 ^
                       && cabal install                                               ^
                       && cabal clean
  ```
> NOTE: `Windows` isn't supported yet. I'm working on it. If you'd like to help just send a `pr`.

## Usage
```
hurl new $TEMPLATE_NAME $INSTANCE_DIRECTORY
```

## Templates
A template is a file, stored in a special directory (`~/.hurl` on `POSIX` and
`%HOME%\.hurl` on `Windows`), that has the `.hurl` file extension. Templates
are used to specify directory skeletons containing:
* `leaf`s: files which have default contents.
* `node`s: which contain other `leaf`s and `node`s.
These `leaf`s and `node`s are, generically, referred to as `tree`s.
The syntax for defining a `tree` is very simple:
* Lets start with an example: to define a file named `example.txt`, that contains the text
  `this is an example`, we would write:
  ```
  leaf 'example.txt' = "
  this is an example
  "
  ```
  First we let `hurl` know that we are defining a `leaf` (with the `leaf` keyword), then specify the
  name of the file (`example.txt`) and, finally, specify it's contents in double quotes.
* Lets start with an example: to define a directory named `example.d`, that contains `example.txt`,
  we would write:
  ```
  node 'example.d' = [

  leaf 'example.txt' = "
  this is an example
  "

  ]
  ```
  First we let `hurl` know that we are defining a `node` (with the `node` keyword), then specify the
  name of the directory (`example.d`) and, finally, specify it's branches in square braces.
> NOTE: when we specifying the template to use, on the command-line, please remember to
>       omit the file-extension and to never specify a full path.

## License
```
Copyright (c) 2018 Kove W. Ochre-Salter

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
"Software"), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be included
in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
```
The above verbatim is from [/LICENSE](./LICENSE).
