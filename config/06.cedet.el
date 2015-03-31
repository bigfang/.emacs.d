;; -*- mode: Emacs-Lisp -*-
;; Time-stamp: <BigFang 2015-03-31 23:04:36>


;; CC-mode
(require 'cc-mode)
(add-hook 'c-mode-common-hook
          '(lambda ()
	     (require 'xcscope)
             (c-toggle-hungry-state t)
             (setq default-tab-width 4
                   c-default-style "k&r"
                   indent-tabs-mode nil
                   c-basic-offset tab-width
                   comment-style 'extra-line)))
;;    (hs-minor-mode t)
;; (add-to-list 'c-cleanup-list 'scope-operator)
;; (add-to-list 'c-cleanup-list 'defun-close-semi)
;; (add-to-list 'c-cleanup-list 'list-close-comma)
;; (add-to-list 'c-cleanup-list 'brace-else-brace)
;; (add-to-list 'c-cleanup-list 'brace-elseif-brace)
;; (add-to-list 'c-cleanup-list 'compact-empty-funcall)))

(define-key c-mode-base-map (kbd "RET") 'newline-and-indent)

;; gud
(gud-tooltip-mode)
(setq gdb-many-windows t)
;; (add-hook 'gdb-mode-hook
;;    '(lambda ()
;;       (local-set-key (kbd "<f12>") 'toggle-tool-bar-mode-from-frame)
;;       ))


(require 'cedet)
(require 'semantic)
;;(require 'semantic-ia)
;;(require 'semantic-gcc)
;;(require 'semantic-util-modes)
(semantic-mode t)
(global-ede-mode t)

;; (semantic-load-enable-minimum-features)
;; (semantic-load-enable-code-helpers)
;; (semantic-load-enable-guady-code-helpers)
;; (semantic-load-enable-excessive-code-helpers)
;; (semantic-load-enable-semantic-debugging-helpers)

;; (semantic-stickyfunc-mode)
;; (semantic-highlight-func-mode 1)
;; (semantic-idle-tag-highlight-mode)
;; (setq semantic-decoration-on-*-members nil)
;; (setq which-func-mode nil)
;; (global-semantic-tag-folding-mode 1)

;; (define-key c-mode-base-map (kbd "<C-return>") 'semantic-ia-complete-symbol)
(define-key c-mode-base-map (kbd "C-z z") 'eassist-switch-h-cpp)
(global-set-key (kbd "<f12>") 'semantic-ia-fast-jump)

;; (setq semanticdb-project-roots (list (expand-file-name "/")))
(defconst cedet-user-include-dirs
  (list ".." "../include" "../inc"
        "../.." "../../include" "../../inc"))
(defconst cedet-win32-include-dirs
  (list "D:/MinGW/include"
        "D:/MinGW/include/c++/3.4.5"
        "D:/MinGW/include/c++/3.4.5/mingw32"
        "D:/MinGW/include/c++/3.4.5/backward"
        "D:/MinGW/lib/gcc/mingw32/3.4.5/include"))
(require 'semantic-c nil 'noerror)
(let ((include-dirs cedet-user-include-dirs))
  (when (eq system-type 'windows-nt)
    (setq include-dirs (append include-dirs cedet-win32-include-dirs)))
  (mapc (lambda (dir)
          (semantic-add-system-include dir 'c++-mode)
          (semantic-add-system-include dir 'c-mode))
        include-dirs))

;; ecb
;; (add-to-list 'load-path "~/.emacs.d/plugins/ecb")
;; (load-file "~/.emacs.d/plugins/ecb/ecb.el")
;; (require 'ecb)
;; (setq ecb-compile-window-height 8
;;       ecb-tip-of-the-day nil
;;       ecb-layout-name "leftright2"
;;       ecb-windows-width 0.2)
;; (global-set-key (kbd "<apps> B") 'ecb-activate)
;; (global-set-key (kbd "<apps> b") 'ecb-deactivate)
