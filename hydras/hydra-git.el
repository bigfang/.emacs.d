;; -*- mode: Emacs-Lisp -*-


(defhydra hydra:git-gutter (:body-pre (git-gutter-mode 1)
                            :color pink :hint nil)
  "
Git gutter:
  ^^^ Move ^^^   |    hunk
-----^^^^^^------|---------------
   ^ ^ _K_ ^ ^   |   _s_tage
   _H_ ^+^ _L_   |   _r_evert
   ^ ^ _J_ ^ ^   |   _D_ popup diff
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


(defhydra hydra:smerge (:color pink :hint nil :post (smerge-auto-leave))
  "
^Move^       ^Keep^               ^Diff^                 ^Other^
^^-----------^^-------------------^^---------------------^^-------
_n_ext       _b_ase               _<_: upper/base        _C_ombine
_p_rev       _u_pper              _=_: upper/lower       _r_esolve
^^           _l_ower              _>_: base/lower        _k_ill current
^^           _a_ll                _R_efine
^^           _RET_: current       _E_diff
"
  ("n" smerge-next)
  ("p" smerge-prev)
  ("b" smerge-keep-base)
  ("u" smerge-keep-upper)
  ("l" smerge-keep-lower)
  ("a" smerge-keep-all)
  ("RET" smerge-keep-current)
  ("\C-m" smerge-keep-current)
  ("<" smerge-diff-base-upper)
  ("=" smerge-diff-upper-lower)
  (">" smerge-diff-base-lower)
  ("R" smerge-refine)
  ("E" smerge-ediff)
  ("C" smerge-combine-with-next)
  ("r" smerge-resolve)
  ("k" smerge-kill-current)
  ("ZZ" (lambda ()
          (interactive)
          (save-buffer)
          (bury-buffer))
   "Save and bury buffer" :color blue)
  ("q" nil :color blue))


(defhydra hydra:git (:color teal :hint nil :columns 3)
  "Git"
  ("i" magit-init "git init")
  ("c" magit-clone "git clone")
  ("b" magit-blame "git blame")
  ("h" magit-log-buffer-file "file history")
  ("d" magit-diff-buffer-file "file diff")
  ("r" magit-refresh-all "refresh all")
  ("v" magit-status "magit")
  ("g" hydra:git-gutter/body "git-gutter...")
  ("t" git-timemachine "git timemachine")
  ("l" magit-todos-list "list todos")
  ("q" nil :color blue))


(provide 'hydra-git)
