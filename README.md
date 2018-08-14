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
  cd %HOME%Downloads/ && git clone https://github.com/Kove-W-O-Salter/hurl-templater ^
                      && cd hurl-templater                                           ^
                      && cabal configure                                             ^
                      && cabal build                                                 ^
                      && cabal install                                               ^
                      && cabal clean
  ```
> NOTE: I don't know if it works on `Windows`. `Windows` users, please report any problems in an issue.

## Usage
```
hurl new $TEMPLATE_NAME $INSTANCE_DIRECTORY
```

## Templates
A template contains a many file-system trees which are either leaves (`leaf`, file)
or nodes (`node`, directory). You define a `leaf` by using the `leaf` keyword
followed by the `leaf`s name (in single quotes), then an equals sign and some
double-quoted text (the `leaf`s content). For example:
```
leaf 'example.txt' = "
This is an example.
"
```
You define a `node` by using the `node` keyword followed by it's name (in single quotes),
then an equals sign and a list of `leaf`s separated by white-spaces and enclosed in `[` and `]`.
For example:
```
node 'example.d' = [
leaf 'example.txt' = "
This is an example.
"
leaf 'example2.txt' = "
This is another example.
"
]
```
Please note that the `node`s `leaf`'s paths are prefixed with the `node`s name;
`node`s have scope. There is a root `node` that is specified on the commandline.
Your templates are stored in your `~/.hurl/` (`%HOME%\.hurl\`, on `Windows`) and
have the `.hurl` file extension. Your templates name is it's filename **without
the file extension**.

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
