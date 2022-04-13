;; -*- mode: Emacs-Lisp; lexical-binding: t; -*-*-


(use-package go-mode
  :ensure t
  :hook ((go-mode . lsp-deferred)
         (go-mode . (lambda () (add-hook 'before-save-hook #'lsp-organize-imports t t)))
         (go-mode . (lambda () (setq tab-width 4)))))


(provide 'init-go)
