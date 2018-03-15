;; -*- mode: Emacs-Lisp -*-
;; Time-stamp: <2018-03-15 09:32:33>



;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)



(fset 'yes-or-no-p 'y-or-n-p)
(setq confirm-kill-emacs #'y-or-n-p)

;; Quit Emacs
(defalias 'exit 'save-buffers-kill-terminal)
(global-unset-key (kbd "C-x C-c"))


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


;;; init.el ends here
