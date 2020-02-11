# r7rs-swank-Gauche-custom

![image](image.png)

## 概要
- r7rs-swank server ( https://github.com/ecraven/r7rs-swank ) (コミット 33b94e3 (2019-7-2))  
  を、Gauche 用に改造したものです。

- 現状、Lem エディタ ( https://github.com/cxxxr/lem ) での使用のみ考慮しています。


## インストール方法
- 事前に Lem エディタ および Gauche がインストールされている必要があります。

- 本サイト ( https://github.com/Hamayama/r7rs-swank-Gauche-custom ) のソースを、  
  (Download Zip ボタン等で) ダウンロードして、適当なフォルダに展開してください。

- そして、Lem エディタの設定ファイル ~/.lem/init.lisp 内に、以下の記述を追加してください (※)。
  ```
  (setf lem-scheme-mode:*scheme-swank-server-run-command*
        '("gosh" "-AC:/work/r7rs-swank-Gauche-custom" "-e(begin (import (gauche-swank)) (start-swank ,port))"))
  ```
  **(※) 上記設定の -A オプションの部分には、展開したフォルダのパスを指定してください。**


## 使い方
- Lem エディタを起動して、M-x scheme-slime を実行すると、  
  r7rs-swank server が起動して、repl のバッファが表示されます。  
  後は、通常の Gauche の repl と同じように使うことができます。

- また、後述の機能のうち、対応しているものを利用できます。  
  (基本的に、repl を起動して、ファイルのロード後に、使用可能になります)


## 機能
- 以下に機能の対応状況を示します。
  
  |<div align="center">機能</div>|<div align="center">Lem エディタのコマンド</div>|<div align="center">r7rs-swank</div>|<div align="center">r7rs-swank-<br>Gauche-custom</div>|
  |---|---|---|---|
  |repl の起動           |M-x scheme-slime                             |○      |○(※1) |
  |ファイルのロード<br>(repl へのロード)|M-x scheme-load-file (C-c C-l)|×(※2) |○      |
  |シンボルの補完        |M-x indent-line-and-complete-symbol (Tab)    |△(※3) |○      |
  |autodoc による関数シグネチャの<br>ミニバッファへの自動表示|-        |△(※4) |△(※5) |
  |マクロの展開          |M-x scheme-macroexpand-all (C-c M-m)         |△(※6) |△(※7) |
  |describe による symbol の説明の表示|M-x scheme-describe-symbol (C-c C-d d)|△(※8) |△(※8) |
  |apropos 関係          |-                                            |×      |×      |
  |inspector 関係        |-                                            |×      |×      |
  |debugger 関係         |-                                            |×      |×      |
  |compile 関係          |-                                            |×      |×      |
  |定義位置へのジャンプ  |M-x find-definition (M-.)                    |×      |△(※9) |
  |参照情報の一覧表示 (xref?)|-                                        |×      |×      |
  |ローカル環境の情報取得|-                                            |×      |×      |
  |インデント情報の更新  |-                                            |×      |×      |
  |カレントライブラリの切り換え|M-x scheme-set-library (C-c M-p)       |×      |△(※10)|
  |repl の interrupt     |-                                            |×      |×      |
  
  ○:対応  
  △:問題あり  
  ×:未対応  
  
  (※1) ,a 等のトップレベルコマンドも使用可能  
  (※2) 現状、バグがあり Gauche では動作しない ( https://github.com/ecraven/r7rs-swank/pull/11 )  
  (※3) 補完の候補がソートされない。また、重複した項目が表示されることがある  
  (※4) Gauche の拡張シグネチャ ( :optional :key :rest ) には未対応。マクロおよびジェネリック関数にも未対応。  
  シグネチャの取得に失敗してエラーが表示されることがある  
  (※5) Gauche の拡張シグネチャ ( :optional :key :rest ) に部分的に対応 (:key はハイライト表示なし)。  
  マクロおよびジェネリック関数については、クラス情報が表示されるのみ  
  (※6) 結果が1行になるので見にくい  
  (※7) pprint の結果を受け取ることで、ある程度改行されるようになった  
  (※8) 説明は表示されないが、bind 情報だけは表示される  
  (※9) 一部のグローバルな手続きのみ対応 (プリコンパイルされたものは不可)。  
  グローバル変数、クラス、マクロ、ジェネリック関数には未対応  
  (※10) repl バッファのみ対応。入力は R7RS 形式 (最外の括弧は省略可) と Gauche のモジュール (ドット区切り) の両方を受け付ける


## 参考情報
1. Gauche:Lemエディタ  
   https://practical-scheme.net/wiliki/wiliki.cgi?Gauche%3ALem%E3%82%A8%E3%83%87%E3%82%A3%E3%82%BF

2. Lem エディタの scheme-mode  
   https://gist.github.com/Hamayama/03eb1c2984abc2ddb7a1c04d15e1bd32


## 環境等
- OS
  - Windows 8.1 (64bit)
- 言語
  - Gauche v0.9.9
  - Gauche v0.9.8
- ライセンス
  - オリジナルと同様とします


## 履歴
- 2019-10-17 v1.00 (初版)
- 2019-10-18 v1.01 swank:connection-info の応答見直し等
- 2019-10-18 v1.02 サーバソケットの設定見直し(Lemに合わせた)
- 2019-10-18 v1.03 コメント追加
- 2019-10-19 v1.04 一部処理見直し等
- 2019-11-26 v1.05 Gauche v0.9.9_pre2対応(hash-table-for-eachの所属モジュールが変わった)
- 2019-12-9  v1.06 Gauche v0.9.9_rc2対応(https://github.com/ecraven/r7rs-swank/pull/12)
- 2020-1-22  v1.07 ハンドラ追加(swank:interactive-eval-region)
- 2020-1-25  v1.08 エラー出力見直し
- 2020-1-27  v1.09 補完の候補のソートと重複除去を行うようにした
- 2020-2-8   v1.10 autodoc のシグネチャ検出のエラーチェックを追加
- 2020-2-10  v1.11 autodoc の表示改善


(2020-2-11)
