;; -*- mode: Emacs-Lisp -*-


(defhydra hydra-avy (:hint nil)
  "
     ^Chars^            ^other^
-------------------------------------
[_c_]   char         [_w_]   word
[_C_]   char-2       [_s_]   subword
[_t_]   char-timer   [_l_]   line
"
    ("c" avy-goto-char :exit t)
    ("C" avy-goto-char-2 :exit t)
    ("t" avy-goto-char-timer :exit t)
    ("w" avy-goto-word-1 :exit t)
    ("s" avy-goto-subword-1 :exit t)
    ("l" avy-goto-line :exit t))
;(global-set-key (kbd "C-;") 'hydra-avy/body) ;;example-binding


(provide 'hydra/hydra-avy)
;;; hydra-avy.el ends here
