;; -*- mode: Emacs-Lisp -*-


(defhydra hydra:rectangle (:body-pre (progn (evil-emacs-state)
                                            (rectangle-mark-mode 1))
                           :color pink
                           :hint nil
                           :post (progn (deactivate-mark)
                                        (evil-normal-state)))
  "
  ^_k_^     [_w_]copy      [_o_]open      [_N_]number-lines            |\\     -,,,--,,_
_h_   _l_   [_y_]yank      [_t_]type      [_e_]exchange-point          /,`.-'`'   ..  \-;;,_
  ^_j_^     [_x_]kill      [_c_]clear     [_r_]reset-region-mark      |,4-  ) )_   .;.(  `'-'
^^^^        [_u_]undo      [_q_]quit      ^ ^                        '---''(./..)-'(_\_)
"
  ("k" rectangle-previous-line)
  ("j" rectangle-next-line)
  ("h" rectangle-backward-char)
  ("l" rectangle-forward-char)
  ("x" kill-rectangle)                    ;; C-x r k
  ("y" yank-rectangle)                    ;; C-x r y
  ("w" copy-rectangle-as-kill)            ;; C-x r M-w
  ("o" open-rectangle)                    ;; C-x r o
  ("t" string-rectangle)                  ;; C-x r t
  ("c" clear-rectangle)                   ;; C-x r c
  ("e" rectangle-exchange-point-and-mark) ;; C-x C-x
  ("N" rectangle-number-lines)            ;; C-x r N
  ("r" (if (region-active-p)
           (deactivate-mark)
         (rectangle-mark-mode 1)))
  ("u" undo nil)
  ("q" nil))

(global-set-key (kbd "C-x SPC") 'hydra:rectangle/body)


(provide 'hydra-rectangle)
