;; -*- mode: Emacs-Lisp -*-


(defhydra hydra-buffer (:color teal :hint nil :idle .5)
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
                            :hint nil)
  "
Git gutter:
  _j_: next hunk        _s_tage hunk     _q_uit
  _k_: previous hunk    _r_evert hunk    _Q_uit and deactivate git-gutter
  ^ ^                   _p_opup hunk
  _h_: first hunk
  _l_: last hunk        set start _R_evision
"
  ("j" git-gutter:next-hunk)
  ("k" git-gutter:previous-hunk)
  ("h" (progn (goto-char (point-min))
              (git-gutter:next-hunk 1)))
  ("l" (progn (goto-char (point-min))
              (git-gutter:previous-hunk 1)))
  ("s" git-gutter:stage-hunk)
  ("r" git-gutter:revert-hunk)
  ("p" git-gutter:popup-hunk)
  ("R" git-gutter:set-start-revision)
  ("q" nil :color blue)
  ("Q" (progn (git-gutter-mode -1)
              ;; git-gutter-fringe doesn't seem to
              ;; clear the markup right away
              (sit-for 0.1)
              (git-gutter:clear))
   :color blue))


(defhydra hydra-highlight (:color pink :hint nil)
  ("SPC" highlight-symbol-at-point "highlight")
  ("p" highlight-symbol-prev "previous")
  ("n" highlight-symbol-next "next")
  ("c" highlight-symbol-count "count" :color blue)
  ("o" highlight-symbol-occur "occur" :color blue)
  ("a" highlight-symbol-list-all "list" :color blue)
  ("q" nil "cancel" :color blue))


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

  ("."   xref-find-definitions "xref find")
  ("j" ffap :exit t)

  ("q" nil "quit"))


(provide 'hydra/hydra-nav)
;;; hydra-nav.el ends here
