;; -*- mode: Emacs-Lisp -*-


;; define key-map C-z
(define-prefix-command 'ctl-z-map)
(global-set-key (kbd "C-z") 'ctl-z-map)

;; overwrite key-map M-o
(define-prefix-command 'alt-o-map)
(global-set-key (kbd "M-o") 'alt-o-map)
(global-set-key (kbd "M-o M-f") 'facemenu-keymap)


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


(global-set-key (kbd "C-z k") 'kill-buffer-and-window)
(global-set-key (kbd "C-z s") 'isearch-forward)

(global-set-key (kbd "M-o SPC") (kbd "C-x C-o"))
(global-set-key (kbd "M-o TAB") (kbd "C-x TAB"))
(global-set-key (kbd "M-o M-o") (kbd "C-c C-c"))
(global-set-key (kbd "M-o M-k") (kbd "C-c C-k"))
(global-set-key (kbd "M-o r") 'revert-buffer)

(global-set-key (kbd "M-O") (kbd "C-g"))
(global-set-key (kbd "C-0") 'universal-argument)
(global-set-key (kbd "<C-tab>") 'indent-for-tab-command)
(global-set-key (kbd "M-U") 'upcase-word)
(global-set-key (kbd "M-I") 'tab-to-tab-stop)
(global-set-key (kbd "C-x k") 'kill-this-buffer)
(global-set-key (kbd "M-,") 'xref-pop-marker-stack)
(global-set-key (kbd "M-.") 'xref-find-definitions)   ; default
(global-set-key (kbd "M-'") 'xref-find-references)

(global-set-key (kbd "M-^")
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
