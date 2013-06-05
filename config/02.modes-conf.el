;; -*- mode: Emacs-Lisp -*-

;; Time-stamp: <BigFang 2013-06-05 10:21:54>

;; bs.el
(require 'bs)
(global-set-key (kbd "C-z b") 'bs-show)
(global-set-key (kbd "M-<up>") 'bs-cycle-previous)
(global-set-key (kbd "M-<down>") 'bs-cycle-next)

;; view-mode
(require 'view)
(global-set-key (kbd "C-x C-z") 'view-mode)
(define-key view-mode-map "b" 'backward-char)
(define-key view-mode-map "f" 'forward-char)
(define-key view-mode-map (kbd "C-n") 'next-line)
(define-key view-mode-map (kbd "C-p") 'previous-line)
(define-key view-mode-map (kbd "p") 'pager-row-up)
(define-key view-mode-map (kbd "n") 'pager-row-down)

;; CC-mode
(require 'cc-mode)
(add-hook 'c-mode-common-hook
          '(lambda ()
	     (require 'xcscope)
             (c-toggle-hungry-state t)
             (setq default-tab-width 4
                   c-default-style "k&r"
                   indent-tabs-mode nil
                   c-basic-offset tab-width
                   comment-style 'extra-line)))
;;    (hs-minor-mode t)
;; (add-to-list 'c-cleanup-list 'scope-operator)
;; (add-to-list 'c-cleanup-list 'defun-close-semi)
;; (add-to-list 'c-cleanup-list 'list-close-comma)
;; (add-to-list 'c-cleanup-list 'brace-else-brace)
;; (add-to-list 'c-cleanup-list 'brace-elseif-brace)
;; (add-to-list 'c-cleanup-list 'compact-empty-funcall)))

(define-key c-mode-base-map (kbd "RET") 'newline-and-indent)

;; dired
(require 'dired)
(require 'dired-x)
(add-hook 'dired-load-hook
          (lambda ()
            (load "dired-x")
            ;; Set dired-x global variables here.  For example:
            ;; (setq dired-guess-shell-gnutar "gtar")
            ;; (setq dired-x-hands-off-my-keys nil)
            ))
(add-hook 'dired-mode-hook
          (lambda ()
            ;; Set dired-x buffer-local variables here.  For example:
            ;; (dired-omit-mode 1)
            ))
(add-hook 'dired-after-readin-hook
          (lambda ()
            (setq truncate-lines t)
            ))

(setq dired-recursive-copies 'top
      dired-recursive-deletes 'top
      dired-dwim-target t)

(put 'dired-find-alternate-file 'disabled nil)

(global-set-key (kbd "C-z C-j") 'dired-jump)

;; gud
(gud-tooltip-mode)
(setq gdb-many-windows t)
;; (add-hook 'gdb-mode-hook
;;    '(lambda ()
;;       (local-set-key (kbd "<f12>") 'toggle-tool-bar-mode-from-frame)
;;       ))

;; ibuffer
(require 'ibuffer)
(setq ibuffer-saved-filter-groups
      '(("default"
         ("dired" (or (mode . dired-mode)
                      (mode . shell-mode)
                      (mode . eshell-mode)))
         ("web" (or (mode . html-mode)
                    (mode . css-mode)
                    (mode . js-mode)
                    (mode . js2-mode)
                    (mode . coffee-mode)))
         ("script" (or (mode . sh-mode)
                       (mode . sql-mode)
                       (mode . ruby-mode)
                       (mode . haskell-mode)
                       (mode . python-mode)))
         ("prog" (or (mode . c++-mode)
                     (mode . c-mode)))
         ("org" (or (name . "^\\*Calendar\\*$")
                    (name . "^diary$")
                    (mode . yaml-mode)
                    (mode . outline-mode)
                    (mode . rst-mode)
                    (mode . markdown-mode)
                    (mode . org-mode)))
         ("lisp" (or (mode . clojure-mode)
                     (mode . lisp-mode)
                     (mode . lisp-interaction-mode)))
         ("elisp" (mode . emacs-lisp-mode))
         ("erc" (or (mode . erc-mode)
                    (mode . erc-list-mode)))
         ("gnus" (or (mode . message-mode)
                     (mode . bbdb-mode)
                     (mode . mail-mode)
                     (mode . gnus-group-mode)
                     (mode . gnus-summary-mode)
                     (mode . gnus-article-mode)
                     (mode . gnus-server-mode)
                     (name . "^\\.bbdb$")
                     (name . "^\\.newsrc-dribble")))
         ;; ("TeX" (or (mode . latex-mode)
         ;;            (mode . plain-tex-mode)))
         ("*buffer*" (name . "\\*.*\\*"))
         ("tags" (name . "^TAGS")))))
(add-hook 'ibuffer-mode-hook
          (lambda ()
            (ibuffer-switch-to-saved-filter-groups "default")))
(global-set-key (kbd "C-x C-b") 'ibuffer)

(add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))
(add-to-list 'auto-mode-alist '("\\.md$" . markdown-mode))

;; ido
(require 'ido)
(ido-mode t)
(ido-everywhere t)
(setq ido-save-directory-list-file "~/.emacs.d/.emacs.ido.last")

;; js-mode
(setq js-indent-level 2)

;; remember
(require 'remember)
(define-key global-map (kbd "<f9> r") 'remember)
(define-key global-map (kbd "<f9> R") 'remember-region)

;; tramp
(require 'tramp)
(setq tramp-default-method "ssh")
(setq tramp-default-user "user"
      tramp-default-host "192\.168\.0\.1")
(setq password-cache-expiry 65535)

;; VC
(setq version-control t
      make-backup-files nil
      kept-old-versions 2
      kept-new-versions 2
      delete-old-versions t)
(add-to-list 'backup-directory-alist "~/.backups/")

;; uniquify
(require 'uniquify)
(setq uniquify-buffer-name-style 'forward)

;; desktop
(require 'desktop)
(desktop-save-mode t)
(add-to-list 'desktop-path "~/.emacs.d/")
