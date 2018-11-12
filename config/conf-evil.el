;; -*- mode: Emacs-Lisp -*-


(use-package evil
  :ensure t
  :pin melpa-stable
  :bind (:map evil-motion-state-map
         ("gD" . evil-goto-definition)
         ("^" . evil-window-top)
         ("$" . evil-window-bottom)
         ("H" . evil-first-non-blank)
         ("L" . evil-end-of-line)
         ("C-e" . evil-end-of-line)      ; evil-scroll-line-down
         ([remap evil-execute-macro] . evil-jump-item)

         :map evil-normal-state-map
         ("zi" . hs-hide-level)
         ("C-y" . yank)                  ; evil-scroll-line-up
         ([remap evil-jump-item] . evil-execute-macro)

         :map evil-insert-state-map
         ([escape] . evil-normal-state)     ; DO NOT USE "ESC"!
         ("C-o" . evil-execute-in-normal-state)

         :map evil-emacs-state-map
         ([escape] . evil-normal-state))     ; DO NOT USE "ESC"!
  :hook (git-commit-mode . evil-insert-state)
  :init
  (setq evil-toggle-key "M-z"
        evil-want-fine-undo nil
        evil-want-change-word-to-end nil
        evil-want-C-u-scroll t
        evil-want-C-i-jump nil)
  :config
  (setq evil-operator-state-cursor '("goldenrod1" evil-half-cursor)
        evil-motion-state-cursor '("orchid" box)
        evil-replace-state-cursor '("MediumPurple1" box)
        evil-emacs-state-cursor '("DeepSkyBlue" box)
        evil-normal-state-cursor '("IndianRed" box)
        evil-visual-state-cursor '("LightGreen" box)
        evil-insert-state-cursor '("LightGoldenrod" box))
  (evil-mode 1)
  (evil-set-initial-state 'ibuffer-mode nil)
  (evil-set-initial-state 'dired-mode nil)
  (evil-set-initial-state 'image-mode 'emacs)

  (define-key evil-motion-state-map "gd" 'dumb-jump-go)
  (define-key evil-motion-state-map "gb" 'dumb-jump-back)
  (define-key evil-motion-state-map "gl" 'dumb-jump-quick-look)

  (define-key evil-motion-state-map (kbd "s-p") 'highlight-symbol-prev)
  (define-key evil-motion-state-map (kbd "s-n") 'highlight-symbol-next)

  (setcdr evil-insert-state-map nil)
  (define-key evil-insert-state-map
    (read-kbd-macro evil-toggle-key) 'evil-emacs-state))


(use-package evil-leader
  :ensure t
  :pin melpa-stable
  :config
  (global-evil-leader-mode)
  (evil-leader/set-leader "RET")

  (evil-leader/set-key
    "ESC" 'keyboard-quit

    "=" 'list-packages
    "?" 'help-command

    "F" 'ido-find-file
    "q" 'quit-window

    "C-x C-c" 'save-buffers-kill-terminal)

  (evil-leader/set-key
        ;; list => l
    "lt" 'treemacs-select-window
    "ll" 'treemacs
    "la" 'ivy-imenu-anywhere
    "li" 'imenu-list-smart-toggle)

  (evil-leader/set-key
    ;; mark => m
    "ma" 'mc/mark-all-like-this
    "mm" 'counsel-bookmark
    "ml" 'bookmark-bmenu-list
    "mn" 'remember-notes
    "mr" 'remember
    "mR" 'remember-region
    "mc" 'remember-clipboard)

  (evil-leader/set-key
    ;; org-mode => o
    "od" 'deft
    "of" 'deft-find-file)

  (evil-leader/set-key
    ;; something => s
    "sv" 'ivy-switch-view

    ;; undo => u
    "uv" 'undo-tree-visualize)
  )



(use-package evil-magit
  :ensure t)


(use-package evil-ediff
  :ensure t)


(use-package evil-numbers
  :ensure t
  :config
  (define-key evil-normal-state-map (kbd "M-<up>") 'evil-numbers/dec-at-pt)
  (define-key evil-normal-state-map (kbd "M-<down>") 'evil-numbers/inc-at-pt))


(use-package evil-surround
  :ensure t
  :config
  (global-evil-surround-mode 1))


(use-package evil-escape
  :ensure t
  :config
  (setq-default evil-escape-key-sequence "kj")
  (evil-escape-mode))


(provide 'conf-evil)
;;; conf-evil.el ends here
