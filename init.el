;; -*- mode: Emacs-Lisp -*-
;; Time-stamp: <2018-03-19 09:59:11>



;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)



(fset 'yes-or-no-p 'y-or-n-p)
;; (setq confirm-kill-emacs #'y-or-n-p)

;; Quit Emacs
(defalias 'exit 'save-buffers-kill-terminal)
(global-unset-key (kbd "C-x C-c"))

(set-default-coding-systems 'utf-8)
(prefer-coding-system 'utf-8)

(setq enable-recursive-minibuffers t)
(setq bookmark-default-file "~/.emacs.d/.emacs.bmk"
      gnus-init-file "~/.emacs.d/.gnus.el"
      erc-startup-file-list '("~/.emacs.d/.ercrc.el"))


(add-to-list 'load-path "~/.emacs.d/config")

(require 'init-pkg)
(require 'init-look)
(require 'init-kbd)
(require 'init-ibuffer)
(require 'init-buildin)

(require 'init-editing)
(require 'init-evil)
(require 'init-ivy)
(require 'init-company)
(require 'init-git)
(require 'init-python)
(require 'init-lang)
(require 'init-elpa)

(require 'init-plugins)
(require 'init-utils)


;; automatically garbage collect when switch away from emacs
(add-hook 'focus-out-hook 'garbage-collect)


;;; init.el ends here
