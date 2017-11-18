# Status update #

The operation implementation synthesis problem can be broken down into
two sub-problems: **generating program candidates** and **verifying
program candidates**.  Work on the first has been a survey of
solutions in recent synthesis literature.  We are focusing on
an ["enumerative learning" approach][1] which we believe x86 assembly
will lend itself to (thanks to the non-nesting, sequential grammar).

The second problem involves writing SMT models of relevant x86
instructions, defined using a subset of linear integer arithmetic,
such that programs of them can be validated against our operational
specifications (defined with a larger subset of linear integer
arithmetic).  We have created a proof-of-concept model in which `movl`
and `addl` are modeled using SMT function definitions.

    (declare-datatypes () ((Env (mk-env (eax Int) (ebx Int)))))
    
    (define-fun mov ((e Env)) Env
        (mk-env (eax e) (eax e)))
    
    (define-fun add ((e Env)) Env
        (mk-env (eax e) (+ (eax e) (ebx e))))


## Exploring Synthesis

The SMT models of instructions and goal programs lend themselves to a
style of **deductive synthesis**, in which we use an SMT solver (Z3)
to deductively solve for programs that satisfy the given constraings.
However, we can alternatively synthesize programs for a given model using
a Counter-Example Guided Inductive Synthesis (CEGIS) loop. In general,
the CEGIS method involves generating a candidate program *P*, attempting
to **validate** *P*, then if *P* is correct, accept P as a solution,
otherwise, provide a counter-example which is utilized in the next
iteration of the **generation** step. We have identified two primary
implementations of CEGIS methodologies as our candidates:

### Oracle-Guided Synthesis

In this model, we use an external implementation of the program (such as the
Python interpreter) to additionally constrain our program search space.
Using the "canonical" implementation of Python, we may synthesize equivalent
x86 programs using test-cases derived from our models. In other words, use
the model to generate test-cases and generate a program that that solves the
test-cases. Oracle-guided synthesis has a particular refutation strategy that
will allow us to derive a program based on Python's output. In effect,
training a compiler for python using the interpreter.

### Enumerative Synthesis

In this model, we fully-inductively generate candidate programs for a given
set of test-cases (mirroring TDD practices). We consider all sets of *k-Programs*,
where `k` is the number of instructions in the program, beginning at zero, until
we find a program that satisfies all of our test-cases. A pruning strategy considers
only programs with **unique output sets**, in other words, only programs with a unique
set of outputs for the set of test-cases. We can combine this strategy with Oracle-guided
synthesis to generate test-cases automatically for known expressions, and allowing the
programmer to specify tests for new operations.

[1]: http://sygus.seas.upenn.edu/files/sygus_extended.pdf
