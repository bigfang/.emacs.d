;; -*- mode: Emacs-Lisp -*-
;; Time-stamp: <2018-12-13 23:34:10>



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

(require 'conf-pkg)

(use-package conf-look)
(use-package conf-kbd)
(use-package conf-builtin)
(use-package conf-dired)
(use-package conf-ibuffer)
(use-package conf-org)

(use-package conf-evil)
(use-package conf-nav)
(use-package conf-editing)
(use-package conf-abo)
(use-package conf-coding)
(use-package conf-git)
(use-package conf-company)
(use-package conf-docker)
(use-package conf-elpa)


;; automatically garbage collect when switch away from emacs
(add-hook 'focus-out-hook 'garbage-collect)


;;; init.el ends here
