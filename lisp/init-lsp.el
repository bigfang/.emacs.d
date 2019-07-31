;; -*- mode: Emacs-Lisp -*-


(use-package lsp-mode
  :ensure t
  :hook (prog-mode . lsp-deferred)
  :commands (lsp lsp-deferred)
  :config
  (setq lsp-auto-guess-root t
        lsp-prefer-flymake nil
        lsp-enable-symbol-highlighting nil
        lsp-imenu-sort-methods '(position kind)))


(use-package lsp-ui
  :ensure t
  :hook (lsp-mode . lsp-ui-mode)
  :bind (("C-;" . lsp-ui-imenu)
         :map lsp-ui-imenu-mode-map
         ("SPC" . hydra:leader/body)
         ("C-;" . lsp-ui-imenu--kill)
         ("TAB" . lsp-ui-imenu--next-kind)
         ("<backtab>" . lsp-ui-imenu--prev-kind)
         ("j" . next-line)
         ("k" . previous-line)
         ("M-n" . next-line)
         ("M-p" . previous-line))
  :config
  (setq lsp-ui-doc-enable t
        lsp-ui-doc-use-webkit nil
        lsp-ui-doc-include-signature t
        lsp-ui-doc-position 'at-point
        lsp-ui-doc-header nil

        lsp-ui-flycheck-enable t

        lsp-ui-sideline-enable t
        lsp-ui-sideline-ignore-duplicate t)
  (evil-define-key 'normal lsp-ui-mode-map (kbd "ga") 'lsp-ui-peek-find-implementation)
  (evil-define-key 'normal lsp-ui-mode-map (kbd "gr") 'lsp-ui-peek-find-references)
  (evil-define-key 'normal lsp-ui-mode-map (kbd "gd") 'lsp-ui-peek-find-definitions))


;; |------------+-----------------------------------------|
;; | Language   | Installation command                    |
;; |------------+-----------------------------------------|
;; | bash       | npm i -g bash-language-server           |
;; | Dockerfile | npm i -g dockerfile-langu               |
;; |------------+-----------------------------------------|
;; | heml       | npm i -D vscode-html-languageserver-bin |
;; | css        | npm i -D vscode-css-languageserver-bin  |
;; | ts/js      | npm i -D typescript-language-server     |
;; | vue        | npm i -D vue-language-server            |
;; |------------+-----------------------------------------|


(use-package company-lsp
  :ensure t
  :config
  (add-to-list 'company-backends 'company-lsp))


;; python
(use-package lsp-python-ms
  :ensure t
  :hook (python-mode . (lambda ()
                          (require 'lsp-python-ms)
                          (lsp-deferred)))
  :config
  (when (executable-find "ipython")
    (setq python-shell-interpreter "ipython"
          python-shell-interpreter-args "-i --simple-prompt")))


(provide 'init-lsp)
