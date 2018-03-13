;; -*- mode: Emacs-Lisp -*-


(setq custom-file "~/.emacs.d/emacs-custom.el"
      bookmark-default-file "~/.emacs.d/.emacs.bmk"
      gnus-init-file "~/.emacs.d/.gnus.el"
      erc-startup-file-list '("~/.emacs.d/.ercrc.el"))


(setq backward-delete-char-untabify-method 'untabify)
;; (setq default-directory "~/")
(setq display-battery-mode t)
;; (setq default-fill-column 80)
(setq echo-keystrokes 0.1)
(setq enable-recursive-minibuffers t)
(setq frame-title-format "%f @ Emacs")
(setq inhibit-startup-screen t)
(setq initial-scratch-message "")
(setq require-final-newline t)
(setq tab-always-indent 'complete)
;; (add-to-list 'completion-styles 'initials)
;; (setq visible-bell t)
(setq x-select-enable-clipboard t)

(setq-default indent-tabs-mode nil)

(set-default-coding-systems 'utf-8)
(prefer-coding-system 'utf-8)


(auto-image-file-mode t)
(auto-revert-mode t)
(blink-cursor-mode -1)
(delete-selection-mode t)
(electric-pair-mode t)
(global-hl-line-mode t)
(global-linum-mode -1)
(mouse-avoidance-mode 'animate)
(show-paren-mode t)
(transient-mark-mode t)
(winner-mode t)


;; scroll
(setq mouse-wheel-scroll-amount '(3 ((shift) . 1) ((control)))
      mouse-wheel-progressive-speed nil
      scroll-conservatively 101)
(setq next-screen-context-lines 3)


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


(provide 'init-basic)
;;; init-basic.el ends here
