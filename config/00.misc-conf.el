;; -*- mode: Emacs-Lisp -*-

;; Time-stamp: <BigFang 2012-11-22 11:06:46>

(setq backward-delete-char-untabify-method nil)
(setq default-directory "~/")
(setq display-battery-mode t)
;; (setq default-fill-column 80)
(setq echo-keystrokes 0.1)
(setq enable-recursive-minibuffers t)
(setq frame-title-format "%b @ Emacs")
(setq inhibit-startup-screen t)
(setq initial-scratch-message "")
(setq require-final-newline t)
(setq tab-always-indent 'complete)
(add-to-list 'completion-styles 'initials)
(setq visible-bell t)
(setq x-select-enable-clipboard t)

(setq-default indent-tabs-mode nil)

(set-default-coding-systems 'utf-8)
(prefer-coding-system 'utf-8)

(auto-image-file-mode t)
(auto-revert-mode t)
(blink-cursor-mode -1)
(delete-selection-mode t)
(electric-pair-mode t)
(global-hl-line-mode -1)
(global-linum-mode -1)
(mouse-avoidance-mode 'animate)
(set-scroll-bar-mode nil)
(show-paren-mode t)
(tool-bar-mode -1)
(transient-mark-mode t)
(winner-mode t)

;; Mode line
(setq display-time-24hr-format t
      display-time-use-mail-icon t)
(display-time-mode t)
;; (display-battery-mode t)
(column-number-mode t)
(size-indication-mode t)

;; (setq compilation-finish-function
;;       (lambda (buf str)
;;         (if (string-match "finished" str)
;;             (run-at-time 1 nil 'delete-windows-on buf))))
(setq compilation-window-height 15)
;; (setq compilation-auto-jump-to-first-error t)
(setq compilation-scroll-output t)

;; scroll
(setq mouse-wheel-scroll-amount '(3 ((shift) . 1)((control)))
      mouse-wheel-progressive-speed nil
      scroll-step 1)
(setq next-screen-context-lines 0)
