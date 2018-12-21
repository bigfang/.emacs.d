;; -*- mode: Emacs-Lisp -*-


(defhydra hydra-mark (:color pink :exit t :hint nil :columns 3)
  "Marks"
  ("m" counsel-bookmark "bookmark")
  ("d" bookmark-delete "delete bookmark")
  ("l" bookmark-bmenu-list "list" :exit t)

  ("n" remember-notes "notes" :exit t)
  ("r" remember "remember" :exit t)
  ("R" remember-region "remember region")
  ("c" remember-clipboard "remember clipboard")
  ("q" nil :color blue))


(defhydra hydra-org (:color pink :exit t :hint nil)
  "Org-mode"
  ("q" nil "quit" :color blue))


(defhydra hydra-deft (:color pink :hint nil :columns 3)
  "Deft"
  ("r" deft-refresh "refresh" :exit t)
  ("f" deft-find-file "find file")
  ("n" deft-new-file "create file")
  ("D" deft-delete-file "delete file")
  ("A" deft-archive-file "archive file")
  ("R" deft-rename-file "rename file")
  ("s" deft-toggle-sort-method "sort")
  ("c" deft-filter-clear "clear")
  ("o" deft-open-file-other-window "other window")
  ("q" nil :color blue))
(evil-define-key 'normal deft-mode-map (kbd ".") 'hydra-deft/body)


;; === markdown ===
(defhydra hydra-markdown (:color pink :hint nil)
  "
Formatting        C-c C-s    _s_: bold          _e_: italic     _b_: blockquote   _p_: pre-formatted    _c_: code
Headings          C-c C-t    _H_: automatic     _1_: h1         _2_: h2           _3_: h3               _4_: h4
Lists             C-c C-x    _m_: insert item
Demote/Promote    C-c C-x    _i_: promote       _r_: demote     _↑_: move up      _↓_: move down
Links, footnotes  C-c C-a    _L_: link          _U_: uri        _F_: footnote     _W_: wiki-link      _R_: reference

"
  ("s" markdown-insert-bold)
  ("e" markdown-insert-italic)
  ("b" markdown-insert-blockquote :color blue)
  ("p" markdown-insert-pre :color blue)
  ("c" markdown-insert-code)

  ("H" markdown-insert-header-dwim)
  ("1" markdown-insert-header-atx-1)
  ("2" markdown-insert-header-atx-2)
  ("3" markdown-insert-header-atx-3)
  ("4" markdown-insert-header-atx-4)

  ("m" markdown-insert-list-item)

  ("i" markdown-promote)
  ("r" markdown-demote)
  ("<down>" markdown-move-down)
  ("<up>" markdown-move-up)

  ("L" markdown-insert-link :color blue)
  ("U" markdown-insert-uri :color blue)
  ("F" markdown-insert-footnote :color blue)
  ("W" markdown-insert-wiki-link :color blue)
  ("R" markdown-insert-reference-link-dwim :color blue)
  ("<f9>" nil)
  ("q" nil :color blue))


(provide 'hydras-org)
