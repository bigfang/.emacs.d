;; -*- mode: Emacs-Lisp -*-


(use-package cua-base
  :config
  ;; (setq cua-highlight-region-shift-only t) ;; no transient mark mode
  ;; (setq cua-toggle-set-mark nil) ;; original set-mark behavior, i.e. no transient-mark-mode
  ;; (setq cua-auto-tabify-rectangles nil) ;; Don't tabify after rectangle commands
  ;; (setq cua-delete-selection nil)
  (setq cua-enable-cua-keys nil)
  (cua-mode -1))


(use-package desktop
  :unless (daemonp)
  :config
  (add-to-list 'desktop-path "~/.emacs.d/")
  (push '(company-posframe-mode . nil)
        desktop-minor-mode-table)
  (desktop-save-mode t))


(use-package ido
  :bind (("C-x b" . ido-switch-buffer))
  :config
  (setq ido-save-directory-list-file "~/.emacs.d/.emacs.ido.last")
  (ido-mode t)
  (ido-everywhere t))


(use-package image-file
  :config
  (auto-image-file-mode t))


(use-package ls-lisp
  :config
  (setq ls-lisp-use-insert-directory-program nil
        ls-lisp-dirs-first t))


(use-package recentf
  :config (recentf-mode t))


(use-package time-stamp
  :config
  (setq time-stamp-format "%04y-%02m-%02d %02H:%02M:%02S"))


(use-package tramp
  :config
  (setq tramp-default-method "ssh"
        tramp-default-user "root"
        ;; tramp-default-host "192\.168\.0\.1"
        password-cache-expiry nil))


(use-package uniquify
  :config
  (setq uniquify-buffer-name-style 'post-forward-angle-brackets))


(use-package view
  :bind (("C-z z" . view-mode)
         :map view-mode-map
         ("b" . backward-char)
         ("f" . forward-char)
         ("C-n" . next-line)
         ("C-p" . previous-line)
         ("p" . evil-scroll-line-up)
         ("n" . evil-scroll-line-down)))


(use-package which-func
  :config
  (setq which-func-unknown "n/a")
  (which-function-mode t))


(use-package windmove
  :config
  (windmove-default-keybindings))


(use-package winner
  :config (winner-mode t))


(use-package zone
  :disabled
  :config (zone-when-idle 600))


(provide 'conf-builtin)
