;; -*- mode: Emacs-Lisp -*-


(use-package evil
  :ensure t
  :pin melpa
  :chords ("kj" . evil-normal-state)
  :bind (:map evil-motion-state-map
         ("'" . evil-goto-mark)
         ("`" . evil-goto-mark-line)
         ("/" . swiper)

         ("^" . evil-window-top)
         ("$" . evil-window-bottom)
         ("H" . evil-first-non-blank)
         ("L" . evil-end-of-line)

         ("C-e" . evil-end-of-line)      ; evil-scroll-line-down
         ("@" . evil-jump-item)
         ("%" . nil)

         :map evil-normal-state-map
         ("j" . evil-next-visual-line)
         ("k" . evil-previous-visual-line)
         ("gj" . evil-next-line)
         ("gk" . evil-previous-line)

         ("zi" . hs-hide-level)
         ("C-." . er/expand-region)
         ("M-." . xref-find-definitions)
         ("C-n" . next-line)
         ("C-p" . previous-line)
         ("C-y" . yank)                  ; evil-scroll-line-up
         ("@" . nil)
         ("%" . evil-execute-macro)

         :map evil-insert-state-map
         ([escape] . evil-normal-state)      ; DO NOT USE "ESC" or "<escape>"!
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
  (evil-set-initial-state 'dired-mode 'emacs)
  (evil-set-initial-state 'ibuffer-mode 'emacs)

  (evil-set-initial-state 'deadgrep-mode 'emacs)
  (evil-set-initial-state 'deft-mode nil)
  (evil-set-initial-state 'helpful-mode 'motion)
  (evil-set-initial-state 'paradox-menu-mode 'motion)

  (global-set-key (kbd "M-n") 'evil-scroll-line-down)
  (global-set-key (kbd "M-p") 'evil-scroll-line-up)

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


(use-package evil-embrace
  :ensure t
  :hook (org-mode . embrace-org-mode-hook)
  :bind ("C-," . embrace-commander)
  :init
  (evil-embrace-enable-evil-surround-integration))

(use-package evil-surround
  :ensure t
  :config
  (global-evil-surround-mode 1))


(use-package evil-textobj-syntax
  :ensure t)


(provide 'init-evil)
