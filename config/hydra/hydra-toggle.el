;; -*- mode: Emacs-Lisp -*-


(whitespace-mode -1)


(defhydra hydra-toggle (:color amaranth)
  "
_a_ abbrev-mode:       %`abbrev-mode
_d_ debug-on-error:    %`debug-on-error
_f_ auto-fill-mode:    %`auto-fill-function
_t_ truncate-lines:    %`truncate-lines
_w_ whitespace-mode:   %`whitespace-mode
_v_ view-mode:         %`view-mode
_r_ rot13-mode:
_z_ zone:
"
  ("a" abbrev-mode nil)
  ("d" toggle-debug-on-error nil)
  ("f" auto-fill-mode nil)
  ("t" toggle-truncate-lines nil)
  ("w" whitespace-mode nil)
  ("v" view-mode nil)
  ("r" toggle-rot13-mode nil :exit t)
  ("z" zone nil)
  ("q" nil "quit"))


(provide 'hydra/hydra-toggle)
;;; hydra-toggle.el ends here
