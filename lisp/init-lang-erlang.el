;; -*- mode: Emacs-Lisp; lexical-binding: t; -*-*-


;; erlang
(use-package erlang
  :ensure t
  :defer t)


;; elixir
(use-package elixir-mode
  :ensure t
  :defer t
  :after lsp-mode
  :interpreter "elixir"
  :hook
  (elixir-mode . lsp)
  :init
  (add-to-list 'exec-path "~/.emacs.d/var/elixir-ls/")
  :config
  (add-hook 'elixir-format-hook
            (lambda ()
              (if (projectile-project-p)
                  (setq elixir-format-arguments
                        (list "--dot-formatter"
                              (concat (locate-dominating-file buffer-file-name ".formatter.exs") ".formatter.exs")))
                (setq elixir-format-arguments nil)))))


;; (use-package alchemist
;;   :ensure t
;;   :defer t
;;   :hook (elixir-mode)
;;   :init
;;   (setq alchemist-key-command-prefix (kbd "M-g M-a"))
;;   :config
;;   (setq alchemist-mix-env "dev")
;;   (evil-define-key 'normal alchemist-mode-map (kbd "gd") 'alchemist-goto-definition-at-point)
;;   (evil-define-key 'normal alchemist-mode-map (kbd "gb") 'alchemist-goto-jump-back))


(provide 'init-lang-erlang)
