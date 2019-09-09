;; -*- mode: Emacs-Lisp; lexical-binding: t; -*-*-


(defalias 'save 'my/save-states)

(defun my/save-states ()
  "save states"
  (interactive)
  (desktop-save desktop-dirname)
  (savehist-save)
  (bookmark-save)
  (message "Save Desktop Savehist Bookmark DONE"))



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
            (outline-minor-mode t)
            (prettify-symbols-mode t)))
(add-hook 'prog-mode-hook
          (lambda ()
            ;; (add-to-list 'prettify-symbols-alist '("->" . ?→))
            ;; (add-to-list 'prettify-symbols-alist '("=>" . ?⇒))
            (add-to-list 'prettify-symbols-alist '("!=" . ?≠))
            (add-to-list 'prettify-symbols-alist '(">=" . ?≥))
            (add-to-list 'prettify-symbols-alist '("<=" . ?≤))))


(provide 'init-hooks)
