;; -*- mode: Emacs-Lisp -*-


(defhydra hydra-buffer (:color teal :hint nil)
  ("i" ibuffer "ibuffer")
  ("b" ivy-switch-buffer "switch")
  ("n" next-buffer "next buffer" :color red)
  ("p" previous-buffer "previous buffer" :color red)
  ("k" kill-this-buffer "kill buffer")

  ("H" buf-move-left :color red)
  ("L" buf-move-right :color red)
  ("K" buf-move-up :color red)
  ("J" buf-move-down :color red)

  ("q" nil "cancel" :color blue))


(provide 'hydra/hydra-buffer)
;;; hydra-buffer.el ends here
