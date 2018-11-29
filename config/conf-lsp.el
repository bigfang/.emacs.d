;; -*- mode: Emacs-Lisp -*-


(electric-quote-mode t)


(require 'lsp-mode)
(require 'lsp-common)

(with-eval-after-load 'python
  (add-hook 'python-mode-hook #'lsp-mode)
  (lsp-define-stdio-client lsp-python "python"
                         (lsp-make-traverser #'(lambda (dir)
                                                 (directory-files
                                                  dir
                                                  nil
                                                  "\\.gitignore\\|\\(__init__\\|setup\\)\\.py")))
                         '("pyls"))
  (add-hook 'python-mode-hook #'lsp-python-enable))


(use-package lsp-mode
  :ensure t)


(use-package company-lsp
  :ensure t
  :init
  (add-to-list 'company-backends 'company-lsp))


(provide 'conf-lsp)
