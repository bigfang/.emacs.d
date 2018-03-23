;; -*- mode: Emacs-Lisp -*-


;; python
(use-package elpy
  :ensure t
  :pin melpa-stable
  :bind (:map elpy-mode-map
         ("<C-return>" . vi-open-line-below)
         ("<C-S-return>" . vi-open-line-above)
         ("M-i" . elpy-company-backend)
         ("M-." . elpy-goto-definition)
         )
  :init
  (elpy-enable)
  :config
  (when (executable-find "ipython")
    (setq python-shell-interpreter "ipython"
          python-shell-interpreter-args "-i --simple-prompt"))
  (setq python-indent-offset 4)
  (evil-define-key 'normal elpy-mode-map (kbd "gd") 'elpy-goto-definition)
  (setq elpy-rpc-backend "jedi")
  (defalias 'workon 'pyvenv-workon)
  (remove-hook 'elpy-modules 'elpy-module-flymake))


;; elixir
(use-package elixir-mode
  :ensure t)

(use-package alchemist
  :ensure t
  :config
  (setq alchemist-key-command-prefix (kbd "C-c ."))
  (setq alchemist-mix-env "dev")
  )


(use-package js2-mode
  :ensure t
  :mode "\\.js\\'"
  :bind (:map js2-mode-map
         ("<return>" . newline-and-indent))
  :hook (js2-mode . (lambda () (setq js2-basic-offset 2)))
  )

(use-package json-mode
  :ensure t)


(provide 'init-lang)
;;; init-lang.el ends here
