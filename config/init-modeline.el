;; -*- mode: Emacs-Lisp -*-


(setq display-time-24hr-format t
      display-time-use-mail-icon t)
(display-time-mode t)
;; (display-battery-mode t)
(column-number-mode t)
(size-indication-mode t)


(use-package minions
  :ensure t
  :config
  (minions-mode 1)
  (setq minions-mode-line-lighter "^ω^"))


(provide 'init-modeline)
;;; init-modeline.el ends here
