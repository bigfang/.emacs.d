;; -*- mode: Emacs-Lisp; lexical-binding: t; -*-*-
;; Time-stamp: <2023-07-31 09:04:45>


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
(add-to-list 'load-path (expand-file-name "lisp/lang" user-emacs-directory))
(add-to-list 'load-path (expand-file-name "hydras" user-emacs-directory))

(defvar deps-base '(init-look
                    init-kbd
                    init-builtin
                    init-dired
                    init-ibuffer
                    init-org
                    init-hooks))

(defvar deps-main '(init-evil
                    init-abo
                    init-selected
                    init-nav
                    init-editing
                    init-coding
                    init-git
                    init-company
                    init-lsp
                    init-docker
                    init-shackle))

(defvar deps-lang '(init-confs
                    init-clojure
                    init-css
                    init-csv
                    init-erlang
                    init-go
                    init-graphql
                    init-haskell
                    init-javascript
                    init-json
                    init-kotlin
                    init-markdown
                    init-prisma
                    init-python
                    init-racket
                    init-rust))

(defvar deps-elpa '(init-elpa))

(require 'init-pkg)
(mapc #'require deps-base)
(mapc #'require deps-main)
(mapc #'require deps-lang)
(mapc #'require deps-elpa)


;; automatically garbage collect when switch away from emacs
(add-hook 'focus-out-hook 'garbage-collect)


;;; init.el ends here
