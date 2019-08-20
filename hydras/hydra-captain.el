;; -*- mode: Emacs-Lisp -*-


(defhydra hydra:browse (:color teal :hint nil :columns 3)
  "visit website"
  ("g" (browse-url "https://github.com") "GitHub")
  ("r" (browse-url "https://www.reddit.com") "Reddit")
  ("s" (browse-url "https://bbs.saraba1st.com/2b/forum-75-1.html") "Stage1st")
  ("t" (browse-url "http://club.tgfcer.com/forum-25-1.html") "TGFC")
  ("x" (browse-url "https://xueqiu.com") "xueqiu")
  ("z" (browse-url "https://zhihu.com") "zhihu")
  ("." (browse-url ".") "current directory")
  ("RET" (browse-url-of-buffer) "current buffer")
  ("q" nil :color blue))


(defhydra hydra:captain (:color teal :exit t :hint nil :idle .2 :columns 5)
  "⊞      --- Hydra Captain ---    "
  ("/" swiper-all "swiper-all")
  ("RET" hydra:toggle/body "toggle modes...")
  ("SPC" lsp-ui-imenu "lsp imenu")
  ("TAB" beginning-of-defun "beginning of defun")
  ("DEL" (lambda (arg)
           (interactive "p")
           (forward-line)
           (end-of-defun arg)
           (backward-char))
   "end of defun")

  ("f" hydra:adjust/body "adjust...")
  ("j" ffap "ffap")
  ;; same as hydra:execute
  ("c" quick-calc "quick calc")
  ("C" calendar "calendar")
  ("s" shell "shell")
  ("e" eval-last-sexp "eval sexp")
  ("E" eval-buffer "eval buffer")
  ("v" ido-find-alternate-file "refresh")
  ("x" smex "smex")

  ("d" deft "deft")
  ("k" hydra:kurecolor/body "kurecolor..." :color teal)
  ("t" google-translate-smooth-translate "google translate")
  ("g" google-this "google this")
  ("G" google-this-search "google search")

  ("b" hydra:browse/body "visit website")

  ("<escape>" nil :color blue)
  ("q" nil :color blue))


(provide 'hydra-captain)
