;; -*- mode: Emacs-Lisp -*-

(require 'package)

;; elpa repos
;; (setq package-archives '(("gnu" . "https://elpa.gnu.org/packages/")
;;                          ("melpa-stable" . "https://stable.melpa.org/packages/")
;;                          ("melpa" . "https://melpa.org/packages/")))
;; (add-to-list 'package-archives '("org" . "https://orgmode.org/elpa/") t)

(setq package-archives '(("gnu" . "https://elpa.emacs-china.org/gnu/")
                         ("melpa-stable" . "https://elpa.emacs-china.org/melpa-stable/")
                         ("melpa" . "https://elpa.emacs-china.org/melpa/")
                         ("org" . "http://elpa.emacs-china.org/org/")))

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


;; === packages ===
(use-package no-littering
  :ensure t)


(use-package auto-package-update
  :ensure t
  :config
  (setq auto-package-update-delete-old-versions t
        auto-package-update-hide-results nil
        auto-package-update-interval 7)
  (auto-package-update-maybe))


(provide 'init-pkg)
