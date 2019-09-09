;; -*- mode: Emacs-Lisp; lexical-binding: t; -*-*-

(use-package gitattributes-mode
  :ensure t
  :defer t)

(use-package gitconfig-mode
  :ensure t
  :defer t)

(use-package gitignore-mode
  :ensure t
  :mode "/.dockerignore\\'")

(use-package magit
  :ensure t
  :pin melpa
  :bind (("C-c v" . magit-status)
         :map transient-map
         ("q" . transient-quit-one))
  :config
  (add-to-list 'magit-section-initial-visibility-alist '(untracked . show))
  (add-to-list 'magit-section-initial-visibility-alist '(unstaged . show))
  (add-to-list 'magit-section-initial-visibility-alist '(unpulled . show))
  (add-to-list 'magit-section-initial-visibility-alist '(unpushed . show))

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
  :disabled
  :ensure t)


(use-package git-gutter
  :ensure t
  ;; :config
  ;; (global-git-gutter-mode +1)
  :custom
  (git-gutter:disabled-modes '(asm-mode hexl-mode image-mode)))


(use-package diff-hl
  :ensure t
  :hook
  ((magit-post-refresh . diff-hl-magit-post-refresh)
   (dired-mode . diff-hl-dired-mode))
  :config
  (global-diff-hl-mode)
  (global-diff-hl-amend-mode)
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


(provide 'init-git)
