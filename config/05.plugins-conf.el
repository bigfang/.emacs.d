;; -*- mode: Emacs-Lisp -*-
;; Time-stamp: <2018-02-15 17:31:07>


;;============================;;
(require 'recent-jump)
(setq recent-jump-threshold 4)
(setq recent-jump-ring-length 10)
(global-set-key (kbd "C-z ,") 'recent-jump-jump-backward)
(global-set-key (kbd "C-z .") 'recent-jump-jump-forward)
