;; -*- mode: Emacs-Lisp -*-


;; define key-map C-z
(define-prefix-command 'ctl-z-map)
(global-set-key (kbd "C-z") 'ctl-z-map)

;; Terminal mouse scroll
(unless window-system
  (global-set-key (kbd "C-z x") 'xterm-mouse-mode)
  (global-set-key (kbd "<mouse-4>") (lambda ()
                                      (interactive)
                                      (scroll-down 1)))
  (global-set-key (kbd "<mouse-5>") (lambda ()
                                      (interactive)
                                      (scroll-up 1)))
  (global-set-key (kbd "<wheel-down>") (lambda ()
                                         (interactive)
                                         (scroll-down 1)))
  (global-set-key (kbd "<wheel-up>") (lambda ()
                                       (interactive)
                                       (scroll-up 1))))


(defun my/global-map-and-set-key (key command &optional prefix suffix)
  "`my/map-key' KEY then `global-set-key' KEY with COMMAND.
 PREFIX or SUFFIX can wrap the key when passing to `global-set-key'."
  (my/map-key key)
  (global-set-key (kbd (concat prefix key suffix)) command))

(defun my/map-key (key)
  "Map KEY from escape sequence \"\e[emacs-KEY\."
  (define-key function-key-map (concat "\e[emacs-" key) (kbd key)))

;; 需要配合 iTerm2 进行 key mapping
;; https://stackoverflow.com/a/40222318/2163429
;; (my/global-map-and-set-key "C-=" 'er/expand-region)
;; (my/global-map-and-set-key "C--" 'er/contract-region)
;; (my/global-map-and-set-key "C->" 'mc/mark-next-like-this)
;; (my/global-map-and-set-key "C-<" 'mc/mark-previous-like-this)
;; (my/global-map-and-set-key "C-c C->" 'mc/mark-all-like-this)

(define-prefix-command 'apps-map)
(global-set-key (kbd "<apps>") 'apps-map)
(global-set-key (kbd "<apps> i") 'erc)
(global-set-key (kbd "<apps> n") 'gnus)
(global-set-key (kbd "<apps> d") 'ediff)
(global-set-key (kbd "<apps> s") 'shell)
(global-set-key (kbd "<apps> S") 'eshell)
(global-set-key (kbd "<apps> m") 'emms)
(global-set-key (kbd "<apps> o") 'org-mode)

;; (global-set-key (kbd "C-z <f5>") 'revert-buffer)
(global-set-key (kbd "C-z M-ESC") 'suspend-frame)
(global-set-key (kbd "C-z k") 'kill-this-buffer)

(global-set-key (kbd "C-`") 'toggle-truncate-lines)
(global-set-key (kbd "<C-tab>") 'indent-for-tab-command)
(global-set-key (kbd "M-I") 'tab-to-tab-stop)
(global-set-key (kbd "C-x k") 'kill-buffer-and-window)
(global-set-key (kbd "C-x j") 'ffap)
(global-set-key (kbd "C-M-]") 'align-entire)
(global-set-key (kbd "M-SPC") 'set-mark-command)

(global-set-key (kbd "<S-up>") 'enlarge-window)
(global-set-key (kbd "<S-down>") 'shrink-window)
(global-set-key (kbd "<S-left>") 'shrink-window-horizontally)
(global-set-key (kbd "<S-right>") 'enlarge-window-horizontally)

(global-set-key (kbd "C-M-j")
                (lambda ()
                  (interactive)
                  (join-line -1)))

;; key-chord
(require 'key-chord)
(key-chord-mode 1)
;; (key-chord-define-global "uu" 'undo)
(key-chord-define-global "``" 'highlight-symbol-at-point)
(key-chord-define-global "DD" 'kill-current-line)
(key-chord-define-global ";;" 'comment-or-uncomment-current-line-or-region)
;; (key-chord-define-global "00" 'vi-open-line-below)
