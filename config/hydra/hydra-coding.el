;; -*- mode: Emacs-Lisp -*-


(defhydra hydra-python (:color teal :hint nil)
  "python"
  ("o" pyvenv-workon "python workon")
  ("r" run-python "IPython")
  ("q" nil :color blue))


(defhydra hydra-csv (:color teal :hint nil)
  "csv"
  ("o" csv-align-fields "align")
  ("u" csv-unalign-fields "unalign")
  ("q" nil :color blue))


(provide 'hydra/hydra-coding)
