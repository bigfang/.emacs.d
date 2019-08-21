;; -*- mode: Emacs-Lisp -*-


(use-package desktop
  :unless (daemonp)
  :config
  (add-to-list 'desktop-minor-mode-table
               '(company-posframe-mode . nil) t)
  (desktop-save-mode t))


(use-package ido
  :bind (("C-x b" . ido-switch-buffer))
  :config
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


(use-package savehist
  :config (savehist-mode t))


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
  :bind (("M-o z" . view-mode)
         :map view-mode-map
         ("<escape>" . keyboard-quit)
         ("C-n" . next-line)
         ("C-p" . previous-line))
  :hook (view-mode . my/change-view-mode-state)
  :config
  (defun my/change-view-mode-state ()
    (cond
     ((eq buffer-read-only t) (evil-motion-state))
     ((eq buffer-read-only nil) (evil-normal-state))))
  (evil-define-key 'motion view-mode-map (kbd "n") 'evil-scroll-line-down)
  (evil-define-key 'motion view-mode-map (kbd "p") 'evil-scroll-line-up))


(use-package which-func
  :disabled
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


(provide 'init-builtin)
