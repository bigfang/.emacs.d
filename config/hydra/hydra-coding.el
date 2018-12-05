;; -*- mode: Emacs-Lisp -*-


(defhydra hydra-python (:color teal :hint nil :columns 3)
  "python"
  ("o" pyvenv-workon "python workon")
  ("r" run-python "IPython")
  ("q" nil "quit" :color blue))


(provide 'hydra/hydra-coding)
