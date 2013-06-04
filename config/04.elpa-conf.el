;; -*- mode: Emacs-Lisp -*-

;; Time-stamp: <BigFang 2013-06-04 14:50:54>


;;; Program languages

(require 'clojure-mode)

(require 'js2-mode)
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))
(add-to-list 'auto-mode-alist '("\\.json$" . js2-mode))


;; (require 'coffee-mode)

;; (require 'python-mode)
;; (setq auto-mode-alist (cons '("\\.py$" . python-mode) auto-mode-alist))
(setq interpreter-mode-alist (cons '("python" . python-mode)
                                   interpreter-mode-alist))
(autoload 'python-mode "python-mode" "Python editing mode." t)

;; (require 'haskell-mode)
;; (add-hook 'haskell-mode-hook 'turn-on-haskell-doc-mode)
;; (add-hook 'haskell-mode-hook 'turn-on-haskell-indentation)
;; (add-hook 'haskell-mode-hook 'turn-on-haskell-indent)
;; (add-hook 'haskell-mode-hook 'turn-on-haskell-simple-indent)


;;; elisp
(require 'anything-config)

;;============================;;
(require 'ascii)

;;============================;;
(require 'auto-complete)
(require 'auto-complete-config)
(ac-config-default)
(global-auto-complete-mode t)
(setq ac-auto-start 3)
(setq ac-auto-show-menu nil)
(define-key ac-mode-map (kbd "M-i") 'auto-complete)
(define-key ac-complete-mode-map (kbd "M-i") 'ac-next)
(define-key ac-complete-mode-map (kbd "<down>") 'next-line)
(define-key ac-complete-mode-map (kbd "<up>") 'previous-line)
(define-key ac-menu-map (kbd "M-n") 'ac-next)
(define-key ac-menu-map (kbd "M-p") 'ac-previous)
;; (define-key ac-completing-map (kbd "<tab>") 'ac-complete)
;; (define-key ac-completing-map (kbd "<return>") 'ac-stop)
(ac-set-trigger-key "TAB")
(add-hook 'cc-mode (lambda () (add-to-list 'ac-sources 'ac-source-semantic)))

;;============================;;
(require 'auto-highlight-symbol)
(global-auto-highlight-symbol-mode t)

;;============================;;
(require 'browse-kill-ring)
(browse-kill-ring-default-keybindings)
(setq browse-kill-ring-highlight-current-entry t)
(setq browse-kill-ring-separator "===")

;;============================;;
(require 'highlight-symbol)
;; (global-set-key (kbd "C-z s") 'highlight-symbol-at-point)

;;============================;;
(require 'magit)

;;============================;;
(require 'markdown-mode)

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
(global-rainbow-delimiters-mode)
;; (add-hook 'clojure-mode-hook 'rainbow-delimiters-mode)
(custom-set-faces
 ;; '(completions-common-part ((t (:inherit default :foreground "red"))))
 ;; '(diredp-compressed-file-suffix ((t (:foreground "#7b68ee"))))
 ;; '(diredp-ignored-file-name ((t (:foreground "#aaaaaa"))))
 '(rainbow-delimiters-depth-1-face ((((background dark)) (:foreground "Salmon"))))
 '(rainbow-delimiters-depth-2-face ((((background dark)) (:foreground "cornflowerblue"))))
 '(rainbow-delimiters-depth-3-face ((((background dark)) (:foreground "orange"))))
 '(rainbow-delimiters-depth-4-face ((((background dark)) (:foreground "purple"))))
 '(rainbow-delimiters-depth-5-face ((((background dark)) (:foreground "green"))))
 '(rainbow-delimiters-depth-6-face ((((background dark)) (:foreground "yellow"))))
 '(rainbow-delimiters-depth-7-face ((((background dark)) (:foreground "brown"))))
 '(rainbow-delimiters-depth-8-face ((((background dark)) (:foreground "magenta"))))
 '(rainbow-delimiters-depth-9-face ((((background dark)) (:foreground "cyan")))))

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
(require 'yaml-mode)

;;============================;;
(require 'yasnippet)
(yas-global-mode 1)
(require 'dropdown-list)
(setq yas-prompt-functions '(yas-dropdown-prompt
                             yas-ido-prompt
                             yas-completing-prompt)
      ;; yas-expand-from-trigger-key "<tab>"
      ;; yas-root-directory "~/.emacs.d/snippets"
      yas-use-menu 'abbreviate)

;; (yas-load-directory yas-root-directory)
