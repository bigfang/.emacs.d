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
  ("M-o P" . projectile-command-map)
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


;; === web develop ===
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


(provide 'init-coding)
