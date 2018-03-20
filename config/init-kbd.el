;; -*- mode: Emacs-Lisp -*-


;; define key-map C-z
(define-prefix-command 'ctl-z-map)
(global-set-key (kbd "C-z") 'ctl-z-map)


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
  (setq dired-use-ls-dired nil)
  (setq mac-command-modifier 'meta
        mac-control-modifier 'control
        mac-option-modifier 'super
        ns-function-modifier 'hyper))


;; Terminal
(unless window-system
  (load-theme 'wombat t)
  (menu-bar-mode -1))

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


(global-set-key (kbd "C-z r") 'revert-buffer)
(global-set-key (kbd "C-z M-ESC") 'suspend-frame)
(global-set-key (kbd "C-z k") 'kill-this-buffer)
(global-set-key (kbd "C-z s") 'isearch-forward)
(global-set-key (kbd "C-z C-z") 'toggle-rot13-mode)

(global-set-key (kbd "C-`") 'toggle-truncate-lines)
(global-set-key (kbd "<C-tab>") 'indent-for-tab-command)
(global-set-key (kbd "M-I") 'tab-to-tab-stop)
(global-set-key (kbd "C-x k") 'kill-buffer-and-window)
(global-set-key (kbd "C-x j") 'ffap)
(global-set-key (kbd "C-M-]") 'align-entire)

(global-set-key (kbd "<s-up>") 'enlarge-window)
(global-set-key (kbd "<s-down>") 'shrink-window)
(global-set-key (kbd "<s-left>") 'shrink-window-horizontally)
(global-set-key (kbd "<s-right>") 'enlarge-window-horizontally)

(global-set-key (kbd "C-M-j")
                (lambda ()
                  (interactive)
                  (join-line -1)))


(global-set-key (kbd "H-i") 'erc)
(global-set-key (kbd "H-n") 'gnus)
(global-set-key (kbd "H-s") 'shell)
(global-set-key (kbd "H-e") 'eshell)
(global-set-key (kbd "H-w") 'eww)
(global-set-key (kbd "H-m") 'emms)


;; https://stackoverflow.com/a/40222318/2163429
(defun my/global-map-and-set-key (key command &optional prefix suffix)
  "`my/map-key' KEY then `global-set-key' KEY with COMMAND.
 PREFIX or SUFFIX can wrap the key when passing to `global-set-key'."
  (my/map-key key)
  (global-set-key (kbd (concat prefix key suffix)) command))

(defun my/map-key (key)
  "Map KEY from escape sequence \"\e[emacs-KEY\."
  (define-key function-key-map (concat "\e[emacs-" key) (kbd key)))


(provide 'init-kbd)
;;; init-kbd.el ends here
