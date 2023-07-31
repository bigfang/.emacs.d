;; -*- mode: Emacs-Lisp; lexical-binding: t; -*-*-


(setq frame-title-format
      '("%b" "🌵"
        (:eval (if (buffer-file-name)
                   (abbreviate-file-name (buffer-file-name))
                 "%f"))))
(setq inhibit-startup-screen t)
(setq initial-scratch-message ";; (〜￣▽￣)〜〜(￣▽￣〜)\n\n")
(setq visible-bell nil)


(if (display-graphic-p)
    (progn
      (blink-cursor-mode -1))
  (progn
    (blink-cursor-mode t)
    (menu-bar-mode -1)
    (load-theme 'wombat t)))
(scroll-bar-mode -1)
(tool-bar-mode -1)
(global-hl-line-mode -1)
(global-display-line-numbers-mode -1)
(mouse-avoidance-mode 'animate)


;; === theme ===
(set-frame-parameter nil 'alpha 95)
(set-face-attribute 'default nil :font "Monaco 14")
(add-to-list 'default-frame-alist '(ns-transparent-titlebar . t))
;; (add-to-list 'default-frame-alist '(ns-appearance . dark))
;; (set-cursor-color "#cd5c5c")
;; (set-face-attribute 'region nil :background "#4682b4" :foreground "black")

(setq custom-theme-directory "~/.emacs.d/themes")
(use-package leuven-theme
  :if (display-graphic-p)
  :ensure t
  :config
  (load-theme 'leuven t))

(use-package doom-themes
  :if (display-graphic-p)
  :ensure t
  :init
  (setq doom-themes-enable-bold t
        doom-themes-enable-italic t)
  :config
  ;; (load-theme 'doom-spacegrey t)
  (doom-themes-visual-bell-config))



;; === modeline ===
(setq display-time-24hr-format t
      display-time-use-mail-icon t)
(display-time-mode -1)
;; (display-battery-mode t)
(column-number-mode t)
(size-indication-mode -1)

(set-face-attribute 'mode-line nil :box '(:line-width -1 :color "DimGrey") :slant 'italic)
(set-face-attribute 'mode-line-inactive nil :box '(:line-width -1 :color "grey30") :weight 'light)

(use-package minions
  :ensure t
  :config
  (setq minions-mode-line-lighter "⌘")
  (minions-mode 1))


;; Load custom file
(setq custom-file "~/.emacs.d/emacs-custom.el")
(when (file-exists-p custom-file)
  (load custom-file))


;; show paren
(use-package paren
  :config
  (set-face-background 'show-paren-match (face-background 'default))
  (set-face-foreground 'show-paren-match "yellow")
  (set-face-attribute 'show-paren-match nil :weight 'extra-bold)
  (show-paren-mode t))



;; === packages ===
(use-package all-the-icons
  :ensure t)

(use-package all-the-icons-dired
  :ensure t
  :requires all-the-icons
  :hook (dired-mode . all-the-icons-dired-mode))

(use-package all-the-icons-ibuffer
  :ensure t
  :requires all-the-icons
  :init (all-the-icons-ibuffer-mode 1))

(use-package all-the-icons-ivy
  :ensure t
  :requires all-the-icons
  :after (ivy all-the-icons)
  :config (all-the-icons-ivy-setup))

(use-package all-the-icons-ivy-rich
  :ensure t
  :requires all-the-icons
  :after (ivy-rich all-the-icons)
  :init (all-the-icons-ivy-rich-mode 1))


(use-package beacon
  :ensure t
  :bind ("M-o SPC" . beacon-blink)
  :config (beacon-mode t))


(use-package dimmer
  :disabled
  :if (display-graphic-p)
  :ensure t
  :config (dimmer-mode))


(provide 'init-look)
