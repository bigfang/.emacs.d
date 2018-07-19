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
         ("zi" . hs-hide-level)
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
    "SPC" 'switch-window
    "RET" 'keyboard-quit
    "TAB" 'previous-buffer
    "DEL" 'next-buffer
    "<up>" 'buf-move-up
    "<down>" 'buf-move-down
    "<left>" 'buf-move-left
    "<right>" 'buf-move-right

    "0" 'delete-window
    "1" 'delete-other-windows
    "=" 'er/expand-region
    "[" 'highlight-symbol-at-point
    "." 'xref-find-definitions
    ";" 'comment-line
    "?" 'help-command
    "\\" 'hsplit-last-buffer
    "-" 'vsplit-last-buffer

    "f" 'ido-find-file
    "q" 'quit-window
    "w" 'save-buffer
    "k" 'kill-buffer-and-window

    "C-x C-c" 'save-buffers-kill-terminal)

  (evil-leader/set-key
    ;; buffer => b
    "bi" 'ibuffer
    "bb" 'ivy-switch-buffer
    "bn" 'next-buffer
    "bp" 'previous-buffer
    "bk" 'kill-this-buffer

    ;; check => c
    "ce" 'flycheck-explain-error-at-point
    ;; "cl" 'flycheck-list-errors
    "cl" 'my/toggle-flyc-window
    "cp" 'flycheck-previous-error
    "cn" 'flycheck-next-error)

  (evil-leader/set-key
    ;; ivy => i
    "ii" 'swiper
    "ib" 'counsel-ibuffer
    "if" 'counsel-find-file
    "ie" 'counsel-recentf
    "im" 'counsel-imenu
    "is" 'counsel-rg
    "ir" 'counsel-rg
    "ia" 'counsel-ag
    "io" 'counsel-outline
    "iu" 'ivy-resume
    "iv" 'ivy-push-view
    "iV" 'ivy-pop-view)

  (evil-leader/set-key
    ;; j => jump
    "jc" 'avy-goto-char-2
    "jw" 'avy-goto-word-or-subword-1
    "jf" 'avy-goto-line
    "jr" 'avy-resume
    "jl" 'goto-line
    "jj" 'ffap

    ;; list => l
    "lt" 'treemacs-select-window
    "ll" 'treemacs
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
    ;; project => p
    "p SPC" 'keyboard-quit
    "pi" 'projectile-ibuffer
    "pd" 'projectile-dired
    "pe" 'projectile-recentf
    "pr" 'projectile-replace
    "pp" 'counsel-projectile-switch-project
    "pb" 'counsel-projectile-switch-to-buffer
    "pf" 'counsel-projectile-find-file
    "ps" 'counsel-projectile-rg
    "pa" 'counsel-projectile-ag
    "pxe" 'projectile-run-eshell)

  (evil-leader/set-key
    ;; something => s
    "ss" 'swiper
    "sm" 'swiper-multi
    "sv" 'ivy-switch-view
    "sw" 'switch-window
    "sf" 'other-frame
    "st" 'transpose-frame

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
    "vzz" 'magit-stash
    "vzp" 'magit-stash-pop
    "vb" 'magit-blame
    "vll" 'magit-log-current
    "vlf" 'magit-log-buffer-file

    ;; execute => x
    "xe" 'eval-last-sexp
    "xv" 'ido-find-alternate-file
    "xx" 'smex)
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
  (setq-default evil-escape-key-sequence "kj")
  (evil-escape-mode))


(provide 'init-evil)
;;; init-evil.el ends here
