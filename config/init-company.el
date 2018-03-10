;; -*- mode: Emacs-Lisp -*-


(use-package company
  :ensure t
  :pin melpa-stable
  :bind (
         ("M-i" . indent-or-complete)
         ;; ("TAB" . indent-or-complete)
         :map company-active-map
         ("<return>" . company-abort)
         ("RET" . company-abort)
         ("<space>" . company-abort)
         ("SPC" . company-abort)
         ("M-i" . company-complete-common-or-cycle)
         ("C-n" . company-complete-common-or-cycle)
         ("C-p" . company-select-previous)
         ("<tab>" . company-complete-selection)
         ("TAB" . company-complete-selection)
         ("<backtab>" . company-select-previous)
         ("S-TAB" . company-select-previous)
         )
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
  :config
  (add-to-list 'company-backends 'company-yasnippet t)
  (setq company-tooltip-minimum 7
        company-minimum-prefix-length 3
        company-selection-wrap-around t
        company-transformers '(company-sort-by-occurrence)
        company-show-numbers t)
  :custom-face
  (company-preview
   ((t (:foreground "darkgray" :underline t))))
  (company-preview-common
   ((t (:inherit company-preview))))
  (company-tooltip
   ((t (:background "lightgray" :foreground "black"))))
  (company-tooltip-selection
   ((t (:background "steelblue" :foreground "white"))))
  (company-tooltip-common
   ((((type x)) (:inherit company-tooltip :weight bold))
    (t (:inherit company-tooltip))))
  (company-tooltip-common-selection
   ((((type x)) (:inherit company-tooltip-selection :weight bold))
    (t (:inherit company-tooltip-selection))))
  )


(use-package company-quickhelp
  :if (not (eq window-system nil))
  :ensure t
  :config
  (company-quickhelp-mode))


(use-package company-jedi
  :ensure t
  :requires jedi)


(provide 'init-company)
;;; init-company.el ends here
