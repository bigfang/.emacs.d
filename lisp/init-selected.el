;; -*- mode: Emacs-Lisp -*-


(use-package selected
  :ensure t
  :demand
  :commands selected-minor-mode
  :init
  (setq selected-org-mode-map (make-sparse-keymap))
  :bind (:map selected-keymap
         ("SPC" . hydra:selected/body)
         ("q" . keyboard-quit)
         ("u" . undo)

         ("TAB" . untabify)
         ("<backtab>" . tabify)
         ("\\" . indent-rigidly)
         (";" . comment-or-uncomment-region)
         ("." . er/expand-region)
         (">" . mc/mark-next-like-this)
         ("<" . mc/mark-previous-like-this)
         ("?" . mc/mark-all-like-this)

         ("x" . kill-region)
         ("w" . kill-ring-save)
         ("S" . embrace-add)
         ("o" . exchange-point-and-mark)
         ("M-n" . move-text-down)
         ("M-p" . move-text-up)

         ("E" . eval-region)
         ("G" . google-this)
         ("f" . fill-region)
         ("l" . hydra:align/body)
         ("n" . narrow-to-region)

         :map selected-org-mode-map
         ("t" . org-table-convert-region))
  :init
  (add-hook 'activate-mark-hook
            '(lambda ()
               (define-key evil-normal-state-map (kbd "q") 'keyboard-quit)
               (define-key evil-motion-state-map (kbd "SPC") 'hydra:selected/body)))
  (add-hook 'deactivate-mark-hook
            '(lambda ()
               (define-key evil-normal-state-map "q" 'evil-record-macro)
               (define-key evil-motion-state-map (kbd "SPC") 'hydra:leader/body)))
  :config
  (use-package hydra-selected)

  (setq selected-minor-mode-override t)
  (selected-global-mode))


(provide 'init-selected)
