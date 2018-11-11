;; -*- mode: Emacs-Lisp -*-

;; alpha
(defun my/emacs-alpha-up ()
  (interactive)
  (let ((my/emacs-alpha-value (frame-parameter nil 'alpha)))
    (setf (frame-parameter nil 'alpha)
          (if (<= (+ my/emacs-alpha-value 5) 100)
              (+ my/emacs-alpha-value 5)
            100))))
(defun my/emacs-alpha-down ()
  (interactive)
  (let ((my/emacs-alpha-value (frame-parameter nil 'alpha)))
    (setf (frame-parameter nil 'alpha)
          (if (>= (- my/emacs-alpha-value 5) 0)
              (- my/emacs-alpha-value 5)
            0))))


(defun hydra-move-splitter-left (arg)
  "Move window splitter left."
  (interactive "p")
  (if (let* ((windmove-wrap-around))
        (windmove-find-other-window 'right))
      (shrink-window-horizontally arg)
    (enlarge-window-horizontally arg)))

(defun hydra-move-splitter-right (arg)
  "Move window splitter right."
  (interactive "p")
  (if (let* ((windmove-wrap-around))
        (windmove-find-other-window 'right))
      (enlarge-window-horizontally arg)
    (shrink-window-horizontally arg)))

(defun hydra-move-splitter-up (arg)
  "Move window splitter up."
  (interactive "p")
  (if (let* ((windmove-wrap-around))
        (windmove-find-other-window 'up))
      (enlarge-window arg)
    (shrink-window arg)))

(defun hydra-move-splitter-down (arg)
  "Move window splitter down."
  (interactive "p")
  (if (let* ((windmove-wrap-around))
        (windmove-find-other-window 'up))
      (shrink-window arg)
    (enlarge-window arg)))


(provide 'hydra/hydra-utils)
;;; hydra-utils.el ends here
