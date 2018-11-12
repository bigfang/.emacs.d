;; -*- mode: Emacs-Lisp -*-


(use-package hydra
  :ensure t
  :after (dired ibuffer)
  :bind (:map evil-motion-state-map
         ("SPC" . hydra-entry/body))
  :config
  (use-package hydra/hydra-utils)

  (use-package hydra/hydra-toggle)
  (use-package hydra/hydra-dired)
  (use-package hydra/hydra-frame)
  (use-package hydra/hydra-ibuffer)
  (use-package hydra/hydra-info)
  (use-package hydra/hydra-macro)
  (use-package hydra/hydra-rectangle)

  (use-package hydra/hydra-flycheck)
  (use-package hydra/hydra-git-gutter)
  (use-package hydra/hydra-abo)
  (use-package hydra/hydra-multiple-cursors)
  (use-package hydra/hydra-projectile)
  (use-package hydra/hydra-launcher)

  (use-package hydra/hydra-buffer)
  (use-package hydra/hydra-jump)

  (use-package hydra/hydra-entry))


(use-package ivy
  :ensure t
  :bind (:map ivy-minibuffer-map
         ("<escape>" . minibuffer-keyboard-quit)
         ("s-n" . ivy-next-line-and-call)
         ("s-p" . ivy-previous-line-and-call)
         ("M-n" . ivy-next-line)
         ("M-p" . ivy-previous-line)
         ("C-n" . ivy-next-history-element)
         ("C-p" . ivy-previous-history-element))
  :hook ((imenu-after-jump . recenter-top-bottom)
         (counsel-grep-post-action . recenter-top-bottom))
  :config
  (setq ivy-re-builders-alist
        '((counsel-M-x . ivy--regex-fuzzy)
          (t . ivy--regex-plus)))
  (setq ivy-use-virtual-buffers t
        ivy-count-format "(%d/%d) "
        ivy-height 12)
  (ivy-mode 1))


(use-package ivy-hydra
  :ensure t
  :after (ivy hydra))


(use-package swiper
  :ensure t
  :bind ("C-s" . swiper)
  :config
  (define-key evil-motion-state-map "/" 'swiper))


(use-package counsel
  :ensure t
  :bind (("M-x" . counsel-M-x)
         ("M-y" . counsel-yank-pop)))


;; ===
(use-package all-the-icons-ivy
  :ensure t
  :config
  (all-the-icons-ivy-setup))


(use-package avy
  :ensure t
  :bind (("M-g g" . avy-goto-word-or-subword-1)
         ("<f1> f" . counsel-describe-function)
         ("<f1> v" . counsel-describe-variable)
         ("<f1> S" . counsel-info-lookup-symbol)
         ("M-g f" . avy-goto-line)))


(use-package counsel-projectile
  :ensure t
  :config (counsel-projectile-mode t))


(use-package smex
  :ensure t
  :bind ("M-X" . smex-major-mode-commands))


(provide 'conf-abo)
;;; conf-abo.el ends here
