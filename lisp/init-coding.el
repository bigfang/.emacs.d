;; -*- mode: Emacs-Lisp -*-


;; === coding ===
(use-package flycheck
  :ensure t
  :pin melpa-stable
  :hook (prog-mode . flycheck-mode)
  :config
  (setq-default flycheck-disabled-checkers '(emacs-lisp-checkdoc))

  (defhydra hydra:flycheck
    (:pre (progn (flycheck-list-errors))
     :post (progn (quit-windows-on "*Flycheck errors*"))
     :hint nil)
    "Errors"
    ("f"  flycheck-error-list-set-filter                            "Filter")
    ("j"  flycheck-next-error                                       "Next")
    ("k"  flycheck-previous-error                                   "Previous")
    ("gg" flycheck-first-error                                      "First")
    ("G"  (progn (goto-char (point-max)) (flycheck-previous-error)) "Last")
    ("q"  nil)))


(use-package projectile
  :ensure t
  :pin melpa-stable
  :bind-keymap
  ("s-p" . projectile-command-map)
  :config
  (setq projectile-completion-system 'ivy)
  (projectile-mode))


(use-package yasnippet
  :ensure t
  :pin melpa
  :hook (prog-mode . yas-minor-mode)
  :config
  (yas-reload-all)
  (use-package yasnippet-snippets
    :ensure t))



;; === programming languages ===
;; python
(use-package pyvenv
  :ensure t)

(use-package anaconda-mode
  :ensure t
  :hook
  (python-mode . anaconda-mode)
  (python-mode . anaconda-eldoc-mode)
  :config
  (setq python-indent-guess-indent-offset-verbose nil)
  (unbind-key "M-r" anaconda-mode-map)
  (when (executable-find "ipython")
    (setq python-shell-interpreter "ipython"
          python-shell-interpreter-args "-i --simple-prompt"))
  (evil-define-key 'normal anaconda-mode-map (kbd "ga") 'anaconda-mode-find-assignments)
  (evil-define-key 'normal anaconda-mode-map (kbd "gr") 'anaconda-mode-find-references)
  (evil-define-key 'normal anaconda-mode-map (kbd "gd") 'anaconda-mode-find-definitions)

  (defhydra hydra:python (:color teal :hint nil)
    "python"
    ("o" pyvenv-workon "python workon")
    ("r" run-python "IPython")
    ("q" nil :color blue)))

(use-package company-anaconda
  :ensure t
  :after company anaconda-mode
  :config
  (add-to-list 'company-backends '(company-anaconda :with company-capf)))


;; erlang
(use-package erlang
  :ensure t)

;; elixir
(use-package elixir-mode
  :ensure t
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
  :init
  (setq alchemist-key-command-prefix (kbd "M-g M-a"))
  :config
  (setq alchemist-mix-env "dev")
  (evil-define-key 'normal alchemist-mode-map (kbd "gd") 'alchemist-goto-definition-at-point)
  (evil-define-key 'normal alchemist-mode-map (kbd "gb") 'alchemist-goto-jump-back))


;; javascript
(use-package js
  :config
  (setq js-indent-level 2))

(use-package js2-mode
  :ensure t
  :mode "\\.js\\'"
  :interpreter "node"
  :bind (:map js2-mode-map
         ("<return>" . newline-and-indent))
  :config
  (setq js2-basic-offset 2))

;; typescript
(use-package typescript-mode
  :ensure t
  :config
  (setq typescript-indent-level 2))

(use-package tide
  :ensure t
  :after (typescript-mode company flycheck)
  :hook ((typescript-mode . tide-setup)
         (typescript-mode . tide-hl-identifier-mode)
         (before-save . tide-format-before-save)))

;; prettier
(use-package prettier-js
  :ensure t
  :hook ((js2-mode . prettier-js-mode)
         (typescript-mode . prettier-js-mode)
         (web-mode . prettier-js-mode))
  :config
  (setq prettier-js-args
        '("--trailing-comma" "all"
          "--single-quote" "true"
          "--no-semi")))


;; rust
(use-package rust-mode
  :ensure t)


;; haskell
(use-package haskell-mode
  :ensure t
  :hook ((haskell-mode . turn-on-haskell-doc-mode)
         (haskell-mode . turn-on-haskell-indent)
         (haskell-mode . interactive-haskell-mode)))



;; === web develop ===
(use-package css-mode
  :config
  (setq css-indent-offset 2))


(use-package emmet-mode
  :ensure t
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
  :config
  (setq web-mode-markup-indent-offset 2
        web-mode-css-indent-offset 2
        web-mode-code-indent-offset 2))


(use-package vue-mode
  :ensure t)



;; === others ===
(use-package csv-mode
  :ensure t
  :config
  (defhydra hydra:csv (:color teal :hint nil)
    "csv"
    ("o" csv-align-fields "align")
    ("u" csv-unalign-fields "unalign")
    ("q" nil :color blue)))

(use-package json-mode
  :ensure t
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
  :ensure t)

(use-package protobuf-mode
  :ensure t)

(use-package toml-mode
  :ensure t)

(use-package yaml-mode
  :ensure t)


(provide 'init-coding)
