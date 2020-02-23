;;
;; gauche-swank.sld
;; 2020-2-23 v1.19
;;
;; customized for Gauche ( https://github.com/Hamayama/r7rs-swank-Gauche-custom )
;; ( the original is https://github.com/ecraven/r7rs-swank )
;;
(define-library (gauche-swank)
  (export start-swank
          swank:lookup-presented-object
          swank:lookup-presented-object-or-lose)
  (import (scheme base) (scheme eval) (scheme read) (scheme write) (scheme file) (scheme case-lambda) (scheme process-context) (scheme repl) (scheme load) (scheme char) (scheme cxr)
          (srfi-69)
          (srfi-27)
          (only (gauche base)
                keyword? keyword->string module-name all-modules module-table module-imports module-precedence-list ref <procedure> class-of
                hash-table-for-each
                macroexpand-1 macroexpand-all
                ;; for Gauche custom
                push! x->string string-split with-input-from-string
                find-module library-name->module-name
                source-location sys-dirname sys-basename
                sys-getpid gauche-version
                report-error string-scan
                sort delete-duplicates
                class-name
                with-module
                with-input-from-port consume-trailing-whitespaces)
          (rename (scheme base) (symbol->string scheme:symbol->string))
          (only (gauche net)
                make-server-socket socket-accept socket-input-port socket-output-port
                ;; for Gauche custom
                make-sockaddrs)
          (gauche pputil)
          (gauche interactive) ; for Gauche custom
          (only (srfi-13)
                string-contains string-prefix? string-replace
                ;; for Gauche custom
                string-prefix-length)
          (only (srfi-1) find fold list-index cons* filter))

  ;; for Gauche custom
  (begin
    ;; settings
    ;;  *server-host-name*
    ;;    server host name or ip address string
    ;;  *macroexpand-result*
    ;;    #f       : return normal result
    ;;    'pprint  : return pprint result
    ;;  *error-output-type*
    ;;    #f       : output only error-message
    ;;    'report  : use report-error
    ;;    'report2 : use report-error without stack-trace
    (define *server-host-name*   "127.0.0.1")
    (define *macroexpand-result* 'pprint)
    (define *error-output-type*  'report2)
    )

  ;; for Gauche custom
  (begin
    (with-module user (import gauche.interactive)))

  (include "specific/gauche.scm")
  (include "common/base.scm")
  (include "common/handlers.scm"))
