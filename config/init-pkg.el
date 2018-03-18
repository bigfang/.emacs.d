;; -*- mode: Emacs-Lisp -*-

(require 'package)

;; elpa repos
(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/"))
(package-initialize)

;; Install use-package from melpa-stable
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
(add-to-list 'package-archives '("org" . "https://orgmode.org/elpa/") t)
;; (add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/") t)
(package-initialize)


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
