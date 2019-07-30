;; -*- mode: Emacs-Lisp -*-


(use-package evil
  :ensure t
  :pin melpa-stable
  :chords ("kj" . evil-normal-state)
  :bind (:map evil-motion-state-map
         ("'" . evil-goto-mark)
         ("`" . evil-goto-mark-line)
         ("gD" . evil-goto-definition)
         ("^" . evil-window-top)
         ("$" . evil-window-bottom)
         ("H" . evil-first-non-blank)
         ("L" . evil-end-of-line)
         ("C-e" . evil-end-of-line)      ; evil-scroll-line-down
         ([remap evil-execute-macro] . evil-jump-item)

         :map evil-normal-state-map
         ("zi" . hs-hide-level)
         ("C-n" . next-line)
         ("C-p" . previous-line)
         ("C-y" . yank)                  ; evil-scroll-line-up
         ([remap evil-jump-item] . evil-execute-macro)

         :map evil-insert-state-map
         ([escape] . evil-normal-state)      ; DO NOT USE "ESC"!
         ("C-o" . evil-execute-in-normal-state)

         :map evil-emacs-state-map
         ([escape] . evil-normal-state))     ; DO NOT USE "ESC" or "<escape>"!
  :hook (git-commit-mode . evil-insert-state)
  :init
  (setq evil-toggle-key "M-z"
        evil-want-keybinding nil        ; for evil-collection
        evil-want-fine-undo t
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
  (evil-set-initial-state 'special-mode 'emacs)
  (evil-set-initial-state 'deadgrep-mode 'emacs)
  (evil-set-initial-state 'deft-mode nil)
  (evil-set-initial-state 'dired-mode 'emacs)
  (evil-set-initial-state 'ibuffer-mode 'emacs)
  (evil-set-initial-state 'helpful-mode 'emacs)
  (evil-set-initial-state 'paradox-menu-mode 'normal)

  (define-key evil-motion-state-map "gd" 'dumb-jump-go)
  (define-key evil-motion-state-map "gb" 'dumb-jump-back)
  (define-key evil-motion-state-map "gl" 'dumb-jump-quick-look)

  (setcdr evil-insert-state-map nil)
  (define-key evil-insert-state-map
    (read-kbd-macro evil-toggle-key) 'evil-emacs-state))


(use-package evil-collection
  :ensure t
  :after evil
  :config
  (evil-collection-init
   '(bookmark calendar ediff
     image image-dired image+
     magit)))


(use-package evil-goggles
  :ensure t
  :config
  (setq evil-goggles-duration 0.100)
  (evil-goggles-mode)
  (evil-goggles-use-diff-faces))


(use-package evil-lion
  :ensure t
  :config
  (evil-lion-mode))


(use-package evil-magit
  :ensure t
  :config
  (evil-define-key 'normal magit-mode-map (kbd "SPC") 'hydra:leader/body))


(use-package evil-numbers
  :ensure t
  :config
  (define-key evil-normal-state-map (kbd "M-<down>") 'evil-numbers/dec-at-pt)
  (define-key evil-normal-state-map (kbd "M-<up>") 'evil-numbers/inc-at-pt))


(use-package evil-surround
  :ensure t
  :config
  (global-evil-surround-mode 1))


(use-package evil-textobj-syntax
  :ensure t)


(with-eval-after-load 'evil
  (global-set-key (kbd "<M-Return>") 'vi-open-below))


(provide 'init-evil)
