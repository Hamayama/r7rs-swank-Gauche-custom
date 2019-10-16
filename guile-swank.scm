(define-module (guile-swank)
  #:use-module (ice-9 match)
  #:use-module (rnrs bytevectors)
  #:use-module (rnrs io ports)
  #:use-module (ice-9 binary-ports)
  #:use-module (ice-9 documentation)
  #:use-module (srfi srfi-69)
  #:use-module (srfi srfi-11) ;; let-values
  #:use-module (srfi srfi-1)
  #:use-module (srfi srfi-9)
  #:use-module (ice-9 pretty-print)
  #:export (start-swank swank:lookup-presented-object
                        swank:lookup-presented-object-or-lose))

(include "specific/guile.scm")
(include "common/base.scm")
(include "common/handlers.scm")
