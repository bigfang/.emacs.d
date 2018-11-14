;; -*- mode: Emacs-Lisp -*-


(defhydra hydra-notes (:color pink :exit t :hint nil :idle .5)
  "bookmark Notes Remember "
  ("m" counsel-bookmark "jump bookmark")
  ("d" bookmark-delete "delete bookmark")
  ("l" bookmark-bmenu-list "list")
  ("n" remember-notes "notes")
  ("r" remember "remember")
  ("R" remember-region "remember region")
  ("c" remember-clipboard "remember clipboard")
  ("q" nil "cancel" :color blue))


(defhydra hydra-org (:color pink :exit t :hint nil :idle .5)
  "Org-mode"
  ("d" deft "deft")
  ("f" deft-find-file "find file")
  ("q" nil "cancel" :color blue))


(provide 'hydra/hydra-org)
;;; hydra-org.el ends here
