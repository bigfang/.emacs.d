;; -*- mode: Emacs-Lisp -*-

(require 'package)

;; elpa repos
(add-to-list 'package-archives '("org" . "https://orgmode.org/elpa/"))
(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
;; (add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/") t)
(package-initialize)


;; Install use-package
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile
  (require 'use-package)
  (setq use-package-verbose t))

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
  :chords (";;" . comment-line)
  :diminish (abbrev-mode)
)


(provide 'init-pkg)
;;; init-pkg.el ends here
