;; -*- mode: Emacs-Lisp -*-


(defhydra hydra:selected (:color teal :exit t :hint nil :columns 5)
    "  Selected"
    ("SPC" nil :color blue)
    ("u" undo)

    ("TAB" tabify "tabify")
    ("<backtab>" untabify "untabify")
    ("=" count-words-region "count words")
    ("\\" indent-region "format")
    ("/" indent-rigidly "indent")
    (";" comment-or-uncomment-region)
    ("." er/expand-region)

    ("m" mc/mark-all-in-region-regexp "mark regex")
    ;; (">" mc/mark-next-like-this "mark next")
    ;; ("<" mc/mark-previous-like-this "mark prev")
    ("?" mc/mark-all-like-this "mark all")
    ("," hydra:multiple-cursors/body "multi cursors...")

    ("x" kill-region)
    ("w" kill-ring-save)
    ("s" embrace-add "embrace")
    ("o" exchange-point-and-mark "exchange")
    ("M-n" move-text-down "move down")
    ("M-p" move-text-up "move up")

    ("E" eval-region)
    ("g" google-this "google")
    ("f" fill-region "fill")
    ("l" hydra:align/body "align...")
    ("n" my/narrow-dwim "narrow")

    ("q" nil :color blue))


(provide 'hydra-selected)
