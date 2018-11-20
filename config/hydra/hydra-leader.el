;; -*- mode: Emacs-Lisp -*-


(use-package hydra/hydra-org)
(use-package hydra/hydra-projectile)

(use-package hydra/hydra-abo)
(use-package hydra/hydra-git)
(use-package hydra/hydra-editing)
(use-package hydra/hydra-nav)
(use-package hydra/hydra-ui)


(defhydra hydra-leader (:color teal :exit t :hint nil :idle .5 :columns 5)
  "      --- Hydra Leader ---    "
  ("C-n" next-line :color red)
  ("C-p" previous-line :color red)
  ("C-x C-c" save-buffers-kill-terminal :color blue)
  (":" eval-expression "evil expression")
  ("!" shell-command "shell command")
  (";" comment-line "comment" :color red)

  ("." er/expand-region "expand-region")
  ("'" hydra-multiple-cursors/body "multiple-cursors")
  ("`" hydra-toggle/body "toggle modes...")

  ("a" hydra-adjust/body "adjust...")
  ("i" hydra-abo/body "ivy...")
  ("b" hydra-buffer/body "buffer...")
  ("c" hydra-flycheck/body "flycheck...")
  ("e" hydra-eyebrowse/body "eyebrowse...")
  ("f" hydra-frame/body "frame...")
  ("h" hydra-highlight/body "highlight...")
  ("j" hydra-jump/body "jump...")
  ("m" hydra-notes/body "notes...")
  ("o" hydra-org/body "org-mode...")
  ("p" hydra-projectile/body "projectile...")
  ("v" hydra-git/body "git")
  ("x" hydra-execute/body "execute...")

  ("l" treemacs "treemacs")


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
  ("z" (progn
         (winner-undo)
         (setq this-command 'winner-undo))
       :color red)
  ("Z" winner-redo :color red)

  ;; buffer
  ("w" save-buffer)
  ("k" kill-buffer-and-window)
  ("<tab>" previous-buffer)
  ("DEL" next-buffer)
  ("U" undo-tree-visualize :color blue)
  ("u" undo-tree-undo :color red)
  ("r" undo-tree-redo :color red)

  ("<escape>" nil :color blue)
  ("q" nil :color blue))


(provide 'hydra/hydra-leader)
;;; hydra-leader.el ends here
