(define-library (gauche-swank)
  (export start-swank
          swank:lookup-presented-object
          swank:lookup-presented-object-or-lose)
  (import (scheme base) (scheme eval) (scheme read) (scheme write) (scheme file) (scheme case-lambda) (scheme process-context) (scheme repl) (scheme load) (scheme char) (scheme cxr)
          (srfi-69)
          (srfi-27)
          (only (gauche hashutil) hash-table-for-each)
          (only (gauche base)
                keyword? keyword->string module-name all-modules module-table module-imports module-precedence-list ref <procedure> class-of
                macroexpand-1 macroexpand-all
                ;; for Gauche custom
                push! x->string string-split with-input-from-string
                find-module library-name->module-name
                source-location sys-dirname sys-basename
                ;; for Gauche custom (postlude)
                with-module with-input-from-port consume-trailing-whitespaces)
          (only (gauche net) make-server-socket socket-accept socket-input-port socket-output-port)
          (gauche pputil)
          (gauche interactive) ; for Gauche custom
          (only (srfi-13) string-contains string-prefix? string-replace)
          (only (srfi-1) find fold list-index cons* filter))

  ;; for Gauche custom
  (begin
    ;; *macroexpand-result*
    ;;   #f      : return noraml result
    ;;   'string : return string literal made by pprint
    (define *macroexpand-result* 'string)
    )

  (include "specific/gauche.scm")
  (include "common/base.scm")
  (include "common/handlers.scm")
  (include "specific/gauche-postlude.scm"))
