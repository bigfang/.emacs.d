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
  (setq-default flycheck-disabled-checkers '(emacs-lisp-checkdoc)))


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
  (unbind-key "M-r" anaconda-mode-map)
  (when (executable-find "ipython")
    (setq python-shell-interpreter "ipython"
          python-shell-interpreter-args "-i --simple-prompt"))
  (evil-define-key 'normal anaconda-mode-map (kbd "ga") 'anaconda-mode-find-assignments)
  (evil-define-key 'normal anaconda-mode-map (kbd "gr") 'anaconda-mode-find-references)
  (evil-define-key 'normal anaconda-mode-map (kbd "gd") 'anaconda-mode-find-definitions))

(use-package company-anaconda
  :ensure t
  :after company anaconda-mode
  :config
  (add-to-list 'company-backends '(company-anaconda :with company-capf)))


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



(use-package csv-mode
  :ensure t)

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
