;; -*- mode: Emacs-Lisp -*-


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


(provide 'hydra/hydra-launcher)
;;; hydra-launcher.el ends here
