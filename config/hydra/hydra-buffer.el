;; -*- mode: Emacs-Lisp -*-


(defhydra hydra-buffer (:color teal :hint nil :idle .5)
  ("i" ibuffer "ibuffer")
  ("b" ivy-switch-buffer "switch")
  ("n" next-buffer "next buffer" :color red)
  ("p" previous-buffer "previous buffer" :color red)
  ("k" kill-this-buffer "kill buffer")

  ("q" nil "cancel" :color blue))


(provide 'hydra/hydra-buffer)
;;; hydra-buffer.el ends here
