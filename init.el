;; -*- mode: Emacs-Lisp -*-
;; Time-stamp: <2018-02-18 14:29:23>


;; load-path
(add-to-list 'load-path "~/.emacs.d/site-lisp")

(setq custom-file "~/.emacs.d/emacs-custom.el"
      bookmark-default-file "~/.emacs.d/.emacs.bmk"
      gnus-init-file "~/.emacs.d/.gnus.el"
      erc-startup-file-list '("~/.emacs.d/.ercrc.el"))
(fset 'yes-or-no-p 'y-or-n-p)

;; time-stamp
(add-hook 'write-file-hooks 'time-stamp)
(setq time-stamp-format "%04y-%02m-%02d %02H:%02M:%02S")

;; trailing whitespace
(add-hook 'prog-mode-hook
          (lambda () (add-to-list 'write-file-functions 'delete-trailing-whitespace)))

;; Marmalade repo
(require 'package)
(add-to-list 'package-archives '("org" . "https://orgmode.org/elpa/"))
(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/"))
;; (add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/") t)
(package-initialize)

;; Color theme
(setq custom-theme-directory "~/.emacs.d/themes")
;; (load-theme 'wombat t)
(load-theme 'material t)
;; (set-cursor-color "#FFDEAD")
;; (set-face-attribute 'region nil :background "#666" :foreground "#fff")

;; Load Configure
(load custom-file)
(mapc 'load (directory-files "~/.emacs.d/config" t "^[^#]+\\.el$"))
