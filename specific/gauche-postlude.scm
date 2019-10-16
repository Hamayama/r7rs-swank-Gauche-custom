
;; support toplevel commands (e.g. ,h)
(define (%read port)
  (with-input-from-port port
    ((with-module gauche.interactive make-repl-reader)
     read
     (lambda ()
       (let ((line (read-line)))
         (if (eof-object? line)
           ""
           line)))
     consume-trailing-whitespaces)))

;; overwrite read-all procedure in base.scm
(define (read-all port)
  (let loop ((result '())
             (form (%read port)))
    (if (eof-object? form)
        (reverse result)
        (loop (cons form result)
              (%read port)))))

