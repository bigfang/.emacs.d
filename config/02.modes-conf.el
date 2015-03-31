;; -*- mode: Emacs-Lisp -*-
;; Time-stamp: <BigFang 2015-03-31 23:32:33>


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

;; dired
(require 'dired)
(setq dired-listing-switches "-aBhl"
      dired-recursive-copies 'top
      dired-recursive-deletes 'top
      dired-dwim-target t)
(put 'dired-find-alternate-file 'disabled nil)
(global-set-key (kbd "C-z C-j") 'dired-jump)

;; ibuffer
(require 'ibuffer)
(setq ibuffer-saved-filter-groups
      '(("Default"
         ("Dired" (or (mode . dired-mode)
                      (mode . shell-mode)
                      (mode . eshell-mode)))
         ("Web" (or (mode . html-mode)
                    (mode . css-mode)
                    (mode . js-mode)
                    (mode . js2-mode)
                    (mode . coffee-mode)))
         ("Script" (or (mode . sh-mode)
                       (mode . sql-mode)
                       (mode . ruby-mode)
                       (mode . haskell-mode)
                       (mode . python-mode)))
         ("Prog" (or (mode . c++-mode)
                     (mode . c-mode)))
         ("Org" (or (name . "^\\*Calendar\\*$")
                    (name . "^diary$")
                    (mode . yaml-mode)
                    (mode . outline-mode)
                    (mode . rst-mode)
                    (mode . markdown-mode)
                    (mode . org-mode)))
         ("Lisp" (or (mode . clojure-mode)
                     (mode . lisp-mode)
                     (mode . lisp-interaction-mode)
                     (mode . emacs-lisp-mode)))
         ("Erc" (or (mode . erc-mode)
                    (mode . erc-list-mode)))
         ("Gnus" (or (mode . message-mode)
                     (mode . bbdb-mode)
                     (mode . mail-mode)
                     (mode . gnus-group-mode)
                     (mode . gnus-summary-mode)
                     (mode . gnus-article-mode)
                     (mode . gnus-server-mode)
                     (name . "^\\.bbdb$")
                     (name . "^\\.newsrc-dribble")))
         ("*Buffer*" (name . "\\*.*\\*"))
         ("Tags" (name . "^TAGS")))))
(add-hook 'ibuffer-mode-hook
          (lambda ()
            (ibuffer-switch-to-saved-filter-groups "Default")))
(global-set-key (kbd "C-x C-b") 'ibuffer)

(add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))
(add-to-list 'auto-mode-alist '("\\.md$" . markdown-mode))

;; ido
(require 'ido)
(ido-mode t)
(ido-everywhere t)
(setq ido-save-directory-list-file "~/.emacs.d/.emacs.ido.last")

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
