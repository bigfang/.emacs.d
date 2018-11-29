;; -*- mode: Emacs-Lisp -*-


(use-package dockerfile-mode
  :ensure t)

(use-package docker
  :ensure t
  :after evil
  :bind ("C-z d" . docker)
  :config
  (evil-set-initial-state 'docker-image-mode 'emacs)
  (evil-set-initial-state 'docker-container-mode 'emacs)
  (evil-set-initial-state 'docker-machine-mode 'emacs)
  (evil-set-initial-state 'docker-network-mode 'emacs)
  (evil-set-initial-state 'docker-volume-mode 'emacs))


(use-package docker-compose-mode
  :ensure t)

(use-package docker-tramp
  :ensure t)


(provide 'conf-docker)
