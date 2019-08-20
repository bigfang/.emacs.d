;; -*- mode: Emacs-Lisp -*-


(use-package hydra
  :ensure t
  :after swiper
  :bind (("C-`" . hydra:leader/body)
         ("C-~" . hydra:captain/body)
         :map evil-motion-state-map
         ("SPC" . hydra:leader/body)
         ("RET" . hydra:captain/body))
  :config
  (use-package hydra-builtin)
  (use-package hydra-dired)
  (use-package hydra-ibuffer)
  (use-package hydra-info)
  (use-package hydra-macro)
  (use-package hydra-rectangle)

  (use-package hydra-org)
  (use-package hydra-projectile)
  (use-package hydra-lsp)
  (use-package hydra-alchemist)
  (use-package hydra-pdf)

  (use-package hydra-abo)
  (use-package hydra-git)
  (use-package hydra-ui)

  (use-package hydra-adapter)

  (use-package hydra-leader)
  (use-package hydra-captain))


;; https://github.com/abo-abo/hydra/wiki/Hydra-Colors#colorful-hydras
;; https://github.com/abo-abo/hydra/wiki/internals#exit
;; |----------+-----------------------------+-----------+-----------------------+-----------|
;; | Body     | Non-color                   | Head      | Executing             | After     |
;; | Color    | Alternative                 | Inherited | NON-HEADS             | executing |
;; |          |                             | Color     |                       | HEADS     |
;; |----------+-----------------------------+-----------+-----------------------+-----------|
;; | red      | :foreign-keys nil (default) | red       | Allow and Quit        |           |
;; |          | :exit nil (default)         |           |                       | Continue  |
;; |----------+-----------------------------+-----------+-----------------------+-----------|
;; | blue     | :foreign-keys nil (default) | blue      | Allow and Quit        |           |
;; |          | :exit t                     |           |                       | Quit      |
;; |----------+-----------------------------+-----------+-----------------------+-----------|
;; | amaranth | :foreign-keys warn          | red       | Disallow and Continue |           |
;; |          | :exit nil (default)         |           |                       | Continue  |
;; |----------+-----------------------------+-----------+-----------------------+-----------|
;; | teal     | :foreign-keys warn          | blue      | Disallow and Continue |           |
;; |          | :exit t                     |           |                       | Quit      |
;; |----------+-----------------------------+-----------+-----------------------+-----------|
;; | pink     | :foreign-keys run           | red       | Allow and Continue    |           |
;; |          | :exit nil (default)         |           |                       | Continue  |
;; |----------+-----------------------------+-----------+-----------------------+-----------|


(use-package ivy
  :ensure t
  :bind (:map ivy-minibuffer-map
         ("M-j" . pyim-convert-string-at-point)
         ("C-\\" . ivy-yank-word)
         ("M-i" . ivy-restrict-to-matches) ; default "S-SPC"
         ("<escape>" . minibuffer-keyboard-quit)
         ("M-u" . ivy-occur)
         ("C-M-n" . my/ivy-next-line-and-call)
         ("C-M-p" . my/ivy-previous-line-and-call)
         ("s-n" . my/ivy-next-line-and-call)
         ("s-p" . my/ivy-previous-line-and-call)
         ("M-n" . ivy-next-line)
         ("M-p" . ivy-previous-line)
         ("C-n" . ivy-next-history-element)
         ("C-p" . ivy-previous-history-element))
  :hook ((imenu-after-jump . recenter-top-bottom)
         (counsel-grep-post-action . recenter-top-bottom))
  :init
  (defun my/ivy-next-line-and-call (&optional arg)
    (interactive "p")
    (ivy-next-line arg)
    (ivy--exhibit)
    (ivy-call)
    (with-ivy-window (recenter)))
  (defun my/ivy-previous-line-and-call (&optional arg)
    (interactive "p")
    (ivy-previous-line arg)
    (ivy--exhibit)
    (ivy-call)
    (with-ivy-window (recenter)))
  :config
  (setq ivy-re-builders-alist
        '((counsel-M-x . ivy--regex-fuzzy)
          (t . ivy--regex-plus)))
  (setq ivy-use-virtual-buffers t
        ivy-count-format "(%d/%d) "
        ivy-virtual-abbreviate 'abbreviate
        ivy-height 15)
  (setcdr (assq t ivy-format-functions-alist) #'ivy-format-function-arrow)
  (ivy-mode 1))


(use-package ivy-hydra
  :ensure t
  :after (ivy hydra))


(use-package swiper
  :ensure t
  :bind (:map swiper-map
         ("M-q" . swiper-query-replace)
         ("C-'" . swiper-avy)
         ("M-c" . swiper-mc)))


(use-package counsel
  :ensure t
  :ensure-system-package (rg . ripgrep)
  :bind (("M-x" . counsel-M-x)
         ("M-y" . counsel-yank-pop))
  :config
  (global-set-key (kbd "<f1> b") 'counsel-descbinds)
  ;; (global-set-key (kbd "<f1> f") 'counsel-describe-function)
  ;; (global-set-key (kbd "<f1> v") 'counsel-describe-variable)
  (global-set-key (kbd "<f1> l") 'counsel-find-library)
  (global-set-key (kbd "<f2> i") 'counsel-info-lookup-symbol)
  (global-set-key (kbd "<f2> u") 'counsel-unicode-char))


(use-package avy
  :ensure t
  :bind (("M-g g" . avy-goto-char-2)
         ("M-g w" . avy-goto-word-or-subword-1)
         ("M-g l" . avy-goto-line))
  :init
  (defhydra hydra:avy (:color teal :hint nil)
    "
     ^Chars^            ^word^              ^other^
------------------------------------------------------------
 [_c_]  char         [_v_]  word         [_s_]  symbol
 [_a_]  char-2       [_w_]  [sub]word    [_r_]  resume
 [_t_]  char-timer   [_e_]  subword      [_l_]  line
"
    ("c" avy-goto-char)
    ("a" avy-goto-char-2)
    ("o" avy-goto-char-2)
    ("t" avy-goto-char-timer)
    ("v" avy-goto-word-1)
    ("w" avy-goto-word-or-subword-1)
    ("e" avy-goto-subword-1)
    ("s" avy-goto-symbol-1)
    ("r" avy-resume)
    ("l" avy-goto-line)
    ("q" nil "cancel" :color blue)))


(use-package auto-yasnippet
  :ensure t
  :bind (("s-w" . aya-create)
         ("s-y" . aya-expand)))


(use-package tiny
  :ensure t
  :bind ("M-o /" . tiny-expand))


;; ===
(use-package all-the-icons-ivy
  :ensure t
  :requires all-the-icons
  :config (all-the-icons-ivy-setup))

(use-package ivy-posframe
  :ensure t
  :requires posframe
  :config
  (setq ivy-posframe-display-functions-alist
        '((swiper          . ivy-posframe-display-at-window-bottom-left)
          (complete-symbol . ivy-posframe-display-at-point)
          (counsel-M-x     . ivy-posframe-display-at-window-bottom-left)
          (t               . ivy-posframe-display)))
  (ivy-posframe-mode 1))

(use-package ivy-rich
  :ensure t
  :after (ivy counsel)
  :config
  (setq ivy-rich-path-style 'abbrev)
  (ivy-rich-mode 1))


(use-package counsel-tramp
  :ensure t)


(use-package counsel-projectile
  :ensure t
  :config (counsel-projectile-mode t))


(use-package smex
  :ensure t
  :bind ("M-X" . smex-major-mode-commands))


(provide 'init-abo)


;; Call `ivy-immediate-done' if you want to use whatever you typed in the
;; search field, and ignore the suggestions provided by ivy in the list.
;;
;;  C-u <`ivy-alt-done' binding> <-- `ivy-immediate-done'
;;
;; This is useful especially when renaming files (and the name you want to
;; rename to partially matches one of the existing files).
;;
;; |----------------------------+----------------+-------------------------------------------------------------------|
;; | Command                    | ivy map        | Function                                                          |
;; |                            | Bindings       |                                                                   |
;; |----------------------------+----------------+-------------------------------------------------------------------|
;; | ivy-done                   | C-m or RET     | Exit the minibuffer with the selected candidate.                  |
;; |                            |                | Try to leave `ivy' as soon as possible.                           |
;; |----------------------------+----------------+-------------------------------------------------------------------|
;; | ivy-alt-done               | C-j            | Exit the minibuffer with the selected candidate.                  |
;; |                            |                | When ARG is t, acts like `ivy-immediate-done'.                    |
;; |                            |                | Try NOT to leave `ivy' at the soonest. For                        |
;; |                            |                | instance, if a directory name completion is                       |
;; |                            |                | possible, do that and list that directory's                       |
;; |                            |                | content in `ivy' instead of opening that dir                      |
;; |                            |                | in `dired'.                                                       |
;; |----------------------------+----------------+-------------------------------------------------------------------|
;; | ivy-immediate-done         | C-M-j          | Exit the minibuffer with the current text,                        |
;; |                            |                | ignoring the candidates.                                          |
;; |----------------------------+----------------+-------------------------------------------------------------------|
;; | ivy-partial-or-done        | TAB            | Attempts partial completion, extending current line               |
;; |                            |                | input as much as possible. "TAB TAB" is the same as               |
;; |                            |                | `ivy-alt-done'.                                                   |
;; |----------------------------+----------------+-------------------------------------------------------------------|
;; | ivy-call                   | C-M-m          | Call the current action without exiting completion.               |
;; |----------------------------+----------------+-------------------------------------------------------------------|
;; | ivy-next-line-and-call     | C-M-n          | Move cursor vertically down ARG candidates.                       |
;; |                            |                | Call the permanent action if possible.                            |
;; | ivy-previous-line-and-call | C-M-p          | Move cursor vertically up ARG candidates.                         |
;; |                            |                | Call the permanent action if possible.                            |
;; |----------------------------+----------------+-------------------------------------------------------------------|
;; | ivy-dispatching-done       | M-o            | Presents valid actions from which to choose. When                 |
;; |                            |                | only one action is available, there is no difference              |
;; |                            |                | between this and `ivy-done'.                                      |
;; |----------------------------+----------------+-------------------------------------------------------------------|
;; | ivy-reverse-i-search       | C-r            | start a recursive completion session to select a history element. |
;; |----------------------------+----------------+-------------------------------------------------------------------|
;; | ivy-insert-current         | M-i            | insert the current candidate into the minibuffer.                 |
;; |                            |                | Useful for copying and renaming files,                            |
;; |                            |                | for example: M-i to insert the original file name string,         |
;; |                            |                | edit it, and then C-m to complete the renaming..                  |
;; |----------------------------+----------------+-------------------------------------------------------------------|
;; | ivy-yank-word              | M-j            | insert the sub-word at point into the minibuffer.                 |
;; |----------------------------+----------------+-------------------------------------------------------------------|
;; | ivy-restrict-to-matches    | S-SPC          | deletes the current input, and resets the candidates list         |
;; |                            |                | to the currently restricted matches.                              |
;; |                            |                | This is how Ivy provides narrowing in successive tiers.           |
;; |----------------------------+----------------+-------------------------------------------------------------------|

;; Switch to any of the saved `ivy-views' using `M-x ivy-switch-buffer'.
;; When `ivy-mode' is enabled, binding for `switch-to-buffer' is remapped to
;; `ivy-switch-buffer'.
