;; -*- mode: Emacs-Lisp -*-


(setq-default fill-column 80)
(setq-default indent-tabs-mode nil)
(setq echo-keystrokes 0.1)              ; 按键连击间隔
(setq backward-delete-char-untabify-method 'untabify) ; 删除键行为
(setq select-enable-clipboard t)        ; 系统剪切板
(setq save-interprogram-paste-before-kill t) ; 剪切板内容加入killing-ring
(setq tab-always-indent 'complete)           ; tab健行为

(auto-revert-mode t)
(delete-selection-mode t)               ; 退格键删除选中区域
(electric-pair-mode t)
(show-paren-mode t)
(transient-mark-mode t)                 ; 高亮选中区域


;; scroll
(setq mouse-wheel-scroll-amount '(3 ((shift) . 1) ((control)))
      mouse-wheel-progressive-speed nil
      scroll-conservatively 101)
(setq next-screen-context-lines 3)


(use-package files
  :ensure nil
  :config
  ;; final blank line
  (setq require-final-newline t)

  ;; time-stamp
  (add-hook 'write-file-hooks 'time-stamp)
  (setq time-stamp-format "%04y-%02m-%02d %02H:%02M:%02S")

  ;; Auto-save and Backups
  ;; (setq auto-save-default nil)
  (setq auto-save-file-name-transforms
        `((".*" ,temporary-file-directory t)))
  (setq make-backup-files t
        version-control t
        backup-by-copying t
        kept-old-versions 2
        kept-new-versions 5
        delete-old-versions t)
  (setq backup-directory-alist
        `((".*" . ,temporary-file-directory)))
  )


;; prog-mode hooks
(add-hook 'prog-mode-hook
          (lambda ()
            (add-to-list 'write-file-functions 'delete-trailing-whitespace)
            ;; (linum-mode)
            (hs-minor-mode)
            (highlight-indentation-mode)
            (prettify-symbols-mode)
            (setq truncate-lines t)
            (setq fill-column 120)
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
