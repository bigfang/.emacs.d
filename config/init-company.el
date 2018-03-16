;; -*- mode: Emacs-Lisp -*-


(use-package company
  :ensure t
  :pin melpa-stable
  :bind (("M-i" . indent-or-complete)
         ;; ("TAB" . indent-or-complete)
         :map company-active-map
         ("<return>" . company-abort)
         ("RET" . company-abort)
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
        company-transformers '(company-sort-by-occurrence)
        company-show-numbers t)
  )


(use-package company-quickhelp
  ;; :if (not (eq window-system nil))
  :ensure t
  :config
  (company-quickhelp-mode)
  (eval-after-load 'company
    '(define-key company-active-map (kbd "C-c h") #'company-quickhelp-manual-begin)))


(provide 'init-company)
;;; init-company.el ends here
