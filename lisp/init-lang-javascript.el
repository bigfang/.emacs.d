;; -*- mode: Emacs-Lisp; lexical-binding: t; -*-*-


;; javascript
(use-package js
  :hook (lsp-deferred)
  :config
  (setq js--prettify-symbols-alist
        '((">=" . ?≥)
          ("<=" . ?≤)))
  (setq js-indent-level 2))


(use-package add-node-modules-path
  :ensure t
  :defer t
  :commands add-node-modules-path
  :hook
  (js-mode js2-mode vue-mode typescript-mode))


(use-package js2-mode
  :ensure t
  :defer t
  :mode "\\.js\\'"
  :interpreter "node"
  :hook (lsp-deferred)
  :config
  (setq js2-basic-offset 2
        js2-strict-missing-semi-warning nil))


;; typescript
(use-package typescript-mode
  :ensure t
  :defer t
  :mode "\\.tsx$"
  :hook
  ((typescript-mode . lsp-deferred)
   (typescript-mode . (lambda () (add-hook 'before-save-hook #'lsp-organize-imports t t))))
  :config
  (setq typescript-indent-level 2))


(provide 'init-lang-javascript)
