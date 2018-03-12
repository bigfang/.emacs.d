;; -*- mode: Emacs-Lisp -*-


(use-package ivy
  :ensure t
  :bind (("C-x b" . ivy-switch-buffer)
         ("C-c C-r" . ivy-resume)
         ("C-z v" . ivy-push-view)
         ("C-z V" . ivy-pop-view)
         :map ivy-minibuffer-map
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
        '((swiper . ivy--regex-plus)
          (t      . ivy--regex-fuzzy)))
  (setq ivy-use-virtual-buffers t
        ivy-count-format "(%d/%d) "
        ivy-height 12))


(use-package ivy-hydra
  :ensure t
  :after (ivy))


(use-package avy
  :ensure t
  :bind (("M-g g" . avy-goto-word-or-subword-1)
         ("M-g f" . avy-goto-line))
  )


(use-package swiper
  :ensure t
  :after (ivy)
  :bind (("C-s" . swiper)))


(use-package counsel
  :ensure t
  :after (ivy)
  :bind (("M-x" . counsel-M-x)
         ("C-h f" . counsel-describe-function)
         ("C-h v" . counsel-describe-variable)
         ("C-h S" . counsel-info-lookup-symbol)
         ("C-x C-f" . counsel-find-file)
         ("M-y" . counsel-yank-pop)))


(use-package counsel-projectile
  :ensure t
  :after (ivy)
  :config
  (counsel-projectile-mode t))


(provide 'init-ivy)
;;; init-ivy.el ends here
