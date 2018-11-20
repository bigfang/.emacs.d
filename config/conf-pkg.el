;; -*- mode: Emacs-Lisp -*-

(require 'package)

;; elpa repos
(setq package-archives '(("gnu"   . "https://elpa.gnu.org/packages/")
                         ("melpa-stable" . "https://stable.melpa.org/packages/")
                         ("melpa" . "https://melpa.org/packages/")))
;; (add-to-list 'package-archives '("org" . "https://orgmode.org/elpa/") t)
;; (add-to-list 'package-archives '("marmalade" . "https://marmalade-repo.org/packages/") t)

;; (setq package-archives '(("gnu"   . "https://elpa.emacs-china.org/gnu/")
;;                          ("melpa-stable" . "https://elpa.emacs-china.org/melpa-stable/")
;;                          ("melpa" . "https://elpa.emacs-china.org/melpa/")))

(package-initialize)

;; Install use-package from melpa-stable
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile
  (setq use-package-verbose t
        use-package-enable-imenu-support t)
  (require 'use-package))
(require 'bind-key)


;; Mac OS exec-path
(use-package exec-path-from-shell
  :if (memq window-system '(mac ns))
  :ensure t
  :config
  (exec-path-from-shell-initialize))


;; ensure system package
(use-package use-package-ensure-system-package
  :ensure t)

;; key-chords
(use-package use-package-chords
  :ensure t
  :config (key-chord-mode 1))


(use-package emacs
  :bind (("M-n" . evil-scroll-line-down)
         ("M-p" . evil-scroll-line-up))
  :chords (";;" . comment-line))


;; === packages ===
(use-package paradox
  :ensure t
  :after evil
  :config
  (paradox-enable)
  (evil-define-key 'normal paradox-menu-mode-map (kbd "I") 'evil-insert-state)
  (evil-define-key 'normal paradox-menu-mode-map (kbd "n") 'paradox-next-entry)
  (evil-define-key 'normal paradox-menu-mode-map (kbd "p") 'paradox-previous-entry)
  (evil-define-key 'normal paradox-menu-mode-map (kbd "q") 'paradox-quit-and-close)
  (evil-define-key 'normal paradox-menu-mode-map (kbd "j") 'paradox-next-entry)
  (evil-define-key 'normal paradox-menu-mode-map (kbd "k") 'paradox-previous-entry)
  (evil-define-key 'normal paradox-menu-mode-map (kbd "i") 'package-menu-mark-install)
  (evil-define-key 'normal paradox-menu-mode-map (kbd "d") 'package-menu-mark-delete)
  (evil-define-key 'normal paradox-menu-mode-map (kbd "x") 'paradox-menu-execute)
  (evil-define-key 'normal paradox-menu-mode-map (kbd "r") 'paradox-menu--refresh)
  (evil-define-key 'normal paradox-menu-mode-map (kbd "v") 'paradox-menu-visit-homepage)
  (evil-define-key 'normal paradox-menu-mode-map (kbd "u") 'package-menu-mark-unmark)
  (evil-define-key 'normal paradox-menu-mode-map (kbd "U") 'package-menu-mark-upgrades)
  (evil-define-key 'normal paradox-menu-mode-map (kbd "l") 'paradox-menu-view-commit-list)
  (evil-define-key 'normal paradox-menu-mode-map (kbd "f") 'hydra-paradox-filter/body)
  (setq paradox-execute-asynchronously t))


(provide 'conf-pkg)
;;; conf-pkg.el ends here
