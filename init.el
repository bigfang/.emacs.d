;; -*- mode: Emacs-Lisp -*-
;; Time-stamp: <2018-03-05 17:20:35>


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

;; elpa repos
(require 'package)
(add-to-list 'package-archives '("org" . "https://orgmode.org/elpa/"))
(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/"))
;; (add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
;; (add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/") t)
(package-initialize)
(when (memq window-system '(mac ns x))
  (exec-path-from-shell-initialize))

;; Color theme
(setq custom-theme-directory "~/.emacs.d/themes")
;; (load-theme 'wombat t)
(load-theme 'solarized-dark t)
(set-cursor-color "#cd5c5c")
(set-face-attribute 'region nil :background "#4682b4" :foreground "black")


;; Windows
(when (eq system-type 'windows-nt)
  (setq w32-pass-lwindow-to-system nil
        w32-pass-rwindow-to-system nil
        w32-lwindow-modifier 'super
        w32-rwindow-modifier 'super
        w32-pass-apps-to-system nil
        w32-apps-modifier 'hyper))

;; Mac OS X
(when (eq system-type 'darwin)
  ;; (push "/usr/local/bin" exec-path)
  (setq mac-command-modifier 'meta
        mac-control-modifier 'control
        mac-option-modifier 'super
        ns-function-modifier 'hyper))

;; Terminal
(when (eq window-system nil)
  (load-theme 'wombat t)
  (menu-bar-mode -1))

;; Load Configure
(load custom-file)
(mapc 'load (directory-files "~/.emacs.d/config" t "^[^#]+\\.el$"))
