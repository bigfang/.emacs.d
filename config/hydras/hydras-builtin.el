;; -*- mode: Emacs-Lisp -*-


(defhydra hydra-buffer (:color teal :hint nil :columns 3)
  "Buffer"
  ("i" ibuffer "ibuffer")
  ("b" ivy-switch-buffer "switch")
  ("n" next-buffer "next buffer" :color red)
  ("p" previous-buffer "previous buffer" :color red)
  ("k" kill-buffer-and-window "kill buffer window")
  ("q" nil :color blue))


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


(defhydra hydra-mark (:color pink :exit t :hint nil :columns 3)
  "Marks"
  ("m" counsel-bookmark "bookmark")
  ("d" bookmark-delete "delete bookmark")
  ("l" bookmark-bmenu-list "list" :exit t)

  ("n" remember-notes "notes" :exit t)
  ("r" remember "remember" :exit t)
  ("R" remember-region "remember region")
  ("c" remember-clipboard "remember clipboard")
  ("q" nil :color blue))


(provide 'hydras-builtin)
