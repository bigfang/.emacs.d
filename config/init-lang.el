;; -*- mode: Emacs-Lisp -*-


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

(use-package json-reformat
  :ensure nil
  :bind (:map json-mode-map
         ("C-c C-f" . json-reformat-region)))


(provide 'init-lang)
;;; init-lang.el ends here
