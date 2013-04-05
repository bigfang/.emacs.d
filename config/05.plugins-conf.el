;; -*- mode: Emacs-Lisp -*-

;; Time-stamp: <BigFang 2013-04-05 16:07:00>

;;============================;;
;; (require 'compile-dwim)
;; (global-set-key (kbd "C-z c") 'compile-dwim-compile)
;; (global-set-key (kbd "C-z r") 'compile-dwim-run)

;;============================;;
(require 'recent-jump)
(setq recent-jump-threshold 4)
(setq recent-jump-ring-length 10)
(global-set-key (kbd "C-z ,") 'recent-jump-jump-backward)
(global-set-key (kbd "C-z .") 'recent-jump-jump-forward)

;;============================;;
;; (require 'sourcepair)
;; (setq sourcepair-source-path '( "." "../*" "../src" )
;;       sourcepair-header-path '( "." "include" "../include" "../*"))
;; (define-key c-mode-base-map (kbd "C-z z") 'sourcepair-load)

;;============================;;
;;(add-to-list 'load-path "~/.emacs.d/plugins/emacs-w3m")
;;(require 'w3m-load)
