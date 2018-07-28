;; -*- mode: Emacs-Lisp -*-
;; Time-stamp: <2018-07-25 21:24:22>



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

(use-package init-look)
(use-package init-kbd)
(use-package init-builtin)
(use-package init-ibuffer)
(use-package init-org)

(use-package init-editing)
(use-package init-evil)
(use-package init-ivy)
(use-package init-company)
(use-package init-git)
(use-package init-lang)
(use-package init-elpa)

(use-package init-plugins)
(use-package init-utils)


;; automatically garbage collect when switch away from emacs
(add-hook 'focus-out-hook 'garbage-collect)


;;; init.el ends here
