;; -*- mode: Emacs-Lisp -*-


(use-package dired
  :bind (:map dired-mode-map
         ("SPC" . hydra:leader/body)
         ("j" . dired-next-line)
         ("k" . dired-previous-line)
         ("J" . dired-goto-file)
         ("K" . dired-do-kill-lines)
         ("G" . end-of-buffer)
         ("V" . dired-do-chgrp)
         ("C-s" . isearch-forward))
  :config
  (setq dired-listing-switches "-lahv"
        dired-recursive-copies 'top
        dired-recursive-deletes 'top
        dired-dwim-target t)
  (put 'dired-find-alternate-file 'disabled nil)

  (use-package dired-x))


(use-package dired-collapse
  :ensure t)


(use-package dired-subtree
  :ensure t
  :bind (:map dired-mode-map
        ("TAB" . dired-subtree-toggle)))


(provide 'init-dired)
