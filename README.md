# Classy - a C++ class hierarchy analyzer
Classy is an easy to use command line tool that can print out a tree for C++ class hierarchies. Output includes class names, whether the class is declared as a ```class``` or ```struct```, class inheritance publicity, and containing file names. Classy is a simple Ruby.

## Installation
Assuming you already have Ruby installed, you just need to run ```install.sh```. The installer script just installs dependencies and creates a symbolic link to ```/usr/local/bin/classy```.

## Usage
* ```classy directory```: Prints out the class tree extracted from all ```.h``` and ```.hpp``` files within the specified directory.

* ```classy directory ClassName```: Prints out the class tree for classes under the class ```ClassName```, extracted from all ```.h``` and ```.hpp``` files within the specified directory.

## Disclaimer
Classy cannot interpret certain class declarations that have unusual syntax (namely, disgusting declarations that have the opening curly brace on a separate line). Classy is currently in development and is by no means complete. There are several things in the code that are glaringly inefficient. Bug reports and pull requests are welcome.

That being said, Classy works well for most projects and can be a welcome addition to your workflow.