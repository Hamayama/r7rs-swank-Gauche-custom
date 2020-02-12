(add-load-path "." :relative)

(import (scheme base) (scheme load))

;; 'load' before 'import' enables to output stack trace on error.
(load "gauche-swank")
(import (gauche-swank))

(start-swank 4010)
