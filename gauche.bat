set GAUCHE_PATH=gosh
@rem set GAUCHE_PATH="C:\Program Files (x86)\Gauche098\bin\gosh"
@rem set GAUCHE_PATH="C:\Program Files (x86)\Gauche095\bin\gosh"

@rem %GAUCHE_PATH% -A. -e"(begin (import (gauche-swank)) (start-swank 4010))"
%GAUCHE_PATH% gauche-main.scm

pause
