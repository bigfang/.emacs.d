;; -*- mode: Emacs-Lisp -*-


(defhydra hydra-git-gutter (:body-pre (git-gutter-mode 1)
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


(defhydra hydra-git (:color teal :hint nil :columns 2)
  "Git"
  ("b" magit-blame "git blame")
  ("h" magit-log-buffer-file "file history")
  ("d" magit-diff-buffer-file "file diff")
  ("g" hydra-git-gutter/body "git-gutter...")
  ("t" git-timemachine "git timemachine")
  ("v" magit-status "magit")
  ("q" nil :color blue))


(provide 'hydra/hydra-git)
;;; hydra-git.el ends here
