# Synthepyz: Synthesizing Operation Implementations for Python #

*Project team: Souradeep Dutta, Nicholas V. Lewchenko, and William Temple*

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
