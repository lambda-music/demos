#!/usr/local/bin/lamu -e
"create scheme + kawapad $*{$} + repl $*{$}"
; (close)

(begin
  (import(lamu help))
  (import (lamu scheme))
  (import (lamu notes))
  (import (lamu music))
  (import (lamu pulsar))
  (import (srfi 1))
 
  (define thre (* 2 256))
  (define curve1 (lambda (x)
                   (- 1 (sqrt (- 1 (expt x 2))))))
  (define curve2 (lambda (x)
                   (set! x (- 1 x))
                   (+ 0 (sqrt (- 1 (expt x 2))))))
  (define (create-velocity-curve curve-func)
    (apply int[] 
           (let ((to-flo  (lambda (x)
                            (/ x 127)))
                 (from-flo (lambda (x)
                             (* x 127)))
                 (calc curve2))
             (let loop ((val (iota 128)))
               (if (null? val)
                 '()
                 (cons
                   (from-flo
                     (calc
                       (to-flo (car val)))) 
                   (loop (cdr val))))))))

  ;; create a velocity curve as a list
  (define velocity-curve (create-velocity-curve curve2))
  (open "filter")
  (define in  (car (open-input  "input1" )))
  (define out (car (open-output "output1")))
  (define fo (metro.MetroSequenceDirectFilter thre thre velocity-curve in out ))
  (define t  (pu:create-track 'hello '() fo))
  (pu:put-track t)
  (pu:list-tracks)
  (pu:set-playing #t)
  ; (connect "a2j:GR-55 [24] (capture): GR-55 MIDI 1" "filter:input1" )
  ; (connect "filter:output1" "amsynth:midi_in"  )
  )


; (("a2j:GR-55 [24] (capture): GR-55 MIDI 1":to-string):index-of "GR" )
; (java.lang.System:err:println "hello world")


