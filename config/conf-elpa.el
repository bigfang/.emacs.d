;; -*- mode: Emacs-Lisp -*-


;; === library ===
(use-package posframe
  :ensure t)


;; === packages ===
(use-package deadgrep
  :ensure t
  :config
  (setq-default deadgrep--search-type 'regexp))


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


(use-package helpful
  :ensure t
  :bind
  ("<f1> ." . helpful-at-point)
  ("<f1> k" . helpful-key)
  ("<f1> f" . helpful-callable)
  ("<f1> v" . helpful-variable))


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
  :custom
  (highlight-symbol-colors
   '("yellow" "DeepPink" "cyan" "MediumPurple1" "SpringGreen1" "DarkOrange" "HotPink1" "RoyalBlue1" "OliveDrab"))
  (highlight-symbol-foreground-color "black")
  :config
  (setq highlight-symbol-idle-delay .5)

  (defhydra hydra-highlight (:body-pre (highlight-symbol-mode 1)
                             :color pink :hint nil :columns 3)
    "Highlight"
    ("SPC" highlight-symbol "highlight")
    ("p" highlight-symbol-prev "previous")
    ("n" highlight-symbol-next "next")
    ("c" highlight-symbol-count "count")
    ("o" highlight-symbol-occur "occur" :color blue)
    ("a" highlight-symbol-list-all "list")
    ("x" highlight-symbol-remove-all "remove all")
    ("q" nil :color blue)))


;; or htmlfontify
(use-package htmlize
  :ensure t)


(use-package image+
  :ensure t
  :after image)


(use-package pdf-tools
  :ensure t
  ;; :ensure-system-package (pkg-config automake poppler)
  :magic ("%PDF" . pdf-view-mode)
  :bind (:map pdf-view-mode-map
         ("." . hydra-pdftools/body)
         ("M-n" . pdf-view-next-line-or-next-page)
         ("M-p" . pdf-view-previous-line-or-previous-page))
  :config (pdf-tools-install)

  (defhydra hydra-pdftools (:color blue :hint nil)
    "
                                                                      ╭───────────┐
       Move  History   Scale/Fit     Annotations  Search/Link    Do   │ PDF Tools │
   ╭──────────────────────────────────────────────────────────────────┴───────────╯
         ^^_g_^^      _B_    ^↧^    _+_    ^ ^     [_al_] list    [_s_] search    [_u_] revert buffer
         ^^^↑^^^      ^↑^    _H_    ^↑^  ↦ _W_ ↤   [_am_] markup  [_o_] outline   [_i_] info
         ^^_p_^^      ^ ^    ^↥^    _0_    ^ ^     [_at_] text    [_F_] link      [_d_] dark mode
         ^^^↑^^^      ^↓^  ╭─^─^─┐  ^↓^  ╭─^ ^─┐   [_ad_] delete  [_f_] search link
    _h_ ←pag_e_→ _l_  _N_  │ _P_ │  _-_    _b_     [_aa_] dired
         ^^^↓^^^      ^ ^  ╰─^─^─╯  ^ ^  ╰─^ ^─╯   [_y_]  yank
         ^^_n_^^      ^ ^  _r_eset slice box
         ^^^↓^^^
         ^^_G_^^
   --------------------------------------------------------------------------------
        "
    ("al" pdf-annot-list-annotations)
    ("ad" pdf-annot-delete)
    ("aa" pdf-annot-attachment-dired)
    ("am" pdf-annot-add-markup-annotation)
    ("at" pdf-annot-add-text-annotation)
    ("y"  pdf-view-kill-ring-save)
    ("+" pdf-view-enlarge :color red)
    ("-" pdf-view-shrink :color red)
    ("0" pdf-view-scale-reset)
    ("H" pdf-view-fit-height-to-window)
    ("W" pdf-view-fit-width-to-window)
    ("P" pdf-view-fit-page-to-window)
    ("n" pdf-view-next-page-command :color red)
    ("p" pdf-view-previous-page-command :color red)
    ("d" pdf-view-dark-minor-mode)
    ("b" pdf-view-set-slice-from-bounding-box)
    ("r" pdf-view-reset-slice)
    ("g" pdf-view-first-page)
    ("G" pdf-view-last-page)
    ("e" pdf-view-goto-page)
    ("o" pdf-outline)
    ("s" pdf-occur)
    ("i" pdf-misc-display-metadata)
    ("u" pdf-view-revert-buffer)
    ("F" pdf-links-action-perfom)
    ("f" pdf-links-isearch-link)
    ("B" pdf-history-backward :color red)
    ("N" pdf-history-forward :color red)
    ("l" image-forward-hscroll :color red)
    ("h" image-backward-hscroll :color red)
    ("q" nil "quit")))


(use-package pyim
  :ensure t
  :bind
  ("M-j" . pyim-convert-code-at-point) ;与 pyim-probe-dynamic-english 配合
  :config
  (setq default-input-method "pyim"
        pyim-default-scheme 'pyim-shuangpin)
  (setq pyim-fuzzy-pinyin-alist nil)
  (setq-default pyim-english-input-switch-functions
                '(pyim-probe-dynamic-english
                  pyim-probe-isearch-mode
                  pyim-probe-program-mode
                  pyim-probe-org-structure-template))
  (setq-default pyim-punctuation-half-width-functions
                '(pyim-probe-punctuation-line-beginning
                  pyim-probe-punctuation-after-punctuation))
  (pyim-isearch-mode -1)
  (setq pyim-page-tooltip 'posframe))

(use-package pyim-basedict
  :ensure nil
  :after pyim
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
  (setq which-key-idle-delay 0.5)
  (which-key-mode))



;; === beta zone ===

;; --- lsp ---
;; (require 'conf-lsp)


;; --- kurecolor ---
(use-package kurecolor
  :ensure t
  :config
  (progn
    (defhydra hydra-kurecolor (:color pink :hint  nil)
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
      ("rh" kurecolor-cssrgb-at-point-or-region-to-hex :color blue)
      ("hr" kurecolor-hexcolor-at-point-or-region-to-css-rgb :color blue)
      ("hR" kurecolor-hexcolor-at-point-or-region-to-css-rgba :color blue)
      ("q"  nil :color blue))))


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
(use-package ivy-posframe
  :disabled
  :ensure t
  :config
  (push '(counsel-M-x . ivy-posframe-display-at-window-bottom-left) ivy-display-functions-alist)
  (push '(t . ivy-posframe-display-at-point) ivy-display-functions-alist)
  (ivy-posframe-enable))


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
