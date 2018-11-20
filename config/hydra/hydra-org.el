;; -*- mode: Emacs-Lisp -*-


(defhydra hydra-notes (:color pink :exit t :hint nil :idle .5 :columns 3)
  "Notes "
  ("m" counsel-bookmark "jump bookmark")
  ("d" bookmark-delete "delete bookmark")
  ("l" bookmark-bmenu-list "list")
  ("n" remember-notes "notes")
  ("r" remember "remember")
  ("R" remember-region "remember region")
  ("c" remember-clipboard "remember clipboard")
  ("q" nil :color blue))


(defhydra hydra-deft (:color pink :hint nil :columns 3)
  "Deft"
  ("r" deft-refresh "refresh" :exit t)
  ("f" deft-find-file "find file")
  ("n" deft-new-file "create file")
  ("D" deft-delete-file "delete file")
  ("A" deft-archive-file "archive file")
  ("R" deft-rename-file "rename file")
  ("s" deft-toggle-sort-method "sort")
  ("c" deft-filter-clear "clear")
  ("o" deft-open-file-other-window "other window")
  ("q" nil :color blue))
(evil-define-key 'normal deft-mode-map (kbd ".") 'hydra-deft/body)


(defhydra hydra-org (:color pink :exit t :hint nil :idle .5)
  "Org-mode"
  ("d" deft "deft")
  ("q" nil :color blue))


(provide 'hydra/hydra-org)
;;; hydra-org.el ends here
