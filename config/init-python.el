;; -*- mode: Emacs-Lisp -*-


(use-package python
  :ensure nil
  :hook (python-mode . my/python-mode-conf)
  :config
  (defun my/python-mode-conf ()
    (setenv "IPY_TEST_SIMPLE_PROMPT" "1")
    (setq python-indent-offset 4
          indent-tabs-mode nil
          ;; TODO 设置 run-python 的参数
          python-shell-exec-path "~/.emacs.d/.python-environments/jedi/bin"
          python-shell-virtualenv-root "~/.emacs.d/.python-environments/jedi"
          python-shell-interpreter "ipython"
          python-shell-interpreter-args "-i --simple-prompt")
    )
  )


(use-package jedi
  :ensure t
  :pin melpa-stable
  :hook (python-mode . my/jedi-conf)
  :config
  (defun my/jedi-conf ()
    (setq jedi:environment-root "jedi"
          jedi:complete-on-dot t
          jedi:use-shortcuts t)
    (add-to-list 'exec-path (concat (getenv "HOME") "/.emacs.d/.python-environments/jedi/bin"))
    (add-to-list 'company-backends 'company-jedi)
    'jedi:setup)
  )


(use-package elpy
  :ensure t
  :pin melpa-stable
  :bind (:map elpy-mode-map
         ("<C-return>" . vi-open-line-below)
         ("<C-S-return>" . vi-open-line-above)
         ("M-i" . elpy-company-backend)
         ("M-." . elpy-goto-definition)
         )
  :hook ((elpy-mode . flycheck-mode)
         (elpy-mode . (lambda() (local-unset-key (kbd "<M-tab>")))))
  :config
  (elpy-enable)
  (defalias 'workon 'pyvenv-workon)
  (remove-hook 'elpy-modules 'elpy-module-flymake)
  )


(provide 'init-python)
;; init-python.el ends here
