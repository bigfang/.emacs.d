;; -*- mode: Emacs-Lisp -*-


;; == prog-mode hooks ==
(defun my/prog-mode ()
  (interactive)
  (hs-minor-mode)
  ;; (linum-mode)
  (prettify-symbols-mode)

  ;; (git-gutter-mode)
  (highlight-symbol-mode)

  (setq truncate-lines t))

(add-hook 'prog-mode-hook 'my/prog-mode)


;; Auto-save and Backups
;; (setq auto-save-default nil)
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))
(setq make-backup-files t
      version-control t
      backup-by-copying t
      kept-old-versions 2
      kept-new-versions 5
      delete-old-versions t)
(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))

;; bs.el
(require 'bs)
(global-set-key (kbd "C-z b") 'bs-show)
(global-set-key (kbd "C-z C-p") 'bs-cycle-previous)
(global-set-key (kbd "C-z C-n") 'bs-cycle-next)

;; desktop
(require 'desktop)
(desktop-save-mode t)
(add-to-list 'desktop-path "~/.emacs.d/")

;; dired
(require 'dired)
(setq dired-listing-switches "-aBhl"
      dired-recursive-copies 'top
      dired-recursive-deletes 'top
      dired-dwim-target t)
(put 'dired-find-alternate-file 'disabled nil)

;; ibuffer
(require 'ibuffer)
(setq ibuffer-saved-filter-groups
      '(("Default"
         ("Dired" (or (mode . dired-mode)
                      (mode . shell-mode)
                      (mode . eshell-mode)))
         ("Python" (mode . python-mode))
         ("Script" (or (name . "^\\.gitignore$")
                       (mode . sh-mode)
                       (mode . sql-mode)
                       (mode . ruby-mode)
                       (mode . python-mode)))
         ("Lambda" (or (mode . elixir-mode)
                       (mode . haskell-mode)
                       (mode . clojure-mode)))
         ("Web" (or (mode . html-mode)
                    (mode . web-mode)
                    (mode . js-mode)
                    (mode . js2-mode)
                    (mode . json-mode)
                    (mode . css-mode)))
         ("Org" (or (name . "^\\*Calendar\\*$")
                    (name . "^diary$")
                    (mode . yaml-mode)
                    (mode . outline-mode)
                    (mode . rst-mode)
                    (mode . markdown-mode)
                    (mode . org-mode)))
         ("Lisp" (or (mode . lisp-mode)
                     ;; (mode . lisp-interaction-mode)
                     (mode . emacs-lisp-mode)))
         ("Magit"  (name . "^\\*magit:"))
         ("VC"  (or (name . "^\\*magit-")
                    (name . "^\\*vc")
                    (mode . diff-mode)
                    (mode . vc-dir-mode)))
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

;; Use human readable Size column instead of original one
(define-ibuffer-column size-h
  (:name "Size" :inline t)
  (cond
   ((> (buffer-size) 1000000) (format "%7.1fM" (/ (buffer-size) 1000000.0)))
   ((> (buffer-size) 100000) (format "%7.0fk" (/ (buffer-size) 1000.0)))
   ((> (buffer-size) 1000) (format "%7.1fk" (/ (buffer-size) 1000.0)))
   (t (format "%8d" (buffer-size)))))

;; Modify the default ibuffer-formats
(setq ibuffer-formats
      '((mark modified read-only " "
              (name 24 24 :left :elide)
              " "
              (size-h 9 -1 :right)
              " "
              (mode 16 16 :left :elide)
              " " filename-and-process)
        (mark " "
              (name 16 -1)
              " " filename)))
(global-set-key (kbd "C-x b") 'ibuffer)

;; ido
(require 'ido)
(ido-mode t)
(ido-everywhere t)
(setq ido-save-directory-list-file "~/.emacs.d/.emacs.ido.last")

;; image mode
(require 'image-mode)
(define-key image-mode-map "u" 'image-scroll-down)

;; remember
(require 'remember)
(define-key global-map (kbd "<f9> r") 'remember)
(define-key global-map (kbd "<f9> R") 'remember-region)

;; tramp
(require 'tramp)
(setq tramp-default-method "ssh")
;; (setq tramp-default-user "user"
;;       tramp-default-host "192\.168\.0\.1")
(setq password-cache-expiry nil)

;; uniquify
(require 'uniquify)
(setq uniquify-buffer-name-style 'post-forward)

;; view-mode
(require 'view)
(global-set-key (kbd "C-z z") 'view-mode)
(define-key view-mode-map "b" 'backward-char)
(define-key view-mode-map "f" 'forward-char)
(define-key view-mode-map (kbd "C-n") 'next-line)
(define-key view-mode-map (kbd "C-p") 'previous-line)
(define-key view-mode-map (kbd "p") 'pager-row-up)
(define-key view-mode-map (kbd "n") 'pager-row-down)

;; windmove
(windmove-default-keybindings)
