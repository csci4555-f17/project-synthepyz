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



[1]: http://sygus.seas.upenn.edu/files/sygus_extended.pdf
