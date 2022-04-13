;; -*- mode: Emacs-Lisp; lexical-binding: t; -*-*-


(use-package haskell-mode
  :ensure t
  :defer t
  :hook ((haskell-mode . turn-on-haskell-doc-mode)
         (haskell-mode . turn-on-haskell-indent)
         (haskell-mode . interactive-haskell-mode)))


(provide 'init-haskell)
