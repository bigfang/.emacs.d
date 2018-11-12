;; -*- mode: Emacs-Lisp -*-


(defhydra hydra-multiple-cursors (:color pink :hint nil)
  "
     ^Up^            ^Down^        ^Other^
----------------------------------------------
[_p_]   Next    [_n_]   Next    [_L_] Edit lines
[_P_]   Skip    [_N_]   Skip    [_a_] Mark all
[_M-p_] Unmark  [_M-n_] Unmark  [_r_] Mark by regexp
^ ^             ^ ^             [_q_] Quit
"
  ("L" mc/edit-lines :exit t)
  ("a" mc/mark-all-like-this :exit t)
  ("n" mc/mark-next-like-this)
  ("N" mc/skip-to-next-like-this)
  ("M-n" mc/unmark-next-like-this)
  ("p" mc/mark-previous-like-this)
  ("P" mc/skip-to-previous-like-this)
  ("M-p" mc/unmark-previous-like-this)
  ("r" mc/mark-all-in-region-regexp :exit t)

  ("0" mc/insert-numbers "insert numbers")
  ("z" mc/insert-letters "insert latters")
  ("s" mc/sort-regions "sort")
  ("r" mc/reverse-regions "reverse")
  ("q" nil :color blue))

(global-set-key [remap undo-tree-undo] 'hydra-multiple-cursors/body)


(provide 'hydra/hydra-multiple-cursors)
;;; hydra-multiple-cursors.el ends here
