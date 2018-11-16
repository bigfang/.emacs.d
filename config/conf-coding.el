;; -*- mode: Emacs-Lisp -*-


;; === coding ===
(use-package auto-yasnippet
  :ensure t
  :bind (("s-w" . aya-create)
         ("s-y" . aya-expand)))


(use-package flycheck
  :ensure t
  :pin melpa-stable
  :hook (elpy-mode . flycheck-mode)
  :config
  (defun my/toggle-flyc-window ()
    (interactive)
    (if (get-buffer-window "*Flycheck errors*" t)
        (with-selected-window
            (get-buffer-window "*Flycheck errors*" t)
          (delete-window))
      (flycheck-list-errors))))


(use-package projectile
  :ensure t
  :pin melpa-stable
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
(use-package elpy
  :ensure t
  :pin melpa-stable
  :bind (:map elpy-mode-map
         ;; ("<C-return>" . evil-open-blow)
         ("M-i" . elpy-company-backend)
         ("M-." . elpy-goto-definition)
         :map comint-mode-map
         ("M-p" . comint-previous-input)
         ("M-n" . comint-next-input))
  :init (elpy-enable)
  :config
  (evil-define-key 'normal elpy-mode-map (kbd "gd") 'elpy-goto-definition)
  (when (executable-find "ipython")
    (setq python-shell-interpreter "ipython"
          python-shell-interpreter-args "-i --simple-prompt"))
  (setq python-indent-offset 4)
  (setq elpy-rpc-backend "jedi")
  (remove-hook 'elpy-modules 'elpy-module-flymake))


;; elixir
(use-package elixir-mode
  :ensure t
  :hook
  (elixir-mode . (lambda () (add-hook 'before-save-hook 'elixir-format nil t))))

(use-package alchemist
  :ensure t
  :config
  (setq alchemist-key-command-prefix (kbd "C-c ."))
  (setq alchemist-mix-env "dev"))


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
;;; conf-coding.el ends here
