;; -*- mode: Emacs-Lisp -*-


;; time-stamp
(add-hook 'write-file-hooks 'time-stamp)
(setq time-stamp-format "%04y-%02m-%02d %02H:%02M:%02S")

;; prog-mode hooks
(add-hook 'prog-mode-hook
          (lambda ()
            (add-to-list 'write-file-functions 'delete-trailing-whitespace)
            ;; (linum-mode)
            (hs-minor-mode)
            (prettify-symbols-mode)
            (setq truncate-lines t)
            ))


(use-package expand-region
  :ensure t
  :bind (("C-;" . er/expand-region)))


(use-package multiple-cursors
  :ensure t
  :bind (("C-S-c C-S-c" . mc/edit-lines)
         ("C->" . mc/mark-next-like-this)
         ("C-<" . mc/mark-previous-like-this)
         ("C-c C->" . mc/mark-all-like-this)
         ("C-S-<mouse-1>" . mc/add-cursor-on-click))
  :config
  (setq mc/edit-lines-empty-lines 'ignore
        mc/insert-numbers-default 1))


(provide 'init-editing)
;;; init-editing.el ends here
