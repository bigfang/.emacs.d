;; -*- mode: Emacs-Lisp -*-


(defhydra hydra-alchemist (:color teal :hint nil :columns 4)
  "alchemist"
  ("m" hydra-alchemist-mix/body "mix...")
  ("i" hydra-alchemist-iex/body "iex...")
  ("v" hydra-alchemist-eval/body "eval...")
  ("o" hydra-alchemist-macro/body "expand macro...")
  ("X" hydra-alchemist-hex/body "hex...")

  ("r" alchemist-iex-run "iex")
  ("h" alchemist-help-search-at-point "help")
  ("s" alchemist-project-toggle-file-and-tests "switch lib/test")
  ("S" alchemist-project-toggle-file-and-tests-other-window "Switch lib/test")
  ("f" alchemist-project-find-test "test files")
  ("l" alchemist-project-find-lib "lib files")
  ("t" alchemist-mix-test "test")

  ("M" alchemist-mix "Mix:")
  ("H" alchemist-help "Help:")
  ("q" nil :color blue))


(defhydra hydra-alchemist-iex(:color teal :hint nil :columns 3)
  "alchemist iex"
  ("i" alchemist-iex-run "iex")
  ("p" alchemist-iex-project-run "iex project")
  ("l" alchemist-iex-send-current-line "sent line")
  ("c" alchemist-iex-send-current-line-and-go "send line and go")
  ("r" alchemist-iex-send-region "send region")
  ("m" alchemist-iex-send-region-and-go "send region and go")
  ("b" alchemist-iex-compile-this-buffer "compile buffer")
  ("R" alchemist-iex-reload-module "reload module")
  ("q" nil :color blue))

(defhydra hydra-alchemist-mix (:color teal :hint nil :columns 3)
  "alchemist mix"
  ("c" alchemist-mix-compile "compile")
  ("m" alchemist-mix-run "run")
  ("l" alchemist-mix-rerun-last-task "last task")

  ("f" alchemist-mix-test-file "test file")
  ("b" alchemist-mix-test-this-buffer "test buffer")
  ("." alchemist-mix-test-at-point "test at point")
  ("s" alchemist-mix-test-stale "test stale")
  ("r" alchemist-mix-rerun-last-test "last test")
  ("q" nil :color blue))

(defhydra hydra-alchemist-eval (:color teal :hint nil :columns 4)
  "alchemist eval"
  ("l" alchemist-eval-current-line "eval line")
  ("k" alchemist-eval-print-current-line "eval print line")
  ("j" alchemist-eval-quoted-current-line "quoted line")
  ("h" alchemist-eval-print-quoted-current-line "print quoted line")
  ("o" alchemist-eval-region "eval region")
  ("i" alchemist-eval-print-region "eval print region")
  ("u" alchemist-eval-quoted-region "quoted region")
  ("y" alchemist-eval-print-quoted-region "print quoted region")
  ("q" alchemist-eval-buffer "eval buffer")
  ("w" alchemist-eval-print-buffer "eval print buffer")
  ("e" alchemist-eval-quoted-buffer "eval quoted buffer")
  ("r" alchemist-eval-print-quoted-buffer "eval print quoted buffer")
  ("!" alchemist-eval-close-popup "close popup")
  ("q" nil :color blue))

(defhydra hydra-alchemist-macro(:color teal :hint nil :columns 4)
  "alchemist macro"
  ("l" alchemist-macroexpand-once-current-line "once line")
  ("L" alchemist-macroexpand-once-print-current-line "once print line")
  ("k" alchemist-macroexpand-current-line "current line")
  ("K" alchemist-macroexpand-print-current-line "print line")
  ("i" alchemist-macroexpand-once-region "once region")
  ("I" alchemist-macroexpand-once-print-region "once print region")
  ("r" alchemist-macroexpand-region "region")
  ("R" alchemist-macroexpand-print-region "print region")
  ("!" alchemist-macroexpand-close-popup "close popup")
  ("q" nil :color blue))

(defhydra hydra-alchemist-hex(:color teal :hint nil :columns 3)
  "alchemist hex"
  ("i" alchemist-hex-info-at-point "info")
  ("r" alchemist-hex-releases-at-point "releases curr")
  ("R" alchemist-hex-releases "releases")
  ("s" alchemist-hex-search "search")
  ("I" alchemist-hex-info "info")
  ("d" alchemist-hex-all-dependencies "dependencies")
  ("q" nil :color blue))


(provide 'hydra/hydra-alchemist)
