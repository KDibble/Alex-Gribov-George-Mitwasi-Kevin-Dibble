#lang racket
;(require "arduino_interface_agribov.rkt")
(require "RacketToMax.rkt")

(define (make-state-machine)
  (let ((state 'Main))
    (lambda (transition)
      (cond [(eq? state 'Main) (cond [(eq? transition 'but1) (set! state 'Effects)]
                                     [(eq? transition 'but2) (set! state 'SetLoop)]
                                     [(eq? transition 'but3) (set! state 'PlayLoops)]
                                     [(eq? transition 'but4) (toggleOnOff)])]
            [(eq? state 'Effects) (begin (set! state 'Main) (change-eff transition))]
            [(eq? state 'SetLoop) (cond [(eq? transition 'but1) (set! state 'FIXME)]
                                     [(eq? transition 'but2) (set! state 'FIXME)]
                                     [(eq? transition 'but3) (set! state 'FIXME)]
                                     [(eq? transition 'but4) (set! state 'FIXME)])]
            [(eq? state 'PlayLoops) (cond [(eq? transition 'but1) (set! state 'FIXME)]
                                     [(eq? transition 'but2) (set! state 'FIXME)]
                                     [(eq? transition 'but3) (set! state 'FIXME)]
                                     [(eq? transition 'but4) (set! state 'FIXME)])]
            [(eq? state 'FIXME) (FIXME)])
      (print state)
      state
      );;end lambda
    );;end let
  );;end define

(define main-state-machine (make-state-machine))

(define (toggleOnOff)
  (FIXME)
  )

(define (change-eff button)
  (FIXME)
  )

(define (FIXME)
  (print "Still under development")
)

(define (query-buttons)
  (let ((onButtons (getButtonData buttons)))
    (cond [(= 1 (car onButtons)) 'but0]
          [(= 1 (cadr onButtons)) 'but1]
          [(= 1 (caddr onButtons)) 'but2]
          [(= 1 (cadddr onButtons)) 'but3]
          [else 'none])
    )
  )

(define (main-loop)
  ;query buttons and return the first one that's pressed
  (main-state-machine (query-buttons))
  (main-loop)
  )