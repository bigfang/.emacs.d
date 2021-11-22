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
  (js-mode js2-mode typescript-mode))


(use-package rjsx-mode
  :ensure t
  :defer t
  :mode "\\.jsx\\'")


(use-package js2-mode
  :ensure t
  :defer t
  :mode "\\.js\\'"
  :interpreter "node"
  :hook (lsp-deferred)
  :config
  (setq js2-basic-offset 2
        js2-strict-missing-semi-warning nil))

;; prettier
(use-package prettier-js
  :ensure t
  :defer t
  :config
  (setq prettier-js-args
        '("--print-width" "100"
          "--single-quote" "true"
          "--bracket-spacing" "true"
          ;; "--no-semi"
          "--arrow-parens" "avoid"
          "--trailing-comma" "es5"))
  :hook ((js-mode . prettier-js-mode)
         (js2-mode . prettier-js-mode)
         (typescript-mode . prettier-js-mode)
         (web-mode . prettier-js-mode))
  :bind ("M-o p" . prettier-js))


;; typescript
(use-package typescript-mode
  :ensure t
  :defer t
  :mode ("\\.ts$" "\\.tsx$")
  :hook
  ((typescript-mode . lsp-deferred)
   (typescript-mode . (lambda () (add-hook 'before-save-hook #'lsp-organize-imports t t))))
  :config
  (setq typescript-indent-level 2))


(provide 'init-lang-javascript)
