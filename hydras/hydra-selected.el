;; -*- mode: Emacs-Lisp -*-


(defhydra hydra:selected (:color teal :exit t :hint nil :columns 5)
    "  Selected"
    ("SPC" nil :color blue)
    ("u" undo "undo")

    ("TAB" untabify "untabify")
    ("<backtab>" tabify "tabify")
    ("\\" indent-rigidly "indent")
    (";" comment-or-uncomment-region "[un]comment")
    ("." er/expand-region "expand-region")
    (">" mc/mark-next-like-this "mark next")
    ("<" mc/mark-previous-like-this "mark prev")
    ("?" mc/mark-all-like-this "mark all")

    ("x" kill-region "cut")
    ("w" kill-ring-save "copy")
    ("S" embrace-add "embrace")
    ("o" exchange-point-and-mark "exchange")
    ("M-n" move-text-down "move down")
    ("M-p" move-text-up "move up")

    ("E" eval-region "eval")
    ("G" google-this "google")
    ("f" fill-region "fill")
    ("l" hydra:align/body "align...")
    ("n" narrow-to-region "narrow")

    ("q" nil :color blue))


(provide 'hydra-selected)
