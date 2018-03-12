;; -*- mode: Emacs-Lisp -*-


(use-package emojify
  :ensure t
  :config
  (add-hook 'after-init-hook #'global-emojify-mode)
  )

(use-package smartparens
  :ensure t)

(use-package smartparens-config
  :ensure nil
  :after (smartparens)
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
  :config
  (setq-default fill-column 120)
  (setq fci-rule-width 1)
  (setq fci-rule-color "DimGray")
  (define-globalized-minor-mode
    global-fci-mode fci-mode (lambda () (fci-mode 1)))
  (global-fci-mode 1))


;; ===  build-in  packages  ===


(use-package remember
  :bind (("<f9> r" . remember)
         ("<f9> R" . remember-region)))


(provide 'init-alpha)
;;; init-alpha.el ends here
