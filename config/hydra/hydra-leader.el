;; -*- mode: Emacs-Lisp -*-


(defhydra hydra-resize-window (:color amaranth)
  "resize window"
  ("h" hydra-move-splitter-left   "left" )
  ("j" hydra-move-splitter-down   "down")
  ("k" hydra-move-splitter-up     "up")
  ("l" hydra-move-splitter-right  "right")
  ("q" nil "cancel" :color blue))


(defhydra hydra-leader (:color pink :exit t :hint nil :idle 1 :columns 5)
  ("C-n" next-line :color red)
  ("C-p" previous-line :color red)

  ("," hydra-toggle/body "toggle modes")

  ("b" hydra-buffer/body "buffer")
  ("c" hydra-flycheck/body "flycheck")
  ("f" hydra-frame/body "frame")
  ("g" hydra-git-gutter/body "git-gutter")
  ("i" hydra-abo/body "abo-abo")
  ("j" hydra-jump/body "jump")
  ("p" hydra-projectile/body "projectile")
  ("x" hydra-launcher/body "launcher")

  ("`" highlight-symbol-at-point "highlight symbol")
  ("." er/expand-region "expand-region")
  (";" comment-line "comment" :color red)
  ("v" magit-status "magit")

  ;; cursor
  ("H" windmove-left :color red)
  ("J" windmove-down :color red)
  ("K" windmove-up :color red)
  ("L" windmove-right :color red)
  ("RET" other-frame)

  ;; window
  ("SPC" switch-window)
  ("\\" (lambda ()
          (interactive)
           (split-window-horizontally)
           (other-window 1)))
  ("-" (lambda ()
         (interactive)
          (split-window-vertically)
          (other-window 1)))
  ("Q" quit-window)
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
  ("k" kill-buffer-and-window)
  ("TAB" previous-buffer)
  ("DEL" next-buffer)

  ;; misc
  (">" my/emacs-alpha-up :color red)
  ("<" my/emacs-alpha-down :color red)
  ("M-=" text-scale-increase :color red)
  ("M--" text-scale-decrease :color red)
  ("C-x C-c" save-buffers-kill-terminal)

  ("ESC" nil "cancel" :color blue)      ; FIXME
  ("q" nil "cancel" :color blue))


(provide 'hydra/hydra-leader)
;;; hydra-leader.el ends here
