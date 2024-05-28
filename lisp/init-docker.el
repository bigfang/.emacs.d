;; -*- mode: Emacs-Lisp; lexical-binding: t; -*-*-


(use-package dockerfile-mode
  :ensure t
  :defer t)

(use-package docker
  :ensure t
  :after evil
  :bind ("M-o d" . docker)
  :config
  (evil-set-initial-state 'docker-image-mode 'emacs)
  (evil-set-initial-state 'docker-container-mode 'emacs)
  (evil-set-initial-state 'docker-machine-mode 'emacs)
  (evil-set-initial-state 'docker-network-mode 'emacs)
  (evil-set-initial-state 'docker-volume-mode 'emacs))


(use-package docker-compose-mode
  :ensure t
  :defer t)


(provide 'init-docker)
