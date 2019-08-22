;; -*- mode: Emacs-Lisp -*-


(defun before-create ()
  (setq-default local-paredit? paredit-mode)
  (enable-paredit-mode)
  (evil-emacs-state))

(defun before-exit ()
  (my/toggle-paredit-mode local-paredit?)
  (evil-normal-state))


(defhydra hydra:paredit (:color pink :hint nil
                         :body-pre (before-create)
                         :post (before-exit))
  "
     ^barf/slurp^    |     ^^wrap/splice^^^     |   ^split/join^  |        ^misc^
--^^-----------------|----^^^^-^----------------|----^^-----------|-----^^---------------
  _<S-left>_ : <--(  |   ^M-(^ / ^M-\"^: wrap   |    _S_: split   |   ^^[M-q]: reindent
  _<S-right>_: (-->  |   ^M-s^: splice  ^^^     |    _J_: join    |   _C-M-l_: recenter
  _<M-left>_ : <--)  |   ^<M-up>^ / ^<M-down>^ ^|   ^^        [_,_]: toggle
  _<M-right>_: )-->    [_R_]: raise  [_?_]: convolute ^^^   [_TAB_]: trigger
"
  ("TAB" (my/toggle-paredit-mode (not local-paredit?)) :exit t)
  ("," paredit-mode)

  ;; Barfage & Slurpage
  ("<S-left>" paredit-backward-slurp-sexp)
  ("<S-right>" paredit-backward-barf-sexp)
  ("<M-left>" paredit-forward-barf-sexp)
  ("<M-right>" paredit-forward-slurp-sexp)

  ;; Depth-Changing
  ;; split & join
  ("S" paredit-split-sexp)
  ("J" paredit-join-sexps)
  ;; wraping & splicing
  ;; ("M-(" paredit-wrap-round)
  ;; ("M-\"" paredit-meta-doublequote)
  ;; ("M-s" paredit-splice-sexp)
  ;; ("<M-up>" paredit-splice-sexp-killing-backward)
  ;; ("<M-down>" paredit-splice-sexp-killing-forward)
  ;; bonus
  ("R" paredit-raise-sexp)
  ("?" paredit-convolute-sexp)

  ;; misc
  ;; ("M-q" paredit-reindent-defun)
  ("C-M-l" paredit-recenter-on-sexp)

  ;; Basic Insertion Commands
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

  ;; Deleting & Killing
  ("C-d" paredit-forward-delete)
  ("M-d" paredit-forward-kill-word)
  ("DEL" paredit-backward-delete)
  ("M-DEL" paredit-backward-kill-word)
  ("C-k" paredit-kill)

  ;; Movement & Navigation
  ("a" beginning-of-defun)
  ("e" end-of-defun)
  ("f" paredit-forward)
  ("b" paredit-backward)
  ("u" paredit-backward-up)
  ("d" paredit-forward-down)
  ("n" paredit-forward-up)
  ("p" paredit-backward-down)

  ;; Evil Movement
  ("H" back-to-indentation)
  ("L" move-end-of-line)
  ("h" backward-char)
  ("j" next-line)
  ("k" previous-line)
  ("l" forward-char)

  ;; c g i m o r s t v w x y z

  ("q" nil))


(provide 'hydra-paredit)
