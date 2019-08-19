;; -*- mode: Emacs-Lisp -*-


(defhydra hydra:paredit (:color pink :hint nil
                         :body-pre (evil-emacs-state)
                         :post (evil-normal-state))
  "
     ^barf/slurp^          split/join            warp/splice
--^^^^-------------------------------------------------------------------
  _<S-left>_ : <--(      _S_: split            M-(/M-\": warp
  _<S-right>_: (-->      _J_: join             M-s: splice
  _<M-left>_ : <--)      ^^M-q: reindent       <M-up>/<M-down>: up/down
  _<M-right>_: )-->      _C-M-l_: recenter     _R_: raise
"
  ("TAB" paredit-mode :color blue)
  ("," paredit-mode)

  ;; barf / slurp
  ("<S-left>" paredit-backward-slurp-sexp)
  ("<S-right>" paredit-backward-barf-sexp)
  ("<M-left>" paredit-forward-barf-sexp)
  ("<M-right>" paredit-forward-slurp-sexp)

  ;; split / join
  ("S" paredit-split-sexp)
  ("J" paredit-join-sexps)
  ;; ("M-q" paredit-reindent-defun)
  ("C-M-l" paredit-recenter-on-sexp)

  ;; warp / splice
  ;; ("M-(" paredit-wrap-round)
  ;; ("M-\"" paredit-meta-doublequote)
  ;; ("M-s" paredit-splice-sexp)
  ;; ("<M-up>" paredit-splice-sexp-killing-backward)
  ;; ("<M-down>" paredit-splice-sexp-killing-forward)

  ;; misc
  ("R" paredit-raise-sexp)
  ("?" paredit-convolute-sexp)

  ;; inertion
  ("\"" paredit-doublequote)
  ("\\" paredit-backslash)
  ("(" paredit-open-round)
  (")" paredit-close-round)
  ("M-)" paredit-close-round-and-newline)
  ("[" paredit-open-square)
  ("]" paredit-close-square)
  ("{" paredit-open-curly)
  ("}" paredit-close-curly)
  ("M-;" paredit-comment-dwim)
  ("C-j" paredit-new-line)

  ;; delete
  ("C-d" paredit-forward-delete)
  ("M-d" paredit-forward-kill-word)
  ("DEL" paredit-backward-delete)
  ("M-DEL" paredit-backward-kill-word)
  ("C-k" paredit-kill)

  ;; structural navigation
  ("a" beginning-of-defun)
  ("e" end-of-defun)
  ("f" paredit-forward)
  ("b" paredit-backward)
  ("u" paredit-backward-up)
  ("d" paredit-forward-down)
  ("n" paredit-forward-up)
  ("p" paredit-backward-down)

  ;; basic movement
  ("H" back-to-indentation)
  ("L" move-end-of-line)
  ("h" backward-char)
  ("j" next-line)
  ("k" previous-line)
  ("l" forward-char)

  ("q" nil))


(provide 'hydra-paredit)
