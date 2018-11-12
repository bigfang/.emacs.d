;; -*- mode: Emacs-Lisp -*-


(defhydra hydra-frame (:color pink :exit t :hint nil :idle .5)
  ("0" delete-frame "delete")
  ("1" delete-other-frames "delete other")
  ("2" make-frame-command "create")
  ("c" make-frame-command "create")
  ("o" find-file-other-frame "find file")
  ("f" other-frame "other frame" :color red)
  ("t" transpose-frame)
  ("q" nil "cancel" :color blue))


(provide 'hydra/hydra-frame)
;;; hydra-frame.el ends here
