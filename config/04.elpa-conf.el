;; -*- mode: Emacs-Lisp -*-


;;; programming languages

(require 'js2-mode)
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))
(define-key js2-mode-map (kbd "<return>") 'newline-and-indent)
(add-hook 'js2-mode-hook (lambda () (setq js2-basic-offset 2)))
;; (define-key js2-mode-map (kbd "<backspace>") 'c-electric-backspace)
;; (define-key js2-mode-map (kbd "C-d") 'c-electric-delete-forward)
(require 'json-mode)
(require 'json-reformat)
(define-key json-mode-map (kbd "C-c C-f") 'json-reformat-region)

(require 'elixir-mode)
(require 'alchemist)
(setq alchemist-key-command-prefix (kbd "C-c ."))
(setq alchemist-mix-env "dev")


;; ================================================== ;;

;; evil
(setq evil-toggle-key "M-z"
      evil-want-fine-undo t
      evil-want-C-i-jump nil)
;; (require 'evil)
(evil-mode 1)
(evil-set-initial-state 'dired-mode 'emacs)
(evil-set-initial-state 'image-mode 'emacs)
(add-hook 'git-commit-mode-hook 'evil-insert-state)

(define-key evil-normal-state-map (kbd "^") 'evil-window-top)
(define-key evil-normal-state-map (kbd "$") 'evil-window-bottom)
(define-key evil-normal-state-map (kbd "H") 'evil-first-non-blank)
(define-key evil-normal-state-map (kbd "L") 'evil-end-of-line)
(define-key evil-normal-state-map (kbd "C-e") 'evil-end-of-line)
(define-key evil-normal-state-map (kbd "C-y") 'yank)
(define-key evil-normal-state-map (kbd "C-u") 'evil-scroll-up)
(define-key evil-normal-state-map (kbd "C-n") 'evil-scroll-line-down) ; evil-paste-pop-next
(define-key evil-normal-state-map (kbd "C-p") 'evil-scroll-line-up) ; evil-paste-pop

(setcdr evil-insert-state-map nil)
(define-key evil-insert-state-map
  (read-kbd-macro evil-toggle-key) 'evil-emacs-state)
(define-key evil-insert-state-map (kbd "<escape>") 'evil-normal-state)
(define-key evil-insert-state-map (kbd "C-g") 'evil-normal-state)
(define-key evil-insert-state-map (kbd "C-o") 'evil-execute-in-normal-state)


(setq evil-emacs-state-cursor '("#00bfff" box)
      evil-normal-state-cursor '("#cd5c5c" box)
      evil-visual-state-cursor '("#eedd82" box)
      evil-insert-state-cursor '("#ab82ff" box))


(require 'evil-surround)
(global-evil-surround-mode 1)

(require 'evil-leader)
(global-evil-leader-mode)
(evil-leader/set-leader "<SPC>")
(evil-leader/set-key
  "<up>" 'windmove-up
  "<down>" 'windmove-down
  "<left>" 'windmove-left
  "<right>" 'windmove-right
  "<SPC>" 'keyboard-quit

  "=" 'er/expand-region
  "." 'xref-find-definitions
  "|" 'split-window-right
  "-" 'split-window-below
  ";" 'comment-or-uncomment-current-line-or-region
  "0" 'delete-window

  "!e" 'flycheck-explain-error-at-point
  "!l" 'flycheck-list-errors
  "!p" 'flycheck-previous-error
  "!n" 'flycheck-next-error

  "bb" 'switch-to-buffer
  "bn" 'next-buffer
  "bp" 'previous-buffer
  "bk" 'kill-this-buffer
  "ma" 'mc/mark-all-like-this
  "f" 'counsel-find-file
  "g" 'avy-goto-char-2
  "h" 'highlight-symbol-at-point
  "q" 'quit-window
  "wk" 'kill-buffer-and-window
  "s" 'counsel-ag
  "u" 'undo-tree-visualize
  "vv" 'magit-status

  "pp" 'counsel-projectile-switch-project
  "pb" 'counsel-projectile-switch-to-buffer
  "pf" 'counsel-projectile-find-file
  "ps" 'counsel-projectile-ag
  "xs" 'save-buffer

  "C-x C-c" 'save-buffers-kill-terminal)

(evil-leader/set-key-for-mode 'python-mode "." 'elpy-goto-definition)
(evil-leader/set-key-for-mode 'python-mode "," 'elpy-goto-assignment)


;; ivy counsel swiper
(ivy-mode 1)
(setq ivy-use-virtual-buffers t
      enable-recursive-minibuffers t
      ivy-height 12)
(setq ivy-re-builders-alist
      '((swiper . ivy--regex-plus)
        (t      . ivy--regex-fuzzy)))
(global-set-key (kbd "C-s") 'swiper)
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-x C-b") 'ivy-switch-buffer)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)
(global-set-key (kbd "M-y") 'counsel-yank-pop)

(global-set-key (kbd "C-z v") 'ivy-push-view)
(global-set-key (kbd "C-z V") 'ivy-pop-view)
;; (define-key minibuffer-local-map (kbd "C-r") 'counsel-minibuffer-history)

(global-set-key (kbd "M-g g") 'avy-goto-char-2)
(global-set-key (kbd "M-g f") 'avy-goto-line)

(counsel-projectile-mode t)

;; projectile
;; (projectile-mode)
(setq projectile-switch-project-action 'neotree-projectile-action)


;; company-mode
(add-hook 'after-init-hook 'global-company-mode)
(add-to-list 'company-backends 'company-yasnippet t)
(eval-after-load 'company
  '(progn
     (setq company-tooltip-minimum 8
           company-show-numbers t)
     (define-key company-active-map (kbd "M-i") 'company-complete-common-or-cycle)
     (define-key company-active-map (kbd "<tab>") 'company-complete-common-or-cycle)))

(defun indent-or-complete ()
  (interactive)
  (if (looking-at "\\_>")
      (company-complete-common)
    (indent-according-to-mode)))

(defun complete-or-indent ()
  (interactive)
  (if (company-manual-begin)
      (company-complete-common)
    (indent-according-to-mode)))
(global-set-key (kbd "M-i") 'indent-or-complete)
;; (global-set-key (kbd "M-i") 'complete-or-indent)

(custom-set-faces
 '(company-preview
   ((t (:foreground "darkgray" :underline t))))
 '(company-preview-common
   ((t (:inherit company-preview))))
 '(company-tooltip
   ((t (:background "lightgray" :foreground "black"))))
 '(company-tooltip-selection
   ((t (:background "steelblue" :foreground "white"))))
 '(company-tooltip-common
   ((((type x)) (:inherit company-tooltip :weight bold))
    (t (:inherit company-tooltip))))
 '(company-tooltip-common-selection
   ((((type x)) (:inherit company-tooltip-selection :weight bold))
    (t (:inherit company-tooltip-selection)))))

(when (not (eq window-system nil))
  (company-quickhelp-mode))


;; python jedi elpy
(defun my/python-mode-conf ()
  (setenv "IPY_TEST_SIMPLE_PROMPT" "1")
  (setq python-indent-offset 4
        python-indent 4
        indent-tabs-mode nil

        ;; TODO 设置 run-python 的参数
        python-shell-exec-path "~/.emacs.d/.python-environments/jedi/bin"
        python-shell-virtualenv-root "~/.emacs.d/.python-environments/jedi"
        python-shell-interpreter "ipython"
        python-shell-interpreter-args "-i --simple-prompt"))
(add-hook 'python-mode-hook 'my/python-mode-conf)

(setq jedi:environment-root "jedi"
      jedi:complete-otn-dot t
      jedi:use-shortcuts t
      compandy-minimum-prefix-length 3
      company-transformers '(company-sort-by-occurrence)
      company-selection-wrap-around t)

(add-hook 'python-mode-hook
          (lambda ()
            (add-to-list 'exec-path (concat (getenv "HOME") "/.emacs.d/.python-environments/jedi/bin"))
            ;; (add-to-list 'company-backends 'company-jedi)
            'jedi:setup))

(elpy-enable)
(defalias 'workon 'pyvenv-workon)
(remove-hook 'elpy-modules 'elpy-module-flymake)
(add-hook 'elpy-mode-hook
          (lambda ()
            (flycheck-mode)
            (local-unset-key (kbd "M-<tab>"))
            (define-key elpy-mode-map (kbd "<C-return>") 'vi-open-line-below)
            (define-key elpy-mode-map (kbd "<C-S-return>") 'vi-open-line-above)
            (define-key elpy-mode-map (kbd "M-i") 'elpy-company-backend)
            (define-key elpy-mode-map (kbd "C-.") 'elpy-goto-definition)))


;; ================================================== ;;

;; =====
(require 'emmet-mode)
(add-hook 'sgml-mode-hook 'emmet-mode)
(add-hook 'css-mode-hook  'emmet-mode)
(add-hook 'web-mode-hook 'emmet-mode)
(setq emmet-preview-default nil)
(add-hook 'emmet-mode-hook
          (lambda ()
            (define-key emmet-mode-keymap (kbd "C-j") nil)
            (define-key emmet-mode-keymap (kbd "<C-return>") nil)
            (define-key emmet-mode-keymap (kbd "<M-return>") 'emmet-expand-line)
            (define-key emmet-mode-keymap (kbd "M-j") 'emmet-expand-line)))

;; =====
(require 'expand-region)
(global-set-key (kbd "C-=") 'er/expand-region)

;; ===== 与company-mode冲突
;; (require 'fill-column-indicator)
;; (setq-default fill-column 120)
;; (setq fci-rule-width 1)
;; (setq fci-rule-color "DimGray")
;; (define-globalized-minor-mode
;;   global-fci-mode fci-mode (lambda () (fci-mode 1)))
;; (global-fci-mode 1)

;; =====
;; (require 'flycheck)
;; (add-hook 'prog-mode-hook 'flycheck-mode)

;; =====
(require 'git-gutter)
(global-git-gutter-mode +1)
(custom-set-variables
 '(git-gutter:disabled-modes '(asm-mode image-mode)))

;; =====
(require 'highlight-symbol)
(custom-set-variables
 '(highlight-symbol-colors
   '("yellow" "DeepPink" "cyan" "MediumPurple1" "SpringGreen1" "DarkOrange" "HotPink1" "RoyalBlue1" "OliveDrab"))
 '(highlight-symbol-foreground-color "black")
 )
;; (global-set-key (kbd "C-z s") 'highlight-symbol-at-point)

;; =====
(require 'magit)
(global-set-key (kbd "C-c v") 'magit-status)

;; =====
(require 'minions)
(minions-mode 1)

;; =====
(require 'multiple-cursors)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C->") 'mc/mark-all-like-this)

;; =====
(require 'neotree)
(setq neo-autorefresh t)
(global-set-key (kbd "C-x C-z") 'neotree-toggle)

;; =====
(require 'pager)
(global-set-key (kbd "C-v") 'pager-page-down)
(global-set-key (kbd "M-v") 'pager-page-up)
(global-set-key (kbd "M-p") 'pager-row-up)
(global-set-key (kbd "M-n") 'pager-row-down)

;; =====
(require 'rainbow-delimiters)
(custom-set-faces
 '(rainbow-delimiters-depth-1-face ((t (:foreground "dark orange"))))
 '(rainbow-delimiters-depth-2-face ((t (:foreground "deep sky blue"))))
 '(rainbow-delimiters-depth-3-face ((t (:foreground "yellow"))))
 '(rainbow-delimiters-depth-4-face ((t (:foreground "orchid"))))
 '(rainbow-delimiters-depth-5-face ((t (:foreground "spring green"))))
 '(rainbow-delimiters-depth-6-face ((t (:foreground "sienna1")))))

;; =====
(require 'rainbow-mode)
(add-hook 'prog-mode-hook 'rainbow-mode)

;; =====
(require 'undo-tree)
(global-undo-tree-mode)                 ; C-x u
;; (global-set-key (kbd "C-z C-/") 'undo-tree-visualize)

;; yasnippet
(require 'yasnippet)
;; (yas-global-mode 1)
(yas-reload-all)
(add-hook 'prog-mode-hook #'yas-minor-mode)
