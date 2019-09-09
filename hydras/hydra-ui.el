;; -*- mode: Emacs-Lisp; lexical-binding: t; -*-*-


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


(defun hydra:move-splitter-left (arg)
  "Move window splitter left."
  (interactive "p")
  (if (let* ((windmove-wrap-around))
        (windmove-find-other-window 'right))
      (shrink-window-horizontally arg)
    (enlarge-window-horizontally arg)))

(defun hydra:move-splitter-right (arg)
  "Move window splitter right."
  (interactive "p")
  (if (let* ((windmove-wrap-around))
        (windmove-find-other-window 'right))
      (enlarge-window-horizontally arg)
    (shrink-window-horizontally arg)))

(defun hydra:move-splitter-up (arg)
  "Move window splitter up."
  (interactive "p")
  (if (let* ((windmove-wrap-around))
        (windmove-find-other-window 'up))
      (enlarge-window arg)
    (shrink-window arg)))

(defun hydra:move-splitter-down (arg)
  "Move window splitter down."
  (interactive "p")
  (if (let* ((windmove-wrap-around))
        (windmove-find-other-window 'up))
      (shrink-window arg)
    (enlarge-window arg)))


(defhydra hydra:adjust (:color amaranth :hint nil :columns 5)
  "Adjust windows"
  ("h" hydra:move-splitter-left   "window left" )
  ("j" hydra:move-splitter-down   "window down")
  ("k" hydra:move-splitter-up     "window up")
  ("l" hydra:move-splitter-right  "window right")

  ("H" buf-move-left   "buffer left")
  ("L" buf-move-right  "buffer right")
  ("K" buf-move-up     "buffer up")
  ("J" buf-move-down   "buffer down")

  ("[" (progn
         (winner-undo)
         (setq this-command 'winner-undo))
   "winner undo" :color red)
  ("]" winner-redo "winner redo":color red)

  (">" my/emacs-alpha-up   "transparent up")
  ("<" my/emacs-alpha-down "transparent down")
  ("=" text-scale-increase "zoom in")
  ("-" text-scale-decrease "zoom out")
  ("0" (text-scale-set 0) "reset")

  ("t" transpose-frame "transpose")
  ("q" nil :color blue))


(defhydra hydra:frame (:color pink :exit t :hint nil :columns 3)
  "Frames"
  ("a" hydra:adjust/body "adjust...")
  ("0" delete-frame "delete")
  ("d" delete-frame "delete")
  ("1" delete-other-frames "delete other")
  ("2" make-frame-command "create")
  ("c" (lambda ()
         (interactive)
         (make-frame-command)
         (set-frame-size (selected-frame) 150 45)) "create")
  ("o" find-file-other-frame "find file")
  ("f" other-frame "other frame" :color red)
  ("DEL" ns-next-frame "next frame" :color red)
  ("<tab>" ns-prev-frame "previous frame" :color red)
  ("q" nil :color blue))


(provide 'hydra-ui)
