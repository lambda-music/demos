#!/home/ats/bin/lamu -e
; "create scheme + kawapad $*{$} + repl"
"create scheme + kawapad $*{$} + repl $*{$}"

(begin
 (import(lamu help))
 (import (lamu scheme))
 (import (lamu notes))
 (import (lamu music))
 (import (lamu pulsar))
 (open "filter")
 (define in  (car (open-input  "input1" )))
 (define out (car (open-output "output1")))
 (define fo (metro.MetroSequenceDirectFilter (* 2048 8) in out ))
 (set! fo:threshold (* 8 1024))
 (define t  (pu:create-track 'hello '() fo))
 (pu:put-track t)
 (pu:list-tracks)
 (pu:set-playing #t)
 ; (connect "a2j:GR-55 [24] (capture): GR-55 MIDI 1" "filter:input1" )
 ; (connect "filter:output1" "amsynth:midi_in"  )
 )

; (("a2j:GR-55 [24] (capture): GR-55 MIDI 1":to-string):index-of "GR" )
; (java.lang.System:err:println "hello world")


