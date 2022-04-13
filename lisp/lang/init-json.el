;; -*- mode: Emacs-Lisp; lexical-binding: t; -*-*-


(use-package json-mode
  :ensure t
  :defer t
  :config
  (setq json-reformat:indent-width 2)

  (defhydra hydra:json (:color teal :hint nil :columns 2)
    "json"
    ("f" json-mode-beautify "reformat")
    ("p" json-mode-show-path "show snatcher")
    ("k" json-mode-kill-path "kill snatcher")
    ("t" json-toggle-boolean "toggle boolean")
    ("n" json-nullify-sexp "set null")
    ("<up>" json-increment-number-at-point "increase number" :color pink)
    ("<down>" json-decrement-number-at-point "decrease number" :color pink)
    ("q" nil :color blue)))


(provide 'init-json)
