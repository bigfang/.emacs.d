;; -*- mode: Emacs-Lisp -*-


(use-package ivy
  :ensure t
  :bind (:map ivy-minibuffer-map
         ;; ("[escape]" . minibuffer-keyboard-quit)
         ("<escape>" . minibuffer-keyboard-quit)
         ("M-n" . ivy-next-line)
         ("M-p" . ivy-previous-line)
         ("C-n" . ivy-next-history-element)
         ("C-p" . ivy-previous-history-element)
         )
  :config
  (setq ivy-re-builders-alist
        '((counsel-M-x . ivy--regex-fuzzy)
          (t . ivy--regex-plus)))
  (setq ivy-use-virtual-buffers t
        ivy-count-format "(%d/%d) "
        ivy-height 12)
  (ivy-mode 1))


(use-package ivy-hydra
  :ensure t)


(use-package swiper
  :ensure t
  :bind ("C-s" . swiper))


(use-package counsel
  :ensure t
  :bind (("M-x" . counsel-M-x)
         ("M-y" . counsel-yank-pop)))


;; ===
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
  :ensure t)


(provide 'init-ivy)
;;; init-ivy.el ends here
