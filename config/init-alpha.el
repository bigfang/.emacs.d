;; -*- mode: Emacs-Lisp -*-


(use-package pyim
  :ensure t
  :config
  (setq default-input-method "pyim")
  (setq pyim-default-scheme 'pyim-shuangpin)
  (pyim-isearch-mode 1))

(use-package pyim-basedict
  :ensure
  :config (pyim-basedict-enable))


(use-package imenu-anywhere
  :ensure t)


(use-package imenu-list
  :ensure t
  :bind ("C-'" . imenu-list-smart-toggle)
  :config
  (setq imenu-list-size 0.15
        imenu-list-auto-resize t))


(use-package emojify
  :ensure t
  :config
  (add-hook 'after-init-hook #'global-emojify-mode)
  )

(use-package smartparens
  :ensure t)

(use-package smartparens-config
  :ensure nil
  :hook ((prog-mode . show-smartparens-mode)
         (prog-mode . smartparens-mode)))


(use-package emmet-mode
  :ensure nil
  :hook (sgml-mode css-mode web-mode)
  :bind (:map emmet-mode-keymap
         ("C-j" . nil)
         ("<C-return>" . nil)
         ("<M-return>" . emmet-expand-line)
         ("M-j" . emmet-expand-line)
         )
  :config
  (setq emmet-indentation 2
        emmet-preview-default nil))


(use-package fill-column-indicator
  :ensure t
  :disabled
  :init
  ;;; code sinppet from spacemacs
  (defvar-local company-fci-mode-on-p nil)

  (defun company-turn-off-fci (&rest ignore)
    (when (boundp 'fci-mode)
      (setq company-fci-mode-on-p fci-mode)
      (when fci-mode (fci-mode -1))))

  (defun company-maybe-turn-on-fci (&rest ignore)
    (when company-fci-mode-on-p (fci-mode 1)))

  (add-hook 'company-completion-started-hook 'company-turn-off-fci)
  (add-hook 'company-completion-finished-hook 'company-maybe-turn-on-fci)
  (add-hook 'company-completion-cancelled-hook 'company-maybe-turn-on-fci)
  :config
  (setq-default fill-column 120)
  (setq fci-rule-width 1)
  (setq fci-rule-color "DimGray")
  (define-globalized-minor-mode
    global-fci-mode fci-mode (lambda () (fci-mode 1)))
  (global-fci-mode 1))


;; ===  build-in  packages  ===


(provide 'init-alpha)
;;; init-alpha.el ends here
