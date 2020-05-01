#!/usr/local/bin/lamu -e
"create scheme + kawapad $*{$} + repl $*{$}"
; (close)

#|
 | === How to Calulate the Proper Threshold Value ===
 |
 | 60sec/BPM == NOTE-LEN(sec)
 | NOTE-LEN * x ==  1sec
 | x == 1sec/NOTE-LEN
 | 
 | ; The `thre` parameter should be specified by length of a bar
 | ; In this case, we can presume the current time signature is 4/4.
 | ; That is, it should be divided by 4.
 |
 | (1sec/note-len)/4 == thre
 | (1sec/(60sec/BPM))/4==thre
 | bpm/60 * 1/4
 | bpm/240=thre
 | 
 | (Sat, 02 May 2020 04:53:14 +0900)
 |#

(begin
  (import(lamu help))
  (import (lamu scheme))
  (import (lamu notes))
  (import (lamu music))
  (import (lamu pulsar))
  (import (srfi 1))
 
  ; === Defining the Threshold Value ===
  ; `thre` is the minimum note length
  ; the MIDI notes which is shorter than this value
  ; will be removed with this filter program.
  (define thre (* 2 256))

  ; === Defining Velocity Curve ===
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


