;; -*- mode: Emacs-Lisp -*-


(use-package hydra/hydra-org)
(use-package hydra/hydra-projectile)
(use-package hydra/hydra-alchemist)

(use-package hydra/hydra-coding)
(use-package hydra/hydra-abo)
(use-package hydra/hydra-git)
(use-package hydra/hydra-editing)
(use-package hydra/hydra-nav)
(use-package hydra/hydra-ui)


(defhydra hydra-adapter-default (:color teal :hint nil :columns 3)
  "default adapter"
   ("o" list-packages "list packages")
   ("j" ffap "ffap")
   ("z" fzf-directory "fzf-directory")
   ("." (browse-url ".") "current directory")
   ("q" nil :color blue))

(defun hydra-adapter ()
  "adapter"
  (interactive)
  (cond
   ((eq major-mode 'org-mode) (hydra-org/body))
   ((eq major-mode 'python-mode) (hydra-python/body))
   ((eq major-mode 'markdown-mode) (hydra-markdown-mode/body))
   ((bound-and-true-p alchemist-mode) (hydra-alchemist/body))
   (t (hydra-adapter-default/body))))


(defhydra hydra-leader (:color teal :exit t :hint nil :idle .5 :columns 5)
  "      --- Hydra Leader ---    "
  ("C-n" next-line :color red)
  ("C-p" previous-line :color red)
  ("C-x C-c" save-buffers-kill-terminal :color blue)
  (":" eval-expression "evil expression")
  ("!" shell-command "shell command")
  (";" comment-line "comment" :color red)

  ("." er/expand-region "expand-region")
  ("'" hydra-multiple-cursors/body "multiple-cursors")
  ("`" hydra-toggle/body "toggle modes...")

  ("o" hydra-adapter "adapter...")

  ("a" hydra-avy/body "avy...")
  ("i" hydra-abo/body "ivy...")
  ("b" hydra-buffer/body "buffer...")
  ("c" hydra-flycheck/body "flycheck...")
  ("e" hydra-eyebrowse/body "eyebrowse...")
  ("f" hydra-frame/body "frame...")
  ("h" (lambda ()
         (interactive)
         (highlight-symbol)
         (hydra-highlight/body)) "highlight...")
  ("j" hydra-dumb-jump/body "jump...")
  ("m" hydra-mark/body "marks...")
  ("p" hydra-projectile/body "projectile...")
  ("v" hydra-git/body "git")
  ("x" hydra-execute/body "execute...")

  ("d" deft "deft")
  ("g" magit-status "magit")
  ("l" beacon-blink "blink cursor")
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
  ("U" undo-tree-visualize :color blue)

  ("<escape>" nil :color blue)
  ("q" nil :color blue))


(provide 'hydra/hydra-leader)
