;; -*- mode: Emacs-Lisp -*-


(defalias 'save 'my/save)

(defun my/save ()
  "save states"
  (interactive)
  (my/desktop-save)
  (savehist-save)
  (bookmark-save)
  (message "Save Desktop savehist bookmark DONE"))



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

            ;; (flyspell-prog-mode)
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


(provide 'init-hooks)
