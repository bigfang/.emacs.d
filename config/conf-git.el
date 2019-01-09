;; -*- mode: Emacs-Lisp -*-

(use-package gitattributes-mode
  :ensure t)

(use-package gitconfig-mode
  :ensure t)

(use-package gitignore-mode
  :ensure t
  :config
  (add-to-list 'auto-mode-alist
               (cons "/.dockerignore\\'" 'gitignore-mode)))

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


(use-package forge
  :ensure t)


(use-package git-gutter
  :ensure t
  :config
  (global-git-gutter-mode +1)
  :custom
  (git-gutter:disabled-modes '(asm-mode hexl-mode image-mode)))


(use-package diff-hl
  :ensure t
  :hook
  ((magit-post-refresh . diff-hl-magit-post-refresh)
   (dired-mode . diff-hl-dired-mode))
  :config
  (global-diff-hl-mode)
  (diff-hl-flydiff-mode)
  (unless (display-graphic-p)
    (diff-hl-margin-mode)))


(use-package git-timemachine
  :ensure t
  :config
  (evil-make-overriding-map git-timemachine-mode-map 'normal)
  ;; force update evil keymaps after git-timemachine-mode loaded
  (add-hook 'git-timemachine-mode-hook #'evil-normalize-keymaps))


(use-package magit-todos
  :ensure t
  :hook (magit-mode . magit-todos-mode)
  :config
  (setq magit-todos-ignored-keywords nil)
  (setq magit-todos-keywords-list
        '("TODO" "DOING" "DONE" "FIXME"
          "DONT" "FAIL" "MAYBE" "NOTE" "HACK"
          "NEXT" "THEM" "PROG" "OKAY"
          "KLUDGE" "TEMP" "XXX" "???")))


(provide 'conf-git)
