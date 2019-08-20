;; -*- mode: Emacs-Lisp -*-


(use-package selected
  :ensure t
  :demand t
  :commands selected-minor-mode
  :init
  (setq selected-org-mode-map (make-sparse-keymap))
  (add-hook 'activate-mark-hook
            '(lambda ()
               ;; (define-key evil-normal-state-map (kbd "q") 'keyboard-quit)
               (define-key evil-motion-state-map (kbd "SPC") 'hydra:selected/body)))
  (add-hook 'deactivate-mark-hook
            '(lambda ()
               ;; (define-key evil-normal-state-map "q" 'keyboard-quit)
               (define-key evil-motion-state-map (kbd "SPC") 'hydra:leader/body)))

  (defun my/narrow-to-region-indirect (start end)
    "Restrict editing in this buffer to the current region, indirectly."
    (interactive "r")
    (deactivate-mark)
    (let ((buf (clone-indirect-buffer nil t)))
      (with-current-buffer buf
        (narrow-to-region start end))
      (switch-to-buffer buf)))
  (defun my/narrow-or-wide (start end)
    (interactive "r")
    (if (buffer-narrowed-p)
        (progn
          (widen)
          (recenter-top-bottom))
      (my/narrow-to-region-indirect start end)))
  :bind (:map selected-keymap
         ("SPC" . hydra:selected/body)
         ("q" . (lambda () (interactive) (evil-normal-state) (keyboard-quit)))
         ("u" . undo)

         ("TAB" . untabify)
         ("<backtab>" . tabify)
         ("=" . align-entire)
         ("\\" . indent-region)
         ("/" . indent-rigidly)
         (";" . comment-or-uncomment-region)
         ("." . er/expand-region)
         (">" . mc/mark-next-like-this)
         ("<" . mc/mark-previous-like-this)
         ("?" . mc/mark-all-like-this)

         ("x" . kill-region)
         ("w" . kill-ring-save)
         ("s" . embrace-add)
         ("o" . exchange-point-and-mark)
         ("M-n" . move-text-down)
         ("M-p" . move-text-up)

         ("E" . eval-region)
         ("G" . google-this)
         ("f" . fill-region)
         ("l" . hydra:align/body)
         ("n" . my/narrow-to-region-indirect)

         :map selected-org-mode-map
         ("t" . org-table-convert-region))
  :config
  (use-package hydra-selected)

  (setq selected-minor-mode-override t)
  (selected-global-mode))


(provide 'init-selected)
