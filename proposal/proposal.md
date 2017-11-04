# Synthepyz: Synthesizing Operation Implementations for Python #

*Project team: Souradeep Dutta, Nicholas V. Lewchenko, and William Temple*

## Introduction

Adding new native operations to a compiled language requires
implementing those operations at the assembly level, a task that is
tedious and error-prone for a human developer.  An efficient low-level
implementation is often quite different from the high-level logical or
mathematical description a developer already understands.

We will design a synthesis engine capable of discovering efficient x86
implementations of operations defined in higher-level mathematical
theories, such as integer arithmetic, and use it to add native support
for complex operations not yet covered by our Python compiler
implementation.

## Project Timeline

|Week  |Goals |
|:---- |:---- |
|11/5-11/11|Investigate SMT-solving and program synthesis methods based on solver-assisted model checking, and generate the initial literature review. Develop a simple proof-of-concept for a basic arithmetic operation not defined in our language -- namely, multiplication.|
|11/12-11/18|Determine what modifications to our Python compiler will be necessary for the integration of the simple Proof-of-Concept into the python compiler and begin integration.|
|11/19-11/25|Design and development of additional operations, assessing the extent of operations that we can feasibly derive and the flexibility of the synthesis engine.|
|11/26-12/2|Buffer (it's always good to have some dead space in case something goes wrong)|
|12/3-12/9|Begin report and brainstorm applications of our method as well as elemental examples describing the utility (or possible lack of utility -- we're not sure what we may find) of our method in programming languages.|
|12/10-12/16|Finish report, for submission on Sunday, 12/17|