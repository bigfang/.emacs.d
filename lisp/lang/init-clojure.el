;; -*- mode: Emacs-Lisp; lexical-binding: t; -*-*-


(use-package cider
  :ensure t
  :defer t)


(use-package clojure-mode
  :ensure t
  :mode "\\.clj\\'"
  :init
  (add-hook 'clojure-mode-hook #'evil-paredit-mode)
  :config
  (require 'cider))


(provide 'init-clojure)
