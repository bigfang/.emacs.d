;; -*- mode: Emacs-Lisp -*-
;; Time-stamp: <2018-03-11 15:46:37>



;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)


;; (setq *emacs-load-start* (current-time))
(fset 'yes-or-no-p 'y-or-n-p)
(setq confirm-kill-emacs #'y-or-n-p)

(setq custom-file "~/.emacs.d/emacs-custom.el"
      bookmark-default-file "~/.emacs.d/.emacs.bmk"
      gnus-init-file "~/.emacs.d/.gnus.el"
      erc-startup-file-list '("~/.emacs.d/.ercrc.el"))


(add-to-list 'load-path "~/.emacs.d/config")

(require 'init-pkg)
(require 'init-basic)
(require 'init-ui)
(require 'init-kbd)
(require 'init-modeline)
(require 'init-ibuffer)
(require 'init-buildin)

(require 'init-evil)
(require 'init-editing)
(require 'init-ivy)
(require 'init-company)
(require 'init-git)
(require 'init-python)
(require 'init-lang)
(require 'init-elpa)

(require 'init-plugins)
(require 'init-utils)

(require 'init-alpha)


;; Load Configure
(load custom-file)
