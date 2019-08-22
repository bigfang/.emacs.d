;; -*- mode: Emacs-Lisp -*-


(defun my/narrow-selected-dwim (start end)
  "Restrict editing in this buffer to the current region, indirectly."
  (interactive "r")
  (deactivate-mark)
  (let ((buf (clone-indirect-buffer "*Clone*" t)))
    (with-current-buffer buf
      (if (eq start end)
          (narrow-to-defun)
        (narrow-to-region start end)))
    (switch-to-buffer buf)))

(defun my/narrow-dwim (start end)
  (interactive "r")
  (if (buffer-narrowed-p)
      (if (string-prefix-p "*Clone*" (buffer-name))
          (kill-buffer-and-window)
        (widen))
    (if (eq start end)
        (hydra:narrow/body)
      (my/narrow-selected-dwim start end))))


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
  :bind (:map selected-keymap
         ("SPC" . hydra:selected/body)
         ("q" . (lambda () (interactive) (evil-normal-state) (keyboard-quit)))
         ("u" . undo)

         ("TAB" . tabify)
         ("<backtab>" . untabify)
         ("=" . count-words-region)
         ("\\" . indent-region)
         ("/" . indent-rigidly)
         (";" . comment-or-uncomment-region)
         ("." . er/expand-region)

         ("m" . mc/mark-all-in-region-regexp)
         (">" . mc/mark-next-like-this)
         ("<" . mc/mark-previous-like-this)
         ("?" . mc/mark-all-like-this)
         ("," . hydra:multiple-cursors/body)

         ("x" . kill-region)
         ("w" . kill-ring-save)
         ("s" . embrace-add)
         ("o" . exchange-point-and-mark)
         ("M-n" . move-text-down)
         ("M-p" . move-text-up)

         ("E" . eval-region)
         ("g" . google-this)
         ("f" . fill-region)
         ("l" . hydra:align/body)
         ("n" . my/narrow-selected-dwim)

         :map selected-org-mode-map
         ("t" . org-table-convert-region))
  :config
  (use-package hydra-selected)

  (setq selected-minor-mode-override t)
  (selected-global-mode))


(provide 'init-selected)
