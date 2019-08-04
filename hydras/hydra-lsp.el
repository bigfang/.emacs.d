;; -*- mode: Emacs-Lisp -*-


(defhydra hydra:lsp (:color teal :hint nil)
  "
 ^Buffer^               ^Server^                                     ^^^Symbol^^^
-^^---------------------^^------------------------------------------------------------------------^^^^^^
 [_f_] format           [_M-r_] restart            [_d_] declaration  [_i_] implementation  [_o_] doc
 [_m_] imenu            [_S_]   shutdown           [_._] definition   [_t_] type            [_r_] rename
 [_x_] execute action   [_M-s_] describe session   [_'_] references   [_l_] sideline
"
  ("d" lsp-find-declaration)
  ("t" lsp-find-type-definition)
  ("." lsp-ui-peek-find-definitions)
  ("'" lsp-ui-peek-find-references)
  ("i" lsp-ui-peek-find-implementation)
  ("l" lsp-ui-sideline-toggle-symbols-info)
  ("o" lsp-ui-doc-mode)
  ("r" lsp-rename)

  ("f" lsp-format-buffer)
  ("m" lsp-ui-imenu)
  ("x" lsp-execute-code-action)

  ("M-s" lsp-describe-session)
  ("M-r" lsp-restart-workspace)
  ("S" lsp-shutdown-workspace)

  ("q" nil :color blue))


(provide 'hydra-lsp)
