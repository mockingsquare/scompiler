# scompiler
Swift implementation of an interpreter originally written in Smalltalk

This project contains a Swift implementation of the **JustKidding** language (file extension `.jk`) based on a [compiler course](https://people.scs.carleton.ca/~lalonde/comp3002/) offered by Professor Wilf Lalonde.

One thing to note is that I'm trying to translate a project from a very flexible object-oriented Smalltalk to a strongly typed and less object-oriented Swift. Some of my design choices may not lead to the best implementation, and I might have made a "bad" choice because I was trying to implement features that Smalltalk offers in Swift or simply because I did not know a better way. 

## Implementation
- [ ] Implement a Parser and Scanner tables and compile and evaluate something like “a*b where a=10-5; b=20;” (Jan 10 ~ Jan 23)
- [ ] Implement a compiler with for loops, if statements, and simple expressions (Jan 24 ~ Feb 6)
- [ ] Implement class Relations which is a collection of triples (Feb 7 ~ Feb 20) 
- [ ] Implement a finite state machine (Feb 7 ~ Feb 20)
- [ ] Create a Regular Expression Translator (Feb 21 ~ Mar 6) 
- [ ] Implement a Grammar Translator (Feb 21 ~ Mar 6)
- [ ] Build sets (Mar 7 ~ Mar 20)
- [ ] Prepare to build a Readahead FSM (Mar 7 ~ Mar 20)
- [ ] Build tables (Mar 21 ~ Apr 3)

# Project structure
The project uses [SPM](https://github.com/apple/swift-package-manager/) to manage executables, framework and dependencies.

# How to run
Windows, Mac, and Linux are all supported by Swift. If you are new to Swift, I suggest you [download toolchains](https://www.swift.org/download/) and follow the [instruction](https://www.swift.org/getting-started/) on how to install.
> 2022/02/14 Windows users need to allow developer mode in their settings to use SPM

`swift build`

1. To use a prompt: `swift run`
2. To use a file: `swift run scompiler [filename]`