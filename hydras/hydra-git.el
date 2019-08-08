;; -*- mode: Emacs-Lisp -*-


(defhydra hydra:diff-hl (:color pink :hint nil)
  "
diff-hl:
  ^^^ Move ^^^   |    hunk
-----^^^^^^------|-----^^-------
   ^ ^ _K_ ^ ^   |   _m_ark
   _H_ ^+^ _L_   |   _r_evert
   ^ ^ _J_ ^ ^   |   _=_ diff
"
  ("n" diff-hl-next-hunk "next hunk")
  ("p" diff-hl-previous-hunk "prev hunk")
  ("J" diff-hl-next-hunk)
  ("K" diff-hl-previous-hunk)
  ("H" (progn (goto-char (point-min))
              (diff-hl-next-hunk)))
  ("L" (progn (goto-char (point-max))
              (diff-hl-previous-hunk)))
  ("m" diff-hl-mark-hunk)
  ("=" diff-hl-diff-goto-hunk :color blue)
  ("r" diff-hl-revert-hunk)
  ("q" nil :color blue))


(defhydra hydra:git-gutter (:body-pre (git-gutter-mode 1)
                            :color pink :hint nil)
  "
Git gutter:
  ^^^ Move ^^^   |    hunk
-----^^^^^^------|------^^------
   ^ ^ _K_ ^ ^   |   _s_tage
   _H_ ^+^ _L_   |   _r_evert
   ^ ^ _J_ ^ ^   |   _=_ diff
"
  ("n" git-gutter:next-hunk "next hunk")
  ("p" git-gutter:previous-hunk "prev hunk")
  ("J" git-gutter:next-hunk)
  ("K" git-gutter:previous-hunk)
  ("H" (progn (goto-char (point-min))
              (git-gutter:next-hunk 1)))
  ("L" (progn (goto-char (point-max))
              (git-gutter:previous-hunk 1)))
  ("s" git-gutter:stage-hunk)
  ("r" git-gutter:revert-hunk)
  ("=" git-gutter:popup-hunk)
  ("R" git-gutter:set-start-revision "Set Start Revision")
  ("q" nil :color blue))


(defhydra hydra:smerge (:color pink :hint nil
                        :body-pre (smerge-mode t)
                        :post (smerge-auto-leave))
  "
^Move^       ^Keep^               ^Diff^                 ^Other^
^^-----------^^-------------------^^---------------------^^-------
_n_ext       _b_ase               _<_: upper/base        _C_ombine
_p_rev       _u_pper              _=_: upper/lower       _r_esolve
^^           _l_ower              _>_: base/lower        _d_elete current
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
  ("<" smerge-diff-base-upper)
  ("=" smerge-diff-upper-lower)
  (">" smerge-diff-base-lower)
  ("R" smerge-refine)
  ("E" smerge-ediff)
  ("C" smerge-combine-with-next)
  ("r" smerge-resolve)
  ("d" smerge-kill-current)

  ("u" undo "undo")
  ("q" nil :color blue))
(define-key smerge-mode-map (kbd "M-m") 'hydra:smerge/body)


(defhydra hydra:git (:color teal :hint nil :columns 4)
  "Git"
  ("i" magit-init "git init")
  ("c" magit-clone "git clone")
  ("r" magit-refresh-all "refresh all")
  ("f" magit-diff-buffer-file "file diff")
  ("v" magit-file-dispatch "magit file...")
  ("d" hydra:diff-hl/body "diff-hl...")
  ("g" hydra:git-gutter/body "git-gutter...")
  ("m" hydra:smerge/body "smerge...")
  ("h" git-timemachine "timemachine")
  ("l" magit-todos-list "list todos")
  ("q" nil :color blue))


(provide 'hydra-git)
