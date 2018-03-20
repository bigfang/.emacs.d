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

(setq custom-theme-directory "~/.emacs.d/themes")
(use-package solarized-theme
  :disabled
  :ensure t
  :config
  (load-theme 'solarized-dark t))

(use-package doom-themes
  :ensure t
  :config
  (load-theme 'doom-spacegrey))


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


(provide 'init-look)
;;; init-look.el ends here
