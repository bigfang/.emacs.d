;; -*- mode: Emacs-Lisp -*-


(setq frame-title-format "%b %z %p @ %m >_< %f")
(setq inhibit-startup-screen t)
(setq initial-scratch-message ";; (〜￣▽￣)〜〜(￣▽￣〜)\n\n")
(setq visible-bell nil)

(tool-bar-mode -1)
(scroll-bar-mode -1)
(blink-cursor-mode -1)
(global-hl-line-mode -1)
(global-linum-mode -1)
(mouse-avoidance-mode 'animate)


;; === theme ===
(set-frame-parameter nil 'alpha 95)
;; (set-cursor-color "#cd5c5c")
(set-face-attribute 'region nil :background "#4682b4" :foreground "black")
(set-face-attribute 'default nil :font "Monaco 13")

(setq custom-theme-directory "~/.emacs.d/themes")
(use-package solarized-theme
  :disabled
  :ensure t
  :config
  (load-theme 'solarized-dark t))

(use-package doom-themes
  :ensure t
  :init
  (setq doom-themes-enable-bold t
        doom-themes-enable-italic t)
  :config
  (load-theme 'doom-spacegrey t)
  (doom-themes-visual-bell-config))



;; === modeline ===
(setq display-time-24hr-format t
      display-time-use-mail-icon t)
(display-time-mode -1)
;; (display-battery-mode t)
(column-number-mode t)
(size-indication-mode -1)


(use-package minions
  :ensure t
  :config
  (setq minions-mode-line-lighter ">_<")
  (minions-mode 1))


;; Load custom file
(setq custom-file "~/.emacs.d/emacs-custom.el")
(when (file-exists-p custom-file)
  (load custom-file))


;; display-buffer
(add-to-list 'display-buffer-alist
             '("\\*.*\\*"
               (display-buffer-reuse-window
                display-buffer-below-selected)
               (split-window-sensibly)
               (window-height   . 0.2)
               (reusable-frames . visible)))


;; show paren
(use-package paren
  :ensure t
  :config
  (set-face-background 'show-paren-match (face-background 'default))
  (set-face-foreground 'show-paren-match "#def")
  (set-face-attribute 'show-paren-match nil :weight 'extra-bold)
  (show-paren-mode t))



;; === packages ===
(use-package all-the-icons
  :ensure t)

(use-package all-the-icons-dired
  :ensure t
  :hook (dired-mode . all-the-icons-dired-mode))


(use-package beacon
  :ensure t
  :config (beacon-mode t))


(use-package dimmer
  :ensure t
  :config
  (dimmer-mode))


(provide 'init-look)
;;; init-look.el ends here
