;; -*- mode: Emacs-Lisp -*-


(use-package evil-anzu
  :ensure t)

(use-package anzu
  :ensure t
  :bind
  (([remap query-replace] . anzu-query-replace)
   ([remap query-replace-regexp] . anzu-query-replace-regexp))
  :config
  (global-anzu-mode 1))


(use-package google-translate
  :ensure t
  :bind (("C-c t" . google-translate-at-point)
         ("C-c T" . google-translate-smooth-translate))
  :config
  ;; (setq url-gateway-method 'socks)
  ;; (setq socks-server '("Default server" "127.0.0.1" 1080 5))
  (require 'google-translate-smooth-ui)
  (setq google-translate-default-source-language "en"
        google-translate-default-target-language "zh-CN")
  (setq google-translate-translation-directions-alist
      '(("en" . "zh-CN") ("zh-CN" . "en"))))


(use-package treemacs
  :ensure t
  :bind ("M-0" . treemacs-select-window)
  :config (setq treemacs-never-persist t))

(use-package treemacs-evil
  :ensure t)

(use-package treemacs-projectile
  :ensure t
  :config
  (setq treemacs-header-function #'treemacs-projectile-create-header))


(use-package pyim
  :ensure t
  :config
  (setq default-input-method "pyim")
  (setq pyim-default-scheme 'pyim-shuangpin)
  (pyim-isearch-mode -1))

(use-package pyim-basedict
  :ensure
  :config (pyim-basedict-enable))


(use-package imenu-anywhere
  :ensure t)


(use-package emojify
  :ensure t
  :config
  (add-hook 'after-init-hook #'global-emojify-mode))

(use-package company-emoji
  :ensure t
  :config
  (add-to-list 'company-backends 'company-emoji))


(use-package emmet-mode
  :ensure nil
  :hook (sgml-mode css-mode web-mode)
  :bind (:map emmet-mode-keymap
         ("C-j" . nil)
         ("<C-return>" . nil)
         ("<M-return>" . emmet-expand-line)
         ("M-j" . emmet-expand-line)
         )
  :config
  (setq emmet-indentation 2
        emmet-preview-default nil))


(use-package fill-column-indicator
  :disabled
  :ensure t
  :init
  ;;; code sinppet from spacemacs
  (defvar-local company-fci-mode-on-p nil)

  (defun company-turn-off-fci (&rest ignore)
    (when (boundp 'fci-mode)
      (setq company-fci-mode-on-p fci-mode)
      (when fci-mode (fci-mode -1))))

  (defun company-maybe-turn-on-fci (&rest ignore)
    (when company-fci-mode-on-p (fci-mode 1)))

  (add-hook 'company-completion-started-hook 'company-turn-off-fci)
  (add-hook 'company-completion-finished-hook 'company-maybe-turn-on-fci)
  (add-hook 'company-completion-cancelled-hook 'company-maybe-turn-on-fci)
  :hook (prog-mode . fci-mode)
  :config
  (setq fci-rule-width 1)
  (setq fci-rule-color "DimGray")
  )


;; or htmlfontify
(use-package htmlize
  :disabled
  :ensure t)


;; ===  build-in  packages  ===



;; ===  lsp  ===
;; (require 'init-lsp)


(provide 'init-plugins)
;;; init-plugins.el ends here
