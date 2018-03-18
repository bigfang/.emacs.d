;; -*- mode: Emacs-Lisp -*-


(use-package desktop
  :config
  (add-to-list 'desktop-path "~/.emacs.d/")
  (desktop-save-mode t))


(use-package dired
  :config
  (setq dired-listing-switches "-aBhl"
        dired-recursive-copies 'top
        dired-recursive-deletes 'top
        dired-dwim-target t)
  (put 'dired-find-alternate-file 'disabled nil))


(use-package ido
  :bind (("C-x b" . ido-switch-buffer))
  :config
  (setq ido-save-directory-list-file "~/.emacs.d/.emacs.ido.last")
  (ido-mode t)
  (ido-everywhere t))


(use-package image-file
  :config
  (auto-image-file-mode t))


(use-package image-mode
  :bind (:map image-mode-map
        ("u" . image-scroll-down)))


(use-package recentf
  :config (recentf-mode t))


(use-package tramp
  :config
  (setq tramp-default-method "ssh"
        ;; tramp-default-user "user"
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


(provide 'init-buildin)
;;; init-buildin.el ends here
