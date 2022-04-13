;; -*- mode: Emacs-Lisp; lexical-binding: t; -*-*-


(use-package markdown-mode
  :ensure t
  :defer t)


(use-package markdown-toc
  :ensure t
  :bind ("C-c C-q" . markdown-toc-generate-or-refresh-toc))


(provide 'init-markdown)
