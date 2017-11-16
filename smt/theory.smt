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

(check-sat)
