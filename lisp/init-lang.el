;; -*- mode: Emacs-Lisp; lexical-binding: t; -*-*-


;; go
(use-package go-mode
  :ensure t
  :hook ((go-mode . lsp-deferred)
         (go-mode . (lambda () (add-hook 'before-save-hook #'lsp-organize-imports t t)))
         (go-mode . (lambda () (setq tab-width 4)))))


;; haskell
(use-package haskell-mode
  :ensure t
  :defer t
  :hook ((haskell-mode . turn-on-haskell-doc-mode)
         (haskell-mode . turn-on-haskell-indent)
         (haskell-mode . interactive-haskell-mode)))


;; racket
(use-package racket-mode
  :ensure t
  :defer t)


;; rust
(use-package rust-mode
  :ensure t
  :defer t)



(provide 'init-lang)
