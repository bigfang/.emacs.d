;; -*- mode: Emacs-Lisp -*-


(whitespace-mode -1)
(display-line-numbers-mode -1)


(defhydra hydra-toggle (:color amaranth)
  "
_a_ abbrev-mode:         %`abbrev-mode
_c_ cua-mode:            %`cua-mode
_d_ debug-on-error:      %`debug-on-error
_f_ auto-fill-mode:      %`auto-fill-function
_t_ truncate-lines:      %`truncate-lines
_w_ whitespace-mode:     %`whitespace-mode
_o_ ioutline-mode:       %`outline-minor-mode
_v_ view-mode:           %`view-mode
_m_ xterm-mouse-mode     %`xterm-mouse-mode
_n_ line-numbers-mode    %`display-line-numbers-mode
_r_ rot13-mode:
_z_ zone:
"
  ("a" abbrev-mode nil)
  ("c" cua-mode nil)
  ("d" toggle-debug-on-error nil)
  ("f" auto-fill-mode nil)
  ("t" toggle-truncate-lines nil)
  ("w" whitespace-mode nil)
  ("o" outline-minor-mode nil)
  ("v" view-mode nil)
  ("m" xterm-mouse-mode nil)
  ("n" display-line-numbers-mode nil)
  ("r" toggle-rot13-mode nil :color blue)
  ("z" zone nil :color blue)
  ("q" nil :color blue))


(defhydra hydra-execute (:color teal :hint nil :columns 3)
  ("c" quick-calc "quick calc")
  ("s" shell "shell")
  ("e" eval-last-sexp "eval sexp")
  ("v" ido-find-alternate-file "refresh")
  ("x" smex "smex")
  ("q" nil :color blue))


(defhydra hydra-abo (:color teal :hint nil :columns 4)
  "swiper"
  ("i" counsel-imenu "imenu")
  ("b" counsel-ibuffer "ibuffer")
  ("f" counsel-find-file "find file")
  ("e" counsel-recentf "recent file")
  ("m" counsel-mark-ring "mark ring")
  ("g" counsel-git-grep "git-grep")
  ("s" counsel-rg "ripgrep")
  ("a" counsel-ag "ag")
  ("o" counsel-outline "outline")
  ("z" counsel-fzf "fzf")
  ("w" ivy-imenu-anywhere "imenu-anywhere")
  ("r" ivy-resume "resume")

  ("I" image-dired "image dired")
  ("d" ido-dired "dired")
  ("l" imenu-list-smart-toggle "imenu list")
  ("q" nil :color blue))

(defhydra soo-hydra-ivy (:hint nil :color pink)
  "
 Move     ^^^^^^^^^^ | Call           ^^^^ | Options^^ | Action _w_/_s_/_a_: %s(ivy-action-name)
----------^^^^^^^^^^-+----------------^^^^-+--------^^-+---------------------------------
 _g_ ^ ^ _k_ ^ ^ _u_ | _f_ollow    _o_ccur | _c_alling: %-7s(if ivy-calling \"on\" \"off\") _C_ase-fold: %-10`ivy-case-fold-search
 ^↨^ _h_ ^+^ _l_ ^↕^ | _TAB_ call      ^^  | _m_atcher: %-7s(ivy--matcher-desc) _t_runcate: %-11`truncate-lines
 _G_ ^ ^ _j_ ^ ^ _d_ | _⏎_ done       ^^  | _<_/_>_: shrink/grow
"
  ;; arrows
  ("j" ivy-next-line)
  ("k" ivy-previous-line)
  ("l" ivy-alt-done)
  ("h" ivy-backward-delete-char)
  ("g" ivy-beginning-of-buffer)
  ("G" ivy-end-of-buffer)
  ("d" ivy-scroll-up-command)
  ("u" ivy-scroll-down-command)
  ("e" ivy-scroll-down-command)
  ;; actions
  ("C-g" keyboard-escape-quit :exit t)
  ("<escape>" keyboard-escape-quit :exit t)
  ("C-o" nil)
  ("q" nil)
  ("f" ivy-alt-done :exit nil)
  ("C-j" ivy-alt-done :exit nil)
  ("RET" ivy-done :exit t)
  ("C-m" ivy-done :exit t)
  ("TAB" ivy-call)
  ("c" ivy-toggle-calling)
  ("m" ivy-rotate-preferred-builders)
  (">" ivy-minibuffer-grow)
  ("<" ivy-minibuffer-shrink)
  ("w" ivy-prev-action)
  ("s" ivy-next-action)
  ("a" ivy-read-action)
  ("t" (setq truncate-lines (not truncate-lines)))
  ("C" ivy-toggle-case-fold)
  ("o" ivy-occur :exit t))

(eval-after-load
    'ivy '(define-key ivy-minibuffer-map
            (kbd "C-o") 'soo-hydra-ivy/body))


(provide 'hydras-abo)