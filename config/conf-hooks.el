;; -*- mode: Emacs-Lisp -*-


(add-hook 'before-save-hook 'whitespace-cleanup)


(add-hook 'org-mode-hook
          (lambda ()
            (text-scale-increase 1)))

(add-hook 'markdown-mode-hook
          (lambda ()
            (text-scale-increase 1)))


(add-hook 'prog-mode-hook
          (lambda ()
            (setq truncate-lines t)
            (setq fill-column 80)

            ;; (linum-mode t)
            (hs-minor-mode t)
            (prettify-symbols-mode t)))
(add-hook 'prog-mode-hook
          (lambda ()
            ;; (add-to-list 'prettify-symbols-alist '("->" . ?→))
            ;; (add-to-list 'prettify-symbols-alist '("=>" . ?⇒))
            (add-to-list 'prettify-symbols-alist '("!=" . ?≠))
            (add-to-list 'prettify-symbols-alist '(">=" . ?≥))
            (add-to-list 'prettify-symbols-alist '("<=" . ?≤))))


(provide 'conf-hooks)
