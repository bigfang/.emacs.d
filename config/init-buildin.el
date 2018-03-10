;; -*- mode: Emacs-Lisp -*-


(use-package bs
  :bind (("C-z b" . bs-show)
         ("C-z C-p" . bs-cycle-previous)
         ("C-z C-n" . bs-cycle-next)))


(use-package desktop
  :config
  (desktop-save-mode t)
  (add-to-list 'desktop-path "~/.emacs.d/"))


(use-package dired
  :config
  (setq dired-listing-switches "-aBhl"
        dired-recursive-copies 'top
        dired-recursive-deletes 'top
        dired-dwim-target t)
  (put 'dired-find-alternate-file 'disabled nil))


(use-package ido
  :config
  (ido-mode t)
  (ido-everywhere t)
  (setq ido-save-directory-list-file "~/.emacs.d/.emacs.ido.last"))


(use-package image-mode
  :bind (:map image-mode-map
              ("u" . image-scroll-down)))


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
         ("p" . pager-row-up)
         ("n" . pager-row-down)))


(use-package windmove
  :config
  (windmove-default-keybindings))


(provide 'init-buildin)
;;; init-buildin.el ends here
