;; -*- mode: Emacs-Lisp -*-


(defhydra hydra:leader (:color teal :exit t :hint nil :idle .2 :columns 5)
  "      --- Hydra Leader ---    "
  ("<up>" previous-line :color red)
  ("<down>" next-line :color red)
  ("<left>" left-char :color red)
  ("<right>" right-char :color red)
  ("C-SPC" set-mark-command :color red)
  ("C-n" next-line :color red)
  ("C-p" previous-line :color red)
  ("C-x C-c" save-buffers-kill-terminal :color blue)
  (":" eval-expression "evil expression")
  ("!" shell-command "shell command")

  (";" indent-rigidly "indent-rigidly")
  ("'" hydra:multiple-cursors/body "multiple-cursors...")
  ("," embrace-commander "embrace")
  ("." er/expand-region "expand-region")
  ("/" hydra:undo-tree/body "undo-tree...")

  ("o" hydra:adapter "adapter...")

  ("a" hydra:avy/body "avy...")
  ("b" hydra:buffer/body "buffer...")
  ("c" hydra:flycheck/body "flycheck...")
  ("e" hydra:eyebrowse/body "eyebrowse...")
  ("f" hydra:frame/body "frame...")
  ("h" hydra:highlight/body "highlight...")
  ("i" hydra:abo/body "ivy...")
  ("j" hydra:dumb-jump/body "jump...")
  ("l" hydra:lsp/body "lsp-mode...")
  ("m" hydra:mark/body "marks...")
  ;; ("n" nil "nil")
  ("p" hydra:projectile/body "projectile...")
  ;; ("r" nil "nil")
  ("s" hydra:align/body "align...")
  ;; ("u" hydra:undo-tree/body "undo-tree...")
  ("v" hydra:git/body "git...")
  ("x" hydra:execute/body "execute...")
  ;; ("y" nil "nil")

  ("d" deft "deft")
  ("g" magit-status "magit")
  ("t" treemacs "treemacs")

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
  ("z" quit-window)
  ("0" delete-window)
  ("1" delete-other-windows)

  ;; buffer
  ("w" save-buffer)
  ("k" kill-this-buffer)
  ("<tab>" projectile-previous-project-buffer)
  ("DEL" projectile-next-project-buffer)
  ("<" previous-buffer "prev buffer" :color red)
  (">" next-buffer "next buffer" :color red)

  ("<escape>" nil :color blue)
  ("q" nil :color blue))


(provide 'hydra-leader)
