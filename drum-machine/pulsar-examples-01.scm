#!/usr/bin/lamu 
"create + scheme + gui $*{$}"

(n velo: 1 2 3 join: 'inner )


(n type: 'note (n  velo: 1 3 4 5 6 velo: 5 6 7 pos: 3 4 5 ))

(assq 'a '(1 ))

(n type: 'note velo: 111
    (n  velo: 1 3 4 5 6 velo: 1 2 3  pos: 3 4 5  ) )
(((type . note) (pos . 3) (velo . 111))
((type . note) (pos . 4) (velo . 111))
((type . note) (pos . 5) (velo . 111))
((type . note) (velo . 111))
((type . note) (velo . 111))
((type . note) (velo . 111))
((type . note) (velo . 111))
((type . note) (velo . 111)))

(n type: 'note velo: 111 velo: 1 3 4 5 6 velo: 1 2 3  pos: 3 4 5  )
(((type . note) (pos . 3) (velo . 111))
 ((pos . 4) (velo . 1))
   ((pos . 5) (velo . 3))
   ((velo . 4))
   ((velo . 5))
   ((velo . 6))
   ((velo . 1))
   ((velo . 2))
   ((velo . 3)))

(((type . note) (pos . 3) (velo . 111))
 ((pos . 4) (velo . 11))
   ((pos . 5) (velo . 11))
   ((velo . 11))
   ((velo . 6))
   ((velo . 1))
   ((velo . 2))
   ((velo . 3)))

(n velo: 1 (melody "do re mi"))

(n type: 'note 
    (n  velo: 1 3 4 5 6 velo: 1 2 3  pos: 3 4 5  ) )
(((type . note) (pos . 3) (velo . 1))
((type . note) (pos . 4) (velo . 3))
((type . note) (pos . 5) (velo . 4))
((type . note) (velo . 5))
((type . note) (velo . 6))
((type . note) (velo . 1))
((type . note) (velo . 2))
((type . note) (velo . 3)))


(((type . note) (pos . 3) (velo . 1))
((type . note) (pos . 4) (velo . 2))
((type . note) (pos . 5) (velo . 3))
((type . note) (velo . 5))
((type . note) (velo . 6)))

(((pos . 3) (velo . 1)) ((pos . 4) (velo . 2)) ((pos . 5) (velo . 3)) ((velo
. 5)) ((velo . 6)))

(((type . #f) (pos . 3) (velo . 1))
((type . #f) (pos . 4) (velo . 2))
((type . #f) (pos . 5) (velo . 3))
((type . #f) (pos . 3) (velo . 5))
((type . #f) (pos . 3) (velo . 6)))

(n  velo: 1 
 )


(import (srfi 1))
(import (lamu lang))
(import (lamu utils gui))
(define (drum-machine-start)
  (if (not (open?))
      (begin
       (import (lamu lang))
       (import (lamu utils gui))
       (use "pulsar-pattern-generator.scm" )
       (session-start)
       (create-gui)
       (exet (mant 'rept (selt 'newt (newt 'main 12))))
       (set-playing #t))))

(define (drum-machine-stop)
  (if (open?)
      (session-end)
      (close)
      ))

(drum-machine-start)
(drum-machine-stop)

(exet (selt 'name 'main))
(exet (selt 'all))

(set-tempo 100)





(if #f (begin
        ((trackset-manager 'new-trackset) 'add-track 
                                         (xnew SimpleTrack (new-track-id) 'inst-Ride-Bell 'pns-basic-one "(cl 1/4 1/4 3/4 )" "(+ -0/4 -0/32)" 9 2)
                                         (xnew SimpleTrack (new-track-id) 'inst-Kick-Long 'pns-basic-one "'( 3/4 3/4 3/4 2/4 )" "(+ -0/4 -0/32)" 2 1)
                                         (xnew SimpleTrack (new-track-id) 'inst-sn-33 'pns-basic-one "'( 2/4 2/4 2/4 3/4 )" "(+ -1/4 -0/32)" 2 1)
                                         (xnew SimpleTrack (new-track-id) 'inst-SB-Kik22psoA1 'pns-two-four "(cl 2/4 3/4 1/4 4/4 )" "(+ -1/36 -0/32)" 9 1))
        
         ((trackset-manager 'new-trackset) 'add-track 
                                           (xnew SimpleTrack (new-track-id) 'inst-Kick-Long 'pns-basic-one "'( 2/4 2/4 2/4 3/4 )" "(+ -0/4 -0/32)" 1 1)
                                           (xnew SimpleTrack (new-track-id) 'inst-Hand-Clap 'pns-basic-one "(cl 4/4 )" "(+ -1/4 -1/12 2/36   )" 1 1)
                                           (xnew SimpleTrack (new-track-id) 'inst-Crash-Jazz 'pns-basic-one "(cl 1/4 2/4 1/4 3/4 )" "(+ -0/4 -0/32)" 8 1)
                                           (xnew SimpleTrack (new-track-id) 'inst-Kick-Long 'pns-basic-one "'( 4/4 )" "(+ -3/16 -0/32)" 1 1)
                                           (xnew SimpleTrack (new-track-id) 'inst-Snare2 'pns-basic-one "'( 2/4 2/4 2/4 3/4 )" "(+ -1/4 -0/32)" 2 1))

         ((trackset-manager 'new-trackset) 'add-track 
                                           (xnew SimpleTrack (new-track-id) 'inst-Sizzle-Cymbal 'pns-basic-one "'( 1/4 3/4 1/4 3/4 2/4 3/4 4/4 )" "(- 1/7 1/4 )" 7 1)
                                           (xnew SimpleTrack (new-track-id) 'inst-SB-Ride2Brush 'pns-basic-one "(cl '( 2/4 2/4 2/4 4/4 ) )" "(+  1/8 0 )" 4 1)
                                           (xnew SimpleTrack (new-track-id) 'inst-Hand-Clap 'pns-two-four "'( 2/4 2/4 2/4 3/4 )" "(+ 0/8 0 )" 2 1)
                                           (xnew SimpleTrack (new-track-id) 'inst-Kick-Long 'pns-counting "'( 2/4 2/4 2/4 3/4 )" "(- 1/7 1/4 )" 7 1))

         ((trackset-manager 'new-trackset) 'add-track 
                                           (xnew SimpleTrack (new-track-id) 'inst-Kick-Long 'pns-basic-one "'( 1/4 3/4 1/4 3/4 )" "(+ -1/4 0 )" 5 1)
                                           (xnew SimpleTrack (new-track-id) 'inst-Mid-Tom 'pns-basic-one "(cl '( 2/4 2/4 2/4 4/4 ) )" "(+ 0/4 0 )" 4 1)
                                           (xnew SimpleTrack (new-track-id) 'inst-sn-33 'pns-basic-one "'( 2/4 3/4 2/4 3/4 2/4 3/4 2/4 4/4 )" "(+ 0/8 0 )" 8 1))

         ((trackset-manager 'new-trackset) 'add-track 
                                           (xnew SimpleTrack (new-track-id) 'inst-Kick-Long 'pns-basic-one "'( 1/8 3/8 1/8 4/4 )" "(+ 1/4 0 )" 10 2)
                                           (xnew SimpleTrack (new-track-id) 'inst-Paiste-Ride 'pns-basic-4-swing "(cl 2/4 2/4 2/4   2/4 2/4 4/4  )" "(+ 0/4 0 )" 2 1)
                                           (xnew SimpleTrack (new-track-id) 'inst-sn-33 'pns-basic-one "'( 2/4 2/4 2/4 3/4 )" "(+ -2/8 0 )" 2 1)
                                           (xnew SimpleTrack (new-track-id) 'inst-SB-TomB12in 'pns-basic-4-swing "'( 2/4 2/4 2/4 3/4 )" "(+ -0/4 -0/32)" 5 2))

         ; Seven Two
         ((trackset-manager 'new-trackset) 'add-track 
                                           (xnew SimpleTrack (new-track-id) 'inst-Kick-Long 'pns-basic-one "'( 0/4 3/4 1/4 4/4 )" "(+ 1/4 0 )" 7 2)
                                           (xnew SimpleTrack (new-track-id) 'inst-Ride-Rock 'pns-basic-4-swing "(cl 2/4 2/4 2/4 4/4 )" "(+ 0/4 0 )" 2 1)
                                           (xnew SimpleTrack (new-track-id) 'inst-sn-33 'pns-basic-one "'( 2/4 2/4 2/4 3/4 )" "(+ -2/8 0 )" 1 1))

         ((trackset-manager 'new-trackset) 'add-track 
                                           (xnew SimpleTrack (new-track-id) 'inst-Kick-Long 'pns-basic-one "'( 1/4 3/4 1/4 3/4 )" "(+ 0/4 0 )" 4 2)
                                           (xnew SimpleTrack (new-track-id) 'inst-Ride-Rock 'pns-basic-4-swing "(cl  2/4 2/4 2/4 4/4  )" "(+ 0/4 0 )" 4 1)
                                           (xnew SimpleTrack (new-track-id) 'inst-sn-55 'pns-basic-one "'( 2/4 2/4 2/4 3/4 )" "(+ -1/4 0 )" 2 1)
                                           (xnew SimpleTrack (new-track-id) 'inst-Kick-Long 'pns-basic-one "'( 2/4 2/4 2/4 3/4 )" "(+ -3/16 0 )" 1 1))
         
         ((trackset-manager 'new-trackset) 'add-track 
                                           (xnew SimpleTrack (new-track-id) 'inst-Kick-Long 'pns-basic-one "(map (lambda(x) (/ x 5)) '( 1 1 1 5 ) )" "(+ 0/4 0 )" 4 1)
                                           (xnew SimpleTrack (new-track-id) 'inst-Ride-Jazz 'pns-basic-4-swing " (apply circular-list '( 2/4 2/4 2/4 3/4 ) )  " "(+ 0/4 0 )" 4 1))


         ((trackset-manager 'new-trackset) 'add-track 
                                           (xnew SimpleTrack (new-track-id) 'inst-Kick-Long 'pns-basic-one "'( 1/4 3/4 1/4 3/4 )" "(+ 1/4 0 )" 4 1)
                                           (xnew SimpleTrack (new-track-id) 'inst-Ride-Rock 'pns-basic-4-swing "(cl  2/4 2/4 2/4 4/4  )" "(+ 0/4 0 )" 4 1)
                                           (xnew SimpleTrack (new-track-id) 'inst-sn-33 'pns-basic-one "'( 2/4 2/4 2/4 3/4 )" "(+ 0/8 0 )" 1 1))
         ))



