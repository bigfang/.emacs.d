;; -*- mode: Emacs-Lisp -*-

(require 'package)

;; elpa repos
;; (add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/"))
;; (add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
;; (add-to-list 'package-archives '("org" . "https://orgmode.org/elpa/") t)
;; (add-to-list 'package-archives '("marmalade" . "https://marmalade-repo.org/packages/") t)

(setq package-archives '(("gnu"   . "https://elpa.emacs-china.org/gnu/")
                         ("melpa-stable" . "https://elpa.emacs-china.org/melpa-stable/")
                         ("melpa" . "https://elpa.emacs-china.org/melpa/")))

(package-initialize)

;; Install use-package from melpa-stable
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))


(eval-when-compile
  (setq use-package-verbose t
        use-package-enable-imenu-support t)
  (require 'use-package))

;; key-chords
(use-package use-package-chords
  :ensure t
  :config (key-chord-mode 1))


;; Mac OS exec-path
(use-package exec-path-from-shell
  :if (memq window-system '(mac ns))
  :ensure t
  :config
  (exec-path-from-shell-initialize))


(use-package emacs
  :bind (("M-n" . evil-scroll-line-down)
         ("M-p" . evil-scroll-line-up))
  :chords (";;" . comment-line)
  :diminish (abbrev-mode)
)


(provide 'init-pkg)
;;; init-pkg.el ends here
