;; -*- mode: Emacs-Lisp -*-


(use-package buffer-move
  :ensure t
  :bind (("C-z <up>" . buf-move-up)
         ("C-z <down>" . buf-move-down)
         ("C-z <left>" . buf-move-left)
         ("C-z <right>" . buf-move-right)))


(use-package dumb-jump
  :ensure t
  :bind (("M-g o" . dumb-jump-go-other-window)
         ("M-g j" . dumb-jump-go)
         ("M-g i" . dumb-jump-go-prompt)
         ("M-g x" . dumb-jump-go-prefer-external)
         ("M-g z" . dumb-jump-go-prefer-external-other-window))
  :config
  (setq dumb-jump-selector 'ivy
        dumb-jump-prefer-searcher 'rg)

  (defhydra dumb-jump-hydra (:color blue :columns 3)
    "Dumb Jump"
    ("j" dumb-jump-go "Go")
    ("o" dumb-jump-go-other-window "Other window")
    ("e" dumb-jump-go-prefer-external "Go external")
    ("x" dumb-jump-go-prefer-external-other-window "Go external other window")
    ("i" dumb-jump-go-prompt "Prompt")
    ("l" dumb-jump-quick-look "Quick look")
    ("b" dumb-jump-back "Back")))


(use-package imenu-anywhere
  :ensure t)


(use-package imenu-list
  :ensure t
  :bind ("C-'" . imenu-list-smart-toggle)
  :config
  (setq imenu-list-size 0.12
        imenu-list-auto-resize t)
  (evil-set-initial-state 'imenu-list-major-mode 'emacs))


(use-package switch-window
  :ensure t
  :bind
  (("C-x o" . switch-window)
   :map switch-window-extra-map
   ("i" . nil)
   ("k" . 'switch-window-mvborder-up)
   ("j" . 'switch-window-mvborder-down)
   ("h" . 'switch-window-mvborder-left)
   ("l" . 'switch-window-mvborder-right))
  :config
  ;; (setq switch-window-auto-resize-window t
  ;;       switch-window-default-window-size 0.75)
  (setq switch-window-qwerty-shortcuts
        '("s" "d" "i" "o" "u" "w" "v" "n"
          "a" "f" "p" "e" "g" "y"
          "m" "r" "t" "z" "x" "c"
          "q" "h" "j" "k" "l" "b"))
  (setq switch-window-threshold 2
        switch-window-increase 12
        switch-window-shortcut-appearance 'asciiart
        switch-window-minibuffer-shortcut ?x)
  (setq switch-window-shortcut-style 'qwerty))


(use-package transpose-frame
  :ensure t
  :bind ("C-z t" . transpose-frame))


(use-package treemacs
  :ensure t
  :config
  (setq treemacs-project-follow-cleanup t
        treemacs-width 30)
  (treemacs-follow-mode t)
  (treemacs-filewatch-mode t)
  (treemacs-fringe-indicator-mode t))

(use-package treemacs-evil
  :ensure t
  :after treemacs)

(use-package treemacs-projectile
  :ensure t
  :after treemacs
  :config
  (setq treemacs-header-function #'treemacs-projectile-create-header))


(provide 'conf-nav)
;;; conf-nav.el ends here
