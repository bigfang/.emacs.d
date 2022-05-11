;; -*- mode: Emacs-Lisp; lexical-binding: t; -*-*-


(use-package python
  :config
  (when (executable-find "ipython")
    (setq python-shell-interpreter "ipython"
          python-shell-interpreter-args "-i --simple-prompt"))

  (defhydra hydra:python (:color teal :hint nil)
    "python"
    ("a" poetry "poetry")
    ("w" pyvenv-workon "workon")
    ("r" run-python "IPython")
    ("q" nil :color blue)))



(use-package pyvenv
  :ensure t
  :defer t)


(use-package lsp-pylsp
  :after lsp-mode
  :defer t
  :hook (python-mode . lsp-deferred)
  :config
  (setq lsp-pylsp-plugins-pydocstyle-enabled nil
        lsp-pylsp-plugins-yapf-enabled t))


(use-package lsp-python-ms
  :disabled
  :ensure t
  :init (setq lsp-python-ms-auto-install-server t)
  :hook (python-mode . (lambda ()
                          (require 'lsp-python-ms)
                          (lsp-deferred))))


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
