;; -*- mode: Emacs-Lisp -*-


(defun rag/align-whitespace (start end)
  "Align columns by whitespace"
  (interactive "r")
  (align-regexp start end
                "\\(\\s-*\\)\\s-" 1 1 t))

(defun rag/align-equals (start end)
  "Align columns by equals sign"
  (interactive "r")
  (align-regexp start end
                "\\(\\s-*\\)=" 1 1 t))

(defun rag/align-columns (begin end)
  "Align text columns"
  (interactive "r")
  ;; align-regexp syntax:  align-regexp (beg end regexp &optional group spacing repeat)
  (align-regexp begin end "\\(\\s-+\\)[a-zA-Z0-9=(),?':`\.{}]" 1 1 t)
  (indent-region begin end)) ; indent the region correctly after alignment

(defhydra hydra:align (:color blue)
  ("r" align-regexp "regexp")
  ("c" rag/align-columns "column")
  ("=" rag/align-equals "equals")
  ("SPC" rag/align-whitespace "whitespace")
  ("q" nil "quit"))


(defhydra hydra:buffer (:color teal :hint nil :columns 3)
  "Buffer"
  ("i" ibuffer "ibuffer")
  ("b" ivy-switch-buffer "switch")
  ("n" next-buffer "next buffer" :color red)
  ("p" previous-buffer "previous buffer" :color red)
  ("k" kill-buffer-and-window "kill buffer window")
  ("q" nil :color blue))


(defhydra hydra:mark (:color pink :exit t :hint nil)
  "
    bookmark             remember
---------------------------------------------
   [_m_]: mark          [_n_]: notes
   [_d_]: delete        [_r_]: remember
   [_l_]: list          [_c_]: clipboard
   ^^                   [_R_]: region
"
  ("m" counsel-bookmark)
  ("d" bookmark-delete)
  ("l" bookmark-bmenu-list :exit t)

  ("n" remember-notes :exit t)
  ("r" remember :exit t)
  ("R" remember-region)
  ("c" remember-clipboard)
  ("q" nil :color blue))


(provide 'hydra-builtin)
