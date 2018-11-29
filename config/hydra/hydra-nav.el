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
  ("d" highlight-symbol-remove-all "remove all")
  ("q" nil :color blue))


(defhydra hydra-jump (:color teal :hint nil)
  "
   ^Chars^             ^other^                ^dumb-jump^
-------------------------------------------------------------------------------
[_c_] char         [_w_] word / subword    [_j_] go
[_s_] char-2       [_S_] subword           [_o_] other window
[_t_] char-timer   [_l_] line              [_i_] prompt
[_g_] line                               ^^[_b_] back
                                       ^^^^[_l_] quick look
"
  ("c" avy-goto-char)
  ("s" avy-goto-char-2)
  ("t" avy-goto-char-timer)
  ("w" avy-goto-word-or-subword-1)
  ("S" avy-goto-subword-1)
  ("g" avy-goto-line)

  ("j" dumb-jump-go)
  ("i" dumb-jump-go-prompt)
  ("o" dumb-jump-go-other-window)
  ("b" dumb-jump-back :color red)
  ("l" dumb-jump-quick-look)
  ("e" dumb-jump-go-prefer-external "Go external")
  ("x" dumb-jump-go-prefer-external-other-window "Go external other window")

  ("q" nil "quit"))


(provide 'hydra/hydra-nav)
