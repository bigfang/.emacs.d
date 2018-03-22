;; -*- mode: Emacs-Lisp -*-


(use-package magit
  :ensure t
  :pin melpa-stable
  :bind ("C-c v" . magit-status)
  :config
  (setq magit-display-buffer-function
        (lambda (buffer)
          (display-buffer
           buffer
           (cond ((and (derived-mode-p 'magit-mode)
                       (eq (with-current-buffer buffer major-mode)
                           'magit-status-mode))
                  nil)
                 ((memq (with-current-buffer buffer major-mode)
                        '(magit-process-mode
                          magit-revision-mode
                          magit-diff-mode
                          magit-stash-mode))
                  nil)
                 (t
                  '(display-buffer-same-window))))))

  (setq magit-completing-read-function 'ivy-completing-read))


(use-package git-gutter
  :ensure t
  :config
  (global-git-gutter-mode +1)
  :custom
  (git-gutter:disabled-modes '(asm-mode hexl-mode image-mode)))


(provide 'init-git)
;;; init-git.el ends here
