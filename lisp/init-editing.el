;; -*- mode: Emacs-Lisp; lexical-binding: t; -*-*-


(setq-default fill-column 80)
(setq-default indent-tabs-mode nil)
(setq-default line-spacing nil)
(setq backward-delete-char-untabify-method 'hungry)  ; 删除键行为
(setq delete-by-moving-to-trash t)              ; 删除至系统回收站
(setq echo-keystrokes 0.1)                      ; 按键连击间隔
(setq select-enable-clipboard t)                ; 系统剪切板
(setq save-interprogram-paste-before-kill t)    ; 剪切板内容加入killing-ring
(setq scroll-preserve-screen-position 'always)  ; 滚屏时鼠标行为
(setq set-mark-command-repeat-pop t)            ; C-u后C-SPC的行为
(setq tab-always-indent 'complete)              ; tab健行为

(global-auto-revert-mode t)
(delete-selection-mode t)               ; 退格键删除选中区域
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
  :config
  ;; time-stamp
  (add-hook 'before-save-hook 'time-stamp)

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


(use-package elec-pair
  :config
  (setq electric-pair-inhibit-predicate 'electric-pair-conservative-inhibit)
  (electric-pair-mode t))



;; === packages ===
(use-package expand-region
  :ensure t
  :bind ("C-." . er/expand-region)
  :config
  (setq expand-region-contract-fast-key ","))


(use-package string-inflection
  :ensure t
  :bind ("M-u" . my/string-inflection-cycle-auto) ; M-U in init-kbd.el
  :config
  (defun my/string-inflection-cycle-auto ()
    "switching by major-mode"
    (interactive)
    (cond
     ;; for emacs-lisp-mode
     ((eq major-mode 'emacs-lisp-mode)
      (string-inflection-all-cycle))
     (t
      ;; default
      (string-inflection-all-cycle)))))


(use-package paredit
  :ensure t
  :chords (",," . hydra:paredit/body)
  :bind (:map paredit-mode-map
         ("<S-left>" . paredit-backward-slurp-sexp)
         ("<S-right>" . paredit-backward-barf-sexp)
         ("<M-left>" . paredit-forward-barf-sexp)
         ("<M-right>" . paredit-forward-slurp-sexp))
  :init
  (defun my/toggle-paredit-mode (stat)
    (if stat
        (progn (paredit-mode +1)
               (message "paredit-mode enabled"))
      (progn (paredit-mode -1)
             (message "paredit-mode disabled"))))

  (defun paredit/space-for-delimiter-p (endp delm)
    (or (member 'font-lock-keyword-face (text-properties-at (1- (point))))
        (not (derived-mode-p 'c++-mode
                             'c-mode
                             'csharp-mode
                             'elixir-mode
                             'erlang-mode
                             'go-mode
                             'java-mode
                             'js-mode
                             'lua-mode
                             'python-mode
                             'ruby-mode
                             'rust-mode
                             'typescript-mode))))
  :config
  (add-to-list 'paredit-space-for-delimiter-predicates 'paredit/space-for-delimiter-p)
  (add-hook 'evil-insert-state-entry-hook 'enable-paredit-mode)
  (add-hook 'evil-insert-state-exit-hook 'disable-paredit-mode)
  (use-package hydra-paredit))


(use-package multiple-cursors
  :ensure t
  :bind (("C-S-c C-S-c" . mc/edit-lines)
         ("C->" . mc/mark-next-like-this)
         ("C-<" . mc/mark-previous-like-this)
         ("C-c C->" . mc/mark-all-like-this)
         ("C-?" . mc/mark-all-like-this)
         ("C-S-<mouse-1>" . mc/add-cursor-on-click))
  :config
  (setq mc/edit-lines-empty-lines 'ignore
        mc/always-repeat-command t
        mc/always-run-for-all t
        mc/insert-numbers-default 1)
  :init
  (defhydra hydra:multiple-cursors (:color pink :hint nil)
    "
  Multiple Cursors
     ^Up^            ^Down^          ^Other^
--^^--------------^^--------------^^------------------
  [_p_]   Next    [_n_]   Next    [_L_] Edit lines
  [_P_]   Skip    [_N_]   Skip    [_a_] Mark all
  [_M-p_] Unmark  [_M-n_] Unmark  [_s_] Sort regions
  ^ ^             ^ ^             [_q_] Quit
"
    ("L" mc/edit-lines :exit t)
    ("a" mc/mark-all-like-this :exit t)
    ("n" mc/mark-next-like-this)
    ("N" mc/skip-to-next-like-this)
    ("M-n" mc/unmark-next-like-this)
    ("p" mc/mark-previous-like-this)
    ("P" mc/skip-to-previous-like-this)
    ("M-p" mc/unmark-previous-like-this)

    ("s" mc/sort-regions)
    ("r" mc/reverse-regions "reverse")
    ("d" mc/insert-numbers "insert numbers")
    ("z" mc/insert-letters "insert latters")
    ("q" nil :color blue))
  (global-set-key (kbd "C-,") 'hydra:multiple-cursors/body))


;; key-binding -- https://emacs.stackexchange.com/a/2557
(use-package undo-tree
  :ensure t
  :bind (:map evil-normal-state-map
         ("U" . undo-tree-redo)
         ("u" . undo-tree-undo))
  :config
  (global-undo-tree-mode)
  (bind-key* "C-\\" 'undo-tree-redo)
  ;; (bind-key* "C-?" 'uncomment-region)
  ;; (bind-key* "M-_" 'uncomment-region)
  ;; (bind-key* "s-z" 'comment-dwim)
  ;; (bind-key* "C-/" 'comment-dwim)
  ;; (bind-key* "C-_" 'comment-dwim)
  :init
  (setq undo-tree-auto-save-history nil)
  (defhydra hydra:undo-tree (:hint nil)
    "
    [_p_]: undo  [_n_]: redo  [_s_]: save  [_l_]: load  "
    ("p" undo-tree-undo)
    ("n" undo-tree-redo)
    ("s" undo-tree-save-history)
    ("l" undo-tree-load-history)
    ("u" undo-tree-visualize "visualize" :color blue)
    ("q" nil :color blue))
  (bind-key* (kbd "C-x u") 'hydra:undo-tree/body))


(provide 'init-editing)
