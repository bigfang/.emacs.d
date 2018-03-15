;; -*- mode: Emacs-Lisp -*-


(setq display-time-24hr-format t
      display-time-use-mail-icon t)
(display-time-mode -1)
;; (display-battery-mode t)
(column-number-mode t)
(size-indication-mode -1)


(use-package minions
  :ensure t
  :config
  (minions-mode 1)
  (setq minions-mode-line-lighter ">_<"))


(provide 'init-modeline)
;;; init-modeline.el ends here
