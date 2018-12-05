;; -*- mode: Emacs-Lisp -*-


(defhydra hydra-buffer (:color teal :hint nil :columns 3)
  "Buffer"
  ("i" ibuffer "ibuffer")
  ("b" ivy-switch-buffer "switch")
  ("n" next-buffer "next buffer" :color red)
  ("p" previous-buffer "previous buffer" :color red)
  ("k" kill-buffer-and-window "kill buffer window")
  ("q" nil :color blue))


(defhydra hydra-eyebrowse (:color teal :hint nil :columns 2)
  "eyebrowse"
  ("p"  eyebrowse-prev-window-config       "prev config" :color red)
  ("n"  eyebrowse-next-window-config       "next config" :color red)
  ("e"  eyebrowse-last-window-config       "last config")
  ("s"  eyebrowse-switch-to-window-config  "switch config")
  ("c"  eyebrowse-create-window-config     "create config")
  ("d"  eyebrowse-close-window-config      "delete current config")
  ("m"  eyebrowse-rename-window-config     "rename current config")
  ("0"  eyebrowse-switch-to-window-config-0)
  ("1"  eyebrowse-switch-to-window-config-1)
  ("2"  eyebrowse-switch-to-window-config-2)
  ("3"  eyebrowse-switch-to-window-config-3)
  ("4"  eyebrowse-switch-to-window-config-4)
  ("5"  eyebrowse-switch-to-window-config-5)
  ("6"  eyebrowse-switch-to-window-config-6)
  ("7"  eyebrowse-switch-to-window-config-7)
  ("8"  eyebrowse-switch-to-window-config-8)
  ("9"  eyebrowse-switch-to-window-config-9)
  ("q"  nil :color blue))


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


(defhydra hydra-highlight (:body-pre (highlight-symbol-mode 1)
                           :color pink :hint nil :columns 3)
  "Highlight"
  ("SPC" highlight-symbol "highlight")
  ("p" highlight-symbol-prev "previous")
  ("n" highlight-symbol-next "next")
  ("c" highlight-symbol-count "count")
  ("o" highlight-symbol-occur "occur" :color blue)
  ("a" highlight-symbol-list-all "list")
  ("x" highlight-symbol-remove-all "remove all")
  ("q" nil :color blue))


(defhydra hydra-avy (:color teal :hint nil)
  "
     ^Chars^            ^word^              ^other^
------------------------------------------------------------
 [_c_]  char         [_w_]  word         [_s_]  symbol
 [_v_]  char-2       [_e_]  subword
 [_t_]  char-timer                     ^^[_l_]  line
"
  ("c" avy-goto-char)
  ("v" avy-goto-char-2)
  ("t" avy-goto-char-timer)
  ("w" avy-goto-word-or-subword-1)
  ("e" avy-goto-subword-1)
  ("s" avy-goto-symbol-1)
  ("l" avy-goto-line)

  ("q" nil "cancel" :color blue))


(defhydra hydra-dumb-jump (:color teal :hint nil)
  "
     ^jump^                        ^other^
----------------------------------------------
 [_j_] go                     [_l_] quick look
 [_o_] go other window        [_i_] prompt
 [_e_] external               [_b_] back
 [_x_] external other window
"
  ("j" dumb-jump-go)
  ("o" dumb-jump-go-other-window)
  ("i" dumb-jump-go-prompt)
  ("l" dumb-jump-quick-look)
  ("b" dumb-jump-back :color red)
  ("e" dumb-jump-go-prefer-external)
  ("x" dumb-jump-go-prefer-external-other-window)

  ("q" nil))


(provide 'hydra/hydra-nav)
