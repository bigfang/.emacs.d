;; -*- mode: Emacs-Lisp -*-


(use-package company
  :ensure t
  :pin melpa-stable
  :bind (("M-i" . company-indent-or-complete-common)
         ;; ("TAB" . indent-or-complete)
         :map company-active-map
         ("<return>" . company-complete-selection)
         ("RET" . company-complete-selection)
         ("<space>" . my/abort-and-insert-space)
         ("SPC" . my/abort-and-insert-space)
         ("<tab>" . company-complete-selection)
         ("TAB" . company-complete-selection)
         ("<backtab>" . company-select-previous)
         ("S-TAB" . company-select-previous)
         ("C-n" . company-complete-common-or-cycle)
         ("C-p" . company-select-previous)
         ("M-i" . company-search-candidates)
         ("M-o" . company-filter-candidates)
         :map company-search-map
         ("DEL" . company-search-abort)
         ("<backspace>" . company-search-abort)
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
  ;; (add-to-list 'company-backends 'company-yasnippet t)
  (setq company-backends
        '(company-semantic
          company-clang
          company-files
          (company-capf
           company-keywords
           company-dabbrev-code)
          company-dabbrev))
  (setq company-tooltip-minimum 7
        company-minimum-prefix-length 3
        company-selection-wrap-around t
        company-tooltip-align-annotations t
        company-transformers '(company-sort-by-occurrence)
        company-show-numbers t))


(use-package company-box
  :ensure t
  :init (setq company-box-icons-alist 'company-box-icons-all-the-icons)
  :hook (company-mode . company-box-mode))


(use-package company-posframe
  :disabled
  :requires (company posframe)
  :ensure t
  :config
  (company-posframe-mode 1))


(use-package company-quickhelp
  :disabled
  :if window-system
  :requires company
  :ensure t
  :bind (:map company-active-map
         ("M-/" . company-quickhelp-manual-begin))
  :config
  (setq company-quickhelp-delay 2
        company-quickhelp-use-propertized-text t)
  (company-quickhelp-mode))


(use-package company-prescient
  :ensure t
  :config (prescient-persist-mode +1))


(provide 'conf-company)
