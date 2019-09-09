;; -*- mode: Emacs-Lisp; lexical-binding: t; -*-*-


(defhydra hydra:lsp (:color teal :hint nil)
  "
     ^Buffer^    ^|      ^Server^      |         ^^Symbol^^           |      ^Doc^
--^^-------------^+-------^^-----------+--^^^^------------------------+---^^-------------
  [_\\_] format   |  [_R_]   restart   |  [_d_] decl  [_t_] type def  |  [_o_] doc
  [_m_] imenu    ^|  [_S_]   shutdown  |  [_._] def   [_s_] symbol    |  [_l_] sideline
  [_x_] execute  ^|  [_M-s_] session   |  [_'_] refs                ^^|  [_c_] flycheck
  [_r_] rename   ^|                  ^^|  [_i_] impl                ^^|
"
  ("r" lsp-rename)
  ("d" lsp-find-declaration)
  ("t" lsp-find-type-definition)
  ("." lsp-find-definitions)
  ("'" lsp-find-references)
  ("i" lsp-find-implementation)
  ("s" lsp-ui-peek-find-workspace-symbol)
  ("l" lsp-ui-sideline-toggle-symbols-info)
  ("o" lsp-ui-doc-mode)
  ("c" lsp-ui-flycheck-list)

  ("\\" lsp-format-buffer)
  ("m" lsp-ui-imenu)
  ("x" lsp-execute-code-action)

  ("M-s" lsp-describe-session)
  ("R" lsp-restart-workspace)
  ("S" lsp-shutdown-workspace)

  ("q" nil :color blue))


(provide 'hydra-lsp)
