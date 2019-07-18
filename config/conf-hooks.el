;; -*- mode: Emacs-Lisp -*-


(defun whitespace-cleanup* ()
  (let* ((modified-before-p (buffer-modified-p)))
    (whitespace-cleanup)
    (if (not modified-before-p)
        (set-buffer-modified-p))))

(defun whitespace-cleanup-on-save ()
  (add-hook 'write-contents-functions #'whitespace-cleanup*))



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
            (whitespace-cleanup-on-save)

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
