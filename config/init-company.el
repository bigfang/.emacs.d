;; -*- mode: Emacs-Lisp -*-


(use-package company
  :ensure t
  :pin melpa-stable
  :bind (("M-i" . indent-or-complete)
         ;; ("TAB" . indent-or-complete)
         :map company-active-map
         ("<return>" . company-complete-selection)
         ("RET" . company-complete-selection)
         ("<space>" . my/abort-and-insert-space)
         ("SPC" . my/abort-and-insert-space)
         ("M-i" . company-complete-common-or-cycle)
         ("C-n" . company-complete-common-or-cycle)
         ("C-p" . company-select-previous)
         ("<tab>" . company-complete-selection)
         ("TAB" . company-complete-selection)
         ("<backtab>" . company-select-previous)
         ("S-TAB" . company-select-previous))
  :hook (after-init . global-company-mode)
  :init
  (defun indent-or-complete ()
    (interactive)
    (if (looking-at "\\_>")
        (company-complete-common)
      (indent-according-to-mode)))

  (defun complete-or-indent ()
    (interactive)
    (if (company-manual-begin)
        (company-complete-common)
      (indent-according-to-mode)))

  (defun my/abort-and-insert-space ()
    (interactive)
    (progn
      (company-abort)
      (insert " ")))
  :config
  (add-to-list 'company-backends 'company-yasnippet t)
  (setq company-tooltip-minimum 7
        company-minimum-prefix-length 3
        company-selection-wrap-around t
        company-tooltip-align-annotations t
        company-transformers '(company-sort-by-occurrence)
        company-show-numbers t))


(use-package company-quickhelp
  :disabled
  :if window-system
  :ensure t
  :config
  (setq company-quickhelp-delay .3
        company-quickhelp-use-propertized-text t)
  (eval-after-load 'company
    '(define-key company-active-map (kbd "C-c h") #'company-quickhelp-manual-begin))
  (company-quickhelp-mode))


(use-package company-statistics
  :ensure t
  :config (company-statistics-mode 1))


(provide 'init-company)
;;; init-company.el ends here
