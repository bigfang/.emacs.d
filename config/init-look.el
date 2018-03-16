;; -*- mode: Emacs-Lisp -*-


(tool-bar-mode -1)
(scroll-bar-mode -1)


;; === theme ===
(setq custom-theme-directory "~/.emacs.d/themes")

(use-package solarized-theme
  :ensure t
  :config
  (load-theme 'solarized-dark t)
  (set-cursor-color "#cd5c5c")
  (set-face-attribute 'region nil :background "#4682b4" :foreground "black")
  )

(set-frame-parameter nil 'alpha 95)


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
  (minions-mode 1)
  (setq minions-mode-line-lighter ">_<"))


;; Load custom file
(when (file-exists-p custom-file)
  (load custom-file))


(provide 'init-look)
;;; init-look.el ends here
