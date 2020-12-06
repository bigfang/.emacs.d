;; -*- mode: Emacs-Lisp; lexical-binding: t; -*-*-


;; === library ===
(use-package posframe
  :if (display-graphic-p)
  :ensure t)


;; === packages ===
(use-package deadgrep
  :ensure t
  :ensure-system-package (rg . ripgrep)
  :defer t
  :config
  (setq-default deadgrep--search-type 'regexp))


(use-package google-this
  :ensure t
  :config
  (google-this-mode 1))

(use-package google-translate
  :ensure t
  :bind ("M-o T" . google-translate-smooth-translate)
  :init
  (require 'google-translate-smooth-ui)
  :config
  ;; (setq url-gateway-method 'socks)
  ;; (setq socks-server '("Default server" "127.0.0.1" 1080 5))
  (setq google-translate-default-source-language "en"
        google-translate-default-target-language "zh-CN")
  (setq google-translate-translation-directions-alist
        '(("en" . "zh-CN") ("zh-CN" . "en") ("ja" . "zh-CN"))))


(use-package helpful
  :ensure t
  :bind ("<f1> ." . helpful-at-point)
        ("<f1> k" . helpful-key)
        ("<f1> f" . helpful-callable)
        ("<f1> v" . helpful-variable)
  :config
  (evil-define-key 'motion helpful-mode-map (kbd "n") 'forward-button)
  (evil-define-key 'motion helpful-mode-map (kbd "p") 'backward-button)

  (setq helpful-max-buffers 1))


(use-package highlight-indent-guides
  :ensure t
  :hook (prog-mode . highlight-indent-guides-mode)
  :config
  (if (display-graphic-p)
      (setq highlight-indent-guides-method 'bitmap)
    (setq highlight-indent-guides-method 'character))
  (setq highlight-indent-guides-responsive 'top
        highlight-indent-guides-delay 0.2)
  (setq highlight-indent-guides-auto-enabled nil)
  (set-face-background 'highlight-indent-guides-odd-face "DarkGrey")
  (set-face-background 'highlight-indent-guides-even-face "DimGrey")
  (set-face-foreground 'highlight-indent-guides-character-face "DimGrey")
  (set-face-foreground 'highlight-indent-guides-top-character-face "wheat4"))


;; or htmlfontify
(use-package htmlize
  :ensure t)


(use-package image+
  :ensure t
  :after image)


(use-package kurecolor
  :ensure t
  :bind (("M-o c" . hydra:kurecolor/body))
  :config
  (defhydra hydra:kurecolor (:color pink :hint  nil)
    "
Inc/Dec      _j_/_J_ brightness      _k_/_K_ saturation      _l_/_L_ hue
Set          _sj_ ^^ brightness      _sk_ ^^ saturation      _sl_ ^^ hue
Get          _gj_ ^^ brightness      _gk_ ^^ saturation      _gl_ ^^ hue
             _rh_ ^^ RGB → Hex       _hr_ ^^ Hex → RGB       _hR_ ^^ Hex → RGBA
"
    ("j"  kurecolor-decrease-brightness-by-step)
    ("J"  kurecolor-increase-brightness-by-step)
    ("k"  kurecolor-decrease-saturation-by-step)
    ("K"  kurecolor-increase-saturation-by-step)
    ("l"  kurecolor-decrease-hue-by-step)
    ("L"  kurecolor-increase-hue-by-step)
    ("sj" kurecolor-set-brightness :color blue)
    ("sk" kurecolor-set-saturation :color blue)
    ("sl" kurecolor-set-hue :color blue)
    ("gj" kurecolor-hex-val-group :color blue)
    ("gk" kurecolor-hex-sat-group :color blue)
    ("gl" kurecolor-hex-hue-group :color blue)
    ("rh" kurecolor-cssrgb-at-point-or-region-to-hex)
    ("hr" kurecolor-hexcolor-at-point-or-region-to-css-rgb)
    ("hR" kurecolor-hexcolor-at-point-or-region-to-css-rgba)
    ("q"  nil :color blue)))


(use-package move-text
  :ensure t
  :bind (("<C-S-up>" . move-text-up)
         ("<C-S-down>" . move-text-down)))


(use-package paradox
  :ensure t
  :defer t
  :after evil
  :config
  (paradox-enable)
  (evil-define-key 'motion paradox-menu-mode-map (kbd "I") 'evil-insert-state)
  (evil-define-key 'motion paradox-menu-mode-map (kbd "n") 'paradox-next-entry)
  (evil-define-key 'motion paradox-menu-mode-map (kbd "p") 'paradox-previous-entry)
  (evil-define-key 'motion paradox-menu-mode-map (kbd "q") 'paradox-quit-and-close)
  (evil-define-key 'motion paradox-menu-mode-map (kbd "j") 'paradox-next-entry)
  (evil-define-key 'motion paradox-menu-mode-map (kbd "k") 'paradox-previous-entry)
  (evil-define-key 'motion paradox-menu-mode-map (kbd "i") 'package-menu-mark-install)
  (evil-define-key 'motion paradox-menu-mode-map (kbd "d") 'package-menu-mark-delete)
  (evil-define-key 'motion paradox-menu-mode-map (kbd "x") 'paradox-menu-execute)
  (evil-define-key 'motion paradox-menu-mode-map (kbd "r") 'paradox-menu--refresh)
  (evil-define-key 'motion paradox-menu-mode-map (kbd "v") 'paradox-menu-visit-homepage)
  (evil-define-key 'motion paradox-menu-mode-map (kbd "u") 'package-menu-mark-unmark)
  (evil-define-key 'motion paradox-menu-mode-map (kbd "U") 'package-menu-mark-upgrades)
  (evil-define-key 'motion paradox-menu-mode-map (kbd "l") 'paradox-menu-view-commit-list)
  (evil-define-key 'motion paradox-menu-mode-map (kbd "f") 'hydra-paradox-filter/body)
  (setq paradox-execute-asynchronously t))


(use-package pdf-tools
  :if (display-graphic-p)
  :ensure t
  ;; :ensure-system-package (pkg-config automake poppler)
  :magic ("%PDF" . pdf-view-mode)
  :bind (:map pdf-view-mode-map
         ("." . hydra:pdftools/body)
         ("M-n" . pdf-view-next-line-or-next-page)
         ("M-p" . pdf-view-previous-line-or-previous-page))
  :config (pdf-tools-install))


(use-package pyim
  :ensure t
  :bind
  ("M-j" . pyim-convert-string-at-point) ;与 pyim-probe-dynamic-english 配合
  :config
  (setq default-input-method "pyim"
        pyim-default-scheme 'pyim-shuangpin)
  (setq pyim-fuzzy-pinyin-alist nil)
  (setq-default pyim-english-input-switch-functions
                '(pyim-probe-dynamic-english
                  ;; pyim-probe-isearch-mode
                  pyim-probe-program-mode
                  pyim-probe-org-structure-template))
  (setq-default pyim-punctuation-half-width-functions
                '(pyim-probe-punctuation-line-beginning
                  pyim-probe-punctuation-after-punctuation))
  (pyim-isearch-mode -1)
  (setq pyim-page-tooltip 'popup))

(use-package pyim-basedict
  :ensure nil
  :after pyim
  :config (pyim-basedict-enable))


(use-package rainbow-delimiters
  :if (display-graphic-p)
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


(use-package simple-httpd
  :load-path "site-lisp/simple-httpd"
  ;; :ensure t
  :defer t
  :config
  (setq httpd-port 7777))


(use-package symbol-overlay
  :ensure t
  :commands symbol-overlay-mode
  :bind (:map symbol-overlay-map
         ("h" . nil)
         ("?" . symbol-overlay-map-help)
         ("." . symbol-overlay-put)
         ("c" . symbol-overlay-count)
         ("M-q" . symbol-overlay-query-replace)
         ("X" . symbol-overlay-remove-all))
  :chords (".." . symbol-overlay-put)
  :hook (prog-mode . symbol-overlay-mode)
  :config
  (defhydra hydra:symbol-overlay (:color pink :hint nil
                                  :body-pre (when (thing-at-point 'symbol)
                                              (symbol-overlay-put)))
    "
    ^_p_^      _e_  echo         _._  highlight  _s_  isearch
  _<_   _>_    _d_  definition   _x_  remove     _M-q_  query-replace
    ^_n_^      _w_  save         _c_  count      _r_  rename
"
      ("." symbol-overlay-put)
      ("<" symbol-overlay-jump-first)
      (">" symbol-overlay-jump-last)
      ("p" symbol-overlay-jump-prev)
      ("n" symbol-overlay-jump-next)
      ("x" symbol-overlay-remove-all)
      ("d" symbol-overlay-jump-to-definition)
      ("c" symbol-overlay-count)

      ("e" symbol-overlay-echo-mark)
      ("t" symbol-overlay-toggle-in-scope)
      ("w" symbol-overlay-save-symbol)
      ("s" symbol-overlay-isearch-literally :color blue)
      ("M-q" symbol-overlay-query-replace :color blue)
      ("r" symbol-overlay-rename  :color blue)

      ("q" nil)))


(use-package visual-regexp
  :ensure t
  :bind ("M-o q" . vr/query-replace)
        ("M-o m" . vr/mc-mark))


(use-package which-key
  :ensure t
  :config
  (setq which-key-idle-delay 0.5)
  (which-key-mode))


(use-package zzz-to-char
  :ensure t
  :bind ("C-z" . zzz-to-char))



;; === beta zone ===
(use-package keyfreq
  :ensure t
  :config
  (keyfreq-mode 1)
  (keyfreq-autosave-mode 1))


(use-package rg
  :ensure t
  :defer t
  :ensure-system-package (rg . ripgrep))


;; --- prescient ---
(use-package prescient
  :ensure t
  :config (prescient-persist-mode))

(use-package company-prescient
  :ensure t
  :requires prescient
  :config
  (company-prescient-mode t))

(use-package ivy-prescient
  :ensure t
  :requires prescient
  :config
  (ivy-prescient-mode t))


;; --- emoji ---
(use-package emojify
  :ensure t
  :hook (after-init . global-emojify-mode))

(use-package company-emoji
  :ensure t
  :requires company
  :after company-lsp              ; fix company-backends order
  :config
  (add-to-list 'company-backends 'company-emoji))



;; === desabled ===
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


(provide 'init-elpa)
