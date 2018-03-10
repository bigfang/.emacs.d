;; -*- mode: Emacs-Lisp -*-


(use-package evil
  :ensure t
  :pin melpa-stable
  :bind (
         :map evil-normal-state-map
         ("^" . evil-window-top)
         ("$" . evil-window-bottom)
         ("H" . evil-first-non-blank)
         ("L" . evil-end-of-line)
         ("C-e" . evil-end-of-line)
         ("C-y" . yank)
         ("C-u" . evil-scroll-up)
         ("C-n" . evil-scroll-line-down)   ; evil-paste-pop-next
         ("C-p" . evil-scroll-line-up)   ; evil-paste-pop

         :map evil-visual-state-map
         ("^" . evil-window-top)
         ("$" . evil-window-bottom)
         ("H" . evil-first-non-blank)
         ("L" . evil-end-of-line)
         ("C-e" . evil-end-of-line)

         :map evil-insert-state-map
         ([escape] . evil-normal-state)     ; DO NOT USE "ESC"!
         ;; ("C-g" . evil-normal-state)
         ("C-o" . evil-execute-in-normal-state)

         :map evil-emacs-state-map
         ([escape] . evil-normal-state)     ; DO NOT USE "ESC"!
         )
  :hook (git-commit-mode . evil-insert-state)
  :init
  (setq evil-toggle-key "M-z"
        evil-want-fine-undo t
        evil-want-C-i-jump nil)
  :config
  (evil-mode 1)
  (setq evil-emacs-state-cursor '("#00bfff" box)
        evil-normal-state-cursor '("#cd5c5c" box)
        evil-visual-state-cursor '("#eedd82" box)
        evil-insert-state-cursor '("#ab82ff" box))

  (evil-set-initial-state 'dired-mode 'emacs)
  (evil-set-initial-state 'image-mode 'emacs)
  (evil-set-initial-state 'neotree-mode 'emacs)

  (setcdr evil-insert-state-map nil)
  (define-key evil-insert-state-map
    (read-kbd-macro evil-toggle-key) 'evil-emacs-state)
  )


(use-package evil-leader
  :ensure t
  :pin melpa-stable
  :config
  (global-evil-leader-mode)
  (evil-leader/set-leader "SPC")
  (evil-leader/set-key
    "<up>" 'windmove-up
    "<down>" 'windmove-down
    "<left>" 'windmove-left
    "<right>" 'windmove-right
    "ESC" 'keyboard-quit
    "SPC" 'keyboard-quit

    "=" 'er/expand-region
    "." 'xref-find-definitions
    "\\" 'split-window-right
    "-" 'split-window-below
    ";" 'comment-line
    "0" 'delete-window
    "1" 'delete-other-windows

    "!e" 'flycheck-explain-error-at-point
    "!l" 'flycheck-list-errors
    "!p" 'flycheck-previous-error
    "!n" 'flycheck-next-error

    "bi" 'ibuffer
    "bb" 'switch-to-buffer
    "bn" 'next-buffer
    "bp" 'previous-buffer
    "bk" 'kill-this-buffer
    "ma" 'mc/mark-all-like-this
    "f" 'counsel-find-file
    "g" 'avy-goto-word-or-subword-1
    "h" 'highlight-symbol-at-point
    "q" 'quit-window
    "w" 'save-buffer
    "k" 'kill-buffer-and-window
    "u" 'undo-tree-visualize

    "ss" 'swiper
    "sr" 'ivy-resume
    "sa" 'counsel-ag

    "vv" 'magit-status
    "vd" 'magit-diff-unstaged

    "pi" 'projectile-ibuffer
    "pd" 'projectile-dired
    "pp" 'counsel-projectile-switch-project
    "pb" 'counsel-projectile-switch-to-buffer
    "pf" 'counsel-projectile-find-file
    "ps" 'counsel-projectile-ag

    "xe" 'eval-last-sexp
    "z" 'winner-undo

    "C-x C-c" 'save-buffers-kill-terminal)

  (evil-leader/set-key-for-mode 'python-mode "." 'elpy-goto-definition)
  (evil-leader/set-key-for-mode 'python-mode "," 'elpy-goto-assignment)
  )


(use-package evil-magit
  :requires (magit)
  :ensure t
  :pin melpa-stable)



(use-package evil-ediff
  :ensure t)


(use-package evil-surround
  :ensure t
  :config
  (global-evil-surround-mode 1))


(use-package evil-escape
  :ensure t
  :config
  (evil-escape-mode)
  (setq-default evil-escape-delay 0.2)
  (setq-default evil-escape-key-sequence "kj"))


(provide 'init-evil)
;;; init-evil.el ends here
