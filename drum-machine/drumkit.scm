;===============================================================================
;
; This scheme script file defines a number of instruments which I frequently
; use. This does not make sense for those people other than me but this also
; might be an example to understand how to access to your favorite instruments
; from Pulsar sequencer.
;
; See 
;    RHYTHM_PATTERNS
;    INSTRUMENTALS
; 
; (Tue, 30 Jul 2019 11:32:22 +0900)
;===============================================================================

(import (srfi 1))
(import (kawa pprint))
(use "libh2jazzy")

; n= a number of swing sequences ( c8 r8 c8 c8 ) which length usually equals to a halftone.
; ex (n-swing 2 1) generates the orthodox swing pattern which consists 4 quarter tones.
;
; Parameters 
;   n       : the number to repeat the specific pattern.
;   b       : the bar count duruing which the specific pattern to repeat.
;   ns-proc : specifying the pattern to repeat. 
(define n-swing 
  (lambda(n b ns-proc) 
    (cons 
      (len b)
      (sca! b
            (apply append 
                   (map 
                     (lambda (x)
                       (mov! (/ x n)
                             (sca! (/ 1 n)
                                   (ns-proc x n))))
                     (iota n )))))))

;==============================================================================================
; INSTRUMENTALS
;==============================================================================================

(define key-name-value-list-to-name-value-list 
  (lambda ( key-name-value-list )
    (map 
      (lambda (e) (cons (cadr e) (cddr e))) 
      key-name-value-list )))

(define key-name-value-list-to-name-key-list 
  (lambda ( key-name-value-list )
    (map 
      (lambda (e) (cons (cadr e) (car e))) 
      key-name-value-list )))

(define insert-list-by-index 
  (lambda (dst-list src-list idx)
    (let-values (((head tail) (split-at dst-list idx )))
                (append head src-list tail))))
  
;
; This is association-list of symbols and cons-cells. The key consists symbols
; to identify each instrument. The value consists cons-cells. A cons-cell in
; the list contains instrument name on the car side, note name on the cdr side.

; (lambda (notes) (n note: note-number notes ))

(define inst-list (map (lambda (x)
                         (cons 
                           (first x) 
                           (cons (second x)
                                 (let ((note-number (third x)))
                                   (lambda (notes) (n note: note-number notes ))))))
                       h2j-drumkit ))

(define (sym2val s lst)
  (if (not (symbol? s))
    (raise (cons 'invalid-argument-exception s  ) ))
  (cdr (or (assq s lst)
           (raise (string-append "instrumental not found error "
                                 (symbol->string s))))))

; ===========================================================================================
; RHYTHM_PATTERNS
; ===========================================================================================

; This is association-list of symbols and cons-cells. The key consists symbols
; to identify each pattern. The value consists cons-cells. A cons-cell in the
; list contains instrument name on the car side, a procedure object to generate
; pattern on the cdr side.
;
; We call the procedure "pns-function".
(define pns-list
  `((pns-two-four         .  ( "2-4 Beat"    . ,(lambda (x m) 
                                                  (append
                                                    (n type: 'note mark: 'A enab: #t           pos: (/ 2 4) velo:  (+ 0.5  (rnd -0.0  0.1 )))))))

    (pns-basic-one        .  ( "1 Beat"      . ,(lambda (x m) 
                                                  (append
                                                    (n type: 'note mark: 'A enab: (luck 1.00 ) pos: 0       velo: (+ 0.3  (rnd -0.0  0.1 )))))))

    (pns-basic-4-swing    .  ( "4-Swing"     . ,(lambda (x m) 
                                                  (append
                                                    (n type: 'note mark: 'A enab: (luck 1.00 ) pos: (/ 0 4) velo: (+ 0.3  (rnd -0.0  0.1 )))
                                                    (n type: 'note mark: 'A enab: (luck 0.00 ) pos: (/ 1 4) velo: (+ 0.5  (rnd -0.0  0.1 )))
                                                    (n type: 'note mark: 'A enab: (luck 1.00 ) pos: (/ 2 4) velo: (+ 0.3  (rnd -0.0  0.1 )))
                                                    (n type: 'note mark: 'A enab: (luck 1.00 ) pos: (/ 3 4) velo: (+ 0.5  (rnd -0.0  0.3 )))))) )

    (pns-basic-6-swing    .  ( "6-Swing"     . ,(lambda (x m) 
                                                  (append
                                                    (n type: 'note mark: 'A enab: (luck 1.00 ) pos: (/ 0 6) velo: (+ 0.3  (rnd -0.0  0.1 )))
                                                    (n type: 'note mark: 'A enab: (luck 0.00 ) pos: (/ 2 6) velo: (+ 0.3  (rnd -0.0  0.1 )))
                                                    (n type: 'note mark: 'A enab: (luck 1.00 ) pos: (/ 3 6) velo: (+ 0.3  (rnd -0.0  0.1 )))
                                                    (n type: 'note mark: 'A enab: (luck 1.00 ) pos: (/ 5 6) velo: (+ 0.5  (rnd -0.0  0.3 ))))))) 

    (pns-basic-5-swing    .  ( "5-Swing"     . ,(lambda (x m) 
                                                  (append
                                                    (n type: 'note mark: 'A enab: (luck 1.00 ) pos: (/ 0 5) velo: (+ 0.3  (rnd -0.0  0.1 )))
                                                    (n type: 'note mark: 'A enab: (luck 0.00 ) pos: (/ 1 5) velo: (+ 0.3  (rnd -0.0  0.1 )))
                                                    (n type: 'note mark: 'A enab: (luck 1.00 ) pos: (/ 2 5) velo: (+ 0.3  (rnd -0.0  0.1 )))
                                                    (n type: 'note mark: 'A enab: (luck 0.00 ) pos: (/ 3 5) velo: (+ 0.3  (rnd -0.0  0.1 )))
                                                    (n type: 'note mark: 'A enab: (luck 1.00 ) pos: (/ 4 5) velo: (+ 0.5  (rnd -0.0  0.3 )))))))

    (pns-ntime            .  ( "pns-ntime"   . ,(lambda (x m) 
                                                  (list
                                                    (n mark: 'A enab: (luck 1.00 ) pos: (/ 0 4) velo: (+ 0.3  (rnd -0.0  0.1 )))))))))


(define main-track-sequence (lambda () (list (len 4/4))))
(set-main   (lambda()
               (display-warn "====set-main SET-MAIN ========\n" )
               (newline-warn)
               (put-track  (new-track 'main (lambda args
                                              (apply main-track-sequence args ))))))



; vim: filetype=scheme expandtab :
