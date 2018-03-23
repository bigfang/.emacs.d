;; -*- mode: Emacs-Lisp -*-


(use-package ibuffer
  :ensure nil
  :bind ("C-x C-b" . ibuffer)
  :hook
  (ibuffer-mode . (lambda ()
                    (ibuffer-switch-to-saved-filter-groups "Default")))
  :config
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
           ("VC"  (or (name . "^\\*magit:")
                      (name . "^\\*magit-")
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
  )


(provide 'init-ibuffer)
;;; init-ibuffer.el ends here
