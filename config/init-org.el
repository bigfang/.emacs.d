;; -*- mode: Emacs-Lisp -*-


(use-package org
  :ensure t
  :hook (org-mode . my/org-table-font)
  :config
  (defun my/org-table-font ()
    (interactive)
    (set-face-attribute 'org-table nil :font "PCMyungjo 16"))
  (setq org-startup-folded nil))


(use-package org-bullets
    :ensure t
    :commands org-bullets-mode
    :config
    (add-hook 'org-mode-hook
              (lambda ()
                (org-bullets-mode 1))))


(use-package deft
  :ensure t
  :commands (deft)
  :config
  (setq deft-directory "~/notes"
        deft-recursive t
        deft-extensions '("org" "md"))
  ;; (setq deft-use-filename-as-title -1)
  (evil-define-key 'insert deft-mode-map (kbd "C-g") 'deft-filter-clear)
  (evil-define-key 'normal deft-mode-map (kbd "c") 'deft-new-file)
  (evil-define-key 'normal deft-mode-map (kbd "R") 'deft-rename-file)
  (evil-define-key 'normal deft-mode-map (kbd "D") 'deft-delete-file)
  (evil-define-key 'normal deft-mode-map (kbd "gr") 'deft-refresh)
  (evil-define-key 'normal deft-mode-map (kbd "f") 'deft-find-file)
  (evil-define-key 'normal deft-mode-map (kbd "q") 'quit-window))



(provide 'init-org)
;;; init-org.el ends here
