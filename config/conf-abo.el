;; -*- mode: Emacs-Lisp -*-


(use-package hydra
  :ensure t
  :after (dired ibuffer)
  :config
  (require 'hydra/hydra-dired)
  (require 'hydra/hydra-ibuffer)
  (require 'hydra/hydra-info)
  (require 'hydra/hydra-macro)

  (require 'hydra/hydra-avy)
  (require 'hydra/hydra-flycheck)
  (require 'hydra/hydra-git-gutter)
  (require 'hydra/hydra-multiple-cursors)
  (require 'hydra/hydra-projectile))


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
