;; -*- mode: Emacs-Lisp -*-

;; Time-stamp: <BigFang 2012-07-04 21:43:03>

;; alpha
(set-frame-parameter nil 'alpha 95)
(defun my-emacs-alpha-up ()
  (interactive)
  (let ((my-emacs-alpha-value (frame-parameter nil 'alpha)))
    (setf (frame-parameter nil 'alpha) (if (<= (+ my-emacs-alpha-value 5) 100)
                                           (+ my-emacs-alpha-value 5)
                                         100))))
(defun my-emacs-alpha-down ()
  (interactive)
  (let ((my-emacs-alpha-value (frame-parameter nil 'alpha)))
    (setf (frame-parameter nil 'alpha) (if (>= (- my-emacs-alpha-value 5) 0)
                                           (- my-emacs-alpha-value 5)
                                         0))))
(global-set-key (kbd "<S-wheel-up>") 'my-emacs-alpha-up)
(global-set-key (kbd "<S-wheel-down>") 'my-emacs-alpha-down)

;; Comment current line
(defun comment-or-uncomment-current-line-or-region ()
  "Comments or uncomments current current line or whole lines in region."
  (interactive)
  (save-excursion
    (let (min max)
      (if (region-active-p)
          (setq min (region-beginning) max (region-end))
        (setq min (point) max (point)))
      (comment-or-uncomment-region
       (progn (goto-char min) (line-beginning-position))
       (progn (goto-char max) (line-end-position))))))
;; (global-set-key (kbd "M-;") 'comment-or-uncomment-current-line-or-region)

;; Copy word
(defun copy-word (&optional arg)
  "Copy words at point into kill-ring"
  (interactive "P")
  (let ((beg (progn (if (looking-back "[a-zA-Z0-9]" 1) (backward-word 1)) (point)))
        (end (progn (forward-word arg) (point))))
    (copy-region-as-kill beg end)))
(defun copy-line (&optional arg)
  "Save current line into Kill-Ring without mark the line "
  (interactive "P")
  (let ((beg (line-beginning-position))
        (end (line-end-position arg)))
    (copy-region-as-kill beg end)))
(defun copy-paragraph (&optional arg)
  "Copy paragraphes at point"
  (interactive "P")
  (let ((beg (progn (backward-paragraph 1) (point)))
        (end (progn (forward-paragraph arg) (point))))
    (copy-region-as-kill beg end)))

(global-set-key (kbd "C-z w") 'copy-word)
(global-set-key (kbd "C-z l") 'copy-line)
(global-set-key (kbd "C-z p") 'copy-paragraph)

;; (defun copy-line-or-region (&optional n)
;;   "Save current line or region into Kill-Ring.  If the mark is
;; deactivated in current buffer, Save current line; otherwise save
;; the region."
;;   (interactive "p")
;;   (if mark-active
;;       (kill-ring-save
;;        (region-beginning) (region-end))
;;     (copy-line n)))

;; move line
(defun move-line (n)
  "Move the current line up or down by N lines."
  (interactive "p")
  (setq col (current-column))
  (beginning-of-line) (setq start (point))
  (end-of-line) (forward-char) (setq end (point))
  (let ((line-text (delete-and-extract-region start end)))
    (forward-line n)
    (insert line-text)
    ;; restore point to original column in moved line
    (forward-line -1)
    (forward-char col)))
(defun move-line-up (n)
  "Move the current line up by N lines."
  (interactive "p")
  (move-line (if (null n) -1 (- n))))
(defun move-line-down (n)
  "Move the current line down by N lines."
  (interactive "p")
  (move-line (if (null n) 1 n)))

(global-set-key (kbd "<C-S-up>") 'move-line-up)
(global-set-key (kbd "<C-S-down>") 'move-line-down)

;; transpose windows
(defun transpose-windows (arg)
  "Transpose the buffers shown in two windows."
  (interactive "p")
  (let ((selector (if (>= arg 0) 'next-window 'previous-window)))
    (while (/= arg 0)
      (let ((this-win (window-buffer))
            (next-win (window-buffer (funcall selector))))
        (set-window-buffer (selected-window) next-win)
        (set-window-buffer (funcall selector) this-win)
        (select-window (funcall selector)))
      (setq arg (if (plusp arg) (1- arg) (1+ arg))))))

(global-set-key (kbd "C-z t") 'transpose-windows)

;; go to char
(defun wy-go-to-char (n char)
  "Move forward to Nth occurence of CHAR.Typing `wy-go-to-char-key' again will move forwad to the next Nth occurence of CHAR."
  (interactive "p\ncGo to char: ")
  (search-forward (string char) nil nil n)
  (while (char-equal (read-char)
                     char)
    (search-forward (string char) nil nil n))
  (setq unread-command-events (list last-input-event)))

(global-set-key (kbd "C-z a") 'wy-go-to-char)

;; find word
(defun wcy-isearch-word-at-point()
  (interactive)
  (setq isearch-string (thing-at-point 'word))
  (isearch-search-and-update))

(define-key isearch-mode-map "\C-w" 'wcy-isearch-word-at-point)

;; vi dd, o, O
(defun vi-open-line-above ()
  "Insert a newline above the current line and put point at beginning."
  (interactive)
  (unless (bolp)
    (beginning-of-line))
  (newline)
  (forward-line -1)
  (indent-according-to-mode))

(defun vi-open-line-below ()
  "Insert a newline below the current line and put point at beginning."
  (interactive)
  (unless (eolp)
    (end-of-line))
  (newline-and-indent))

(defun vi-open-line (&optional abovep)
  "Insert a newline below the current line and put point at beginning.
With a prefix argument, insert a newline above the current line."
  (interactive "P")
  (if abovep
      (vi-open-line-above)
    (vi-open-line-below)))

(global-set-key (kbd "C-j") 'vi-open-line)

(defun kill-current-line (&optional n)
  (interactive "p")
  (save-excursion
    (beginning-of-line)
    (let ((kill-whole-line t))
      (kill-line n))))
