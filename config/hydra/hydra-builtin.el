;; -*- mode: Emacs-Lisp -*-


(defhydra hydra-move-text (:color red :hint nil)
  "Move text"
  ("<up>" move-text-up "up")
  ("<down>" move-text-down "down")
  ("q" nil :color blue))

(global-set-key (kbd "<C-S-up>") '(lambda ()
                                    (interactive)
                                    (move-text-up)
                                    (hydra-move-text/body)))

(global-set-key (kbd "<C-S-down>") '(lambda ()
                                      (interactive)
                                      (move-text-down)
                                      (hydra-move-text/body)))


(provide 'hydra/hydra-builtin)
