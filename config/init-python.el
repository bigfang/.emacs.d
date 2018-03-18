;; -*- mode: Emacs-Lisp -*-


(use-package python
  :ensure nil
  :config
  (add-to-list 'exec-path (concat (getenv "HOME") "/.emacs.d/.python-environments/jedi/bin"))
  (when (executable-find "ipython")
    (setq python-shell-interpreter "ipython"
          python-shell-interpreter-args "-i --simple-prompt"))
  (setq python-indent-offset 4))


(use-package elpy
  :ensure t
  :pin melpa-stable
  :bind (:map elpy-mode-map
         ("<C-return>" . vi-open-line-below)
         ("<C-S-return>" . vi-open-line-above)
         ("M-i" . elpy-company-backend)
         ("M-." . elpy-goto-definition-or-rgrep)
         )
  :init
  (elpy-enable)
  (defun elpy-goto-definition-or-rgrep ()
    "Go to the definition of the symbol at point, if found. Otherwise, run `elpy-rgrep-symbol'."
    (interactive)
    (ring-insert find-tag-marker-ring (point-marker))
    (condition-case nil (elpy-goto-definition)
      (error (elpy-rgrep-symbol
              (concat "\\(def\\|class\\)\s" (thing-at-point 'symbol) "(")))))
  :config
  (evil-define-key 'normal elpy-mode-map (kbd "gd") 'elpy-goto-definition-or-rgrep)
  (setq elpy-rpc-backend "jedi")
  (defalias 'workon 'pyvenv-workon)
  (remove-hook 'elpy-modules 'elpy-module-flymake))


(use-package company-jedi
  :ensure t
  :hook (python-mode . my/jedi-conf)
  :config
  (defun my/jedi-conf ()
    (setq jedi:environment-root "jedi"
          jedi:environment-virtualenv (list (expand-file-name "~/.emacs.d/.python-environments/"))
          jedi:complete-on-dot t
          jedi:use-shortcuts t)
    (add-to-list 'company-backends 'company-jedi)
    (jedi:setup)))


(provide 'init-python)
;; init-python.el ends here
