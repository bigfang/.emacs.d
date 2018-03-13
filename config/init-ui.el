;; -*- mode: Emacs-Lisp -*-


(tool-bar-mode -1)
(scroll-bar-mode -1)


(setq custom-theme-directory "~/.emacs.d/themes")

;; (load-theme 'wombat t)
(use-package solarized-theme
  :ensure t
  :config
  (load-theme 'solarized-dark t)
  (set-cursor-color "#cd5c5c")
  (set-face-attribute 'region nil :background "#4682b4" :foreground "black")
  )

(set-frame-parameter nil 'alpha 95)


;; Load Configure

(when (file-exists-p custom-file)
  (load custom-file))


(provide 'init-ui)
;;; init-ui.el ends here
