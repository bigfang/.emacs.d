;; -*- mode: Emacs-Lisp -*-



(use-package markdown-mode
  :ensure t)



;; === plugins ===


(use-package recent-jump
  :load-path "site-lisp/"
  :bind (("C-z ," . recent-jump-jump-backward)
         ("C-z ." . recent-jump-jump-forward))
  :init
  (setq recent-jump-threshold 4)
  (setq recent-jump-ring-length 10)
  )


(provide 'init-plugins)
;;; init-plugins.el ends here
