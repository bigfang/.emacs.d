;; -*- mode: Emacs-Lisp; lexical-binding: t; -*-*-


;; overwrite key-map M-o
(define-prefix-command 'alt-o-map)
(global-set-key (kbd "M-o") 'alt-o-map)
(define-key alt-o-map (kbd "M-f") 'facemenu-keymap)


;; Windows
(when (eq system-type 'windows-nt)
  (setq w32-pass-lwindow-to-system nil
        w32-pass-rwindow-to-system nil
        w32-lwindow-modifier 'super
        w32-rwindow-modifier 'super
        w32-pass-apps-to-system nil
        w32-apps-modifier 'hyper))

;; Mac OS X
(when (eq system-type 'darwin)
  ;; (setq dired-use-ls-dired nil)
  ;; (setq mac-allow-anti-aliasing t)
  (if (display-graphic-p)
      (setq mac-command-modifier 'meta
            mac-control-modifier 'control
            mac-option-modifier 'super
            mac-function-modifier 'hyper)))


(use-package kkp
  :ensure t
  :config
  (setq kkp-super-modifier 'meta
        kkp-alt-modifier 'super)
  (global-kkp-mode +1))


;; Terminal mouse scroll
(global-set-key (kbd "<mouse-3>") '(lambda ()
                                     (interactive)
                                     (yank)))
(unless (display-graphic-p)
  (define-key alt-o-map (kbd "x") 'xterm-mouse-mode)
  (global-set-key (kbd "<mouse-4>") '(lambda ()
                                       (interactive)
                                       (scroll-down 1)))
  (global-set-key (kbd "<mouse-5>") '(lambda ()
                                       (interactive)
                                       (scroll-up 1)))
  (global-set-key (kbd "<wheel-down>") '(lambda ()
                                          (interactive)
                                          (scroll-down 1)))
  (global-set-key (kbd "<wheel-up>") '(lambda ()
                                        (interactive)
                                        (scroll-up 1))))


(define-key alt-o-map (kbd "RET") (kbd "C-x C-o"))
(define-key alt-o-map (kbd "M-o") (kbd "C-c C-c"))
(define-key alt-o-map (kbd "M-k") (kbd "C-c C-k"))
(define-key alt-o-map (kbd "M-e") (kbd "C-c C-e"))
(define-key alt-o-map (kbd "M-q") (kbd "C-c C-q"))
(define-key alt-o-map (kbd "a") (kbd "C-M-a"))
(define-key alt-o-map (kbd "e") (kbd "C-M-e"))
(define-key alt-o-map (kbd "r") 'revert-buffer)
(define-key alt-o-map (kbd "k") 'kill-buffer-and-window)

(global-set-key (kbd "<C-left>")
                '(lambda (arg)
                   (interactive "p")
                   (beginning-of-line)
                   (hs-hide-level arg)))
(global-set-key (kbd "<C-right>") 'hs-show-block)
(global-set-key (kbd "C-r") 'universal-argument)
(global-set-key (kbd "M-/") 'hippie-expand)
(global-set-key (kbd "M-I") 'tab-to-tab-stop)
(global-set-key (kbd "M-U") 'upcase-word)
(global-set-key (kbd "M-V") 'scroll-down-command)
(global-set-key (kbd "M-2") (kbd "C-g"))
(global-set-key (kbd "M-,") 'xref-pop-marker-stack)
(global-set-key (kbd "M-.") 'xref-find-definitions)   ; default
(global-set-key (kbd "M-'") 'xref-find-references)

(global-set-key (kbd "H-i") 'erc)
(global-set-key (kbd "H-n") 'gnus)
(global-set-key (kbd "H-s") 'shell)
(global-set-key (kbd "H-e") 'eshell)
(global-set-key (kbd "H-w") 'eww)
(global-set-key (kbd "H-m") 'emms)


;; key chords
(key-chord-define-global "``" 'cycle-spacing)
(key-chord-define-global ";;" 'comment-line)
;; (key-chord-define-global ",," nil)
;; (key-chord-define-global ".." nil)
(key-chord-define-global "//" 'align-current)


(global-set-key (kbd "M-SPC") 'just-one-space) ; 切换输入法
(global-set-key (kbd "M-RET")
                '(lambda ()
                   (interactive)
                   (end-of-line)
                   (newline-and-indent)))
;; GUI only
(global-set-key (kbd "<S-return>")
                '(lambda ()
                   (interactive)
                   (forward-line -1)
                   (end-of-line)
                   (newline-and-indent)))
(global-set-key (kbd "<M-S-return>") 'delete-blank-lines)
(global-set-key (kbd "S-SPC") 'delete-horizontal-space)
(global-set-key (kbd "M-S-SPC") 'cycle-spacing)
(global-set-key (kbd "<C-tab>") 'indent-for-tab-command)


;; https://stackoverflow.com/a/40222318/2163429
(defun my/global-map-and-set-key (key command &optional prefix suffix)
  "`my/map-key' KEY then `global-set-key' KEY with COMMAND.
 PREFIX or SUFFIX can wrap the key when passing to `global-set-key'."
  (my/map-key key)
  (global-set-key (kbd (concat prefix key suffix)) command))

(defun my/map-key (key)
  "Map KEY from escape sequence \"\e[emacs-KEY\."
  (define-key function-key-map (concat "\e[emacs-" key) (kbd key)))

(unless (display-graphic-p)
  (my/global-map-and-set-key "C-?" 'undo-tree-redo))


(provide 'init-kbd)
