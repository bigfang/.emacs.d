;; -*- mode: Emacs-Lisp -*-


;; === coding ===
(use-package auto-yasnippet
  :ensure t
  :bind (("s-w" . aya-create)
         ("s-y" . aya-expand)))


(use-package flycheck
  :ensure t
  :pin melpa-stable
  :hook (prog-mode . flycheck-mode)
  :config
  (setq-default flycheck-disabled-checkers '(emacs-lisp-checkdoc))

  (defhydra hydra-flycheck
    (:pre (progn (setq hydra-lv t) (flycheck-list-errors))
          :post (progn (setq hydra-lv nil) (quit-windows-on "*Flycheck errors*"))
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

  (defhydra hydra-python (:color teal :hint nil)
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
(use-package js2-mode
  :ensure t
  :mode "\\.js\\'"
  :bind (:map js2-mode-map
         ("<return>" . newline-and-indent))
  :config
  (setq js2-basic-offset 2))


;; rust
(use-package rust-mode
  :ensure t)



(use-package csv-mode
  :ensure t
  :config
  (defhydra hydra-csv (:color teal :hint nil)
    "csv"
    ("o" csv-align-fields "align")
    ("u" csv-unalign-fields "unalign")
    ("q" nil :color blue)))

(use-package json-mode
  :ensure t)

(use-package nginx-mode
  :ensure t)

(use-package protobuf-mode
  :ensure t)

(use-package toml-mode
  :ensure t)

(use-package yaml-mode
  :ensure t)


(provide 'conf-coding)
