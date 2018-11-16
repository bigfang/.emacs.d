;; -*- mode: Emacs-Lisp -*-


(defhydra hydra-buffer (:color teal :hint nil :idle .5 :columns 3)
  "Buffer"
  ("i" ibuffer "ibuffer")
  ("b" ivy-switch-buffer "switch")
  ("n" next-buffer "next buffer" :color red)
  ("p" previous-buffer "previous buffer" :color red)
  ("k" kill-this-buffer "kill buffer")
  ("q" nil "cancel" :color blue))


(defhydra hydra-flycheck
  (:pre (progn (setq hydra-lv t) (flycheck-list-errors))
   :post (progn (setq hydra-lv nil) (quit-windows-on "*Flycheck errors*"))
   :hint nil)
  "Errors"
  ("f"  flycheck-error-list-set-filter                            "Filter")
  ("j"  flycheck-next-error                                       "Next")
  ("k"  flycheck-previous-error                                   "Previous")
  ("gg" flycheck-first-error                                      "First")
  ("G"  (progn (goto-char (point-max)) (flycheck-previous-error)) "Last")
  ("q"  nil))


(defhydra hydra-git-gutter (:body-pre (git-gutter-mode 1)
                            :color pink
                            :hint nil)
  "
Git gutter:
  ^^^ Move ^^^   |    hunk
-----^^^^^^------|---------------
   ^ ^ _K_ ^ ^   |   _s_tage
   _H_ ^+^ _L_   |   _r_evert
   ^ ^ _J_ ^ ^   |   _p_opup
"
  ("n" git-gutter:next-hunk "next hunk")
  ("p" git-gutter:previous-hunk "prev hunk")
  ("J" git-gutter:next-hunk)
  ("K" git-gutter:previous-hunk)
  ("H" (progn (goto-char (point-min))
              (git-gutter:next-hunk 1)))
  ("L" (progn (goto-char (point-min))
              (git-gutter:previous-hunk 1)))
  ("s" git-gutter:stage-hunk)
  ("r" git-gutter:revert-hunk)
  ("D" git-gutter:popup-hunk)
  ("R" git-gutter:set-start-revision "Set Start Revision")
  ("q" nil :color blue))


(defhydra hydra-highlight (:body-pre (highlight-symbol-mode 1)
                           :color pink :hint nil :columns 3)
  "Highlight"
  ("SPC" highlight-symbol "highlight")
  ("p" highlight-symbol-prev "previous")
  ("n" highlight-symbol-next "next")
  ("c" highlight-symbol-count "count")
  ("o" highlight-symbol-occur "occur" :color blue)
  ("a" highlight-symbol-list-all "list")
  ("q" nil "cancel" :color blue))


(defhydra hydra-jump (:color teal :hint nil)
  "
   ^Chars^             ^other^                ^dumb-jump^
-------------------------------------------------------------------------------
[_c_] char         [_w_] word / subword    [_J_] go
[_s_] char-2       [_S_] subword           [_o_] other window
[_t_] char-timer   [_l_] line              [_i_] prompt
[_g_] line                               ^^[_b_] back
                 ^^[_j_] ffap              [_l_] quick look
"
  ("c" avy-goto-char)
  ("s" avy-goto-char-2)
  ("t" avy-goto-char-timer)
  ("w" avy-goto-word-or-subword-1)
  ("S" avy-goto-subword-1)
  ("g" avy-goto-line)

  ("J" dumb-jump-go)
  ("i" dumb-jump-go-prompt)
  ("o" dumb-jump-go-other-window)
  ("b" dumb-jump-back :color red)
  ("l" dumb-jump-quick-look)
  ("e" dumb-jump-go-prefer-external "Go external")
  ("x" dumb-jump-go-prefer-external-other-window "Go external other window")

  ("." xref-find-definitions "xref find def")
  ("/" xref-find-references "xref find ref")
  ("j" ffap)
  ("q" nil "quit"))


(provide 'hydra/hydra-nav)
;;; hydra-nav.el ends here
