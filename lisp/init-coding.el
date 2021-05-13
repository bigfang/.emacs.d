;; -*- mode: Emacs-Lisp; lexical-binding: t; -*-*-


;; === coding ===
(use-package flycheck
  :ensure t
  :pin melpa
  :hook (prog-mode . flycheck-mode)
  :config
  (setq-default flycheck-disabled-checkers '(emacs-lisp-checkdoc))

  (defhydra hydra:flycheck (:pre (flycheck-list-errors)
                            :post (quit-windows-on "*Flycheck errors*")
                            :hint nil)
    "Flycheck"
    ("f"  flycheck-error-list-set-filter    "Filter")
    ("j"  flycheck-next-error               "Next")
    ("k"  flycheck-previous-error           "Previous")
    ("H" flycheck-first-error              "First")
    ("L"  (progn (goto-char (point-max))
                 (flycheck-previous-error)) "Last")
    ("q"  nil)))


(use-package projectile
  :ensure t
  :pin melpa
  :bind-keymap
  ("M-o p" . projectile-command-map)
  :config
  (setq projectile-completion-system 'ivy)
  (setq projectile-mode-line-function
        '(lambda () (format " [%s]" (projectile-project-name))))
  (projectile-mode))


(use-package yasnippet
  :ensure t
  :pin melpa
  :hook (prog-mode . yas-minor-mode)
  :config
  (yas-reload-all))

(use-package yasnippet-snippets
  :ensure t
  :after yasnippet)



;; === programming languages ===
;; python
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

(use-package poetry
  :ensure t
  :defer t)

(use-package pyvenv
  :ensure t
  :defer t)

(use-package lsp-pyls
  ;; :disabled
  :defer t
  :hook (python-mode . lsp-deferred)
  :config
  (setq lsp-pyls-plugins-pylint-enabled nil
        lsp-pyls-configuration-sources ["flake8"]))

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


;; erlang
(use-package erlang
  :ensure t
  :defer t)

;; elixir
(use-package elixir-mode
  :ensure t
  :defer t
  :interpreter "elixir"
  :config
  (add-hook 'elixir-format-hook
            (lambda ()
              (if (projectile-project-p)
                  (setq elixir-format-arguments
                        (list "--dot-formatter"
                              (concat (locate-dominating-file buffer-file-name ".formatter.exs") ".formatter.exs")))
                (setq elixir-format-arguments nil)))))

(use-package alchemist
  :ensure t
  :defer t
  :hook (elixir-mode)
  :init
  (setq alchemist-key-command-prefix (kbd "M-g M-a"))
  :config
  (setq alchemist-mix-env "dev")
  (evil-define-key 'normal alchemist-mode-map (kbd "gd") 'alchemist-goto-definition-at-point)
  (evil-define-key 'normal alchemist-mode-map (kbd "gb") 'alchemist-goto-jump-back))


;; javascript
(use-package js
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
  :config
  (setq js2-basic-offset 2
        js2-strict-missing-semi-warning nil))

;; typescript
(use-package typescript-mode
  :ensure t
  :defer t
  :mode "\\.tsx$"
  :defer t
  :config
  (setq typescript-indent-level 2))

;; prettier
(use-package prettier-js
  :ensure t
  :defer t
  ;; :config
  ;; (setq prettier-js-args
  ;;       '("--trailing-comma" "all"
  ;;         "--single-quote" "true"
  ;;         "--no-semi"))
  ;; :hook ((js2-mode . prettier-js-mode)
  ;;        (typescript-mode . prettier-js-mode)
  ;;        (web-mode . prettier-js-mode))
  :bind ("M-o P" . prettier-js))


;; racket
(use-package racket-mode
  :ensure t
  :defer t)


;; rust
(use-package rust-mode
  :ensure t
  :defer t)


;; haskell
(use-package haskell-mode
  :ensure t
  :defer t
  :hook ((haskell-mode . turn-on-haskell-doc-mode)
         (haskell-mode . turn-on-haskell-indent)
         (haskell-mode . interactive-haskell-mode)))

;; go
(use-package go-mode
  :ensure t
  :hook ((go-mode . lsp-deferred)
         (go-mode . (lambda () (setq tab-width 4)))
         (before-save . lsp-format-buffer)
         (before-save . lsp-organize-imports)))


;; === web develop ===
(use-package css-mode
  :defer t
  :config
  (setq css-indent-offset 2))


(use-package emmet-mode
  :ensure t
  :defer t
  :hook (sgml-mode css-mode web-mode)
  :bind (:map emmet-mode-keymap
         ("C-j" . nil)
         ("<C-return>" . nil)
         ("<M-return>" . emmet-expand-line)
         ("M-j" . emmet-expand-line))
  :config
  (setq emmet-indentation 2
        emmet-preview-default nil))


(use-package web-mode
  :ensure t
  :defer t
  :config
  (setq web-mode-markup-indent-offset 2
        web-mode-css-indent-offset 2
        web-mode-code-indent-offset 2))



;; === others ===
(use-package csv-mode
  :ensure t
  :defer t
  :config
  (defhydra hydra:csv (:color teal :hint nil)
    "csv"
    ("o" csv-align-fields "align")
    ("u" csv-unalign-fields "unalign")
    ("q" nil :color blue)))

(use-package json-mode
  :ensure t
  :defer t
  :config
  (setq json-reformat:indent-width 2)

  (defhydra hydra:json (:color teal :hint nil :columns 2)
    "json"
    ("f" json-mode-beautify "reformat")
    ("p" json-mode-show-path "show snatcher")
    ("k" json-mode-kill-path "kill snatcher")
    ("t" json-toggle-boolean "toggle boolean")
    ("n" json-nullify-sexp "set null")
    ("<up>" json-increment-number-at-point "increase number" :color pink)
    ("<down>" json-decrement-number-at-point "decrease number" :color pink)
    ("q" nil :color blue)))

(use-package nginx-mode
  :ensure t
  :defer t)

(use-package protobuf-mode
  :ensure t
  :defer t)

(use-package toml-mode
  :ensure t
  :defer t)

(use-package yaml-mode
  :ensure t
  :defer t)


(provide 'init-coding)
