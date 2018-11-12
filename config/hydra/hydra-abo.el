;; -*- mode: Emacs-Lisp -*-


(defhydra hydra-abo (:color teal :hint nil :idle .5 :columns 4)
  ("i" swiper "swiper")
  ("b" counsel-ibuffer "ibuffer")
  ("f" counsel-find-file "find file")
  ("e" counsel-recentf "recent file")
  ("m" counsel-imenu "imenu")
  ("s" counsel-rg "ripgrep")
  ("r" counsel-rg "ripgrep")
  ("a" counsel-ag "ag")
  ("o" counsel-outline "outline")
  ("z" counsel-fzf "fzf")
  ("a" ivy-imenu-anywhere "imenu-anywhere")
  ("u" ivy-resume "resume")
  ("v" ivy-push-view "push view")
  ("V" ivy-pop-view "pop view")
  ("q" nil "cancel" :color blue))


(provide 'hydra/hydra-abo)
;;; hydra-abo.el ends here
