;; -*- mode: Emacs-Lisp; lexical-binding: t; -*-*-


(use-package python
  :config
  (when (executable-find "ipython")
    (setq python-shell-interpreter "ipython"
          python-shell-interpreter-args "-i --simple-prompt"))

  (defhydra hydra:python (:color teal :hint nil)
    "python"
    ("a" poetry "poetry")
    ("r" run-python "IPython")
    ("q" nil :color blue)))


(use-package lsp-pylsp
  :after lsp-mode
  :defer t
  :hook (python-mode . lsp-deferred)
  :config
  (setq lsp-pylsp-plugins-pydocstyle-enabled nil
        lsp-pylsp-plugins-yapf-enabled t))


(use-package lsp-pyright
  :disabled
  :ensure t
  :defer t
  :hook (python-mode . (lambda ()
                          (require 'lsp-pyright)
                          (lsp-deferred)))
  :config
  (setq lsp-pyright-venv-path "~/.cache/pypoetry/virtualenvs"))


(provide 'init-python)
