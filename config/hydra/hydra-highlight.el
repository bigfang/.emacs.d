;; -*- mode: Emacs-Lisp -*-


(defhydra hydra-highlight (:body-pre (highlight-symbol-mode 1)
                           :color pink :hint nil)
  ("h" highlight-symbol-at-point)
  ("k" highlight-symbol-prev)
  ("j" highlight-symbol-next)
  ("o" highlight-symbol-occur :color blue)
  ("l" highlight-symbol-list-all :color blue)
  ("q" nil "cancel" :color blue))


(provide 'hydra/hydra-highlight)
;;; hydra-highlight.el ends here
