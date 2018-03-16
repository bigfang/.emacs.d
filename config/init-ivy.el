;; -*- mode: Emacs-Lisp -*-


(use-package smex
  :ensure t)


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
  (ivy-mode 1)
  (setq ivy-re-builders-alist
        '((counsel-M-x . ivy--regex-fuzzy)
          (t . ivy--regex-plus)))
  (setq ivy-use-virtual-buffers t
        ivy-count-format "(%d/%d) "
        ivy-height 12))


(use-package ivy-hydra
  :ensure t)


(use-package avy
  :ensure t
  :bind (("M-g g" . avy-goto-word-or-subword-1)
         ("M-g f" . avy-goto-line))
  )


(use-package swiper
  :ensure t
  :bind ("C-z s" . swiper))


(use-package counsel
  :ensure t
  :bind (("M-x" . counsel-M-x)
         ("<f1> f" . counsel-describe-function)
         ("<f1> v" . counsel-describe-variable)
         ("<f1> S" . counsel-info-lookup-symbol)
         ("M-y" . counsel-yank-pop)))


(use-package counsel-projectile
  :ensure t
  :config
  (counsel-projectile-mode t))


(provide 'init-ivy)
;;; init-ivy.el ends here
