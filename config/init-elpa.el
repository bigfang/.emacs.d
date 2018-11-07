;; -*- mode: Emacs-Lisp -*-


(use-package auto-yasnippet
  :ensure t
  :bind (("s-w" . aya-create)
         ("s-y" . aya-expand)))


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


(use-package flycheck
  :ensure t
  :pin melpa-stable
  :hook (elpy-mode . flycheck-mode)
  :config
  (defun my/toggle-flyc-window ()
    (interactive)
    (if (get-buffer-window "*Flycheck errors*" t)
        (with-selected-window
            (get-buffer-window "*Flycheck errors*" t)
          (delete-window))
      (flycheck-list-errors))))


(use-package highlight-indent-guides
  :ensure t
  :hook (prog-mode . highlight-indent-guides-mode)
  :config
  (setq highlight-indent-guides-method 'character)
  (setq highlight-indent-guides-responsive 'top
        highlight-indent-guides-delay 0.2)

  (setq highlight-indent-guides-auto-enabled nil)
  (set-face-background 'highlight-indent-guides-odd-face "DarkGrey")
  (set-face-background 'highlight-indent-guides-even-face "DimGrey")
  (set-face-foreground 'highlight-indent-guides-character-face "DimGrey")
  (set-face-foreground 'highlight-indent-guides-top-character-face "wheat4"))


(use-package highlight-symbol
  :ensure t
  :bind (("<down>" . highlight-symbol-next)
         ("<up>" . highlight-symbol-prev))
  :config
  (define-key evil-motion-state-map (kbd "<up>") 'highlight-symbol-prev)
  (define-key evil-motion-state-map (kbd "<down>") 'highlight-symbol-next)
  :custom
  (highlight-symbol-colors
   '("yellow" "DeepPink" "cyan" "MediumPurple1" "SpringGreen1" "DarkOrange" "HotPink1" "RoyalBlue1" "OliveDrab"))
  (highlight-symbol-foreground-color "black"))


(use-package imenu-anywhere
  :ensure t)


(use-package imenu-list
  :ensure t
  :bind ("C-'" . imenu-list-smart-toggle)
  :config
  (setq imenu-list-size 0.12
        imenu-list-auto-resize t)
  (evil-set-initial-state 'imenu-list-major-mode 'emacs))


(use-package move-text
  :ensure t
  :bind (("<C-S-up>" . move-text-up)
         ("<C-S-down>" . move-text-down)))


(use-package paradox
  :ensure t
  :config
  (paradox-enable)
  (evil-set-initial-state 'paradox-menu-mode 'emacs)
  (setq paradox-execute-asynchronously t))


(use-package projectile
  :ensure t
  :pin melpa-stable
  :config
  (setq projectile-completion-system 'ivy)
  (projectile-mode))


(use-package rainbow-delimiters
  :ensure t
  :hook (prog-mode . rainbow-delimiters-mode)
  :custom-face
  (rainbow-delimiters-depth-1-face ((t (:foreground "dark orange"))))
  (rainbow-delimiters-depth-2-face ((t (:foreground "deep sky blue"))))
  (rainbow-delimiters-depth-3-face ((t (:foreground "MediumSeaGreen"))))
  (rainbow-delimiters-depth-4-face ((t (:foreground "goldenrod"))))
  (rainbow-delimiters-depth-5-face ((t (:foreground "orchid"))))
  (rainbow-delimiters-depth-6-face ((t (:foreground "chartreuse"))))
  (rainbow-delimiters-depth-7-face ((t (:foreground "sienna1"))))
  (rainbow-delimiters-depth-8-face ((t (:foreground "MediumPurple2"))))
  (rainbow-delimiters-depth-9-face ((t (:foreground "yellow")))))


(use-package rainbow-mode
  :ensure t
  :hook (prog-mode))


(use-package switch-window
  :ensure t
  :bind ("C-x o" . switch-window)
  :config
  ;; (setq switch-window-auto-resize-window t
  ;;       switch-window-default-window-size 0.75)
  (setq switch-window-threshold 2
        switch-window-increase 8
        switch-window-minibuffer-shortcut ?x)
  (setq switch-window-shortcut-style 'qwerty))


(use-package transpose-frame
  :ensure t
  :bind ("C-z t" . transpose-frame))


(use-package string-inflection
  :ensure t
  :bind ("M-u" . my/string-inflection-cycle-auto) ; M-U in init-kbd.el
  :config
  (defun my/string-inflection-cycle-auto ()
    "switching by major-mode"
    (interactive)
    (cond
     ;; for emacs-lisp-mode
     ((eq major-mode 'emacs-lisp-mode)
      (string-inflection-all-cycle))
     ;; for python
     ((eq major-mode 'python-mode)
      (string-inflection-python-style-cycle))
     (t
      ;; default
      (string-inflection-all-style-cycle)))))


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


(use-package undo-tree
  :ensure t
  :config (global-undo-tree-mode))


(use-package which-key
  :ensure t
  :config
  (setq which-key-idle-delay 1.0)
  (which-key-mode))


(use-package yasnippet
  :ensure t
  :pin melpa
  :hook (prog-mode . yas-minor-mode)
  :config
  (yas-reload-all)
  (use-package yasnippet-snippets
    :ensure t))


(provide 'init-elpa)
;;; init-elpa.el ends here
