;; -*- mode: Emacs-Lisp; lexical-binding: t; -*-*-


(use-package lsp-mode
  :ensure t
  :commands (lsp lsp-deferred)
  :config
  (setq lsp-auto-guess-root t
        lsp-keep-workspace-alive nil
        lsp-eldoc-enable-hover nil
        lsp-headerline-breadcrumb-enable nil
        lsp-signature-doc-lines 3
        lsp-file-watch-threshold 2048
        lsp-enable-symbol-highlighting t
        lsp-imenu-sort-methods '(position kind))
  :init
  (add-to-list 'exec-path "~/.elixir-ls"))


(use-package lsp-ui
  :ensure t
  :hook (lsp-mode . lsp-ui-mode)
  :bind (("C-;" . lsp-ui-imenu)
         :map lsp-ui-mode-map
         ([remap xref-find-definitions] . lsp-ui-peek-find-definitions)
         ([remap xref-find-references] . lsp-ui-peek-find-references)
         :map lsp-ui-imenu-mode-map
         ("SPC" . lsp-ui-imenu--kill)
         ("C-;" . lsp-ui-imenu--kill)
         ("TAB" . lsp-ui-imenu--next-kind)
         ("<backtab>" . lsp-ui-imenu--prev-kind)
         ("j" . next-line)
         ("k" . previous-line)
         ("M-n" . next-line)
         ("M-p" . previous-line))
  :config
  (with-eval-after-load 'evil-maps
    (evil-define-key 'motion lsp-ui-mode-map (kbd "gi") 'lsp-ui-peek-find-implementation)
    (evil-define-key 'motion lsp-ui-mode-map (kbd "gr") 'lsp-ui-peek-find-references)
    (evil-define-key 'motion lsp-ui-mode-map (kbd "gd") 'lsp-ui-peek-find-definitions))

  (setq lsp-ui-doc-enable nil
        lsp-ui-doc-use-webkit nil
        lsp-ui-doc-include-signature t
        lsp-ui-doc-position 'at-point
        lsp-ui-doc-header nil

        lsp-ui-sideline-enable t
        lsp-ui-sideline-ignore-duplicate t))


;; |------------+-----------------------------------------|
;; | Language   | Installation command                    |
;; |------------+-----------------------------------------|
;; | bash       | npm i -g bash-language-server           |
;; | Dockerfile | npm i -g dockerfile-langu               |
;; |------------+-----------------------------------------|
;; | heml       | npm i -D vscode-html-languageserver-bin |
;; | css        | npm i -D vscode-css-languageserver-bin  |
;; | ts/js      | npm i -D typescript-language-server     |
;; |------------+-----------------------------------------|
;; | python     | pip install 'python-lsp-server[all]'    |
;; |------------+-----------------------------------------|


(provide 'init-lsp)
