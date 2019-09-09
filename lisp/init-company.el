;; -*- mode: Emacs-Lisp; lexical-binding: t; -*-*-


(use-package company
  :ensure t
  :pin melpa
  :bind (("M-i" . company-indent-or-complete-common)
         ;; ("TAB" . indent-or-complete)
         :map company-active-map
         ("M-." . company-other-backend)
         ("DEL" . company-abort)
         ("<escape>" . company-abort)
         ("RET" . company-complete-selection)
         ("SPC" . my/abort-and-insert-space)
         ("TAB" . company-complete-common)
         ("C-n" . company-complete-common-or-cycle)
         ("C-p" . company-select-previous)
         ("M-i" . company-complete-common-or-cycle)
         ("M-o" . company-filter-candidates)
         :map company-search-map
         ("DEL" . company-search-abort)
         ("M-o" . company-search-toggle-filtering)
         ("M-i" . company-search-repeat-forward)
         ("M-j" . company-search-repeat-forward)
         ("M-k" . company-search-repeat-backward))
  :hook (after-init . global-company-mode)
  :init
  (defun my/abort-and-insert-space ()
    (interactive)
    (progn
      (company-abort)
      (insert " ")))
  :config
  (setq company-backends
        '((company-yasnippet
           company-capf
           company-files
           company-dabbrev-code
           company-keywords)
           (company-abbrev
            company-dabbrev)))
  (setq company-async-timeout 5
        company-tooltip-minimum 7
        company-tooltip-minimum-width 28
        company-minimum-prefix-length 2
        company-selection-wrap-around t
        company-tooltip-align-annotations t
        company-transformers '(company-sort-by-occurrence)
        company-show-numbers t))


(provide 'init-company)
