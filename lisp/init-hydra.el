;; -*- mode: Emacs-Lisp; lexical-binding: t; -*-*-


(use-package hydra
  :ensure t
  :bind (("C-`" . hydra:leader/body)
         ("C-~" . hydra:captain/body)
         :map evil-motion-state-map
         ("SPC" . hydra:leader/body)
         ("RET" . hydra:captain/body))
  :config
  (use-package hydra-builtin)
  (use-package hydra-dired)
  (use-package hydra-ibuffer)
  (use-package hydra-info)
  (use-package hydra-macro)
  (use-package hydra-rectangle)

  (use-package hydra-org)
  (use-package hydra-projectile)
  (use-package hydra-lsp)
  (use-package hydra-alchemist)
  (use-package hydra-pdf)

  (use-package hydra-abo)
  (use-package hydra-git)
  (use-package hydra-ui)

  (use-package hydra-adapter)

  (use-package hydra-leader)
  (use-package hydra-captain))


(provide 'init-hydra)
