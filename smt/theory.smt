;;; x86 Instruction theory

;;; An x86 execution env only has two registers (for simplicity)
(declare-datatypes () ((Env (mk-env (eax Int) (ebx Int)))))
;;; (A better env model would use the array theory)

;;; Each instruction is defined to operate as either
;;;
;;;    <inst> eax ebx
;;;    or
;;;    <inst>r ebx eax
;;;

(define-fun mov ((e Env)) Env
  (mk-env (eax e) (eax e)))

(define-fun movr ((e Env)) Env
  (mk-env (ebx e) (ebx e)))

(define-fun add ((e Env)) Env
  (mk-env (eax e) (+ (eax e) (ebx e))))

(define-fun addr ((e Env)) Env
  (mk-env (+ (eax e) (ebx e)) (ebx e)))

;;; Check that "{eax = 1, ebx = 2} mov eax ebx {eax = 1, ebx = 1}"
(assert (= (mov (mk-env 1 2)) (mk-env 1 1)))

;;; Check that "{eax = 8, ebx = 100} add eax ebx; add eax ebx {eax = 8, ebx = 116}"
(assert (= (add (add (mk-env 8 100))) (mk-env 8 116)))

;;; Should get sat
(check-sat)

(declare-const e Env)

;;; Check that a model doesn't exist.  In other words, forall values
;;; given to eax and ebx, the ending value of ebx = the starting value
;;; of eax * 3
(assert (not (= (ebx (add (add (mov e)))) (* (eax e) 3))))

;;; Should get unsat, verifying that an input that violates our spec
;;; does not exist
(check-sat)

;;; # The script is run this way, and should produce the following outputs:
;;;
;;; $ z3 -smt2 theory.smt
;;; sat
;;; unsat
;;;
