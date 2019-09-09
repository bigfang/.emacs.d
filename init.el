;; -*- mode: Emacs-Lisp; lexical-binding: t; -*-*-
;; Time-stamp: <2019-09-09 12:01:31>



(fset 'yes-or-no-p 'y-or-n-p)
;; (setq confirm-kill-emacs #'y-or-n-p)

;; Quit Emacs
(defalias 'exit 'save-buffers-kill-terminal)
(global-unset-key (kbd "C-x C-c"))

(set-default-coding-systems 'utf-8)
(prefer-coding-system 'utf-8)

(setq user-full-name "bigfang"
      user-mail-address (concat "bitair" "@" "gmail.com"))

(setq enable-recursive-minibuffers t)
(setq gnus-init-file "~/.emacs.d/.gnus.el"
      erc-startup-file-list '("~/.emacs.d/.ercrc.el"))


(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))
(add-to-list 'load-path (expand-file-name "hydras" user-emacs-directory))


(require 'init-pkg)

(use-package init-look)
(use-package init-kbd)
(use-package init-builtin)
(use-package init-dired)
(use-package init-ibuffer)
(use-package init-org)
(use-package init-hooks)

(use-package init-evil)
(use-package init-abo)
(use-package init-selected)
(use-package init-nav)
(use-package init-editing)
(use-package init-coding)
(use-package init-git)
(use-package init-company)
(use-package init-lsp)
(use-package init-shackle)
(use-package init-docker)
(use-package init-elpa)


;; automatically garbage collect when switch away from emacs
(add-hook 'focus-out-hook 'garbage-collect)


;;; init.el ends here
