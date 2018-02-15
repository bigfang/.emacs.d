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
;; (require 'yaml-mode)

(require 'elixir-mode)
(require 'alchemist)
(setq alchemist-key-command-prefix (kbd "C-c ."))
(setq alchemist-mix-env "dev")


;; ================================================== ;;

;; ivy counsel swiper
(ivy-mode 1)
(setq ivy-use-virtual-buffers t
      enable-recursive-minibuffers t
      ivy-height 15)
(setq ivy-re-builders-alist
      '((swiper . ivy--regex-plus)
        (t      . ivy--regex-fuzzy)))
(global-set-key (kbd "C-s") 'swiper)
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-x C-b") 'ivy-switch-buffer)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)
(global-set-key (kbd "M-y") 'counsel-yank-pop)

(global-set-key (kbd "C-c v") 'ivy-push-view)
(global-set-key (kbd "C-c V") 'ivy-pop-view)
;; (define-key minibuffer-local-map (kbd "C-r") 'counsel-minibuffer-history)

(global-set-key (kbd "C-z C-g") 'avy-goto-char-2)
(global-set-key (kbd "M-g f") 'avy-goto-line)


;; company-mode
(add-hook 'after-init-hook 'global-company-mode)
(add-to-list 'company-backends 'company-yasnippet)
(eval-after-load 'company
  '(progn
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
(global-set-key (kbd "M-i") 'complete-or-indent)
(global-set-key (kbd "<tab>") 'indent-or-complete)


(require 'color)
(let ((bg (face-attribute 'default :background)))
  (custom-set-faces
   `(company-tooltip ((t (:inherit default :background ,(color-lighten-name bg 2)))))
   `(company-scrollbar-bg ((t (:background ,(color-lighten-name bg 10)))))
   `(company-scrollbar-fg ((t (:background ,(color-lighten-name bg 5)))))
   `(company-tooltip-selection ((t (:inherit font-lock-function-name-face))))
   `(company-tooltip-common ((t (:inherit font-lock-constant-face))))))


;; yasnippet
(require 'yasnippet)
;; (yas-global-mode 1)
(yas-reload-all)
(add-hook 'prog-mode-hook #'yas-minor-mode)


;; ================================================== ;;

(require 'diredful)
(diredful-mode 1)

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
(global-set-key (kbd "M-SPC") 'er/expand-region)

;; =====
(require 'fill-column-indicator)
(setq-default fill-column 120)
(setq fci-rule-width 1)
(setq fci-rule-color "DimGray")
(define-globalized-minor-mode
  global-fci-mode fci-mode (lambda () (fci-mode 1)))
(global-fci-mode 1)

;; =====
;; (require 'flycheck)
;; (if (fboundp 'global-flycheck-mode)
;;     (global-flycheck-mode +1)
;;   (add-hook 'prog-mode-hook 'flycheck-mode))

;; =====
(require 'highlight-symbol)
;; (global-set-key (kbd "C-z s") 'highlight-symbol-at-point)

;; =====
(require 'magit)

;; =====
(require 'multiple-cursors)
(global-set-key (kbd "C-c C-C") 'mc/edit-lines)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C->") 'mc/mark-all-like-this)

;; =====
(require 'neotree)
(global-set-key (kbd "C-x C-z") 'neotree-toggle)

;; =====
(require 'pager)
(global-set-key (kbd "C-v") 'pager-page-down)
(global-set-key (kbd "M-v") 'pager-page-up)
(global-set-key (kbd "M-p") 'pager-row-up)
(global-set-key (kbd "M-n") 'pager-row-down)

;; =====
(require 'pretty-lambdada)
(pretty-lambda-for-modes)
(pretty-lambda 'python-mode)
(pretty-lambda 'ruby-mode)
(pretty-lambda 'haskell-mode)

;; =====
(require 'rainbow-delimiters)
(rainbow-delimiters-mode)
(add-hook 'clojure-mode-hook 'rainbow-delimiters-mode)
(add-hook 'js2-mode-hook 'rainbow-delimiters-mode)
(add-hook 'lisp-mode-hook 'rainbow-delimiters-mode)
(add-hook 'lisp-interaction-mode 'rainbow-delimiters-mode)
;; (custom-set-faces
;;  ;; '(completions-common-part ((t (:inherit default :foreground "red"))))
;;  ;; '(diredp-compressed-file-suffix ((t (:foreground "#7b68ee"))))
;;  ;; '(diredp-ignored-file-name ((t (:foreground "#aaaaaa"))))
;;  '(rainbow-delimiters-depth-1-face ((((background dark)) (:foreground "Salmon"))))
;;  '(rainbow-delimiters-depth-2-face ((((background dark)) (:foreground "cornflowerblue"))))
;;  '(rainbow-delimiters-depth-3-face ((((background dark)) (:foreground "orange"))))
;;  '(rainbow-delimiters-depth-4-face ((((background dark)) (:foreground "purple"))))
;;  '(rainbow-delimiters-depth-5-face ((((background dark)) (:foreground "green"))))
;;  '(rainbow-delimiters-depth-6-face ((((background dark)) (:foreground "yellow"))))
;;  '(rainbow-delimiters-depth-7-face ((((background dark)) (:foreground "brown"))))
;;  '(rainbow-delimiters-depth-8-face ((((background dark)) (:foreground "magenta"))))
;;  '(rainbow-delimiters-depth-9-face ((((background dark)) (:foreground "cyan")))))

;; =====
(require 'rainbow-mode)
(add-hook 'css-mode-hook 'rainbow-mode)
(add-hook 'html-mode-hook 'rainbow-mode)
;; (dolist (rainbow-hook '(css-mode-hook
;;                         html-mode-hook))
;;   (add-hook rainbow-hook (lambda () (rainbow-mode t))))

;; =====
(require 'session)
(add-hook 'after-init-hook 'session-initialize)
(setq session-save-file "~/.emacs.d/.emacs.session")

;; =====
(require 'smarter-compile)
(add-to-list 'smart-compile-alist
             '("\\.py$" . "python %f"))
(add-to-list 'smart-compile-alist
             '("\\.js$" . "node %f"))
(global-set-key (kbd "C-z C-x") 'smarter-compile)

;; =====
(require 'undo-tree)
(global-undo-tree-mode)
(global-set-key (kbd "C-z C-_") 'undo-tree-visualize)
(global-set-key (kbd "C-z C-/") 'undo-tree-visualize)
