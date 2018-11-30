;; -*- mode: Emacs-Lisp -*-


(use-package darkroom
  :ensure t
  :hook
  ((org-mode markdown-mode) . darkroom-mode)
  :config
  (setq darkroom-text-scale-increase 1))


(use-package fzf
  :ensure t
  :ensure-system-package fzf)


(use-package google-this
  :ensure t
  :config
  (google-this-mode 1))

(use-package google-translate
  :ensure t
  :bind ("C-c t" . google-translate-smooth-translate)
  :init
  (setq google-translate-default-source-language "en"
        google-translate-default-target-language "zh-CN")
  (setq google-translate-translation-directions-alist
        '(("en" . "zh-CN") ("zh-CN" . "en") ("ja" . "zh-CN")))
  :config
  ;; (setq url-gateway-method 'socks)
  ;; (setq socks-server '("Default server" "127.0.0.1" 1080 5))
  (require 'google-translate-smooth-ui))


(use-package image+
  :ensure t
  :after image)


(use-package highlight-indent-guides
  :ensure t
  :hook (prog-mode . highlight-indent-guides-mode)
  :config
  (setq highlight-indent-guides-method 'character)
  (setq highlight-indent-guides-responsive 'top
        highlight-indent-guides-delay 0.2)
  (setq highlight-indent-guides-auto-enabled nil)
  (set-face-background 'highlight-indent-guides-odd-face "DarkGrey")
  (set-face-background 'highlight-indent-guides-even-face "DimGrey")
  (set-face-foreground 'highlight-indent-guides-character-face "DimGrey")
  (set-face-foreground 'highlight-indent-guides-top-character-face "wheat4"))


(use-package highlight-symbol
  :ensure t
  :chords ("``" . highlight-symbol)
  :hook (prog-mode . highlight-symbol-mode)
  :config
  (setq highlight-symbol-idle-delay .5)
  :custom
  (highlight-symbol-colors
   '("yellow" "DeepPink" "cyan" "MediumPurple1" "SpringGreen1" "DarkOrange" "HotPink1" "RoyalBlue1" "OliveDrab"))
  (highlight-symbol-foreground-color "black"))


(use-package pdf-tools
  :ensure t
  ;; :ensure-system-package (pkg-config automake poppler)
  :magic ("%PDF" . pdf-view-mode)
  :bind (:map pdf-view-mode-map
         ("M-n" . pdf-view-next-line-or-next-page)
         ("M-p" . pdf-view-previous-line-or-previous-page))
  :config (pdf-tools-install))


(use-package pyim
  :ensure t
  :config
  (setq default-input-method "pyim"
        pyim-default-scheme 'pyim-shuangpin)
  (setq pyim-fuzzy-pinyin-alist nil)
  (pyim-isearch-mode -1))

(use-package pyim-basedict
  :ensure nil
  :config (pyim-basedict-enable))


(use-package rainbow-delimiters
  :ensure t
  :hook (prog-mode . rainbow-delimiters-mode)
  :custom-face
  (rainbow-delimiters-depth-1-face ((t (:foreground "dark orange"))))
  (rainbow-delimiters-depth-2-face ((t (:foreground "deep sky blue"))))
  (rainbow-delimiters-depth-3-face ((t (:foreground "MediumSeaGreen"))))
  (rainbow-delimiters-depth-4-face ((t (:foreground "goldenrod"))))
  (rainbow-delimiters-depth-5-face ((t (:foreground "orchid"))))
  (rainbow-delimiters-depth-6-face ((t (:foreground "chartreuse"))))
  (rainbow-delimiters-depth-7-face ((t (:foreground "sienna1"))))
  (rainbow-delimiters-depth-8-face ((t (:foreground "MediumPurple2"))))
  (rainbow-delimiters-depth-9-face ((t (:foreground "yellow")))))


(use-package rainbow-mode
  :ensure t
  :hook (prog-mode))


(use-package which-key
  :ensure t
  :config
  (setq which-key-idle-delay 1.0)
  (which-key-mode))



;; === beta zone ===

;; --- lsp ---
;; (require 'conf-lsp)


;; --- regexp ---
(use-package visual-regexp
  :ensure t)

(use-package visual-regexp-steroids
  :ensure t)

;; --- emoji ---
(use-package emojify
  :ensure t
  :hook (after-init . global-emojify-mode))

(use-package company-emoji
  :ensure t
  :requires company
  :config
  (add-to-list 'company-backends 'company-emoji))


;; --- web develop ---
(use-package emmet-mode
  :ensure t
  :hook (sgml-mode css-mode web-mode)
  :bind (:map emmet-mode-keymap
         ("C-j" . nil)
         ("<C-return>" . nil)
         ("<M-return>" . emmet-expand-line)
         ("M-j" . emmet-expand-line))
  :config
  (setq emmet-indentation 2
        emmet-preview-default nil))


(use-package vue-mode
  :ensure t)


(use-package web-mode
  :ensure t
  :config
  (setq web-mode-markup-indent-offset 2
        web-mode-css-indent-offset 2
        web-mode-code-indent-offset 2))



;; === desabled ===
;; or htmlfontify
(use-package htmlize
  :disabled
  :ensure t)


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
  (setq fci-rule-color "DimGray"))


(provide 'conf-elpa)
