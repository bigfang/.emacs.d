;; -*- mode: Emacs-Lisp -*-


(use-package hydra
  :ensure t
  :after (swiper)
  :bind (("C-SPC" . hydra-leader/body)
         ("C-s" . hydra-captain/body)
         :map evil-motion-state-map
         ("SPC" . hydra-leader/body)
         ("/" . hydra-captain/body))
  :config
  (use-package hydra/hydra-dired)
  (use-package hydra/hydra-ibuffer)
  (use-package hydra/hydra-info)
  (use-package hydra/hydra-macro)
  (use-package hydra/hydra-rectangle)

  (use-package hydra/hydra-leader)
  (use-package hydra/hydra-captain))


(use-package ivy
  :ensure t
  :bind (:map ivy-minibuffer-map
         ("<escape>" . minibuffer-keyboard-quit)
         ("M-u" . ivy-occur)
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
        ivy-height 15)
  (ivy-mode 1))


(use-package ivy-hydra
  :ensure t
  :after (ivy hydra))


(use-package swiper
  :ensure t
  :bind (("C-S" . swiper-all)
         ;; ("C-s" . swiper)
         :map swiper-map
         ("M-q" . swiper-query-replace)
         ("C-'" . swiper-avy)
         ("C-7" . swiper-mc)))


(use-package counsel
  :ensure t
  :ensure-system-package (rg . ripgrep)
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
         ("M-g f" . avy-goto-line)))


(use-package counsel-tramp
  :ensure t)


(use-package counsel-projectile
  :ensure t
  :config (counsel-projectile-mode t))


(use-package smex
  :ensure t
  :bind ("M-X" . smex-major-mode-commands))


(provide 'conf-abo)
;;; conf-abo.el ends here
