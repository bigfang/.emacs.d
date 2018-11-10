;; -*- mode: Emacs-Lisp -*-


(defhydra hydra-jump (:hint nil)
  "
      Chars              other                   dumb-jump
-------------------------------------------------------------------------------
[_c_]   char         [_w_]   word or subword    [_J_]   go
[_C_]   char-2       [_s_]   subword            [_o_]   other window
[_t_]   char-timer   [_l_]   line               [_i_]   prompt
                                           ^^^^ [_b_]   back
                   ^^[_j_]   ffap               [_l_]   quick look
"
  ("c" avy-goto-char :exit t)
  ("C" avy-goto-char-2 :exit t)
  ("t" avy-goto-char-timer :exit t)
  ("w" avy-goto-word-or-subword-1 :exit t)
  ("s" avy-goto-subword-1 :exit t)
  ("l" avy-goto-line :exit t)

  ("J" dumb-jump-go)
  ("i" dumb-jump-go-prompt)
  ("o" dumb-jump-go-other-window)
  ("b" dumb-jump-back)
  ("l" dumb-jump-quick-look)
  ("e" dumb-jump-go-prefer-external "Go external")
  ("x" dumb-jump-go-prefer-external-other-window "Go external other window")

  ("j" ffap :exit t)

  ("q" nil "quit"))


(provide 'hydra/hydra-jump)
;;; hydra-jump.el ends here
