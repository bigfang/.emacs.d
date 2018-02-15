;; -*- mode: Emacs-Lisp -*-

;; Time-stamp: <BigFang 2012-12-28 22:54:28>

(setq erc-nick "bigfang"
      erc-user-full-name "bigbigfang")

(setq erc-echo-notices-in-minibuffer-flag t
      erc-default-coding-system '(utf-8 . utf-8)
      erc-encoding-coding-alist '(("#ubuntu-cn" . utf-8))
      erc-kill-buffer-on-part t
      erc-kill-server-buffer-on-quit t
      erc-auto-query t
      erc-scrolltobottom-mode t)
;;      erc-input-line-position -1)

;; (erc-autojoin-mode t)
(setq erc-autojoin-channels-alist
      '(("freenode.net" "#emacs" "#ubuntu-cn")
        ("oftc.net" "#emacs-cn")))
;; ("ourirc.com" "#linuxfire" "tlf_files")))

(setq erc-join-buffer 'bury
      erc-auto-query 'bury)

;; (erc-match-mode t)
(setq erc-current-nick-highlight-type 'nick-or-keyword
      erc-keywords '("clojure" "emacs" "gnus"))

;; (erc-fill-mode t)
(setq erc-fill-function 'erc-fill-static
      erc-fill-static-center 12)

;; (erc-stamp-mode t)
(setq erc-timestamp-use-align-to t
      erc-timestamp-format "%H:%M"
      erc-timestamp-only-if-changed-flag nil)
(setq erc-insert-timestamp-function 'erc-insert-timestamp-left)

;; (erc-log-mode t)
(setq erc-log-channels-directory "~/var/erc/"
      erc-save-buffer-on-part t
      erc-log-file-coding-system 'utf-8
      erc-log-write-after-send t
      erc-log-write-after-insert t)
