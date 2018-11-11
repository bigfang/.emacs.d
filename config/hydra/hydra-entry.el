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


(defhydra hydra-resize-window (:color amaranth)
  "resize window"
  ("h" hydra-move-splitter-left   "left" )
  ("j" hydra-move-splitter-down   "down")
  ("k" hydra-move-splitter-up     "up")
  ("l" hydra-move-splitter-right  "right")
  ("q" nil "cancel" :color blue))


(defhydra hydra-entry (:color pink :exit t :hint nil)
  ("C-n" next-line :color red)
  ("C-p" previous-line :color red)

  ("," hydra-toggle/body "toggle modes")
  ("c" hydra-flycheck/body "flycheck")
  ("p" hydra-projectile/body "projectile")
  ("g" hydra-git-gutter/body "git-gutter")
  ("i" hydra-abo/body "abo-abo")
  ("v" magit-status "magit")

  ;; cursor
  ("h" windmove-left :color red)
  ("j" windmove-down :color red)
  ("k" windmove-up :color red)
  ("l" windmove-right :color red)
  ("RET" other-frame :color red)

  ;; window
  ("SPC" switch-window)
  ("\\" (lambda ()
          (interactive)
          (split-window-right)
          (windmove-right)))
  ("-" (lambda ()
         (interactive)
         (split-window-below)
         (windmove-down)))
  ("0" delete-window)
  ("1" delete-other-windows)
  ("S" hydra-resize-window/body)

  ("z" (progn
         (winner-undo)
         (setq this-command 'winner-undo))
       :color red)
  ("Z" winner-redo :color red)

  ;; buffer
  ("w" save-buffer)
  ("TAB" previous-buffer :color red)
  ("DEL" next-buffer :color red)
  ("<left>" buf-move-left :color red)
  ("<right>" buf-move-right :color red)
  ("<up>" buf-move-up :color red)
  ("<down>" buf-move-down :color red)

  ;; misc
  (">" my/emacs-alpha-up :color red)
  ("<" my/emacs-alpha-down :color red)
  ("M-=" text-scale-increase :color red)
  ("M--" text-scale-decrease :color red)
  ("C-x C-c" save-buffers-kill-terminal)

  ("xe" eval-last-sexp)

  ("ESC" nil "cancel" :color blue)      ; FIXME
  ("q" nil "cancel" :color blue))


(provide 'hydra/hydra-entry)
;;; hydra-entry.el ends here
