;; -*- mode: Emacs-Lisp -*-
;; Time-stamp: <BigFang 2015-03-31 10:20:16>


;; load-path
(add-to-list 'load-path "~/.emacs.d/plugins")

(setq custom-file "~/.emacs.d/emacs-custom.el"
      bookmark-default-file "~/.emacs.d/.emacs.bmk"
      gnus-init-file "~/.emacs.d/site-lisp/.gnus.el"
      erc-startup-file-list '("~/.emacs.d/site-lisp/.ercrc.el"))
(fset 'yes-or-no-p 'y-or-n-p)

;; personal info
(setq user-full-name "BigFang"
      user-mail-address "bitair@gmail.com")

;; time-stamp
(add-hook 'write-file-hooks 'time-stamp)
(setq time-stamp-format "BigFang %04y-%02m-%02d %02H:%02M:%02S")

;; trailing whitespace
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; Marmalade repo
(require 'package)
(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/"))
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(package-initialize)

;; Color theme
(setq custom-theme-directory "~/.emacs.d/themes")
(load-theme 'wombat t)
(set-cursor-color "#FFDEAD")

;; Load Configure
(load custom-file)
(mapc 'load (directory-files "~/.emacs.d/config" t "el$"))

(setq default-frame-alist
      '(
        (width . 112) ; character
        (height . 38) ; lines
        ))
