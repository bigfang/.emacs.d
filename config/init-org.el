;; -*- mode: Emacs-Lisp -*-


(defun my-org-table-font ()
  (interactive)
  (set-face-attribute 'org-table nil :font "PCMyungjo 16"))
(add-hook 'org-mode-hook 'my-org-table-font)


(use-package org
  :ensure t
  :config
  (setq org-startup-folded nil))


(provide 'init-org)
;;; init-org.el ends here
