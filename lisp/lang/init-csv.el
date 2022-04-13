;; -*- mode: Emacs-Lisp; lexical-binding: t; -*-*-


(use-package csv-mode
  :ensure t
  :defer t
  :config
  (defhydra hydra:csv (:color teal :hint nil)
    "csv"
    ("o" csv-align-fields "align")
    ("u" csv-unalign-fields "unalign")
    ("q" nil :color blue)))


(provide 'init-csv)
