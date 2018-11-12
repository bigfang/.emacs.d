;; -*- mode: Emacs-Lisp -*-


(whitespace-mode -1)


(defhydra hydra-toggle (:color amaranth)
  "
_a_ abbrev-mode:       %`abbrev-mode
_c_ cua-mode:          %`cua-mode
_d_ debug-on-error:    %`debug-on-error
_f_ auto-fill-mode:    %`auto-fill-function
_t_ truncate-lines:    %`truncate-lines
_w_ whitespace-mode:   %`whitespace-mode
_v_ view-mode:         %`view-mode
_m_ xterm-mouse-mode   %`xterm-mouse-mode
_r_ rot13-mode:
_z_ zone:
"
  ("a" abbrev-mode nil)
  ("c" cua-mode nil)
  ("d" toggle-debug-on-error nil)
  ("f" auto-fill-mode nil)
  ("t" toggle-truncate-lines nil)
  ("w" whitespace-mode nil)
  ("v" view-mode nil)
  ("m" xterm-mouse-mode nil)
  ("r" toggle-rot13-mode nil :color blue)
  ("z" zone nil :color blue)
  ("q" nil "quit" :color blue))


(defhydra hydra-launcher (:color blue :hint nil :idle .5 :columns 4)
  ("bs"  (browse-url "https://bbs.saraba1st.com/2b/forum-75-1.html") "Stage1st")
  ("bt"  (browse-url "http://club.tgfcer.com/forum-25-1.html") "TGFC")
  ("bx"  (browse-url "https://xueqiu.com") "xueqiu")
  ("br"  (browse-url "https://www.reddit.com/") "reddit")
  ("bg"  (browse-url "https://github.com") "github")

  ("s"   shell "shell")
  ("t"   google-translate-at-point "google translate")
  ("T"   google-translate-smooth-translate "google translate smooth")
  ("g"   google-this "google this")
  ("RET" google-this-search "google search")

  ("e"   eval-last-sexp)
  ("v"   ido-find-alternate-file)
  ("x"   smex)
  ("q"   nil "cancel" :color blue))


(defhydra hydra-abo (:color teal :hint nil :idle .5 :columns 4)
  ("i" swiper "swiper")
  ("b" counsel-ibuffer "ibuffer")
  ("f" counsel-find-file "find file")
  ("e" counsel-recentf "recent file")
  ("m" counsel-imenu "imenu")
  ("s" counsel-rg "ripgrep")
  ("a" counsel-ag "ag")
  ("o" counsel-outline "outline")
  ("z" counsel-fzf "fzf")
  ("w" ivy-imenu-anywhere "imenu-anywhere")
  ("r" ivy-resume "resume")
  ("v" ivy-push-view "push view")
  ("V" ivy-pop-view "pop view")
  ("S" ivy-switch-view "switch view")

  ("l" imenu-list-smart-toggle "imenu list")
  ("q" nil "cancel" :color blue))


(provide 'hydra/hydra-abo)
;;; hydra-abo.el ends here
