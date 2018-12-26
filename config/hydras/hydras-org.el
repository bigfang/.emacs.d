;; -*- mode: Emacs-Lisp -*-


(defhydra hydra-org-template (:color blue :hint nil)
  "
 [_c_] center     [_C_] comment    [_h_] html     [_i_] INDEX:
 [_e_] example    [_v_] verse      [_a_] ascii    [_H_] HTML:
 [_s_] src        [_V_] verbatim   [_l_] latex    [_A_] ASCII:
 [_o_] quote      ^ ^              ^ ^            [_L_] LaTeX:
 ^ ^              ^ ^              ^ ^            [_I_] INCLUDE:
"
  ("c" (hot-expand "<c"))
  ("e" (hot-expand "<e"))
  ("s" (hot-expand "<s"))
  ("o" (hot-expand "<q"))
  ("C" (hot-expand "<C"))
  ("v" (hot-expand "<v"))
  ("V" (hot-expand "<V"))
  ("h" (hot-expand "<h"))
  ("a" (hot-expand "<a"))
  ("l" (hot-expand "<l"))
  ("i" (hot-expand "<i"))
  ("H" (hot-expand "<H"))
  ("A" (hot-expand "<A"))
  ("L" (hot-expand "<L"))
  ("I" (hot-expand "<I"))
  ("<" self-insert-command "ins")
  ("q" nil "quit"))

(defun hot-expand (str)
  "Expand org template."
  (insert str)
  (org-try-structure-completion))

(with-eval-after-load 'org
  (define-key org-mode-map "<"
    (lambda () (interactive)
      (if (looking-back "^")
          (hydra-org-template/body)
        (self-insert-command 1)))))


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
