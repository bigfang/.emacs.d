;; -*- mode: Emacs-Lisp; lexical-binding: t; -*-*-

(require 'package)

;; elpa repos
(setq package-archives '(("gnu" . "https://elpa.gnu.org/packages/")
                         ("melpa-stable" . "https://stable.melpa.org/packages/")
                         ("melpa" . "https://melpa.org/packages/")))
(add-to-list 'package-archives '("org" . "https://orgmode.org/elpa/") t)

(setq package-archives '(("gnu" . "https://mirror.nju.edu.cn/elpa/gnu/")
                         ("nogun" . "https://mirror.nju.edu.cn/elpa/nongnu/")
                         ;; ("melpa-stable" . "")
                         ("melpa" . "https://mirror.nju.edu.cn/elpa/melpa/")))

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

;; Install quelpa
(setq quelpa-update-melpa-p nil)
(unless (package-installed-p 'quelpa)
  (with-temp-buffer
    (url-insert-file-contents "https://raw.githubusercontent.com/quelpa/quelpa/master/quelpa.el")
    (eval-buffer)
    (quelpa-self-upgrade)))

(use-package quelpa-use-package
  :ensure t)


;; Mac OS exec-path
(use-package exec-path-from-shell
  :if (memq window-system '(mac ns))
  :ensure t
  :config
  (exec-path-from-shell-initialize))

;; disable signature check
(use-package gnu-elpa-keyring-update
  ;; :disabled
  :ensure t
  :init
  (setq package-check-signature nil))

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
  :disabled
  :ensure t
  :config
  (auto-package-update-at-time "12:10")
  (setq auto-package-update-delete-old-versions t
        auto-package-update-prompt-before-update t
        auto-package-update-hide-results nil
        auto-package-update-interval 2)
  (auto-package-update-maybe))


(provide 'init-pkg)
