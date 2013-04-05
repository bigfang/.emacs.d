;; -*- mode: Emacs-Lisp -*-

;; Time-stamp: <BigFang 2013-04-05 10:56:16>

;; key binding
(when (eq window-system 'w32)
  (setq w32-pass-lwindow-to-system nil
        w32-pass-rwindow-to-system nil
        w32-lwindow-modifier 'super
        w32-rwindow-modifier 'super))
;; w32-pass-apps-to-system nil
;; w32-apps-modifier 'hyper))

(define-prefix-command 'apps-map)
(global-set-key (kbd "<apps>") 'apps-map)
(global-set-key (kbd "<apps> i") 'erc)
(global-set-key (kbd "<apps> n") 'gnus)
(global-set-key (kbd "<apps> d") 'ediff)
(global-set-key (kbd "<apps> s") 'shell)
(global-set-key (kbd "<apps> S") 'eshell)
(global-set-key (kbd "<apps> m") 'emms)
(global-set-key (kbd "<apps> o") 'org-mode)

(define-prefix-command 'ctl-z-map)
(global-set-key (kbd "C-z") 'ctl-z-map)
;; (global-set-key (kbd "C-z <f5>") 'revert-buffer)
(global-set-key (kbd "C-z C-z") 'speedbar)
(global-set-key (kbd "C-z M-ESC") 'suspend-frame)
(global-set-key (kbd "C-z k") 'kill-this-buffer)
(global-set-key (kbd "C-z d") 'gdb)

(global-set-key (kbd "C-`") 'other-window)
(global-set-key (kbd "<C-tab>") 'indent-for-tab-command)
(global-set-key (kbd "M-I") 'tab-to-tab-stop)
(global-set-key (kbd "C-x k") 'kill-buffer-and-window)
(global-set-key (kbd "C-x j") 'ffap)
(global-set-key (kbd "C-M-]") 'align-entire)
(global-set-key (kbd "M-p") 'previous-line)
(global-set-key (kbd "M-n") 'next-line)

(global-set-key (kbd "<S-up>") 'enlarge-window)
(global-set-key (kbd "<S-down>") 'shrink-window)
(global-set-key (kbd "<S-left>") 'shrink-window-horizontally)
(global-set-key (kbd "<S-right>") 'enlarge-window-horizontally)
;; (windmove-default-keybindings)

(global-set-key (kbd "C-M-j")
                (lambda ()
                  (interactive)
                  (join-line -1)))

;; key-chord
(require 'key-chord)
(key-chord-mode 1)
(key-chord-define-global "uu" 'undo)
(key-chord-define-global "``" 'highlight-symbol-at-point)
(key-chord-define-global "dd" 'kill-current-line)
(key-chord-define-global ";;" 'comment-or-uncomment-current-line-or-region)
(key-chord-define-global "00" 'vi-open-line)
