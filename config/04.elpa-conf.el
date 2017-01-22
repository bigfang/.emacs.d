;; -*- mode: Emacs-Lisp -*-


;;; Program languages
(require 'clojure-mode)
(require 'js2-mode)
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))
(define-key js2-mode-map (kbd "<return>") 'newline-and-indent)
;; (define-key js2-mode-map (kbd "<backspace>") 'c-electric-backspace)
;; (define-key js2-mode-map (kbd "C-d") 'c-electric-delete-forward)
(require 'json-mode)
(require 'json-reformat)
(define-key json-mode-map (kbd "C-c C-f") 'json-reformat-region)
(require 'yaml-mode)


;;; elisp
(require 'helm-config)

;;============================;;
(require 'ascii)

;;============================;;
(require 'auto-complete)
(require 'auto-complete-config)
(ac-config-default)
(setq ac-sources '(ac-source-abbrev
                   ac-source-yasnippet
                   ac-source-filename
                   ac-source-words-in-same-mode-buffers
                   ac-source-css-property
                   ac-source-features
                   ac-source-functions
                   ac-source-variables
                   ac-source-symbols
                   ac-source-dictionary))
(global-auto-complete-mode t)
(setq ac-auto-start 3)
(setq ac-auto-show-menu t)
(define-key ac-mode-map (kbd "M-i") 'auto-complete)
(define-key ac-complete-mode-map (kbd "M-i") 'ac-next)
(define-key ac-complete-mode-map (kbd "<down>") 'next-line)
(define-key ac-complete-mode-map (kbd "<up>") 'previous-line)
(define-key ac-menu-map (kbd "M-n") 'ac-next)
(define-key ac-menu-map (kbd "M-p") 'ac-previous)
(define-key ac-completing-map (kbd "<return>") 'ac-complete)
;; (define-key ac-completing-map (kbd "<return>") 'ac-stop)
(ac-set-trigger-key "TAB")
(add-hook 'cc-mode (lambda () (add-to-list 'ac-sources 'ac-source-semantic)))

;;============================;;
(require 'browse-kill-ring)
(browse-kill-ring-default-keybindings)
(setq browse-kill-ring-highlight-current-entry t)
(setq browse-kill-ring-separator "===")

;;============================;;
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
;; (require 'ac-emmet)
;; (add-hook 'sgml-mode-hook 'ac-emmet-html-setup)
;; (add-hook 'css-mode-hook 'ac-emmet-css-setup)

;;============================;;
(require 'fill-column-indicator)
(set-fill-column 80)
(setq fci-rule-width 1)
(setq fci-rule-color "DimGray")
(define-globalized-minor-mode
  global-fci-mode fci-mode (lambda () (fci-mode 1)))
(global-fci-mode 1)

;;============================;;
;; (rqquire 'flycheck)
(if (fboundp 'global-flycheck-mode)
    (global-flycheck-mode +1)
  (add-hook 'prog-mode-hook 'flycheck-mode))

;;============================;;
(require 'highlight-symbol)
;; (global-set-key (kbd "C-z s") 'highlight-symbol-at-point)

;;============================;;
(require 'magit)

;;============================;;
(require 'pager)
(global-set-key (kbd "C-v") 'pager-page-down)
(global-set-key (kbd "M-v") 'pager-page-up)
(global-set-key (kbd "C-p") 'pager-row-up)
(global-set-key (kbd "C-n") 'pager-row-down)

;;============================;;
(require 'pretty-lambdada)
(pretty-lambda-for-modes)
(pretty-lambda 'python-mode)
(pretty-lambda 'ruby-mode)
(pretty-lambda 'haskell-mode)

;;============================;;
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

;;============================;;
(require 'rainbow-mode)
(add-hook 'css-mode-hook 'rainbow-mode)
(add-hook 'html-mode-hook 'rainbow-mode)
;; (dolist (rainbow-hook '(css-mode-hook
;;                         html-mode-hook))
;;   (add-hook rainbow-hook (lambda () (rainbow-mode t))))

;;============================;;
(require 'rect-mark)
;; Support for marking a rectangle of text with highlighting.
(global-set-key (kbd "C-x r C-`") 'rm-set-mark)
(global-set-key (kbd "C-x r C-x") 'rm-exchange-point-and-mark)
(global-set-key (kbd "C-x r C-w") 'rm-kill-region)
(global-set-key (kbd "C-x r M-w") 'rm-kill-ring-save)
;; (global-set-key (kbd "<S-down-mouse-1>") 'rm-mouse-drag-region)
(autoload 'rm-set-mark "rect-mark"
  "Set mark for rectangle." t)
(autoload 'rm-exchange-point-and-mark "rect-mark"
  "Exchange point and mark for rectangle." t)
(autoload 'rm-kill-region "rect-mark"
  "Kill a rectangular region and save it in the kill ring." t)
(autoload 'rm-kill-ring-save "rect-mark"
  "Copy a rectangular region to the kill ring." t)
(autoload 'rm-mouse-drag-region "rect-mark"
  "Drag out a rectangular region with the mouse." t)

;;============================;;
(require 'smarter-compile)
(add-to-list 'smart-compile-alist
             '("\\.py$" . "python %f"))
(add-to-list 'smart-compile-alist
             '("\\.js$" . "node %f"))
(global-set-key (kbd "C-z C-x") 'smarter-compile)

;;============================;;
(require 'session)
(add-hook 'after-init-hook 'session-initialize)
(setq session-save-file "~/.emacs.d/.emacs.session")

;;============================;;
(require 'undo-tree)
(global-undo-tree-mode)
(global-set-key (kbd "C-z C-/") 'undo-tree-visualize)

;;============================;;
;; (require 'web-mode)
;; (add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
;; (setq web-mode-markup-indent-offset 2)
;; (setq web-mode-css-indent-offset 2)
;; (setq web-mode-code-indent-offset 2)
;; (setq web-mode-enable-current-element-highlight t)
;; (setq web-mode-enable-current-column-highlight t)
;; (add-hook 'web-mode-hook #'(lambda () (set (make-local-variable 'yas-extra-modes) 'html-mode)))
;; (defun yas-web-mode-fix ()
;;   (if (string= major-mode "web-mode")
;;       (progn
;;         (web-mode-buffer-refresh)
;;         (indent-for-tab-command))))
;; (setq yas/after-exit-snippet-hook 'yas-web-mode-fix)

;;============================;;
(require 'yasnippet)
(yas-global-mode 1)
(setq yas-prompt-functions '(yas-dropdown-prompt
                             yas-ido-prompt
                             yas-completing-prompt)
      ;; yas-expand-from-trigger-key "<tab>"
      ;; yas-root-directory "~/.emacs.d/snippets"
      yas-use-menu 'abbreviate)
;; (yas-load-directory yas-root-directory)
