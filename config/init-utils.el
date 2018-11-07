;; -*- mode: Emacs-Lisp -*-


;; alpha
(defun my/emacs-alpha-up ()
  (interactive)
  (let ((my/emacs-alpha-value (frame-parameter nil 'alpha)))
    (setf (frame-parameter nil 'alpha) (if (<= (+ my/emacs-alpha-value 5) 100)
                                           (+ my/emacs-alpha-value 5)
                                         100))))
(defun my/emacs-alpha-down ()
  (interactive)
  (let ((my/emacs-alpha-value (frame-parameter nil 'alpha)))
    (setf (frame-parameter nil 'alpha) (if (>= (- my/emacs-alpha-value 5) 0)
                                           (- my/emacs-alpha-value 5)
                                         0))))
(global-set-key (kbd "<C-s-up>") 'my/emacs-alpha-up)
(global-set-key (kbd "<C-s-down>") 'my/emacs-alpha-down)


;; vi o, O
(defun vi-open-line-above ()
  (interactive)
  (unless (bolp)
    (beginning-of-line))
  (newline)
  (forward-line -1)
  (indent-according-to-mode))

(defun vi-open-line-below ()
  (interactive)
  (unless (eolp)
    (end-of-line))
  (newline-and-indent))

(global-set-key (kbd "<C-return>") 'vi-open-line-below)
(global-set-key (kbd "<C-S-return>") 'vi-open-line-above)


;; split window
(defun vsplit-last-buffer ()
  (interactive)
  (split-window-vertically)
  (other-window 1))
  ;; (switch-to-next-buffer))
(defun hsplit-last-buffer ()
  (interactive)
  (split-window-horizontally)
  (other-window 1))
  ;; (switch-to-next-buffer))
(global-set-key (kbd "C-x 2") 'vsplit-last-buffer)
(global-set-key (kbd "C-x 3") 'hsplit-last-buffer)


(provide 'init-utils)
;;; init-utils.el ends here
