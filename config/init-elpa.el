;; -*- mode: Emacs-Lisp -*-


(use-package flycheck
  :ensure t
  :pin melpa-stable)


(use-package projectile
  :ensure t
  :pin melpa-stable
  :config
  (projectile-mode)
  (setq projectile-completion-system 'ivy))


(use-package yasnippet
  :ensure t
  :pin melpa
  :hook (prog-mode . yas-minor-mode)
  :config
  (yas-reload-all))



(use-package highlight-symbol
  :ensure t
  :bind ("C-z s" . highlight-symbol-at-point)
  :chords ("``" . highlight-symbol-at-point)
  :custom-face
  (highlight-symbol-colors
   '("yellow" "DeepPink" "cyan" "MediumPurple1" "SpringGreen1" "DarkOrange" "HotPink1" "RoyalBlue1" "OliveDrab"))
  (highlight-symbol-foreground-color "black")
  )


(use-package move-text
  :ensure t
  :bind (("<C-S-up>" . move-text-up)
         ("<C-S-down>" . move-text-down)))


(use-package neotree
  :ensure t
  :bind ("C-x C-z" . neotree-toggle)
  :config
  (setq projectile-switch-project-action 'neotree-projectile-action))


(use-package pager
  :ensure t
  :bind (("C-v" . pager-page-down)
         ("M-v" . pager-page-up)
         ("M-p" . pager-row-up)
         ("M-n" . pager-row-down)))


(use-package rainbow-delimiters
  :ensure t
  :hook (prog-mode . rainbow-delimiters-mode)
  :custom-face
  (rainbow-delimiters-depth-1-face ((t (:foreground "dark orange"))))
  (rainbow-delimiters-depth-2-face ((t (:foreground "deep sky blue"))))
  (rainbow-delimiters-depth-3-face ((t (:foreground "yellow"))))
  (rainbow-delimiters-depth-4-face ((t (:foreground "orchid"))))
  (rainbow-delimiters-depth-5-face ((t (:foreground "spring green"))))
  (rainbow-delimiters-depth-6-face ((t (:foreground "sienna1"))))
  )


(use-package rainbow-mode
  :ensure t
  :hook (prog-mode))


(use-package undo-tree
  :ensure t
  :config
  (global-undo-tree-mode))


(provide 'init-elpa)
;;; init-elpa.el ends here
