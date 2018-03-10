;; -*- mode: Emacs-Lisp -*-


(use-package magit
  :ensure t
  :pin melpa-stable
  :bind ("C-c v" . magit-status))

(use-package git-gutter
  :ensure t
  :config
  (global-git-gutter-mode +1)
  :custom
  (git-gutter:disabled-modes '(asm-mode hexl-mode image-mode))
  )


(provide 'init-git)
;;; init-git.el ends here
