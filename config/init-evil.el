;; -*- mode: Emacs-Lisp -*-


(use-package evil
  :ensure t
  :pin melpa-stable
  :bind (
         :map evil-motion-state-map
         ("^" . evil-window-top)
         ("$" . evil-window-bottom)
         ("H" . evil-first-non-blank)
         ("L" . evil-end-of-line)
         ("C-e" . evil-end-of-line)      ; evil-scroll-line-down
         ([remap evil-execute-macro] . evil-jump-item)

         :map evil-normal-state-map
         ("C-y" . yank)                  ; evil-scroll-line-up
         ([remap evil-jump-item] . evil-execute-macro)

         :map evil-insert-state-map
         ([escape] . evil-normal-state)     ; DO NOT USE "ESC"!
         ("C-o" . evil-execute-in-normal-state)

         :map evil-emacs-state-map
         ([escape] . evil-normal-state)     ; DO NOT USE "ESC"!
         )
  :hook (git-commit-mode . evil-insert-state)
  :init
  (setq evil-toggle-key "M-z"
        evil-want-fine-undo t
        ;; evil-move-cursor-back nil
        evil-want-C-u-scroll t
        evil-want-C-i-jump nil)
  :config
  (setq evil-operator-state-cursor '("LightGreen" evil-half-cursor)
        evil-motion-state-cursor '("RoyalBlue" box)
        evil-replace-state-cursor '("goldenrod1" box)
        evil-emacs-state-cursor '("DeepSkyBlue" box)
        evil-normal-state-cursor '("IndianRed" box)
        evil-visual-state-cursor '("LightGoldenrod" box)
        evil-insert-state-cursor '("MediumPurple1" box))
  (evil-mode 1)
  (evil-set-initial-state 'dired-mode 'emacs)
  (evil-set-initial-state 'image-mode 'emacs)
  (evil-set-initial-state 'neotree-mode 'emacs)

  (setcdr evil-insert-state-map nil)
  (define-key evil-insert-state-map
    (read-kbd-macro evil-toggle-key) 'evil-emacs-state))


(use-package evil-leader
  :ensure t
  :pin melpa-stable
  :config
  (global-evil-leader-mode)
  (evil-leader/set-leader "SPC")
  (evil-leader/set-key
    "ESC" 'keyboard-quit
    "SPC" 'keyboard-quit
    "RET" 'keyboard-quit
    "TAB" 'previous-buffer
    "DEL" 'next-buffer
    "<up>" 'buf-move-up
    "<down>" 'buf-move-down
    "<left>" 'buf-move-left
    "<right>" 'buf-move-right

    "=" 'er/expand-region
    "[" 'highlight-symbol-at-point
    "." 'xref-find-definitions
    "\\" 'split-window-right
    "-" 'split-window-below
    ";" 'comment-line
    "0" 'delete-window
    "1" 'delete-other-windows

    "h" 'help-command
    "q" 'quit-window
    "w" 'save-buffer
    "k" 'kill-buffer-and-window

    ;; buffer => b
    "bi" 'ibuffer
    "bb" 'ivy-switch-buffer
    "bn" 'next-buffer
    "bp" 'previous-buffer
    "bk" 'kill-this-buffer

    ;; check => c
    "ce" 'flycheck-explain-error-at-point
    "cl" 'flycheck-list-errors
    "cp" 'flycheck-previous-error
    "cn" 'flycheck-next-error

    ;; ivy => i
    "ii" 'swiper
    "ib" 'counsel-ibuffer
    "if" 'counsel-find-file
    "ie" 'counsel-recentf
    "im" 'counsel-imenu
    "is" 'counsel-rg
    "ir" 'counsel-rg
    "ia" 'counsel-ag
    "iu" 'ivy-resume
    "iv" 'ivy-push-view
    "iV" 'ivy-pop-view

    ;; j => jump
    "jc" 'avy-goto-char-2
    "jw" 'avy-goto-word-or-subword-1
    "jf" 'avy-goto-line
    "jr" 'avy-resume
    "jl" 'goto-line
    "jj" 'ffap

    ;; list => l
    "li" 'imenu-list-smart-toggle
    "lt" 'neotree-toggle

    ;; mark => m
    "ma" 'mc/mark-all-like-this
    "mm" 'counsel-bookmark
    "ml" 'bookmark-bmenu-list
    "mn" 'remember-notes
    "mr" 'remember
    "mR" 'remember-region
    "mc" 'remember-clipboard

    ;; project => p
    "p SPC" 'keyboard-quit
    "pi" 'projectile-ibuffer
    "pd" 'projectile-dired
    "pe" 'projectile-recentf
    "pp" 'counsel-projectile-switch-project
    "pb" 'counsel-projectile-switch-to-buffer
    "pf" 'counsel-projectile-find-file
    "ps" 'counsel-projectile-rg
    "pr" 'counsel-projectile-rg
    "pa" 'counsel-projectile-ag

    ;; something => s
    "ss" 'swiper
    "sv" 'ivy-switch-view
    "sw" 'switch-window

    ;; undo => u
    "uv" 'undo-tree-visualize
    "uu" 'undo-tree-undo
    "ur" 'undo-tree-redo
    "uw" 'winner-undo

    ;; version => v
    "vv" 'magit-status
    "vds" 'magit-diff-staged
    "vdu" 'magit-diff-unstaged
    "vdf" 'magit-diff-buffer-file

    ;; execute => x
    "xx" 'smex
    "xe" 'eval-last-sexp

    "C-x C-c" 'save-buffers-kill-terminal)
  )



(use-package evil-magit
  :ensure t)


(use-package evil-ediff
  :ensure t)


(use-package evil-surround
  :ensure t
  :config
  (global-evil-surround-mode 1))


(use-package evil-escape
  :ensure t
  :config
  (setq-default evil-escape-delay 0.2)
  (setq-default evil-escape-key-sequence "kj")
  (evil-escape-mode))


(provide 'init-evil)
;;; init-evil.el ends here
