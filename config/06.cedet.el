;; -*- mode: Emacs-Lisp -*-

;; Time-stamp: <BigFang 2012-06-30 13:28:11>

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
