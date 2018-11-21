;; -*- mode: Emacs-Lisp -*-


(setq-default fill-column 80)
(setq-default indent-tabs-mode nil)
(setq delete-by-moving-to-trash t)      ; 删除至系统回收站
(setq echo-keystrokes 0.1)              ; 按键连击间隔
(setq backward-delete-char-untabify-method 'hungry) ; 删除键行为
(setq select-enable-clipboard t)        ; 系统剪切板
(setq save-interprogram-paste-before-kill t) ; 剪切板内容加入killing-ring
(setq scroll-preserve-screen-position 'always) ; 滚屏时鼠标行为
(setq tab-always-indent 'complete)           ; tab健行为
(setq set-mark-command-repeat-pop t)         ; C-u后C-SPC的行为

(auto-revert-mode t)
(delete-selection-mode t)               ; 退格键删除选中区域
(electric-pair-mode t)
(transient-mark-mode t)                 ; 高亮选中区域
(pixel-scroll-mode -1)


;; scroll
(setq mouse-wheel-scroll-amount '(3 ((shift) . 1) ((control)))
      mouse-wheel-progressive-speed nil)
(setq next-screen-context-lines 3)
(setq scroll-step 1
      scroll-margin 0
      scroll-conservatively 101)
(setq hscroll-step 1
      hscroll-margin 0)


(use-package files
  :ensure nil
  :config
  ;; time-stamp
  (add-hook 'before-save-hook 'time-stamp)
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

    ;; final blank line
  (setq require-final-newline t))


(defun whitespace-cleanup* ()
  (let* ((modified-before-p (buffer-modified-p)))
    (whitespace-cleanup)
    (if (not modified-before-p)
        (not-modified))))

(defun whitespace-cleanup-on-save ()
  (add-hook 'write-contents-functions #'whitespace-cleanup*))

;; prog-mode hooks
(add-hook 'prog-mode-hook
          (lambda ()
            (setq truncate-lines t)
            (setq fill-column 80)
            (whitespace-cleanup-on-save)

            ;; (linum-mode t)
            (hs-minor-mode t)
            (highlight-indentation-mode -1)
            (prettify-symbols-mode t)))



;; === packages ===
(use-package expand-region
  :ensure t
  :bind (("M-." . er/expand-region)
         :map evil-normal-state-map
         ("M-." . er/expand-region))
  :config
  (setq expand-region-contract-fast-key ","))


(use-package string-inflection
  :ensure t
  :bind ("M-u" . my/string-inflection-cycle-auto) ; M-U in conf-kbd.el
  :config
  (defun my/string-inflection-cycle-auto ()
    "switching by major-mode"
    (interactive)
    (cond
     ;; for emacs-lisp-mode
     ((eq major-mode 'emacs-lisp-mode)
      (string-inflection-all-cycle))
     ;; for python
     ((eq major-mode 'python-mode)
      (string-inflection-cycle))
     (t
      ;; default
      (string-inflection-all-cycle)))))


(use-package move-text
  :ensure t
  :bind (("<C-S-up>" . move-text-up)
         ("<C-S-down>" . move-text-down)))


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


;; key-binding -- https://emacs.stackexchange.com/a/2557
(use-package undo-tree
  :ensure t
  :bind (:map evil-normal-state-map
         ("u" . undo)
         ("C-r" . redo))
  :config
  (global-undo-tree-mode)
  (bind-key* "C-?" 'uncomment-region)
  (bind-key* "M-_" 'uncomment-region)
  (bind-key* "s-z" 'comment-dwim)
  (bind-key* "C-_" 'comment-dwim)
  (bind-key* "C-/" 'comment-dwim))


(provide 'conf-editing)
;;; conf-editing.el ends here
