;; -*- mode: Emacs-Lisp -*-


(defun my/align-whitespace (start end)
  "Align columns by whitespace"
  (interactive "r")
  (align-regexp start end
                "\\(\\s-*\\)\\s-" 1 0 t))

(defun my/align-equals (start end)
  "Align columns by equals sign"
  (interactive "r")
  (align-regexp start end
                "\\(\\s-*\\)=" 1 1 t))

(defun my/align-columns (begin end)
  "Align text columns"
  (interactive "r")
  ;; align-regexp syntax:  align-regexp (beg end regexp &optional group spacing repeat)
  (align-regexp begin end "\\(\\s-+\\)[a-zA-Z0-9=(),?':`\.{}]" 1 1 t)
  (indent-region begin end)) ; indent the region correctly after alignment

(defun my/align-regexp-repeat (start end regexp)
  "Repeat alignment with respect to the given regular expression."
  (interactive "r\nsAlign regexp: ")
  (align-regexp start end
                (concat "\\(\\s-*\\)" regexp) 1 1 t))

(defhydra hydra:align (:color blue)
  ("l" my/align-regexp-repeat "regexp repeat")
  ("c" my/align-columns "column")
  ("=" my/align-equals "equals")
  ("SPC" my/align-whitespace "whitespace")
  ("r" align-regexp "regexp")
  ("q" nil "quit"))


(defhydra hydra:buffer (:color teal :hint nil :columns 3)
  "Buffer"
  ("i" ibuffer "ibuffer")
  ("b" ivy-switch-buffer "switch")
  ("b" clone-indirect-buffer-other-window "clone")
  ("n" next-buffer "next buffer" :color red)
  ("p" previous-buffer "previous buffer" :color red)
  ("k" kill-buffer-and-window "kill buffer window")
  ("q" nil :color blue))


(defhydra hydra:narrow (:color pink :exit t :hint nil)
  "
  Narrowing
     ^org^           ^naomal^
--^^^^--------------------------
  _b_: block       _n_: region
  _e_: element     _d_: defun
  _s_: subtree     _p_: page
"
  ("n" narrow-to-region)
  ("d" narrow-to-defun)
  ("p" narrow-to-page)

  ("b" org-narrow-to-block)
  ("e" org-narrow-to-element)
  ("s" org-narrow-to-subtree)

  ("w" (lambda ()
         (interactive)
         (widen)
         (recenter))
   "widen")
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
