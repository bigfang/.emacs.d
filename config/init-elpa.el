;; -*- mode: Emacs-Lisp -*-


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


(use-package projectile
  :ensure t
  :pin melpa-stable
  :config
  (setq projectile-completion-system 'ivy)
  (projectile-mode))



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


(use-package highlight-symbol
  :ensure t
  :chords ("[[" . highlight-symbol-at-point)
  :custom
  (highlight-symbol-colors
   '("yellow" "DeepPink" "cyan" "MediumPurple1" "SpringGreen1" "DarkOrange" "HotPink1" "RoyalBlue1" "OliveDrab"))
  (highlight-symbol-foreground-color "black"))


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


(use-package pyim
  :ensure t
  :config
  (setq default-input-method "pyim"
        pyim-default-scheme 'pyim-shuangpin)
  (setq pyim-fuzzy-pinyin-alist nil)
  (pyim-isearch-mode -1))

(use-package pyim-basedict
  :ensure
  :config (pyim-basedict-enable))


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
